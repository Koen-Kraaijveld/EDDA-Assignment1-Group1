data = read.table("exercise-2/cholesterol.txt", header=TRUE)
before = data$Before
after = data$After8weeks

print(before)
print(after)

par(mfrow=c(1,3))
hist(before)
hist(after)
hist(before-after)

par(mfrow=c(1,3))
qqnorm(before)
qqnorm(after)
qqnorm(before-after)

par(mfrow=c(1,2))
boxplot(before, after)
boxplot(before-after)


par(mfrow=c(1,1))
plot(before, after)
# add correlation test