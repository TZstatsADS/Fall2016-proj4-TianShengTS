# read the label and test #
setwd("/Users/Cristina/Desktop/16 Fall/5243 ADS/Project 4/data/")
prob_yq<-read.csv("adjustprob20_yz.csv")
prob_test<-read.csv("topic_test_knn_30_zyq.csv")

name=prob_yq[,2]
name<-as.character(name)

prob_yq<-as.matrix(prob_yq[,-c(1,2)])
prob_test<-as.matrix(prob_test[,-1])

result<-prob_test%*%t(prob_yq)
colnames(result)=name

for (i in 1:nrow(result)){
  result[i,]=rank(-result[i,])
}


View(result)
a<-result[1,]

a[["pack"]]
a[["steadi"]]
a[["ladder"]]
a[["readi"]]
a[["jame"]]
a[["you"]]
a[["i"]]

b<-result[2,]

b[["night"]]
b[["men"]]
b[["ladi"]]

c<-result[3,]
c[["enough"]]
c[["beauti"]]
c[["believ"]]

d<-result[14,]
d1<-d[c("princess","lay")]
mean(d1)

d[["lay"]]
d[["alon"]]
d[["night"]]
d[["asleep"]]

names(rank)
