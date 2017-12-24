load(file = "./data/land2016_raw.rda")
load(file = "./data/land2017_raw.rda")

#sorting columns
land2017_raw <- land2017_raw[, order(names(land2017_raw))]
land2016_raw <- land2016_raw[, order(names(land2016_raw))]

#remove useless columns
land2016_raw <- subset(land2016_raw, select = -c(시군구_1, 본번지_1, 부번지_1))

#create empty columns from 2017
land2016_raw$시군구명 <- ''
land2016_raw$용도지역2 <- ''
land2016_raw$지리적위치2 <- ''
land2016_raw$지번 <- ''

land2016_raw <- land2016_raw[, order(names(land2016_raw))]

#filling 0 values
library(stringr)
land2017_raw$본번지 <- str_pad(land2017_raw$본번지, 4, pad = "0")
land2017_raw$부번지 <- str_pad(land2017_raw$부번지, 4, pad = "0")

#copy column names
colnames(land2016_raw) <- colnames(land2017_raw)

#reorder
land2017_raw <-
  land2017_raw[, c(
    "일련번호",
    "시도명",
    "시군구",
    "시군구명",
    "읍면",
    "동리",
    "읍면동리",
    "본번지",
    "부번지",
    "지리적위치1",
    "지리적위치2",
    "지목",
    "지번",
    "지번구분",
    "지세명",
    "형상명",
    "도로교통",
    "면적",
    "용도지역1",
    "용도지역2",
    "이용상황",
    "주위환경",
    "공시지가"
  )]
land2016_raw <-
  land2016_raw[, c(
    "일련번호",
    "시도명",
    "시군구",
    "시군구명",
    "읍면",
    "동리",
    "읍면동리",
    "본번지",
    "부번지",
    "지리적위치1",
    "지리적위치2",
    "지목",
    "지번",
    "지번구분",
    "지세명",
    "형상명",
    "도로교통",
    "면적",
    "용도지역1",
    "용도지역2",
    "이용상황",
    "주위환경",
    "공시지가"
  )]

#change empty values to NULL
land2016_raw[land2016_raw == ''] <- NA
land2017_raw[land2017_raw == ''] <- NA

save(land2017_raw, file = "./data/land2017_raw.rda")
save(land2016_raw, file = "./data/land2016_raw.rda")
