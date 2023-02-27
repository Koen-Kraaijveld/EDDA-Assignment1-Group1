# Read data from file and extract birthweight column
data = read.table("exercise-1/birthweight.txt", header=TRUE)
birthweight = data$birthweight

# Perform one-sided t-test to check if the mean birthweight is greater than 2800 grams 
print(t.test(birthweight, mu=2800, alternative="greater"))

# We reject the null hypothesis that the mean birthweight is less than or equal to 2800 grams, and conclude that the mean birthweight is greater than 2800 grams. 
# Our alternative hypothesis is true and the null hypothesis is false.

# Explain why we chose the alternative hypothesis (greater) in the t-test, rather than the two-sided hypothesis.

# Count the number of birthweights greater than 2800 grams 
# Perform a one-sided sign test to verify the expert's claim 
print(wilcox.test(birthweight, mu=2800, alt='greater'))

print(binom.test(sum(birthweight > 2800), length(birthweight), p=0.5, alt="greater"))