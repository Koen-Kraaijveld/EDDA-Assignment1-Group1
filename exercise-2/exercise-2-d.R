options(digits=5)
data = read.table("exercise-2/cholesterol.txt", header=TRUE)
before = data$Before
after = data$After8weeks

# n = length(after)
# theta = numeric(900)
# pval = numeric(900)
# 
# k = 0
# for (i in seq(3, 12, by=0.01)) {
#   t = max(after)
#   B = 1000
#   tstar = numeric(B)
#   for (j in 1:B) {
#     xstar = runif(n, min=3, max=i)
#     tstar[j] = max(xstar)
#   }
# 
#   pl = sum(tstar < t) / B
#   pr = sum(tstar > t) / B
# 
#   theta[k] = i
#   pval[k] = 2 * min(pl, pr)
#   k = k + 1
# }
# 
# df = data.frame(
#   theta = theta,
#   pvalue = pval
# )
# 
# print(df[df$pvalue > 0.05,])
# print(df[df$theta > 9,])


theta = numeric(900)
pval = numeric(900)

k = 0
for (i in seq(3, 12, by=0.01)) {
  theta[k] = i
  pval[k] = ks.test(after, runif(18, min=3, max=i))[[2]]
  k = k + 1
}

df = data.frame(
  theta = theta,
  pvalue = pval
)

print(df[df$pvalue > 0.05,])

