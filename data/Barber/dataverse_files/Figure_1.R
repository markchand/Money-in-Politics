data <- read.csv("~/Figure_1.csv")
#each observation is one donor.


#Figure 1
data$bipartisan <- ifelse(data$pct.rep.donations != 0 & data$pct.dem.donations != 0, 1, 0)

years <- seq(1990, 2012, 2)

bipartisanship.ind <- NULL
for (i in 1:length(years)){
	year <- years[i]
	
summary(model1 <- lm(bipartisan ~ 1, data = data[data$cycle == year & data$individual == 1 & data$num.donations > 2,]))
a <- model1$coef[1]
alower <- a - 1.96*sqrt(vcov(model1)[1])
aupper <- a + 1.96*sqrt(vcov(model1)[1])

bipartisanship.ind <- c(bipartisanship.ind, a)

print(year)
}


bipartisanship.group <- NULL
for (i in 1:length(years)){
	year <- years[i]
	
summary(model1 <- lm(bipartisan ~ 1, data = data[data$cycle == year & data$group == 1  & data$num.donations > 2,]))
a <- model1$coef[1]
alower <- a - 1.96*sqrt(vcov(model1)[1])
aupper <- a + 1.96*sqrt(vcov(model1)[1])

bipartisanship.group <- c(bipartisanship.group, a)

print(year)
}


dev.new(width = 7, height = 4)
par(mar = c(3, 4, 4, 1))
plot(years, bipartisanship.ind, ylim = c(0,1), cex = 0, ylab = "Percent", axes = F, main = "Bipartisan Giving - State Legislative Donors", cex.main = .9)
lines(years, bipartisanship.ind, lty = 1, lwd = 1)
lines(years, bipartisanship.group, lty = 2, lwd = 1)
axis(2, at = c(0, .2, .4, .6, .8, 1), labels = c("0", "20", "40", "60", "80", "100"), cex.axis = .7, las = 2)
axis(1, at = years, cex.axis = .7)
text(2002, .20, "Individuals")
text(2002, .8, "PACs")
