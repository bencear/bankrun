//REGRESSIONS

regress response1 CRT_sum sqCRT_sum
outreg2 using cognitive.doc, replace ctitle(Response1)
regress response2 CRT_sum sqCRT_sum
outreg2 using cognitive.doc, append ctitle(Response2)
regress response3 CRT_sum sqCRT_sum
outreg2 using cognitive.doc, append ctitle(Response3)



//BASIC graphs scatter + qfir
graph drop _all

graph twoway (scatter response1 CRT_sum) (qfitci response1 CRT_sum), name(case1) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
graph twoway (scatter response2 CRT_sum) (qfitci response2 CRT_sum), name(case2) ylabel(10 25 50 75 100) yscale(r(10 100) noextend)
graph twoway (scatter response3 CRT_sum) (qfitci response3 CRT_sum), name(case3) ylabel(10 25 50 75 100) yscale(r(10 100) noextend)

graph combine case1 case2 case3

//FIRST qfit
graph drop _all
*NOT obs'd
twoway qfitci response1 CRT_sum if postion == 1 & (net == 52 | net == 53 | net == 82 | net == 83), title(NOT obs'd) name(case1) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
*obs'd by SECOND
twoway qfitci response1 CRT_sum if postion == 1 & (net == 12 | net == 13 | net == 42 | net == 43), title(obs'd by SECOND) name(case2) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
*obs'd by THIRD
twoway qfitci response1 CRT_sum if postion == 1 & (net == 32 | net == 33 | net == 62 | net == 63), title(obs'd by THIRD) name(case3) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
*obs'd by BOTH
twoway qfitci response1 CRT_sum if postion == 1 & (net == 22 | net == 23 | net == 72 | net == 73), title(obs'd by BOTH) name(case4) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 

graph combine case1 case2 case3 case4


//FIRST qfit + scatter
graph drop _all
*NOT obs'd
graph twoway (qfitci response1 CRT_sum) (scatter response1 CRT_sum) if postion == 1 & (net == 52 | net == 53 | net == 82 | net == 83), title(NOT obs'd) name(case1) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
*obs'd by SECOND
graph twoway (qfitci response1 CRT_sum) (scatter response1 CRT_sum) if postion == 1 & (net == 12 | net == 13 | net == 42 | net == 43), title(obs'd by SECOND) name(case2) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
*obs'd by THIRD
graph twoway (qfitci response1 CRT_sum) (scatter response1 CRT_sum) if postion == 1 & (net == 32 | net == 33 | net == 62 | net == 63), title(obs'd by THIRD) name(case3) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
*obs'd by BOTH
graph twoway (qfitci response1 CRT_sum) (scatter response1 CRT_sum) if postion == 1 & (net == 22 | net == 23 | net == 72 | net == 73), title(obs'd by BOTH) name(case4) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 

graph combine case1 case2 case3 case4




//SECOND qfit
graph drop _all
*observes, observed
twoway qfitci response2 CRT_sum if postion == 2 & (net == 11 | net == 13 | net == 71 | net == 73) & observation == 1, title(obs 1 WD in obs obs'd) name(case1) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
twoway qfitci response2 CRT_sum if postion == 2 & (net == 11 | net == 13 | net == 71 | net == 73) & observation == 0, title(obs 0 WD in obs obs'd) name(case1a) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
*observes, not observed 
twoway qfitci response2 CRT_sum if postion == 2 & (net == 21 | net == 23 | net == 41 | net == 43) & observation == 1, title(obs 1 WD in obs not_obs'd) name(case2) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
twoway qfitci response2 CRT_sum if postion == 2 & (net == 21 | net == 23 | net == 41 | net == 43) & observation == 0, title(obs 0 WD in obs not_obs'd) name(case2a) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
*not observes, observed 
twoway qfitci response2 CRT_sum if postion == 2 & (net == 31 | net == 33 | net == 51 | net == 53) & observation == 0, title(obs 0 WD in not_obs obs'd) name(case3) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
*not observes, not observed 
twoway qfitci response2 CRT_sum if postion == 2 & (net == 61 | net == 63 | net == 81 | net == 83) & observation == 0, title(obs 0 WD in not_obs not_obs'd) name(case4) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 

graph combine case1 case1a case2 case2a case3 case4



//SECOND scatter + qfit
graph drop _all
*observes, observed
graph twoway (qfitci response2 CRT_sum) (scatter response2 CRT_sum) if postion == 2 & (net == 11 | net == 13 | net == 71 | net == 73) & observation == 1, title(obs 1 WD in obs obs'd) name(case1) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
graph twoway (qfitci response2 CRT_sum) (scatter response2 CRT_sum) if postion == 2 & (net == 11 | net == 13 | net == 71 | net == 73) & observation == 0, title(obs 0 WD in obs obs'd) name(case1a) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
*observes, not observed 
graph twoway (qfitci response2 CRT_sum) (scatter response2 CRT_sum) if postion == 2 & (net == 21 | net == 23 | net == 41 | net == 43) & observation == 1, title(obs 1 WD in obs not_obs'd) name(case2) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
graph twoway (qfitci response2 CRT_sum) (scatter response2 CRT_sum) if postion == 2 & (net == 21 | net == 23 | net == 41 | net == 43) & observation == 0, title(obs 0 WD in obs not_obs'd) name(case2a) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
*not observes, observed 
graph twoway (qfitci response2 CRT_sum) (scatter response2 CRT_sum) if postion == 2 & (net == 31 | net == 33 | net == 51 | net == 53) & observation == 0, title(obs 0 WD in not_obs obs'd) name(case3) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
*not observes, not observed 
graph twoway (qfitci response2 CRT_sum) (scatter response2 CRT_sum) if postion == 2 & (net == 61 | net == 63 | net == 81 | net == 83) & observation == 0, title(obs 0 WD in not_obs not_obs'd) name(case4) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 

graph combine case1 case1a case2 case2a case3 case4



//THIRD qfit
graph drop _all
*observes all
twoway qfitci response3 CRT_sum if postion == 3 & (net == 31 | net == 32 | net == 71 | net == 72) & observation == 2, title(obs 2 WD in obs ALL) name(case1) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
twoway qfitci response3 CRT_sum if postion == 3 & (net == 31 | net == 32 | net == 71 | net == 72) & observation == 1, title(obs 1 WD in obs ALL) name(case1a) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
*observes first
twoway qfitci response3 CRT_sum if postion == 3 & (net == 21 | net == 22 | net == 61 | net == 62) & observation == 1, title(obs 1 WD in FIRST) name(case2) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
twoway qfitci response3 CRT_sum if postion == 3 & (net == 21 | net == 22 | net == 61 | net == 62) & observation == 0, title(obs 0 WD in FIRST) name(case2a) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
*observes second
twoway qfitci response3 CRT_sum if postion == 3 & (net == 11 | net == 12 | net == 51 | net == 52) & observation == 1, title(obs 1 WD in SECOND) name(case3) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
twoway qfitci response3 CRT_sum if postion == 3 & (net == 11 | net == 12 | net == 51 | net == 52) & observation == 0, title(obs 0 WD in SECOND) name(case3a) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
*can not observe
twoway qfitci response3 CRT_sum if postion == 3 & (net == 41 | net == 42 | net == 81 | net == 82), title(obs 0 WD in CAN_NOT) name(case4) ylabel(0 1 2 3) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 

graph combine case1 case1a case2 case2a case3 case3a case4


//THIRD scatter+qfit
graph drop _all
*observes all
graph twoway (qfitci response3 CRT_sum) (scatter response3 CRT_sum) if postion == 3 & (net == 31 | net == 32 | net == 71 | net == 72) & observation == 2, title(obs 2 WD in obs ALL) name(case1) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
graph twoway (qfitci response3 CRT_sum) (scatter response3 CRT_sum) if postion == 3 & (net == 31 | net == 32 | net == 71 | net == 72) & observation == 1, title(obs 1 WD in obs ALL) name(case1a) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
*observes first
graph twoway (qfitci response3 CRT_sum) (scatter response3 CRT_sum) if postion == 3 & (net == 21 | net == 22 | net == 61 | net == 62) & observation == 1, title(obs 1 WD in FIRST) name(case2) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
graph twoway (qfitci response3 CRT_sum) (scatter response3 CRT_sum) if postion == 3 & (net == 21 | net == 22 | net == 61 | net == 62) & observation == 0, title(obs 0 WD in FIRST) name(case2a) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
*observes second
graph twoway (qfitci response3 CRT_sum) (scatter response3 CRT_sum) if postion == 3 & (net == 11 | net == 12 | net == 51 | net == 52) & observation == 1, title(obs 1 WD in SECOND) name(case3) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
graph twoway (qfitci response3 CRT_sum) (scatter response3 CRT_sum) if postion == 3 & (net == 11 | net == 12 | net == 51 | net == 52) & observation == 0, title(obs 0 WD in SECOND) name(case3a) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 
*can not observe
graph twoway (qfitci response3 CRT_sum) (scatter response3 CRT_sum) if postion == 3 & (net == 41 | net == 42 | net == 81 | net == 82), title(obs 0 WD in CAN_NOT) name(case4) ylabel(0 1 2 3) ylabel(10 25 50 75 100) yscale(r(10 100) noextend) 

graph combine case1 case1a case2 case2a case3 case3a case4

