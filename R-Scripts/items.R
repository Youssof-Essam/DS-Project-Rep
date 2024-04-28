# Changes and sets working directory
dir<-getwd()
dir<-gsub("R-Scripts","",dir)
setwd(dir)

df<-read.csv("datasets/all_cities.csv")

items<-vector()
item_lists<-strsplit(df$items,",")


for (item_list in item_lists) {
  for (item in item_list) {
    items<-append(items,item)
  }
}
items<-unique(items)
item_sales<-vector()
sales<-0
for (item in items) {
  
  for (ilist in item_lists) {
    
    if(item %in% ilist)
    sales<-sales+1
  }
  item_sales<-append(item_sales,sales)
  sales<-0
}

item_data<-data.frame("Item"=items,"Sales"=item_sales)

write.csv(item_data,file = "datasets/items.csv")


