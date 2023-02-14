# we cannot apply the permutation test because the differences between before and after
# are normal

# the data is paired because the data measures the weight before and after from
# the same person


data = read.table("exercise-2/cholesterol.txt", header=TRUE)
before = data$Before
after = data$After8weeks

ttest = t.test(before, after, paired=TRUE)
print(test)

# fix sign test
sign_test = binom.test(sum((after-before) > 0), length(before), p=0.5)
print(sign_test)