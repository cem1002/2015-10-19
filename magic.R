# Quietly load dplyr if not already loaded
suppressMessages(require(dplyr))

norm_dens <- function(mu = 0, sigma = 1) {
  x <- seq(mu - 5*sigma, mu + 5*sigma, length.out = 1000)
  data_frame(x=x, density=dnorm(x, mu, sigma))
}

random_source_1 <- function(sample_size = 1) {
  return(data_frame(x = rnorm(n = sample_size, mean = 15, sd = 2)))
}

random_source_2 <- function(sample_size = 1) {
  return(data_frame(x = rexp(n = sample_size, rate = 0.5)))
}