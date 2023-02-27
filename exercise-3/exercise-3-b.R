options(digits=3)
diet <- read.table("exercise-3/diet.txt", header = TRUE)
diet$weight.lost <- diet$preweight - diet$weight6weeks

diet_df = data.frame(weight_lost=as.vector(as.matrix(diet$weight.lost)), 
                     diet=as.factor(diet$diet))


diet_aov = lm(weight_lost ~ diet, data=diet_df)
print(anova(diet_aov))
print(summary(diet_aov))

size = c(300, 300)
png(file="exercise-3/graphs/exercise-3-b-qqnorm-residuals.png", width=size[1], height=size[2])
qqnorm(residuals(diet_aov),
       main="Normal Q-Q Plot of the residuals")
dev.off()

png(file="exercise-3/graphs/exercise-3-b-plot-fitted.png", width=size[1], height=size[2])
plot(fitted(diet_aov), residuals(diet_aov),
       main="Scatterplot of the fitted \n values versus residuals")
dev.off()

print(kruskal.test(diet_df$weight_lost, diet_df$diet))
