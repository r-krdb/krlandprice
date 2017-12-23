library(readr)
## 2017
tar <-
  "https://www.data.go.kr/dataset/fileDownload.do?atchFileId=FILE_000000001380204&fileDetailSn=1&publicDataDetailPk=uddi:6c4f2ce3-5a37-4c02-969d-9651e9b90188"

dest<-"data-raw/land2017.csv"

writeLines(
  tem<-readLines(tar),
  file(dest, encoding = "UTF-8")
)

land2017_raw<-read_csv(dest)
for(i in 1:length(colnames(land2017_raw))){
  if(!validUTF8(colnames(land2017_raw)[i])){
    colnames(land2017_raw)[i] <- iconv(colnames(land2017_raw)[i], from = 'cp949', to = 'utf8')
  }
}
save(land2017_raw, file = "data/land2017_raw.rda", compress = "bzip2")


## 2016
tar <-
  "https://www.data.go.kr/dataset/fileDownload.do?atchFileId=FILE_000000001348474&fileDetailSn=1&publicDataDetailPk=uddi:017a7c6b-7285-45cf-8a6d-84794a012a97"

dest<-"data-raw/land2016.csv"

writeLines(
  tem<-readLines(tar),
  file(dest, encoding = "UTF-8")
)

land2016_raw<-read_csv(dest)
for(i in 1:length(colnames(land2016_raw))){
  if(!validUTF8(colnames(land2016_raw)[i])){
    colnames(land2016_raw)[i] <- iconv(colnames(land2016_raw)[i], from = 'cp949', to = 'utf8')
  }
}
save(land2016_raw, file = "data/land2016_raw.rda", compress = "bzip2")

