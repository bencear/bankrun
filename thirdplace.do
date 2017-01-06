//THIRD box
graph drop _all
*observes all
graph box response3 if postion == 3 & (net == 31 | net == 32 | net == 71 | net == 72) & ObsWiWi2 == 1, over(choice) title(obs 2 WD in obs ALL) name(case1) ylabel(40 70 100) yscale(r(40 110) noextend) ytitle("")
graph box response3 if postion == 3 & (net == 31 | net == 32 | net == 71 | net == 72) & ObsWaWi2 == 1, over(choice) title(obs 1 WD in obs ALL) name(case1a) ylabel(40 70 100) yscale(r(40 110) noextend) ytitle("")
*observes first
graph box response3 if postion == 3 & (net == 21 | net == 22 | net == 61 | net == 62) & ObsWi2 == 1, over(choice) title(obs 1 WD in FIRST) name(case2) ylabel(40 70 100) yscale(r(40 110) noextend) ytitle("")
graph box response3 if postion == 3 & (net == 21 | net == 22 | net == 61 | net == 62) & ObsWa2 == 1, over(choice) title(obs 0 WD in FIRST) name(case2a) ylabel(40 70 100) yscale(r(40 110) noextend) ytitle("")
*observes second
graph box response3 if postion == 3 & (net == 11 | net == 12 | net == 51 | net == 52) & ObsWi2 == 1, over(choice) title(obs 1 WD in SECOND) name(case3) ylabel(40 70 100) yscale(r(40 110) noextend) ytitle("")
graph box response3 if postion == 3 & (net == 11 | net == 12 | net == 51 | net == 52) & ObsWa2 == 1, over(choice) title(obs 0 WD in SECOND) name(case3a) ylabel(40 70 100) yscale(r(40 110) noextend) ytitle("")
*can not observe
graph box response3 if postion == 3 & (net == 41 | net == 42 | net == 81 | net == 82), over(choice) title(obs 0 WD in CAN_NOT) name(case4) ylabel(40 70 100) yscale(r(40 110) noextend) ytitle("")

graph combine case1 case1a case2 case2a case3 case3a case4


//THIRD choice bar
graph drop _all
*observes all
hist choice if postion == 3 & (net == 31 | net == 32 | net == 71 | net == 72) & ObsWaWi2 == 1, title(obs 2 WD in ALL) name(case1) start(0) bin(3) xlabel(0 1) freq xscale(r(0 2) noextend) yscale(r(0 100) noextend) ylabel(0 25 50 75 100)
hist choice if postion == 3 & (net == 31 | net == 32 | net == 71 | net == 72) & ObsWaWi2 == 1, title(obs 1 WD in ALL) name(case1a) start(0) bin(3) xlabel(0 1) freq xscale(r(0 2) noextend) yscale(r(0 100) noextend) ylabel(0 25 50 75 100)
*observes first
hist choice if postion == 3 & (net == 21 | net == 22 | net == 61 | net == 62) & ObsWi2 == 1, title(obs 1 WD in FIRST) name(case2) start(0) bin(3) xlabel(0 1) freq xscale(r(0 2) noextend) yscale(r(0 100) noextend) ylabel(0 25 50 75 100)
hist choice if postion == 3 & (net == 21 | net == 22 | net == 61 | net == 62) & ObsWa2 == 1, title(obs 0 WD in FIRST) name(case2a) start(0) bin(3) xlabel(0 1) freq xscale(r(0 2) noextend) yscale(r(0 100) noextend) ylabel(0 25 50 75 100)
*observes second
hist choice if postion == 3 & (net == 11 | net == 12 | net == 51 | net == 52) & ObsWi2 == 1, title(obs 1 WD in SECOND) name(case3) start(0) bin(3) xlabel(0 1) freq xscale(r(0 2) noextend) yscale(r(0 100) noextend) ylabel(0 25 50 75 100)
hist choice if postion == 3 & (net == 11 | net == 12 | net == 51 | net == 52) & ObsWa2 == 1, title(obs 0 WD in SECOND) name(case3a) start(0) bin(3) xlabel(0 1) freq xscale(r(0 2) noextend) yscale(r(0 100) noextend) ylabel(0 25 50 75 100)

*can not observe
hist choice if postion == 3 & (net == 41 | net == 42 | net == 81 | net == 82) & observation == 0, title(obs 0 WD in CAN_NOT) name(case4) start(0) bin(3) xlabel(0 1) freq xscale(r(0 2) noextend) yscale(r(0 100) noextend) ylabel(0 25 50 75 100)

graph combine case1 case1a case2 case2a case3 case3a case4


