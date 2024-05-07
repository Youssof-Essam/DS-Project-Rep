# Changes and sets working directory
dir<-getwd()
dir<-gsub("R-Scripts","",dir)
setwd(dir)

library(arules)

items<-read.transactions("Datasets/items.csv",sep = ",")

ruleset<-apriori(items,parameter = list(support=0.007,confidence=0.25,minlen=2))
inspect(sort(ruleset,by="lift")[1:5])