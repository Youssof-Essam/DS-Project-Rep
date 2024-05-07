# Changes and sets working directory
dir<-getwd()
dir<-gsub("R-Scripts","",dir)
setwd(dir)

df<-read.csv("Datasets/all_cities.csv")
items<-read.csv("Datasets/items.csv")
total_sales<-sum(df$total)
items<-items[order(items$Sales,decreasing = TRUE),]
top<-items$Item[1:5]