getwd()

load(file = "./data/land2016_raw.rda")
load(file = "./data/land2017_raw.rda")

# copy Data : a = 2017, b= 2016

a <- land2017_raw
b <- land2016_raw

str(a)
str(b)

#sorting columns
a<- a[ , order(names(a))]
b<- b[, order(names(b))]

#remove useless columns
b <- subset(b, select = -c(시군구_1,본번지_1,부번지_1))

#create empty columns from 2017
b$시군구명 <- ''
b$용도지역2 <- ''
b$지리적위치2 <- ''
b$지번 <- ''

b<- b[, order(names(b))]

#filling 0 values
library(stringr)
a$본번지<-str_pad(a$본번지, 4, pad = "0")
a$부번지<-str_pad(a$부번지, 4, pad = "0")

#copy column names
colnames(b) <- colnames(a)


#add identifier 
a$year <- "2017"
b$year <- "2016"

#reorder
a<-a[,c("year","일련번호","시도명","시군구","시군구명","읍면","동리","읍면동리","본번지","부번지","지리적위치1","지리적위치2","지목","지번","지번구분","지세명","형상명","도로교통","면적","용도지역1","용도지역2","이용상황","주위환경","공시지가")]
b<-b[,c("year","일련번호","시도명","시군구","시군구명","읍면","동리","읍면동리","본번지","부번지","지리적위치1","지리적위치2","지목","지번","지번구분","지세명","형상명","도로교통","면적","용도지역1","용도지역2","이용상황","주위환경","공시지가")]

#change empty values to NULL
b[b == ''] <- NA
a[a == ''] <- NA

getwd()

save(a, file = "./data/land2017_raw.rda")
save(b, file = "./data/land2016_raw.rda")


