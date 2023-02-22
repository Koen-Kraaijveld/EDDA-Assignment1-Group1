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

shapiro_pval = shapiro.test(birthweight)[[2]]
cat(sprintf("Shapiro-Wilk test p-value: %f\n", shapiro_pval))

# Compute a bounded 96%-CI for the mean
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

# Compute the minimum sample size for the error length to be 100
min_n = ((t_alpha)^2 * s^2) / 50^2
cat(sprintf("Minimum sample size for error length 100: %f\n", min_n))

# Compute bootstrap 96%-CI for the mean and compare to the bounded CI
B=1000
Tstar=numeric(B)
for(i in 1:B) {
  Xstar=sample(birthweight,replace=TRUE)
  Tstar[i]=mean(Xstar)}
Tstar25=quantile(Tstar,0.02)
Tstar975=quantile(Tstar,0.98)
sum(Tstar<Tstar25)
T1 = mean(birthweight)
c(2*T1-Tstar975,2*T1-Tstar25)
