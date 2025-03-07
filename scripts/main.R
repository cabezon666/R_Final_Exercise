analyze_mtcars <- function() {
  source("scripts/setup.R")
  source("scripts/data.R")
  source("scripts/analysis.R")
  source("scripts/visualization.R")
  source("scripts/modeling.R")
  
  data <- load_data()
  
  print(summarize_data(data))
  
  results <- group_analysis(data)
  print(results$by_cyl)
  print(results$by_trans)
  
  plot_mpg_cyl(data)
  plot_scatter(data)
  
  model <- fit_model(data)
  print(summary(model))
}

