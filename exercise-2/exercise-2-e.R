data = read.table("exercise-2/cholesterol.txt", header=TRUE)
before = data$Before
after = data$After8weeks

# low sample size, so we are not sure about normality
# we assume non-normal data, so we use the sign test

n = length(before)
sign_result = binom.test(sum(after < 6), n, p=0.5, alt="l")
print(sign_result)


# similar problem: http://sites.utexas.edu/sos/guided/inferential/categorical/univariate/binomial/#:~:text=A%20binomial%20test%20uses%20sample,equals%20a%20specific%20claimed%20value.

sign_result_2 = binom.test(sum(after <= 4.5), n, p=0.25, alt="l")
print(sign_result_2)
