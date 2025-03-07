library(ggplot2)
library(dplyr)

load_data <- function() {
  data(mtcars)
  data <- mtcars
  data$cyl <- as.factor(data$cyl)
  data$vs <- as.factor(data$vs)
  data$am <- as.factor(data$am)
  data$gear <- as.factor(data$gear)
  data$carb <- as.factor(data$carb)
  return(data)
}

summarize_data <- function(data) {
  return(summary(data))
}

group_analysis <- function(data) {
  by_cyl <- data %>%
    group_by(cyl) %>%
    summarize(
      count = n(),
      mean_mpg = mean(mpg),
      mean_hp = mean(hp)
    )
  
  by_trans <- data %>%
    group_by(am) %>%
    summarize(
      count = n(),
      mean_mpg = mean(mpg),
      mean_hp = mean(hp)
    )
  
  return(list(by_cyl = by_cyl, by_trans = by_trans))
}

plot_mpg_cyl <- function(data) {
  p <- ggplot(data, aes(x = cyl, y = mpg, fill = cyl)) +
    geom_boxplot() +
    labs(title = "MPG by Cylinders",
         x = "Cylinders",
         y = "Miles per Gallon") +
    theme_minimal()
  
  print(p)
  return(p)
}

plot_scatter <- function(data) {
  p <- ggplot(data, aes(x = wt, y = mpg, color = cyl)) +
    geom_point(size = 3) +
    labs(title = "Weight vs MPG",
         x = "Weight (1000 lbs)",
         y = "Miles per Gallon",
         color = "Cylinders") +
    theme_minimal()
  
  print(p)
  return(p)
}

fit_model <- function(data) {
  model <- lm(mpg ~ wt + hp, data = data)
  return(model)
}

analyze_mtcars <- function() {
  data <- load_data()
  
  cat("Data Summary:\n")
  print(summarize_data(data))
  
  cat("\nAnalysis by cylinder:\n")
  results <- group_analysis(data)
  print(results$by_cyl)
  
  cat("\nAnalysis by transmission:\n")
  print(results$by_trans)
  
  cat("\nCreating visualizations...\n")
  plot_mpg_cyl(data)
  plot_scatter(data)
  
  cat("\nFitting linear model...\n")
  model <- fit_model(data)
  print(summary(model))
}

analyze_mtcars()