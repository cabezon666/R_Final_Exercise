summarize_data <- function(data) {
  summary(data)
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