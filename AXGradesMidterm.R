require(ANOVA)
require(ggplot2)
require(multcomp)

data=read.delim("AXGradesMidterm.txt",header=T)
realdata=data[,c(1,5,6)]
colnames(realdata)=c('UserName','Midterm','AXGrades')

realdata$AXGrades=sub("^$", "N", realdata$AXGrades)

M100=realdata[realdata$AXGrades=='',]

realdata$AXGrades=factor(realdata$AXGrades)

AXGradesReg=aov(Midterm~AXGrades,data=realdata)
summary(AXGradesReg)

tkTestCompare=TukeyHSD(AXGradesReg)
plot(tkTestCompare)


realdata <- within(realdata,AXGrades<- relevel(AXGrades, ref = 'N'))

AXGradesReg=aov(Midterm~AXGrades,data=realdata)
test.dunnett=glht(AXGradesReg,linfct=mcp(AXGrades="Dunnett"))
confint(test.dunnett)
plot(test.dunnett)


