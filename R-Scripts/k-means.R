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
new_df1<-df2[,-c(1)]
k<-kmeans(new_df1,centers = 2)
k