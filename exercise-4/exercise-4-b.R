N0 = numeric(6)
N1 = numeric(6)

for (i in 1:6) {
  block = npk[npk$block == i,]
  blockN0 = block[block$N == 0,]
  blockN1 = block[block$N == 1,]
  N0[i] = mean(blockN0$yield)
  N1[i] = mean(blockN1$yield)
}

png(file="exercise-4/graphs/exercise-4-b-plot-nitrogen.png", width=600, height=400)
plot(N0, N1,
     main="Scatterplot of the yield per blocks with nitrogen vs. without nitrogen",
     xlab="Yield of block without nitrogen (pounds)",
     ylab="Yield of block with nitrogen (pounds)",
     col=c("red", "blue", "green", "grey", "orange", "purple")[1:6],
     pch=16)
legend("topleft", 
       legend=c("Block 1", "Block 2", "Block 3", "Block 4", "Block 5", "Block 6"),
       col=c("red", "blue", "green", "grey", "orange", "purple"), pch=16)
dev.off()
