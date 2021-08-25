
# Basic render ------------------------------------------------------------

library(tidyverse)
library(palmerpenguins)
library(rmarkdown)

rmarkdown::render(
  "04-templating/penguin-params.Rmd"
)

rstudioapi::viewer("04-templating/penguin-params.html")

rmarkdown::render(
  "04-templating/penguin-params.Rmd",
  params = list(species = "Chinstrap"),
  output_file = "choose-chinstrap.html"
)

rstudioapi::viewer("04-templating/choose-chinstrap.html")


# Multi-render ------------------------------------------------------------

render_fun <- function(penguin){
  rmarkdown::render(
    "04-templating/penguin-params.Rmd",
    params = list(species = "Chinstrap"),
    output_file = glue::glue("{penguin}-report.html")
  )
}


# Loop and render ---------------------------------------------------------

penguin_names <- 
  distinct(penguins, species) %>% 
  pull() %>% 
  as.character() 

unique(penguins$species) %>%
  as.character()

penguin_names

penguin_names %>% 
  purrr::walk(render_fun)


output_files <- list.files(path = "04-templating/", pattern= "report.html")

tibble(files = paste0("04-templating/", output_files)) %>% 
  mutate(
    file_info = file.info(files),
    now = Sys.time()
  ) %>% 
  unpack(file_info) %>% 
  select(files, mtime, now)

