# Changes and sets working directory
dir<-getwd()
dir<-gsub("R-Scripts","",dir)
setwd(dir)

library(ggplot2)

df<-read.csv("Datasets/all_cities.csv")

chart<-ggplot(df,aes(x=total))+geom_histogram(binwidth = 500,color="white",fill="steelblue")+labs(x="Total",y="Frequency")+theme_minimal()

