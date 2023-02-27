# Load MASS package
library(MASS)

# Set seed 
set.seed(0)

# Create a vector representing the blocks
blocks <- rep(1:6, each = 4)

# Randomly assign nitrogen to two plots in each block
nitrogen <- numeric(length = 24)
for (i in 1:(length(nitrogen)/4)) {
  sample_seq <- sample(c(0, 0, 0, 0), size = 4, replace = TRUE)
  sample_seq[sample(sample(4, 2))] <- 1 # randomly set two elements to 1
  nitrogen[(4*(i-1)+1):(4*i)] <- sample_seq
}

# Randomly assign phosphate to two plots in each block
phosphate <- numeric(length = 24)
for (i in 1:(length(phosphate)/4)) {
  sample_seq <- sample(c(0, 0, 0, 0), size = 4, replace = TRUE)
  sample_seq[sample(sample(4, 2))] <- 1 # randomly set two elements to 1
  phosphate[(4*(i-1)+1):(4*i)] <- sample_seq
}

# Randomly assign potassium totwo plots in each block
potassium <- numeric(length = 24)
for (i in 1:(length(potassium)/4)) {
  sample_seq <- sample(c(0, 0, 0, 0), size = 4, replace = TRUE)
  sample_seq[sample(sample(4, 2))] <- 1 # randomly set two elements to 1
  potassium[(4*(i-1)+1):(4*i)] <- sample_seq
}

# Create a data frame to represent the randomization
randomization <- data.frame(blocks, nitrogen, phosphate, potassium)

# View the resulting randomization
print(randomization)

# Part B:

# Calculate average yield
avg_yield <- with(npk, tapply(yield, list(block, N), mean))


par(mfrow=c(1,1))
# Create a bar plot to show the results
barplot(avg_yield, 
        beside = TRUE, 
        legend = paste("Block", rownames(avg_yield)),
        xlab = "Nitrogen added", 
        names=c("No", "Yes"),
        xlim=c(0, 19),
        ylab = "Yield (pounds)", main = "Effect of nitrogen on yield")

# Part C:

# Create a full two-way ANOVA model
model <- aov(yield ~ block * N, data = npk)

# Print the ANOVA table
anova(model)
