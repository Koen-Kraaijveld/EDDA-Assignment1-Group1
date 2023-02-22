# Read data from file and extract birthweight column
data = read.table("exercise-1/birthweight.txt", header=TRUE)
birthweight = data$birthweight

# Compute the proportion of birthweights less than 2600 grams
n = length(birthweight)
p_hat = sum(birthweight < 2600) / length(birthweight)
z_alpha_half = (p_hat - 0.25) / sqrt((p_hat * (1 - p_hat)) / n)
error = z_alpha_half * sqrt((p_hat * (1 - p_hat)) / n)
print(p_hat - error)
print(p_hat + error)

alpha = 2 * (1 - pnorm(z_alpha_half))
print(alpha)