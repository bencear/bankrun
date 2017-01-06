//FIRST response box
graph drop _all
*NOT obs'd
graph box response1 if postion == 1 & (net == 52 | net == 53 | net == 82 | net == 83), over(choice) title(NOT obs'd) name(case1) ylabel(40 70 100) yscale(r(40 110) noextend) ytitle("")
*obs'd by SECOND
graph box response1 if postion == 1 & (net == 12 | net == 13 | net == 42 | net == 43), over(choice) title(obs'd by SECOND) name(case2) ylabel(40 70 100) yscale(r(40 110) noextend) ytitle("")
*obs'd by THIRD
graph box response1 if postion == 1 & (net == 32 | net == 33 | net == 62 | net == 63), over(choice) title(obs'd by THIRD) name(case3) ylabel(40 70 100) yscale(r(40 110) noextend) ytitle("")
*obs'd by BOTH
graph box response1 if postion == 1 & (net == 22 | net == 23 | net == 72 | net == 73), over(choice) title(obs'd by BOTH) name(case4) ylabel(40 70 100) yscale(r(40 110) noextend) ytitle("")

graph combine case1 case2 case3 case4


//FIRST choice bar
graph drop _all
*NOT obs'd
hist choice if postion == 1 & (net == 52 | net == 53 | net == 82 | net == 83), title(NOT obs'd) name(case1) start(0) bin(3) xlabel(0 1) freq xscale(r(0 2) noextend) yscale(r(0 100) noextend) ylabel(0 25 50 75 100)
*obs'd by SECOND
hist choice if postion == 1 & (net == 12 | net == 13 | net == 42 | net == 43), title(obs'd by SECOND) name(case2) start(0) bin(3) xlabel(0 1) freq xscale(r(0 2) noextend) yscale(r(0 100) noextend) ylabel(0 25 50 75 100)
*obs'd by THIRD
hist choice if postion == 1 & (net == 32 | net == 33 | net == 62 | net == 63), title(obs'd by THIRD) name(case3) start(0) bin(3) xlabel(0 1) freq xscale(r(0 2) noextend) yscale(r(0 100) noextend) ylabel(0 25 50 75 100)
*obs'd by BOTH
hist choice if postion == 1 & (net == 22 | net == 23 | net == 72 | net == 73), title(obs'd by BOTH) name(case4) start(0) bin(3) xlabel(0 1) freq xscale(r(0 2) noextend) yscale(r(0 100) noextend) ylabel(0 25 50 75 100) ytitle("")

graph combine case1 case2 case3 case4

//FIRST scatter
