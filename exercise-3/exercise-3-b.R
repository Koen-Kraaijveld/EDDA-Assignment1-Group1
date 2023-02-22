options(digits=3)
diet <- read.table("exercise-3/diet.txt", header = TRUE)
diet$weight.lost <- diet$preweight - diet$weight6weeks

diet_df = data.frame(weight_lost=as.vector(as.matrix(diet$weight.lost)), 
                     diet=as.factor(diet$diet))

diet_aov = lm(weight_lost ~ diet, data=diet_df)
print(anova(diet_aov))
print(summary(diet_aov))