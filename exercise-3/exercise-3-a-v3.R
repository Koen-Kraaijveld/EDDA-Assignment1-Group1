diet <- read.table("exercise-3/diet.txt", header = TRUE)
diet$weight.lost <- diet$preweight - diet$weight6weeks
weight_lost = diet$weight.lost

main_title="weight change"
size=c(300, 300)

png(file="exercise-3/graphs/exercise-3-a-hist.png", width=size[1], height=size[2])
hist(weight_lost, 
     main=paste("Histogram of the", main_title),
     xlab="Change in weight (kg)")
dev.off()

png(file="exercise-3/graphs/exercise-3-a-qqnorm.png", width=size[1], height=size[2])
qqnorm(weight_lost, 
       main=paste("Normal Q-Q Plot of the", main_title))
dev.off()

png(file="exercise-3/graphs/exercise-3-a-boxplot.png", width=size[1], height=size[2])
boxplot(weight_lost, 
        main=paste("Boxplot of the", main_title),
        ylab="Change in weight (kg)")
dev.off()

png(file="exercise-3/graphs/exercise-3-a-stripchart.png", width=size[1], height=size[2])
stripchart(weight_lost, 
           vertical=TRUE, 
           main=paste("Stripchart of the", main_title),
           ylab="Change in weight (kg)")
dev.off()

png(file="exercise-3/graphs/exercise-3-a-scatterplot.png", width=size[1], height=size[2])
plot(diet$preweight,
     diet$weight6weeks,
     main=paste("Scatterplot of the", main_title),
     xlab="Weight after 6 weeks",
     ylab="Initial weight")
dev.off()

png(file="exercise-3/graphs/exercise-3-a-ecdf.png", width=size[1], height=size[2])
plot(ecdf(weight_lost),
     main=paste("ECDF of the", main_title),
     xlab="Change in weight (kg)",
     ylab="Cumulative Probability")
dev.off()

print(t.test(diet$preweight, diet$weight6weeks, paired=TRUE, alternative="g"))
print(cor.test(diet$preweight, diet$weight6weeks, method="spearman"))


png(file="exercise-3/graphs/exercise-3-a-qqnorm-before.png", width=size[1], height=size[2])
qqnorm(diet$preweight, 
       main="Normal Q-Q Plot of initial weight")
dev.off()

png(file="exercise-3/graphs/exercise-3-a-qqnorm-after.png", width=size[1], height=size[2])
qqnorm(diet$weight6weeks, 
       main="Normal Q-Q Plot of the weight \n after 6 weeks")
dev.off()

png(file="exercise-3/graphs/exercise-3-a-hist-before.png", width=size[1], height=size[2])
hist(diet$preweight, 
     main="Histogram of the initial weight",
     xlab="Weight (kg)")
dev.off()

png(file="exercise-3/graphs/exercise-3-a-hist-after.png", width=size[1], height=size[2])
hist(diet$weight6weeks, 
     main="Histogram of the weight after 6 weeks",
     xlab="Weight (kg)")
dev.off()




