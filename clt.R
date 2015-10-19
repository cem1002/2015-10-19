library(dplyr)
library(ggplot2)

source("magic.R")

# Number of replications (to get fine results)
k <- 10000

# Sample size
n <- 100

rs1_samples <- replicate(k, random_source_1(sample_size = n))

## Histogram of all samples put together. Used qplot for simplicity with this
## completely artificial plot.
qplot(unlist(rs1_samples), binwidth=0.2)

rs1_samp_aves <- data_frame(sample_averages = sapply(rs1_samples, mean))
ggplot(rs1_samp_aves, aes(x=sample_averages)) + geom_histogram(binwidth=0.02)

rs2_samples <- replicate(k, random_source_2(sample_size = n))
qplot(unlist(rs2_samples), binwidth=0.2)

rs2_samp_aves <- data_frame(sample_averages=sapply(rs2_samples, mean))
ggplot(rs2_samp_aves, aes(x=sample_averages)) + geom_histogram(binwidth=0.02)

# From mu.R from last week...

# U[0,1]
n <- 100

list_unif <- replicate(k, 
                       data_frame(x=runif(n, 0, 1)))

x_bars_unif <- sapply(list_unif, mean)

ggplot(data_frame(x_bars_unif=x_bars_unif), aes(x=x_bars_unif)) + 
  geom_density() +
  geom_line(data=norm_dens(0.5, 1/sqrt(12*n)), aes(x=x, y=density), color="red")


# Bernoulli(p)
n <- 100
p <- 0.7
list_probOf1 <- replicate(k, 
                          data_frame(x=sample(c(0,1), prob = c(1-p, p),
                                              size=n, replace=TRUE)))

x_bars_probOf1 <- sapply(list_probOf1, mean)

ggplot(data_frame(x_bars_probOf1=x_bars_probOf1), aes(x=x_bars_probOf1)) + 
  geom_density() + 
  geom_line(data=norm_dens(p, sqrt(p*(1-p)/n)), aes(x=x, y=density), color="red")

# Exp(lambda)
n <- 100
lambda <- 1

list_exp <- replicate(k, data_frame(x=rexp(n, lambda)))

x_bars_exp <- sapply(list_exp, mean)

ggplot(data_frame(x_bars_exp=x_bars_exp), aes(x=x_bars_exp)) + 
  geom_density() + 
  geom_line(data=norm_dens(1, sqrt(lambda/n)), aes(x=x, y=density), color="red")
