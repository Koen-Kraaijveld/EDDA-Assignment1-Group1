npkdf = data.frame(yield=as.vector(as.matrix(npk$yield)), 
                block=as.factor(npk$block),
                N=as.factor(npk$N))

npkaov = lm(yield ~ block * N, data=npkdf)
print(anova(npkaov))
print(summary(npkaov))