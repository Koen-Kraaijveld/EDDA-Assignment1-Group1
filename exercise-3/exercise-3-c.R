options(digits=3)
diet <- read.table("exercise-3/diet.txt", header = TRUE)
diet$weight.lost <- diet$preweight - diet$weight6weeks

dietdf = data.frame(weight.lost=as.vector(as.matrix(diet$weight.lost)), 
                    diet=as.factor(diet$diet),
                    gender=as.factor(diet$gender))

dietaov = lm(weight.lost ~ diet * gender, data=dietdf)
print(anova(dietaov))
print(summary(dietaov))

size = c(300, 300)
png(file="exercise-3/graphs/exercise-3-c-qqnorm-residuals.png", width=size[1], height=size[2])
qqnorm(residuals(dietaov),
       main="Normal Q-Q Plot of the residuals")
dev.off()

png(file="exercise-3/graphs/exercise-3-c-plot-fitted.png", width=size[1], height=size[2])
plot(fitted(dietaov), residuals(dietaov),
     main="Scatterplot of the fitted \n values versus residuals")
dev.off()