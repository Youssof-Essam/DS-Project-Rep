# Changes and sets working directory
dir<-getwd()
dir<-gsub("R-Scripts","",dir)
setwd(dir)

# loads given data set
df<-read.csv("Datasets/all_cities.csv")

# creates a sorted vector of all ages
ages<-sort(unique(df$age))

#creates vector containing total spending of each age
totals<- as.numeric(vector())
 for (age in ages) {
   x=sum(df$total[df$age==age])
   totals<-append(totals,x)
 }

# plots a bar plot of ages and their corresponding total
# barplot(totals,names.arg = ages)
text(x=barplot(totals/1000000,names.arg = ages,col="steelblue",xlab = "Age",ylab = "Million EGP",ylim = c(0,2)),y=totals/1000000,pos=3,labels = round(totals/1000000,3) ,cex=0.7)
