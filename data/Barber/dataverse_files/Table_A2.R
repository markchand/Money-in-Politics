data <- read.csv("Table_A2.csv")

##################################
#Table A2

summary(model1 <- lm(log.cpi.ave.ind.contribution ~ as.factor(recipient_state) + as.factor(year) + ind.unlimited + limited_int_ind_log_limit + limited_int_pac_log_limit + pres.vote + district.inc + republican + majority.party + chamber_pct_dem, data = data))
length(resid(model1))

summary(model2 <- lm(pct.ind.maximizing ~ as.factor(recipient_state) + as.factor(year) + log.cpi.ind.limits + log.cpi.pac.limits + pres.vote + district.inc + republican + majority.party + chamber_pct_dem, data = data[data$ind.unlimited == 0,]))
length(resid(model2))

summary(model3 <- lm(log.cpi.ind.raised ~ as.factor(recipient_state) + as.factor(year) + ind.unlimited + limited_int_ind_log_limit + limited_int_pac_log_limit + pres.vote + district.inc + republican + majority.party + chamber_pct_dem, data = data))
length(resid(model3))

summary(model4 <- lm(log.cpi.ave.pac.contribution ~ as.factor(recipient_state) + as.factor(year) + pac.unlimited + limited_int_ind_log_limit + limited_int_pac_log_limit + pres.vote + district.inc + republican + majority.party + chamber_pct_dem, data = data))
length(resid(model4))

summary(model5 <- lm(pct.pac.maximizing ~ as.factor(recipient_state) + as.factor(year) + log.cpi.pac.limits + log.cpi.ind.limits + pres.vote + district.inc + republican + majority.party + chamber_pct_dem, data = data[data$pac.unlimited == 0,]))
length(resid(model5))

summary(model6 <- lm(log.cpi.pac.raised ~ as.factor(recipient_state) + as.factor(year) + pac.unlimited + limited_int_ind_log_limit + limited_int_pac_log_limit + pres.vote + district.inc + republican + majority.party + chamber_pct_dem, data = data))
length(resid(model6))


###############FIGURES######################

#Figure A1 - left panel
#Individual Limits and Average Contribution
data <- data[!is.na(data$log.ind.limits),]
data <- data[!is.na(data$log.ave.ind.contribution),]
data <- data[order(data$log.ind.limits),]

data$round <- round(data$log.ind.limits, 1)

yaxis <- tapply(data$log.ave.ind.contribution, data$round, function(x) mean(x, na.rm = T))

a <- loess(log.ave.ind.contribution ~ log.ind.limits, data = data[data$log.ind.limits < 13,])
plx <- predict(a, se = F)

plot(data$log.ind.limits, data$log.ave.ind.contribution, cex = 0, ylim = c(3, 8), xlim = c(5, 12), ylab = "Log Average Contribution", xlab = "Log Contribution Limit", main = "Limit Amount and Average Contribution Amount \n Individual Donors", axes = F, cex.main = 1.5, cex.lab = 1.25)
points(names(yaxis), yaxis, pch = 16)
lines(data$log.ind.limits[data$log.ind.limits < 13], plx, lwd = 3)
axis(1, at = seq(5, 12, 1))
axis(2, at = seq(3, 8, 1), las = 2)
box()

#####

#Figure A1 - right panel
#PAC Limits and Average Contribution

data <- data[!is.na(data$log.pac.limits),]
data <- data[!is.na(data$log.ave.pac.contribution),]
data <- data[order(data$log.pac.limits),]

data$round <- round(data$log.pac.limits, 1)

yaxis <- tapply(data$log.ave.pac.contribution, data$round, function(x) mean(x, na.rm = T))

a <- loess(log.ave.pac.contribution ~ log.pac.limits, data = data[data$log.pac.limits < 13,])
plx <- predict(a, se = F)

