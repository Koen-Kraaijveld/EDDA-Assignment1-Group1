data = read.table("exercise-2/cholesterol.txt", header=TRUE)
before = data$Before
after = data$After8weeks

n = length(after)
sample = rnorm(10000)
theta = 2*mean(after) - ((2 * sample * sqrt(var(after)))/ sqrt(n)) - 3

par(mfrow=c(1,2))
hist(theta)
qqnorm(theta)

theta_hat = mean(theta)


# ci
alpha = 0.05
mean = mean(after)
s = sd(after)
n = length(after)
t_alpha = qt(1 - (alpha/2), df=n-1)
error = t_alpha * (s / sqrt(n))
lower_bound = theta_hat - error
upper_bound = theta_hat + error
ci = c(lower_bound, upper_bound)
print(ci)