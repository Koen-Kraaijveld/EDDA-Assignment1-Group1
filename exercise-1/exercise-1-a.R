# Read data from file and extract birthweight column
data = read.table("exercise-1/birthweight.txt", header=TRUE)
birthweight = data$birthweight
size = c(300, 300)

# Check for normality and compute Shapiro-Wilk test p-value
png(file="exercise-1/graphs/exercise-1-a-hist-birthweight.png", width=size[1], height=size[2])
hist(birthweight,
     main="Histogram of the birthweight",
     xlab="Weight (g)")
dev.off()

png(file="exercise-1/graphs/exercise-1-a-qqnorm-birthweight.png", width=size[1], height=size[2])
qqnorm(birthweight,
     main="Normal Q-Q Plot of the birthweight")
dev.off()

shapiro_pval = shapiro.test(birthweight)
print(shapiro_pval)

# Compute a bounded 96%-CI for the mean
alpha = 0.04
xbar = mean(birthweight)
s = sd(birthweight)
n = length(birthweight)
zalpha = qnorm(1 - (alpha/2))
error = zalpha * (s / sqrt(n))
lower_bound = xbar - error
upper_bound = xbar + error
ci = c(lower_bound, upper_bound)
print(ci)

# Compute the minimum sample size for the error length to be 100
min_n = ((t_alpha)^2 * s^2) / 50^2
print(min_n)

# Compute bootstrap 96%-CI for the mean and compare to the bounded CI
B = 1000
tstar=numeric(B)
for(i in 1:B) {
  xstar = sample(birthweight,replace=TRUE)
  tstar[i] = mean(xstar)}
tstar2 = quantile(tstar, 0.02)
tstar98 = quantile(tstar, 0.98)
t1 = mean(birthweight)
bootstrap_ci = c(2 * t1 - tstar98, 2 * t1 - tstar2)
print(bootstrap_ci)