dev.new()
plot(data$log.pac.limits, data$log.ave.pac.contribution, cex = 0, ylim = c(3, 8), xlim = c(5, 12), ylab = "Log Average Contribution", xlab = "Log Contribution Limit", main = "Limit Amount and Average Contribution Amount \n PAC Donors", axes = F, cex.main = 1.5, cex.lab = 1.25)
points(names(yaxis), yaxis, pch = 16)
lines(data$log.pac.limits[data$log.pac.limits < 13], plx, lwd = 3)
axis(1, at = seq(5, 12, 1))
axis(2, at = seq(3, 8, 1), las = 2)
box()

######

#Figure A2 - left panel
#Individual Limits and Number of Maximizers

data <- data[!is.na(data$log.ind.limits),]
data <- data[!is.na(data$pct.ind.maximizing),]
data <- data[order(data$log.ind.limits),]

data$round <- round(data$log.ind.limits, 1)

yaxis <- tapply(data$pct.ind.maximizing, data$round, function(x) mean(x, na.rm = T))

a <- loess(pct.ind.maximizing ~ log.ind.limits, data = data[data$log.ind.limits < 13,])
plx <- predict(a, se = F)

dev.new()
plot(data$log.ind.limits, data$pct.ind.maximizing, cex = 0, ylim = c(0, .3), xlim = c(5, 12), ylab = "Percent Contributors Maximizing", xlab = "Log Contribution Limit", main = "Limit Amount and Donors Giving Maximum \n Individual Donors", axes = F, cex.main = 1.5, cex.lab = 1.25)
points(names(yaxis), yaxis, pch = 16)
lines(data$log.ind.limits[data$log.ind.limits < 13], plx, lwd = 3)
axis(1, at = seq(5, 12, 1))
axis(2, at = seq(0, 1, .1), las = 2)
box()

#####

#Figure A2 - right panel
#PAC Limits and Percent Maximizing

data <- data[!is.na(data$log.pac.limits),]
data <- data[!is.na(data$pct.pac.maximizing),]
data <- data[order(data$log.pac.limits),]

data$round <- round(data$log.pac.limits, 1)

yaxis <- tapply(data$pct.pac.maximizing, data$round, function(x) mean(x, na.rm = T))

a <- loess(pct.pac.maximizing ~ log.pac.limits, data = data[data$log.pac.limits < 13,])
plx <- predict(a, se = F)

dev.new()
plot(data$log.pac.limits, data$pct.pac.maximizing, cex = 0, ylim = c(0, .3), xlim = c(5, 12), ylab = "Percent Contributors Maximizing", xlab = "Log Contribution Limit", main = "Limit Amount and Donors Giving Maximum \n PAC Donors", axes = F, cex.main = 1.5, cex.lab = 1.25)
points(names(yaxis), yaxis, pch = 16)
lines(data$log.pac.limits[data$log.pac.limits < 13], plx, lwd = 3)
axis(1, at = seq(5, 12, 1))
axis(2, at = seq(0, 1, .1), las = 2)
box()

#####

#Figure A3 - left panel
#Individual Limits and Total Amount Raised

data <- data[!is.na(data$log.ind.limits),]
data <- data[!is.na(data$log.ind.raised),]
data <- data[order(data$log.ind.limits),]

data$round <- round(data$log.ind.limits, 1)

yaxis <- tapply(data$log.ind.raised, data$round, function(x) mean(x, na.rm = T))

a <- loess(log.ind.raised ~ log.ind.limits, data = data[data$log.ind.limits < 13,])
plx <- predict(a, se = F)

dev.new()
plot(data$log.ind.limits, data$log.ind.raised, cex = 0, ylim = c(5, 11), xlim = c(5, 12), ylab = "Log Amount Raised", xlab = "Log Contribution Limit", main = "Limit Amount and Amount Raised \n Individual Donors", axes = F, cex.main = 1.5, cex.lab = 1.25)
points(names(yaxis), yaxis, pch = 16)
lines(data$log.ind.limits[data$log.ind.limits < 13], plx, lwd = 3)
axis(1, at = seq(5, 12, 1))
axis(2, at = seq(5, 11, 1), las = 2)
box()

#####

#Figure A3 - right panel
#PAC Limits and Total Amount Raised

data <- data[!is.na(data$log.pac.limits),]
data <- data[!is.na(data$log.pac.raised),]
data <- data[order(data$log.pac.limits),]

