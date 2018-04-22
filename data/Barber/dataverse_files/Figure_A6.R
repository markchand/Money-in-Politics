data <- read.csv("Figure_A6.csv")

years <- sort(unique(data$year))

#Figure A6 - left panel
ind.cont.prof <- tapply(data$ind.contributions[data$high.median.prof == 1], data$year[data$high.median.prof == 1], function(x) mean(x, na.rm = T))

ind.cont.unprof <- tapply(data$ind.contributions[data$high.median.prof == 0], data$year[data$high.median.prof == 0], function(x) mean(x, na.rm = T))

plot(years, ind.cont.prof, cex = 0, ylim = c(0, 50000), axes = F, ylab = "Average Raised (in thousands $)", main = "Average Individual Money Raised")
lines(years, ind.cont.prof, lwd = 2)
lines(years, ind.cont.unprof, lwd = 2, lty = 2)
axis(2, at = seq(0, 50000, 10000), labels = seq(0, 50, 10), las = 2)
axis(1, at = years)
text(2002, 45000, "Professionalized Legislatures")
text(2006, 3000, "Citizen Legislatures")


#Figure A6 - right panel
pac.cont.prof <- tapply(data$group.contributions[data$high.median.prof == 1], data$year[data$high.median.prof == 1], function(x) mean(x, na.rm = T))

pac.cont.unprof <- tapply(data$group.contributions[data$high.median.prof == 0], data$year[data$high.median.prof == 0], function(x) mean(x, na.rm = T))

plot(years, pac.cont.prof, cex = 0, ylim = c(0, 55000), axes = F, ylab = "Average Raised (in thousands $)", main = "Average PAC Money Raised")
lines(years, pac.cont.prof, lwd = 2)
lines(years, pac.cont.unprof, lwd = 2, lty = 2)
axis(2, at = seq(0, 50000, 10000), labels = seq(0, 50, 10), las = 2)
axis(1, at = years)
text(1998, 47000, "Professionalized Legislatures")
text(2006, 3000, "Citizen Legislatures")