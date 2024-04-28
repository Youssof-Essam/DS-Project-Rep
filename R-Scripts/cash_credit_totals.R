# Changes and sets working directory
dir<-getwd()
dir<-gsub("R-Scripts","",dir)
setwd(dir)

# defines layout for panel
par(mfrow=c(4,3))


# loads given data set
df<-read.csv("Datasets/all_cities.csv")

# displays pie chart of payment totals per city
cities<- sort(unique(df$city))

totals<-c(sum(df$total[ tolower(df$paymentType) == "cash"]),sum(df$total[ tolower(df$paymentType) == "credit"]))
par(mar=c(0,0,2,0))
payment<-c("Cash","Credit")

chart<- pie(totals, paste(round(totals/sum(totals)*100,2),"%"),main="All cities",col = c("red","blue"))

legend("bottomright",payment,fill = c("red","blue"))

for (citiy in cities) {
  by_city<-df[df$city==citiy,]
  totals<-c(sum(by_city$total[ tolower(by_city$paymentType) == "cash"]),sum(by_city$total[ tolower(by_city$paymentType) == "credit"]))
  payment<-c("Cash","Credit")
  par(mar=c(0,0,2,0))
  chart<- pie(totals, paste(round(totals/sum(totals)*100,2),"%"),main=citiy,col = c("red","blue"))
  legend("bottomright",payment,fill = c("red","blue"))
}

