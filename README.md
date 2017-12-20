# krlandprice

[![Travis-CI Build Status](https://travis-ci.org/mrchypark/krlandprice.svg?branch=master)](https://travis-ci.org/mrchypark/krlandprice)

공공데이터 포털에 공개된 표준공시지가 데이터를
R에서 사용하기 쉽게 제작한 패키지

* `land2017_raw`: 가공하지 않은 2017년 표준공시지가 데이터
* `land2016_raw`: 가공하지 않은 2016년 표준공시지가 데이터

## installation

```
if(!requireNamespace("devtools")) install.packages("devtools")
devtools::install_github("mrchypark/krlandprice")
library(krlandprice)
land2017_raw
```
