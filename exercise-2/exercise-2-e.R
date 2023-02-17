data = read.table("exercise-2/cholesterol.txt", header=TRUE)
before = data$Before
after = data$After8weeks

# low sample size, so we are not sure after normality
# we assume non-normal data, so we use the sign test

n = length(before)
sign_result = binom.test(sum(after < 6), n, p=0.5)
print(sign_result)



sign_result_2 = binom.test(sum(after <= 4.5), n, p=0.25, alt="l")
print(sign_result_2)
