//SECOND response box
graph drop _all
*observes, observed
graph box response2 if postion == 2 & (net == 11 | net == 13 | net == 71 | net == 73) & ObsWi2 == 1, over(choice) title(obs 1 WD in obs obs'd) name(case1) ylabel(40 70 100) yscale(r(40 110) noextend) ytitle("")
graph box response2 if postion == 2 & (net == 11 | net == 13 | net == 71 | net == 73) & ObsWa2 == 1, over(choice) title(obs 0 WD in obs obs'd) name(case1a) ylabel(40 70 100) yscale(r(40 110) noextend) ytitle("")
*observes, not observed 
graph box response2 if postion == 2 & (net == 21 | net == 23 | net == 41 | net == 43) & ObsWi2 == 1, over(choice) title(obs 1 WD in obs not_obs'd) name(case2) ylabel(40 70 100) yscale(r(40 110) noextend) ytitle("")
graph box response2 if postion == 2 & (net == 21 | net == 23 | net == 41 | net == 43) & ObsWa2 == 1, over(choice) title(obs 0 WD in obs not_obs'd) name(case2a) ylabel(40 70 100) yscale(r(40 110) noextend) ytitle("")
*not observes, observed 
graph box response2 if postion == 2 & (net == 31 | net == 33 | net == 51 | net == 53) & ObsNo2 == 1, over(choice) title(obs 0 WD in not_obs obs'd) name(case3) ylabel(40 70 100) yscale(r(40 110) noextend) ytitle("")
*not observes, not observed 
graph box response2 if postion == 2 & (net == 61 | net == 63 | net == 81 | net == 83) & ObsNo2 == 1, over(choice) title(obs 0 WD in not_obs not_obs'd) name(case4) ylabel(40 70 100) yscale(r(40 110) noextend) ytitle("")

graph combine case1 case1a case2 case2a case3 case4



//SECOND choice bar
graph drop _all
*observes, observed
hist choice if postion == 2 & (net == 11 | net == 13 | net == 71 | net == 73) & ObsWi2 == 1, title(obs 1 WD in obs obs'd) name(case1) start(0) bin(3) xlabel(0 1) freq xscale(r(0 2) noextend) yscale(r(0 100) noextend) ylabel(0 25 50 75 100)
hist choice if postion == 2 & (net == 11 | net == 13 | net == 71 | net == 73) & ObsWa2 == 1, title(obs 0 WD in obs obs'd) name(case1a) start(0) bin(3) xlabel(0 1) freq xscale(r(0 2) noextend) yscale(r(0 100) noextend) ylabel(0 25 50 75 100)
*observes, not observed 
hist choice if postion == 2 & (net == 21 | net == 23 | net == 41 | net == 43) & ObsWi2 == 1, title(obs 1 WD in obs not_obs'd) name(case2) start(0) bin(3) xlabel(0 1) freq xscale(r(0 2) noextend) yscale(r(0 100) noextend) ylabel(0 25 50 75 100)
hist choice if postion == 2 & (net == 21 | net == 23 | net == 41 | net == 43) & ObsWa2 == 1, title(obs 0 WD in obs not_obs'd) name(case2a) start(0) bin(3) xlabel(0 1) freq xscale(r(0 2) noextend) yscale(r(0 100) noextend) ylabel(0 25 50 75 100)
*not observes, observed 
hist choice if postion == 2 & (net == 31 | net == 33 | net == 51 | net == 53) & ObsNo2 == 1, title(obs 0 WD in not_obs obs'd) name(case3) start(0) bin(3) xlabel(0 1) freq xscale(r(0 2) noextend) yscale(r(0 100) noextend) ylabel(0 25 50 75 100)
*not observes, not observed 
hist choice if postion == 2 & (net == 61 | net == 63 | net == 81 | net == 83) & ObsNo2 == 1, title(obs 0 WD in not_obs not_obs'd) name(case4) start(0) bin(3) xlabel(0 1) freq xscale(r(0 2) noextend) yscale(r(0 100) noextend) ylabel(0 25 50 75 100)

graph combine case1 case1a case2 case2a case3 case4
