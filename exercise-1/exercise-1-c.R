set.seed(1) # set fixed seed for reproducibility

# Read data from file and extract birthweight column
data = read.table("exercise-1/birthweight.txt", header=TRUE)
birthweight = data$birthweight

# Simulate data sets under the alternative hypothesis
nsample = 50
nsims = 1000
tpow = numeric(nsims)
signpow = numeric(nsims)
for (i in 1:nsims) {
  # Sample randomly from birthweight
  x = sample(birthweight, nsample)
  
  # Perform t-test
  tpow[i] = t.test(x, mu=2800, alternative="greater")[[3]]
  
  # Perform Wilcoxon signed rank test
  signpow[i] = binom.test(sum(x > 2800), length(x), p=0.5, alt="greater")[[3]]
}

print(sum(tpow < 0.05) / nsims)
print(sum(signpow < 0.05) / nsims)
