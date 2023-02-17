data = read.table("exercise-2/cholesterol.txt", header=TRUE)
before = data$Before
after = data$After8weeks

n = length(after)
t = max(after)
B = 1000
t_star = numeric(B)
for (i in 1:B) {
  x_star = runif(n, min=3, max=12)
  t_star[i] = max(x_star)
}

pl = sum(t_star < t) / B
pr = sum(t_star > t) / B
print(2 * min(pl, pr))

par(mfrow=c(1,1))
hist(t_star)