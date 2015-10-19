library(dplyr)
library(ggplot2)

# Produces a data_frame with normal density values for plotting
norm_dens <- function(mu = 0, sigma = 1) {
  x <- seq(mu - 5*sigma, mu + 5*sigma, length.out = 1000)
  data_frame(x=x, density=dnorm(x, mu, sigma))
}

# Pictures of density
(p_std_norm <- ggplot(data = norm_dens(0, 1), aes(x=x, y=density)) 
  + geom_line())
(p_std_norm + geom_line(data = norm_dens(10, 2)))

ggplot(data = norm_dens(10, 2), aes(x=x, y=density)) + 
  geom_line() + labs(title = "N(10,2) density")
ggplot(data = norm_dens(0, 1), aes(x=x, y=density)) + 
  geom_line() + labs(title = "N(0,1) density")


# "The Rule"
pnorm(1) - pnorm(-1)
pnorm(2) - pnorm(-2)
pnorm(3) - pnorm(-3)
