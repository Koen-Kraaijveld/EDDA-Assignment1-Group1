data = read.table("birthweight.txt", header=TRUE)
birthweight = data$birthweight

# normality check
qqnorm(birthweight)
shapiro_pval = shapiro.test(birthweight)[[2]]
cat(sprintf("Shapiro-Wilk test p-value: %f\n", shapiro_pval))
# add hist, maybe boxplot but not necessary


# bounded CI
alpha = 0.04
mean = mean(birthweight)
s = sd(birthweight)
n = length(birthweight)
t_alpha = qt(1 - (alpha/2), df=n-1)
error = t_alpha * (s / sqrt(n))

lower_bound = mean - error
upper_bound = mean + error
ci = c(lower_bound, upper_bound)
cat(sprintf("Bounded 96%%-CI: [%f, %f]\n", ci[1], ci[2]))


# minimal sample size
min_n = ((t_alpha)^2 * s^2) / 50^2
cat(sprintf("Minimum sample size for error length 100: %f\n", min_n))
