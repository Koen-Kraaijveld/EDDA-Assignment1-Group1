set.seed(1) # set fixed seed for reproducibility

# Read data from file and extract birthweight column
data = read.table("birthweight.txt", header=TRUE)
birthweight = data$birthweight

# Set the hypothesized true mean to be greater than 2800 grams
true_mean = 2850

# Simulate data sets under the alternative hypothesis
n_sims = 1000
t_powers = numeric(n_sims)
sign_powers = numeric(n_sims)
for (i in 1:n_sims) {
  # Simulate a sample of birthweights under the alternative hypothesis
  sim_data = rnorm(length(birthweight), mean=true_mean, sd=sd(birthweight))
  
  # Perform the t-test
  t_result = t.test(sim_data, mu=2800, alternative="greater")
  t_powers[i] = t_result$p.value <= 0.05
  
}

# Compute the proportion of times the null hypothesis is rejected for the t-test
t_power = mean(t_powers)
sign_result = binom.test(sum(x > 2800), length(x), p = 0.5, alternative = "greater")

