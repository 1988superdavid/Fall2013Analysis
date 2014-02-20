require(ANOVA)
require(ggplot2)
require(multcomp)

data=read.delim("MidtermFinalAX.txt",header=T)
realdata=data
colnames(realdata)=c('UserName','Midterm','FE','AXGrades')

realdata$AXGrades=sub("^$", "N", realdata$AXGrades)

M100=realdata[realdata$AXGrades=='',]

realdata$AXGrades=factor(realdata$AXGrades)

AXGradesReg=aov(FE~AXGrades,data=realdata)
summary(AXGradesReg)

tkTestCompare=TukeyHSD(AXGradesReg)
plot(tkTestCompare)


realdata <- within(realdata,AXGrades<- relevel(AXGrades, ref = 'N'))

AXGradesReg=aov(FE~AXGrades,data=realdata)
test.dunnett=glht(AXGradesReg,linfct=mcp(AXGrades="Dunnett"))
confint(test.dunnett)
plot(test.dunnett)


