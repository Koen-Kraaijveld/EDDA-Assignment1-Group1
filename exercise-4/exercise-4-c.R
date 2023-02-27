npkdf = data.frame(yield=as.vector(as.matrix(npk$yield)), 
                   block=as.factor(npk$block),
                   N=as.factor(npk$N))

npkaov = lm(yield ~ block * N, data=npkdf)
print(anova(npkaov))
print(summary(npkaov))

size = c(300, 300)
png(file="exercise-4/graphs/exercise-4-c-qqnorm-residuals.png", width=size[1], height=size[2])
qqnorm(residuals(npkaov),
       main="Normal Q-Q Plot of the residuals")
dev.off()

png(file="exercise-4/graphs/exercise-4-c-plot-fitted.png", width=size[1], height=size[2])
plot(fitted(npkaov), residuals(npkaov),
     main="Scatterplot of the fitted \n values versus residuals")
dev.off()