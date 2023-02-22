options(digits=3)
diet <- read.table("exercise-3/diet.txt", header = TRUE)
diet$weight.lost <- diet$preweight - diet$weight6weeks

dietdf = data.frame(weight.lost=as.vector(as.matrix(diet$weight.lost)), 
                    diet=as.factor(diet$diet),
                    height=as.factor(diet$height))

dietaov = lm(weight.lost ~ diet * height, data=dietdf)
print(anova(dietaov))
print(summary(dietaov))