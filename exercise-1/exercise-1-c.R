data = read.table("birthweight.txt", header=TRUE)
birthweight = data$birthweight
B=1000; n=188
psign=numeric(B) ## will contain p-values of sign test
pttest=numeric(B) ## will contain p-values of t-test
for(i in 1:B) {
  pttest[i]=t.test(birthweight,mu=2800,alt="g") ## extract p-value
  psign[i]=binom.test(sum(birthweight>0),n,p=0.5)[[3]] } ## extract p-value
sum(psign<0.05)/B # fraction of rejecting H0, the power of the sign test
sum(pttest<0.05)/B # fraction of rejecting H0, the power of the t-test

##????????????????