data$round <- round(data$log.pac.limits, 1)

yaxis <- tapply(data$log.pac.raised, data$round, function(x) mean(x, na.rm = T))

a <- loess(log.pac.raised ~ log.pac.limits, data = data[data$log.pac.limits < 13,])
plx <- predict(a, se = F)

dev.new()
plot(data$log.pac.limits, data$log.pac.raised, cex = 0, ylim = c(5, 11), xlim = c(5, 12), ylab = "Log Amount Raised", xlab = "Log Contribution Limit", main = "Limit Amount and Amount Raised \n PAC Donors", axes = F, cex.main = 1.5, cex.lab = 1.25)
points(names(yaxis), yaxis, pch = 16)
lines(data$log.pac.limits[data$log.pac.limits < 13], plx, lwd = 3)
axis(1, at = seq(5, 12, 1))
axis(2, at = seq(5, 11, 1), las = 2)
box()

#####

#Figure A4 - left panel
#Individual Limits and Total Amount Raised in the state
#individual money raised in each state-year
data$st.yr <- paste(data$recipient_state, data$year, sep = "-")
yaxis <- tapply(data$ind.contributions, data$st.yr, function(x) sum(x, na.rm = T))
yaxis <- log(yaxis)
#limit amount for each state-year
xaxis <- tapply(data$log.ind.limits, data$st.yr, function(x) unique(x, na.rm = T))

#round xaxis for plotting
xaxis <- round(xaxis, 1)
axes <- as.data.frame(cbind(yaxis, xaxis))
#average amount raised in states with same contribution limit
yaxis <- tapply(axes$yaxis, axes$xaxis, function(x) mean(x, na.rm = T))

#lowess relationship between these two variables
a <- loess(yaxis[as.numeric(names(yaxis)) < 13] ~ names(yaxis[as.numeric(names(yaxis)) < 13]))
plx <- predict(a, se = F)

dev.new()
plot(5, 5, cex = 0, ylim = c(11, 17), xlim = c(5, 12), ylab = "Log Total Amount Raised in State", xlab = "Log Contribution Limit", main = "Limit Amount and Amount Raised in State \n Individual Donors", axes = F, cex.main = 1.5, cex.lab = 1.25)
points(as.numeric(names(yaxis)), yaxis, pch = 16)
lines(names(yaxis[as.numeric(names(yaxis)) < 13]), plx, lwd = 3, pch = 16)
axis(1, at = seq(5, 12, 1))
axis(2, at = seq(11, 17, 1), las = 2)
box()

#####

#Figure A4 - right panel
#PAC Limits and Total Amount Raised
#PAC money raised in each state-year
yaxis <- tapply(data$group.contributions, data$st.yr, function(x) sum(x, na.rm = T))
yaxis <- log(yaxis)
#limit amount for each state-year
xaxis <- tapply(data$log.pac.limits, data$st.yr, function(x) unique(x, na.rm = T))

#round xaxis for plotting
xaxis <- round(xaxis, 1)
axes <- as.data.frame(cbind(yaxis, xaxis))
#average amount raised in states with same contribution limit
yaxis <- tapply(axes$yaxis, axes$xaxis, function(x) mean(x, na.rm = T))

#lowess relationship between these two variables
a <- loess(yaxis[as.numeric(names(yaxis)) < 13] ~ names(yaxis[as.numeric(names(yaxis)) < 13]))
plx <- predict(a, se = F)

dev.new()
plot(5, 5, cex = 0, ylim = c(11, 17), xlim = c(5, 12), ylab = "Log Total Amount Raised in State", xlab = "Log Contribution Limit", main = "Limit Amount and Amount Raised in State \n PAC Donors", axes = F, cex.main = 1.5, cex.lab = 1.25)
points(as.numeric(names(yaxis)), yaxis, pch = 16)
lines(names(yaxis[as.numeric(names(yaxis)) < 13]), plx, lwd = 3, pch = 16)
axis(1, at = seq(5, 12, 1))
axis(2, at = seq(11, 17, 1), las = 2)
box()