library(dplyr)
library(ggplot2)

n <- 500
normal <- data_frame(x=rnorm(n))
rt_skew <- data_frame(x=rexp(n))
light <- data_frame(x=runif(n))
heavy <- data_frame(x=rt(n, df=3))

ggplot(data=normal, aes(sample=x)) + stat_qq() + labs(title="normal")
ggplot(data=rt_skew, aes(sample=x)) + stat_qq()+ labs(title="right skew")
ggplot(data=light, aes(sample=x)) + stat_qq() + labs(title="light tails")
ggplot(data=heavy, aes(sample=x)) + stat_qq() + labs(title="heavy tails")
