# Load MASS package
library(MASS)

# Set seed for reproducibility
set.seed(123)

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
