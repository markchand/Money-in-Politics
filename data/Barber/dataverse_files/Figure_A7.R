data <- read.csv("Figure_A7.csv")

#MEAN Candidate Portfolio
share.ind <- tapply(data$share.ind, data$cycle, function(x) mean(x, na.rm = T))

share.pac <- tapply(data$share.group, data$cycle, function(x) mean(x, na.rm = T))

share.single <- tapply(data$share.single, data$cycle, function(x) mean(x, na.rm = T))

years <- sort(as.numeric(as.character(unique(data$cycle))))

#Figure A7
dev.new(width = 7, height = 3.5)
par(mar = c(3, 4, 1, 1))
plot(years, share.ind, ylim = c(0,1), cex = 0, ylab = "Percentage", axes = F, main = "Average Fundraising Porfolios of State Legislative Candidates")
lines(years, share.ind, lty = 1, lwd = 1)
lines(years, share.pac, lty = 2, lwd = 1)
lines(years, share.single, lty = 3, lwd = 1)
axis(2, at = c(0, .2, .4, .6, .8, 1), labels = c("0", "20", "40", "60", "80", "100"), cex.axis = .7, las = 2)
axis(1, at = years, cex.axis = .7)
text(2008, .55, "Individuals")
text(2008, .34, "PACs")
text(2008, .11, "Single Issue Groups")


#Figure A8
pac.time <- tapply(data$group.contributions, data$cycle, sum)
single.time <- tapply(data$singleissue.contributions, data$cycle, sum)

share.access <- pac.time / (pac.time + single.time)

dev.new(width = 7, height = 3.5)
par(mar = c(3, 4, 1, 1))
plot(years, share.access, ylim = c(0,1), cex = 0, ylab = "Percentage", axes = F, main = "Percent of PAC Money Coming From Access-Seeking PACs")
lines(years, share.access, lty = 1, lwd = 1)
axis(2, at = c(0, .2, .4, .6, .8, 1), labels = c("0", "20", "40", "60", "80", "100"), cex.axis = .7, las = 2)
axis(1, at = years, cex.axis = .7)
box()
