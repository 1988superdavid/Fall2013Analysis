data=read.delim("IAMidtermFinal.txt",header=T)
realdata=data[,c(1,2,6,10,13,14)]
colnames(realdata)=c('UserName','CourseGoal',
                        'Midterm','FE','IAB','IAF')
reg=lm(FE~Midterm,data=realdata)
summary(reg)


reg=lm(Midterm~CourseGoal+IAB,data=realdata)
summary(reg)


reg=lm(FE~CourseGoal+IAB,data=realdata)
summary(reg)


reg=lm(FE~CourseGoal,data=realdata)
summary(reg)

reg=lm(CourseGoal~IAB,data=realdata)
summary(reg)



