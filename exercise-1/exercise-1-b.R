data = read.table("birthweight.txt", header=TRUE)
birthweight = data$birthweight
t.test(birthweight,mu=2800,alt="g")
#we reject the null hypothesis, because the mean is greater than.
#H1 is true, H0 is false.
#explain why we chose median

sum(birthweight>2800)
binom.test(107,188,p=0.5)
