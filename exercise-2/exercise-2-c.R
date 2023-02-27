data = read.table("exercise-2/cholesterol.txt", header=TRUE)
before = data$Before
after = data$After8weeks
# 
# n = length(after)
# sample = rnorm(10000)
# theta = 2*mean(after) - ((2 * sample * sqrt(var(after)))/ sqrt(n)) - 3
# 
# par(mfrow=c(1,2))
# hist(theta)
# qqnorm(theta)
# 
# theta_hat = mean(theta)
# 
# print(2*mean(after) - 3)
# 
# # ci
# alpha = 0.05
# mean = mean(after)
# s = sd(after)
# n = length(after)
# t_alpha = qt(1 - (alpha/2), df=n-1)
# error = t_alpha * (s / sqrt(n))
# lower_bound = theta_hat - error
# upper_bound = theta_hat + error
# ci = c(lower_bound, upper_bound)
# # print(ci)


thetahat = 2*mean(after) - 3
print(thetahat)

alpha = 0.05
s = sd(after)
n = length(after)
zalpha = qnorm(1 - (alpha/2))
error = zalpha * (s / sqrt(n))
lower = thetahat - error
upper = thetahat + error
ci = c(lower, upper)
print(ci)

