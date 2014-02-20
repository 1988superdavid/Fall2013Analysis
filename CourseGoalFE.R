data=read.delim("CourseGoalFE.txt",header=T)
%Eliminate NA data%
data=data.frame(data)
colnames(data)=c('Name','Email','CourseGoal','FE')


reg=lm(FE~CourseGoal,data=data)
summary(reg)

plot(data$FE~data$CourseGoal)
