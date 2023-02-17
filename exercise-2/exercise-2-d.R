data = read.table("exercise-2/cholesterol.txt", header=TRUE)
before = data$Before
after = data$After8weeks

n = length(after)

theta = numeric(9)
p_val = numeric(9)

for (i in 3:12) {
  t = max(after)
  B = 1000
  t_star = numeric(B)
  for (j in 1:B) {
    x_star = runif(n, min=3, max=i)
    t_star[j] = max(x_star)
  }
  
  pl = sum(t_star < t) / B
  pr = sum(t_star > t) / B
  
  theta[i-2] = i
  p_val[i-2] = 2 * min(pl, pr)
}

df = data.frame(
  theta = theta,
  p_value = p_val
)

print(df)
