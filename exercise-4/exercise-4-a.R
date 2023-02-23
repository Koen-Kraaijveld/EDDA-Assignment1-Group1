# N = c(0, 1)
# P = c(0, 1)
# K = c(0, 1)

# blocks = rep(1:4, each=4)
# n = sample(rep(0:1, each=2))
# k = sample(rep(0:1, each=2))
# p = sample(rep(0:1, each=2))

# nblock = 6
# blocks = numeric(nblock * 4)
# df = data.frame()
# 

for (i in 1:nblock) {
  block = rep(i, each=4)
  n = sample(rep(0:1, each=2))
  k = sample(rep(0:1, each=2))
  p = sample(rep(0:1, each=2))
  print(block)
  print(n)
  print(k)
  print(p)
}

# print(df)
# print(data.frame(block=blocks, 
#                  n=as.factor(n), 
#                  k=as.factor(k), 
#                  p=as.factor(p)))

# I=2; J=2; K=2; N=3
# print(
#   rbind(
#     rep(1:(I), each=N*J),
#     rep(1:(J), N*I),
#     rep(1:(K), N*K),
#     sample(1:(N*I*J*K))
#   )
#   )