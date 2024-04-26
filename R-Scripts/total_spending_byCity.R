# Changes and sets working directory
dir<-getwd()
dir<-gsub("R-Scripts","",dir)
setwd(dir)

df<-read.csv("Datasets/all_cities.csv")

cities<-unique(df$city)
totals<-vector()
for (city in cities) {
  total<- sum(df$total[df$city==city])
  totals<- append(totals,total)
}
total_by_city<-data.frame(cities,totals)

total_by_city<-total_by_city[order(total_by_city$totals,decreasing = TRUE),]

#barplot(total_by_city$totals,names.arg = total_by_city$cities,col = "steelblue",ylim = c(0,3000000))

text(x=barplot(total_by_city$totals,names.arg = total_by_city$cities,col = "steelblue",ylim = c(0,3000000))
,y=total_by_city$totals ,labels = total_by_city$totals,pos = 3,,cex=0.8)