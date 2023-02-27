avg_yield <- with(npk, tapply(yield, list(block, N), mean))

png(file="exercise-4/graphs/exercise-4-b-plot-nitrogen.png", width=500, height=400)
plot(avg_yield[,1], avg_yield[,2],
     main="Scatterplot of the yield per blocks with \n nitrogen vs. without nitrogen",
     xlab="Yield of block without nitrogen (pounds)",
     ylab="Yield of block with nitrogen (pounds)",
     col=c("red", "blue", "green", "grey", "orange", "purple")[1:6],
     pch=16)
legend("topleft", 
       legend=c("Block 1", "Block 2", "Block 3", "Block 4", "Block 5", "Block 6"),
       col=c("red", "blue", "green", "grey", "orange", "purple"), pch=16)
dev.off()

png(file="exercise-4/graphs/exercise-4-b-bar-nitrogen.png", width=500, height=400)
barplot(avg_yield, 
        beside = TRUE, 
        legend = paste("Block", rownames(avg_yield)),
        xlab = "Nitrogen added", 
        names=c("No", "Yes"),
        xlim=c(0, 19),
        ylab = "Yield (pounds)", main = "Barchart showing the effect of nitrogen on yield")
dev.off()

