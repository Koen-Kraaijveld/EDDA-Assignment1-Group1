npkdf = data.frame(yield=as.vector(as.matrix(npk$yield)), 
                   block=as.factor(npk$block),
                   N=as.factor(npk$N),
                   K=as.factor(npk$K),
                   P=as.factor(npk$P))

npkaov1 = lm(yield ~ block * K + P + N, data=npkdf)
print(anova(npkaov1))

npkaov2 = lm(yield ~ block * P + K + N, data=npkdf)
print(anova(npkaov2))