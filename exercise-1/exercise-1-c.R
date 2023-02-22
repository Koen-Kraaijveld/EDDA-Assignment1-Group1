set.seed(1) # set fixed seed for reproducibility

# Read data from file and extract birthweight column
data = read.table("exercise-1/birthweight.txt", header=TRUE)
birthweight = data$birthweight

# Simulate data sets under the alternative hypothesis
n_sample = 50
n_sims = 1000
t_powers = numeric(n_sims)
sign_powers = numeric(n_sims)
for (i in 1:n_sims) {
  # Perform the t-test
  x = sample(birthweight, n_sample)
  t_powers[i] = t.test(x, mu=2800, alternative="greater")[[3]]
  sign_powers[i] = binom.test(sum(x > 2800), n_sample, alternative="greater")[[3]]
}

print(sum(t_powers < 0.05) / n_sims)
print(sum(sign_powers < 0.05) / n_sims)
