data=read.delim("MidtermFE.txt",header=T)
realdata=data[,c(1,2,6,10,11,13)]
colnames(realdata)=c('UserName','CourseGoal','Midterm','Final','IA','AXGrades')

realdata$AXGrades=sub("^$", "N", realdata$AXGrades)
realdataMath100=realdata[realdata$AXGrades=='N',]

reg=lm(Final~Midterm+CourseGoal+IA,data=realdataMath100)
summary(reg)
