### RMarkdown Readme

You will want to install the following packages if you haven't already:

```{r}

all_packages <- c(
  "palmerpenguins", "rmarkdown", "bslib", "tidyverse", "reactable", "DT",
  "whisker", "glue", "flexdashboard", "plotly", "blastula", "shiny", "gt",
  "reticulate", "xaringan", "distill"
  )

install.packages(all_packages)
```

The basic pattern of interacting with this set of code examples will be to go from 01 - 04 in the folders.

The corresponding slides are available at in [PDF](Higher, further, faster with Marvelous R Markdown.pdf).

```
# A tibble: 18 × 1
   files                                        
   <chr>                                        
 1 01-visual-editor/reticulate-doc.Rmd          
 2 01-visual-editor/visual-rmd.Rmd              
 3 02-data-products/flexdashboard-ex.Rmd        
 4 02-data-products/penguin-distill.Rmd         
 5 02-data-products/reactable-ex.Rmd            
 6 02-data-products/xaringan-ex.Rmd             
 7 03-control-document/adelie-report.Rmd        
 8 03-control-document/demo-blastula.Rmd        
 9 03-control-document/penguin-email.Rmd        
10 03-control-document/penguin-emailer.Rmd      
11 03-control-document/penguin-params.Rmd       
12 03-control-document/reference-external.Rmd   
13 03-control-document/use-child-adelie.Rmd     
14 03-control-document/use-conditional-child.Rmd
15 04-templating/loop-within-doc.Rmd            
16 04-templating/penguin-params.Rmd             
17 04-templating/penguin-whiskers.Rmd           
18 04-templating/whisker-vs-glue.Rmd   
```
