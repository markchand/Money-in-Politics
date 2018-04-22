#CCES
cces <- read.csv("cces2012.csv")

summary(model1 <- lm(ideology ~ as.factor(inputstate) + donor + vote + attend.event + put.up.sign + work.for.cand + attend.event + news.interest + income + male + education + white, data = cces[(cces$donate.other == 0 | cces$donate.state == 1) & cces$pid3 == "Republican",]))
length(model1$resid)

summary(model1 <- lm(ideology ~ as.factor(inputstate) + donor + vote + attend.event + put.up.sign + work.for.cand + attend.event + news.interest + income + male + education + white, data = cces[(cces$donate.other == 0 | cces$donate.state == 1) & cces$pid3 == "Democrat",]))
length(model1$resid)