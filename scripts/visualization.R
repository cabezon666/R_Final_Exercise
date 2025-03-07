plot_mpg_cyl <- function(data) {
  p <- ggplot(data, aes(x = cyl, y = mpg, fill = cyl)) +
    geom_boxplot() +
    labs(title = "MPG by Cylinders",
         x = "Cylinders",
         y = "Miles per Gallon") +
    theme_minimal()
  
  ggsave("output/mpg_by_cylinders.png", p, width = 8, height = 6)
}

plot_scatter <- function(data) {
  p <- ggplot(data, aes(x = wt, y = mpg, color = cyl)) +
    geom_point(size = 3) +
    labs(title = "Weight vs MPG",
         x = "Weight (1000 lbs)",
         y = "Miles per Gallon",
         color = "Cylinders") +
    theme_minimal()
  
  ggsave("output/weight_vs_mpg.png", p, width = 8, height = 6)
}