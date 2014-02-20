require(ANOVA)
require(ggplot2)
data=read.delim("Fa13IIAnalysis.txt",header=T)
data$CourseGoal=factor(data$CourseGoal)
CourseGoalReg=aov(FE~CourseGoal,data=data)
summary(CourseGoalReg)

tkTestCompare=TukeyHSD(CourseGoalReg)
plot(tkTestCompare)


data<-within(data, CourseGoal<-relevel(CourseGoal, ref = '8'))
data$CourseGoal <- relevel(data$CourseGoal, ref = "10")
CourseGoalReg=glm(FE~CourseGoal,data=data)

summary(CourseGoalReg)

M100CG10=data[data$CourseGoal==10,]
M100CG8=data[data$CourseGoal==8,]
M100CG5=data[data$CourseGoal==5,]
boxplot(M100CG10$FE,M100CG8$FE,M100CG5$FE)
ggplot(FE~CourseGoal,data=data)

plot(FE~CourseGoal,data=data)
dafadd
