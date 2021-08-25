## ---- smaller-penguins

smaller <- penguins %>% 
  filter(species == "Adelie", 
         !is.na(body_mass_g))

## ---- plot-penguins

smaller %>% 
  ggplot(aes(body_mass_g)) + 
  geom_histogram(binwidth = 100)

## ---- complex-modeling

model_inputs <- tibble(
  model_form = c(
    list(flipper_length_mm ~ body_mass_g),
    list(species_num ~ bill_length_mm + body_mass_g + sex),
    list(flipper_length_mm ~ bill_length_mm + species)
  ),
  data = list(penguins %>% 
                na.omit() %>% 
                mutate(species_num = as.numeric(species)))
) 

model_metrics <- model_inputs %>% 
  rowwise(model_form, data) %>% 
  summarize(lm = list(lm(model_form, data = data)), .groups = "drop") %>% 
  rowwise(model_form, lm, data) %>% 
  summarise(broom::glance(lm), .groups = "drop")

