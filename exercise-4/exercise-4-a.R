# Load MASS package
library(MASS)

# Set seed 
set.seed(0)

# Create a vector representing the blocks
blocks <- rep(1:6, each = 4)

# Randomly assign nitrogen to two plots in each block
nitrogen <- rep(c(1,1,0,0), 6)
nitrogen <- sample(nitrogen)

# Randomly assign phosphate to two plots in each block
phosphate <- rep(c(1,0,1,0), 6)
phosphate <- sample(phosphate)

# Assign potassium to  two plots in each block
potassium <- rep(c(0,1,1,0), 6)
potassium <- sample(potassium)

# Create a data frame to represent the randomization
randomization <- data.frame(blocks, nitrogen, phosphate, potassium)

# View the resulting randomization
randomization

# Part B:

# Average Yield
avg_yield <- with(npk, tapply(yield, list(block, N), mean))

# Create a bar plot to show the results
barplot(avg_yield, beside = TRUE, legend = rownames(avg_yield),
        xlab = "Block", ylab = "Average yield", main = "Effect of nitrogen on yield")


# Part C:

# A full two-way ANOVA model
model <- aov(yield ~ block * N, data = npk)

# Print the ANOVA table
anova(model)

