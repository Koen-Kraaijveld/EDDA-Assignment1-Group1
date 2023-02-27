npkdf = data.frame(yield=as.vector(as.matrix(npk$yield)), 
                   block=as.factor(npk$block),
                   N=as.factor(npk$N),
                   K=as.factor(npk$K),
                   P=as.factor(npk$P))

npklmer1 = lmer(yield ~ N * (1|block), REML=FALSE, data=npkdf)
npklmer2 = lmer(yield ~ (1|block), REML=FALSE, data=npkdf)
print(anova(npklmer2, npklmer1))