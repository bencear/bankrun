
//ALL
summarize response, detail
scalar response_median = r(p50)

gen response_greater = 0
replace response_greater = 1 if response>=response_median

table informationset response_greater clever, c(n response) row col scol

//ALL_clever
summarize response if clever == 1, detail
scalar response_clever_median = r(p50)

gen response_clever_greater = 0 if clever == 1
replace response_clever_greater = 1 if response>=response_clever_median & response_clever_greater != .




//ALL_notclever
summarize response if clever == 0, detail
scalar response_notclever_median = r(p50)

gen response_notclever_greater = 0 if clever == 0
replace response_notclever_greater = 1 if response>=response_notclever_median & response_notclever_greater != .




//tables
table informationset response_clever if clever == 1, c(mean choice)
table informationset response_notclever if clever == 0, c(mean choice)



table informationset response_greater clever, c(n response) row col scol



//THRID
summarize response3, detail
scalar response3_median = r(p50)

gen response3_greater = 0
replace response3_greater = 1 if response3>=response3_median

table informationset response_greater clever, c(n response) row col scol
