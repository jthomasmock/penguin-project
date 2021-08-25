use_penguin_template <- function(species, long_prose){
  
  raw_rmd <- readLines("04-templating/penguin-whiskers.Rmd")
  
  filled_rmd <- whisker::whisker.render(raw_rmd)
  
  writeLines(
    text = filled_rmd,
    con = glue::glue("04-templating/filled-{species}-report.rmd")
  )
}


species <- "Adelie"

long_prose <- "### Mating\n\nThe mating season begins with the Antarctic spring in October. The penguins create nests by piling little stones in circles. Once the egg is laid in December the parents take turns incubating the egg and going to hunt. The parent that stays behind does not eat during their turn with the egg. Once the hatched chick is about 3 weeks old both parents will abandon it, returning to the sea to hunt. The downy chicks gather into a group called a crèche to keep each other warm. They will start to hunt at about 9 weeks old once their down has been replaced with waterproof feathers."

use_penguin_template(species, long_prose)

rstudioapi::navigateToFile("04-templating/filled-Adelie-report.rmd")
