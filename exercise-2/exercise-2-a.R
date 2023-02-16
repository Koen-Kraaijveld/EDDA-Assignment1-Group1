# Read data from file and extract the Before and After8weeks columns
data = read.table("cholesterol.txt", header=TRUE)
before = data$Before
after = data$After8weeks

# Print the Before and After8weeks vectors to the console
print(before)
print(after)

# Set up a 1x3 plot layout and create histograms of the Before and After8weeks vectors, as well as the difference between them
par(mfrow=c(1,3))
hist(before)
hist(after)
hist(before-after)

# Set up a 1x3 plot layout and create Q-Q plots of the Before and After8weeks vectors, as well as the difference between them
par(mfrow=c(1,3))
qqnorm(before)
qqnorm(after)
qqnorm(before-after)

# Set up a 1x2 plot layout and create boxplots of the Before and After8weeks vectors, as well as the difference between them
par(mfrow=c(1,2))
boxplot(before, after)
boxplot(before-after)

# Set up a 1x1 plot layout and create a scatter plot of Before versus After8weeks
par(mfrow=c(1,1))
plot(before, after)

# Add correlation test
cor.test(before, after)