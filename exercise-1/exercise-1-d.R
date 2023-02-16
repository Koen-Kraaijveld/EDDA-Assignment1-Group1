# Read data from file and extract birthweight column
data = read.table("birthweight.txt", header=TRUE)
birthweight = data$birthweight

# Compute the proportion of birthweights less than 2600 grams
p_hat_l = 0.25
z_l = qnorm(p_l)

p_hat = sum(birthweight < 2600) / length(birthweight)
n = length(birthweight)
z_alpha_half = qnorm(1 - 0.025)

# Compute the confidence interval for p
p_ci = c(p_hat - z_alpha_half * sqrt(p_hat*(1-p_hat)/n), 2*p_hat - p_hat_l)

# Compute the confidence level
alpha = 1 - 2 * pnorm(z_alpha_half)
