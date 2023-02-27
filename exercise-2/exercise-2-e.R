data = read.table("exercise-2/cholesterol.txt", header=TRUE)
before = data$Before
after = data$After8weeks

print(wilcox.test(after, mu=6, alt="l"))

# similar problem: http://sites.utexas.edu/sos/guided/inferential/categorical/univariate/binomial/#:~:text=A%20binomial%20test%20uses%20sample,equals%20a%20specific%20claimed%20value.

n = length(before)
sign_result_2 = binom.test(sum(after <= 4.5), n, p=0.25, alt="l")
print(sign_result_2)
