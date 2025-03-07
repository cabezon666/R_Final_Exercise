fit_model <- function(data) {
  model <- lm(mpg ~ wt + hp, data = data)
  return(model)
}