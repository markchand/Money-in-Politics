legislators <- read.dta("Table_2.dta")

#######################
#LEAVE ONE STATE OUT - FIGURE A9
#######################

#leave one state out
states <- unique(legislators$state)
rep.coef <- NULL

library(lme4)
for (i in 1:length(states)){
state <- states[i]

summary(model2 <- lmer(npscore_all ~ (1|state) + (1|year) + ind_unlimited + limited_int_ind_log_limit + pac_unlimited + limited_int_pac_log_limit + compete + pres_vote + dist_income2 + term_limit + republican + majority_party + chamber_pct_dem + professionalism, data = legislators[legislators$state != state,]))

a <- c(fixef(model2)[2:5])
rep.coef <- rbind(rep.coef, a)
print(state)
}

dev.new(width = 12, height = 4)
par(mfrow = c(1, 4), oma = c(0,2,0,0))
plot(density(rep.coef[,1], bw = .03), main = "Individual Unimited", xlim = c(-.01, .4), ylab = "Density", xlab = "Effect Size")
abline(v = .11, lty = 3)
plot(density(rep.coef[,2], bw = .003), main = "Individual Limit", xlim = c(-.01, .04), ylab = "", xlab = "Effect Size")
abline(v = .018, lty = 3)
plot(density(rep.coef[,3], bw = .03), main = "PAC Unlimited", xlim = c(-.4, .01), ylab = "", xlab = "Effect Size")
abline(v = -.07, lty = 3)
plot(density(rep.coef[,4], bw = .003), main = "PAC Limit", xlim = c(-.04,.01), ylab = "", xlab = "Effect Size")
abline(v = -.006, lty = 3)
