# Changes and sets working directory
dir<-getwd()
dir<-gsub("R-Scripts","",dir)
setwd(dir)

df<-read.csv("datasets/all_cities.csv")
customers<-sort(unique(df$customer))

totals_by_customer<-vector()
number_of_orders<-vector()
for (customer in customers) {
  total_by_customer<-sum(df$total[df$customer==customer])
  totals_by_customer<-append(totals_by_customer,total_by_customer)
  number<-nrow(df[df$customer==customer,])
  number_of_orders<-append(number_of_orders,number)
}
average_total<-vector()
for (customer in customer_data$name) {
  average<-(customer_data$total[customer_data$name==customer])/(customer_data$orders[customer_data$name==customer])
  average_total<-append(average_total,round(average))
}
customer_data<-data.frame("name"=customers,"orders"=number_of_orders,"total"=totals_by_customer,"average"=average_total)
customer_data<-customer_data[order(customer_data$average,decreasing = TRUE),]
text(
  x=barplot(customer_data$average,names.arg = customer_data$name,ylim = c(0,2000),col = "steelblue"),
  labels = customer_data$average,y=customer_data$average,cex=0.8,pos = 3
)