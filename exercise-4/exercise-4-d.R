npkdf = data.frame(yield=as.vector(as.matrix(npk$yield)), 
                   block=as.factor(npk$block),
                   N=as.factor(npk$N),
                   K=as.factor(npk$K),
                   P=as.factor(npk$P))

npkaov1 = lm(yield ~ block * K + P + N, data=npkdf)
print(anova(npkaov1))

npkaov2 = lm(yield ~ block * P + K + N, data=npkdf)
print(anova(npkaov2))

npkaov3 = lm(yield ~ block + K + P + N, data=npkdf)
print(anova(npkaov3))

size = c(300, 300)
png(file="exercise-4/graphs/exercise-4-d-qqnorm-residuals-m1.png", width=size[1], height=size[2])
qqnorm(residuals(npkaov1),
       main="Normal Q-Q Plot of the residuals")
dev.off()

png(file="exercise-4/graphs/exercise-4-d-plot-fitted-m1.png", width=size[1], height=size[2])
plot(fitted(npkaov1), residuals(npkaov1),
     main="Scatterplot of the fitted \n values versus residuals")
dev.off()

png(file="exercise-4/graphs/exercise-4-d-qqnorm-residuals-m2.png", width=size[1], height=size[2])
qqnorm(residuals(npkaov2),
       main="Normal Q-Q Plot of the residuals")
dev.off()

png(file="exercise-4/graphs/exercise-4-d-plot-fitted-m2.png", width=size[1], height=size[2])
plot(fitted(npkaov2), residuals(npkaov2),
     main="Scatterplot of the fitted \n values versus residuals")
dev.off()

png(file="exercise-4/graphs/exercise-4-d-qqnorm-residuals-m3.png", width=size[1], height=size[2])
qqnorm(residuals(npkaov2),
       main="Normal Q-Q Plot of the residuals")
dev.off()

png(file="exercise-4/graphs/exercise-4-d-plot-fitted-m3.png", width=size[1], height=size[2])
plot(fitted(npkaov2), residuals(npkaov2),
     main="Scatterplot of the fitted \n values versus residuals")
dev.off()
