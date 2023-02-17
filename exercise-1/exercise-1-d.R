data = read.table("exercise-1/birthweight.txt", header=TRUE)
birthweight = data$birthweight

print(mean(birthweight))
print(pnorm(2600, mean=mean(birthweight), sd=sd(birthweight)))

n = length(birthweight)
p = sum(birthweight < 2600) / length(birthweight)
print((0.3297872 - 0.25) / (sd(birthweight) / sqrt(n)))
se = sd(birthweight) / sqrt(n)
print(se)