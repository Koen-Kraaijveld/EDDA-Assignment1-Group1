# Load the data from file
diet <- read.table("exercise-3/diet.txt", header = TRUE)

# Create a new column for weight lost
diet$weight.lost <- diet$preweight - diet$weight6weeks

# Create a boxplot of weight lost by diet type
boxplot(weight.lost ~ diet, data = diet, xlab = "Diet Type", ylab = "Weight Lost (kg)", main = "Weight Lost by Diet Type")

# Perform a one-way ANOVA with diet as the factor and weight lost as the response variable
model <- lm(weight.lost ~ diet, data = diet)
anova(model)

# Check the assumptions of the ANOVA
plot(model)

# Create a histogram of weight lost
hist(diet$weight.lost, breaks = 10, xlab = "Weight Lost (kg)", ylab = "Frequency", main = "Histogram of Weight Lost")

# Create a bar chart of the number of participants by diet type
barplot(table(diet$diet), xlab = "Diet Type", ylab = "Number of Participants", main = "Number of Participants by Diet Type")

# Create a scatterplot of preweight vs. weight6weeks
plot(diet$preweight, diet$weight6weeks, xlab = "Pre-weight (kg)", ylab = "Weight after 6 weeks (kg)", main = "Pre-weight vs. Weight after 6 weeks")

# Create a new variable for gender type
diet$gender.type <- ifelse(diet$gender == 1, "Male", "Female")

# Create a boxplot of weight lost by gender type
boxplot(weight.lost ~ gender.type, data = diet, xlab = "Gender", ylab = "Weight Lost (kg)", main = "Weight Lost by Gender")
