library(tidyverse)
library(palmerpenguins)
library(broom)

# Info about Adelie Penguins ----------------------------------------------

penguins %>% 
  group_by(species) %>% 
  summarize(n = n(), weight = mean(body_mass_g, na.rm = TRUE))

# looks like the Adelie are the lightest penguin

smaller <- palmerpenguins::penguins %>% 
  filter(species == "Adelie", 
         !is.na(body_mass_g))

# cleanup the data

penguins_clean <- penguins %>% 
  na.omit() %>% 
  mutate(species_num = as.numeric(species))

# Plot Section ------------------------------------------------------------

penguin_plot <- smaller %>% 
  ggplot(aes(body_mass_g)) + 
  geom_histogram(binwidth = 100) +
  labs(x = "Penguin Bins")

penguin_plot

ggsave("plots/penguin-plot.png", penguin_plot, dpi = "retina")

penguin_size_plot <- penguins_clean %>% 
  ggplot(aes(x = body_mass_g, y = bill_length_mm, color = species)) + 
  geom_point() +
  labs(x = "Mass (g)", y = "Bill Length (mm)")

penguin_size_plot +
  geom_smooth(aes(group = "none"), method = "lm")


# Model section -----------------------------------------------------------

model_inputs <- tibble(
  model_form = c(
    list(flipper_length_mm ~ body_mass_g),
    list(species_num ~ bill_length_mm + body_mass_g + sex),
    list(flipper_length_mm ~ bill_length_mm + species)
  ),
  data = list(penguins_clean)
) 

model_metrics <- model_inputs %>% 
  rowwise(model_form, data) %>% 
  summarize(lm = list(lm(model_form, data = data)), .groups = "drop") %>% 
  rowwise(model_form, lm, data) %>% 
  summarise(broom::glance(lm), .groups = "drop")

model_metrics %>% 
  select(model_form, r.squared:p.value) %>% 
  mutate(model_form = as.character(model_form)) %>% 
  gt::gt() %>% 
  gt::fmt_number(r.squared:statistic) %>% 
  gt::fmt_scientific(p.value) %>% 
  gt::cols_width(
    model_form ~ px(150)
  )
