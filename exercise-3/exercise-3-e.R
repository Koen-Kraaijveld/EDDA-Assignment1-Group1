options(digits=3)
diet <- read.table("exercise-3/diet.txt", header = TRUE)
diet$weight.lost <- diet$preweight - diet$weight6weeks

dietdf = data.frame(weight.lost=as.vector(as.matrix(diet$weight.lost)), 
                    diet=as.factor(diet$diet),
                    gender=as.factor(diet$gender))

dietaov1 = lm(weight.lost ~ diet, data=dietdf)
print(anova(dietaov1))
# print(summary(dietaov1))

dietaov2 = lm(weight.lost ~ diet * gender, data=dietdf)
print(anova(dietaov2))
# print(summary(dietaov2))