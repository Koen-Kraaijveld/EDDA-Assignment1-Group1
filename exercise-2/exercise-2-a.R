# Read data from file and extract the Before and After8weeks columns
data = read.table("exercise-2/cholesterol.txt", header=TRUE)
before = data$Before
after = data$After8weeks

main_title=c("\n initial cholesterol", "\n cholesterol after 8 weeks", "\n change in cholesterol")
label = "Cholesterol level (mmol/L)"
size=c(300, 300)

# Set up a 1x3 plot layout and create histograms of the Before and After8weeks vectors, as well as the difference between them
png(file="exercise-2/graphs/exercise-2-a-hist-before.png", width=size[1], height=size[2])
hist(before,
     main=paste("Histogram of the", main_title[1]),
     xlab=label)
dev.off()

png(file="exercise-2/graphs/exercise-2-a-hist-after.png", width=size[1], height=size[2])
hist(after,
     main=paste("Histogram of the", main_title[2]),
     xlab=label)
dev.off()

png(file="exercise-2/graphs/exercise-2-a-hist-change.png", width=size[1], height=size[2])
hist(before-after,
     main=paste("Histogram of the", main_title[3]),
     xlab=label)
dev.off()

# Set up a 1x3 plot layout and create Q-Q plots of the Before and After8weeks vectors, as well as the difference between them
png(file="exercise-2/graphs/exercise-2-a-qqnorm-before.png", width=size[1], height=size[2])
qqnorm(before,
     main=paste("Normal Q-Q Plot of the", main_title[1]))
dev.off()

png(file="exercise-2/graphs/exercise-2-a-qqnorm-after.png", width=size[1]+40, height=size[2])
qqnorm(after,
       main=paste("Normal Q-Q Plot of the", main_title[2]))
dev.off()

png(file="exercise-2/graphs/exercise-2-a-qqnorm-change.png", width=size[1]+20, height=size[2])
qqnorm(before-after,
       main=paste("Normal Q-Q Plot of the", main_title[3]))
dev.off()

# Set up a 1x2 plot layout and create boxplots of the Before and After8weeks vectors, as well as the difference between them
png(file="exercise-2/graphs/exercise-2-a-boxplot-before-after.png", width=size[1], height=size[2])
boxplot(before, after,
       main="Boxplot of the initial cholesterol \n and the cholesterol after eight weeks",
       xlab="Time period",
       ylab=label,
       names=c("Before", "After"))
dev.off()

png(file="exercise-2/graphs/exercise-2-a-boxplot-change.png", width=size[1], height=size[2])
boxplot(before - after,
        main="Boxplot of the change in cholesterol",
        ylab=label)
dev.off()

# Set up a 1x1 plot layout and create a scatter plot of Before versus After8weeks
png(file="exercise-2/graphs/exercise-2-a-scatterplot-before-after.png", width=size[1], height=size[2])
plot(before, after,
        main="Scatterplot of the initial cholesterol \n versus the cholesterol after eight weeks",
        xlab="Initial cholesterol (mmol/L)",
        ylab="Cholesterol after eight weeks (mmol/L)")
dev.off()

# Add correlation test
print(cor.test(before, after))