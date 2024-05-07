# Changes and sets working directory
dir<-getwd()
dir<-gsub("R-Scripts","",dir)
setwd(dir)

library(arules)


get_ruleset<-function(supp,conf){
  items<-read.transactions("Datasets/items.csv",sep = ",")
  rule<-apriori(items,parameter = list(support=supp,confidence=conf,minlen=2))
  rule_frame<-DATAFRAME(from = rule,separate=TRUE)
  return(rule_frame)
}


