data = read.table("exercise-2/cholesterol.txt", header=TRUE)
before = data$Before
after = data$After8weeks

ttest = t.test(before, after, paired=TRUE, alternative="two.sided")
print(ttest)

wilcoxtest = wilcox.test(before, after, paired=TRUE, alternative="two.sided")
print(wilcoxtest)

B = 1000
tstar = numeric(B)

for (i in 1:B) {
  dietstar= t(apply(cbind(before, after), 1, sample))
  tstar[i] = mean(dietstar[,1] - dietstar[,2])
}

t = mean(before - after)
pl = sum(tstar < t) / B
pr = sum(tstar > t) / B
p = 2*min(pl, pr)

print(p)