load_data <- function()
{
  data <- read.csv("data/mtcars.csv", row.names = 1)
  data$cyl <- as.factor(data$cyl)
  data$vs <- as.factor(data$vs)
  data$am <- as.factor(data$am)
  data$gear <- as.factor(data$gear)
  data$carb <- as.factor(data$carb)
  return(data)
}