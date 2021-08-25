multiplot <- function(penguin_name){
  glue("  \n### {penguin_name}  \n  \n") %>% cat() 
  
  
  df_pen <- penguins %>% 
    filter(as.character(species) == penguin_name)
  
  flipper_len <- df_pen %>% 
    summarize(mean = mean(flipper_length_mm)) %>% 
    pull(mean) %>% 
    round(digits = 1)  
  
  glue::glue("There are {nrow(df_pen)} observations of {penguin_name} penguins. The average flipper length is {flipper_len}.  \n") %>% cat()
  
  plot_out <- df_pen %>% 
    ggplot(aes(x = bill_length_mm, 
               y = flipper_length_mm)) +
    geom_point() +
    labs(x = "Bill Length", 
         y = "Flipper Length", 
         title = penguin_name)
  
  print(plot_out)
  
  cat("  \n  \n")
}
