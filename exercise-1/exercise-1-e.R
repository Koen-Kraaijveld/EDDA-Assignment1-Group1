data = read.table("exercise-1/birthweight.txt", header=TRUE)
birthweight = data$birthweight

# male
print(prop.test(c(34, 61, 28, 65), c(62, 126, 62, 126), alternative="two.sided"))
