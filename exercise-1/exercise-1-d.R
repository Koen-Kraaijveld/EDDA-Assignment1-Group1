options(digits=3)
# Read data from file and extract birthweight column
data = read.table("exercise-1/birthweight.txt", header=TRUE)
birthweight = data$birthweight

# Compute the proportion of birthweights less than 2600 grams
n = length(birthweight)
phat = sum(birthweight < 2600) / length(birthweight)
zalphahalf = (phat - 0.25) / sqrt((phat * (1 - phat)) / n)
error = zalphahalf * sqrt((phat * (1 - phat)) / n)
alpha = 2 * (1 - pnorm(zalphahalf))

print(c(phat - error, phat + error))
print(alpha)