diet <- read.table("exercise-3/diet.txt", header = TRUE)
diet$weight.lost <- diet$preweight - diet$weight6weeks

diet_1 = diet[diet$diet == 1,]
diet_2 = diet[diet$diet == 2,]
diet_3 = diet[diet$diet == 3,]

diet_1_preweight = diet_1$preweight
diet_2_preweight = diet_2$preweight
diet_3_preweight = diet_3$preweight

diet_1_weight6weeks = diet_1$weight6weeks
diet_2_weight6weeks = diet_2$weight6weeks
diet_3_weight6weeks = diet_3$weight6weeks

diet_1_weight_lost = diet_1$weight.lost
diet_2_weight_lost = diet_2$weight.lost
diet_3_weight_lost = diet_3$weight.lost

par(mfrow=c(1,3))
hist(diet_1_weight_lost)
hist(diet_2_weight_lost)
hist(diet_3_weight_lost)

par(mfrow=c(1,3))
qqnorm(diet_1_weight_lost)
qqnorm(diet_2_weight_lost)
qqnorm(diet_3_weight_lost)

par(mfrow=c(1,2))
boxplot(diet$weight.lost ~ diet$diet)
stripchart(diet$weight.lost ~ diet$diet, vertical=TRUE)

par(mfrow=c(1,1))
plot(diet$preweight, diet$weight6weeks, col=c("red", "blue", "green")[diet$diet])
legend(x="topright", legend=c("Diet type 1", "Diet type 2", "Diet type 3"), 
       col=c("red","blue","green"), pch=1)

