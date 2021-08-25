rmarkdown::render(
  here::here("penguins", "penguin-report-detail.Rmd"),
  output_file = "penguin-distill.html",
  output_format = distill::distill_article(),
  output_options = list(toc = true, toc_depth = 2)
  )

rmarkdown::render(
  here::here("penguins", "penguin-report-detail.Rmd"),
  output_file = "penguin-report.html",
  output_options = list(toc = true, toc_depth = 2)
)
