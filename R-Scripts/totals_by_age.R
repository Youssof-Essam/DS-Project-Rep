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

# plots a scatter plot of ages and their corresponding total
plot(ages,totals)
