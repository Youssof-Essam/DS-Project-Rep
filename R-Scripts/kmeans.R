# Changes and sets working directory
dir<-getwd()
dir<-gsub("R-Scripts","",dir)
setwd(dir)

library(factoextra)

df<-read.csv("Datasets/all_cities.csv")
customers<-unique(df$customer)
totals<-vector()
ages<-vector()

for (c in customers) {
  sum<-sum(df$total[df$customer==c])
  totals<-append(totals,sum)
  ages<-append(ages,unique(df$age[df$customer==c]))
  
}
df2<-data.frame(customers,totals,ages)
calc<-function(ncl){
  return(kmeans(df2[,-c(1)],centers = as.numeric(ncl),nstart = 300))
}


show_plot<-function(){
  fviz_cluster(k, data =df2[,-c(1)] ,
               geom = c("text","point"),
               ellipse.type = "convex",
               ggtheme = theme_bw()
  )
}
show_table<-function(){
  return(data.frame("Customer"=df2$customers,"Cluster"=k$cluster))
}

