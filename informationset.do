gen ObsNo2 = 0
gen ObsWi2 = 0
gen ObsWa2 = 0
gen ObsWiWi2 = 0
gen ObsWaWi2 = 0


//THIRD pos.

*Nothing: possible networks: 41, 42, 81, 82
replace ObsNo2 = 1 if postion == 3 & (net == 41 | net == 42 | net == 81 | net == 82)

*Computer Withdraw: possible networks: 21, 61, 12, 52
replace ObsWi2 = 1 if postion == 3 & (net == 21 | net == 61 | net == 12 | net == 52)

*Player Withdraw: 
*possible if other withdraws
replace ObsWi2 = 1 if postion == 3 & ochoice == 1  & (net == 22 | net == 62 | net == 11 | net == 51)

*Player Waiting: possible networks: networks in which she observes just one player BUT not the computer, because it's impatient
	*networks: 22, 62, 11, 51
*possible if: other waits
replace ObsWa2 = 1 if postion == 3 & ochoice == 0 & (net == 22 | net == 62 | net == 11 | net == 51)

*Withdraw - Withdraw: possible networks: 31, 32, 71, 72 (oberves everything)
*possible if: other withdraws
replace ObsWiWi2 = 1 if postion == 3 & ochoice == 1 & (net == 31 | net == 32 | net == 71 | net == 72)

*Waiting - Withdraw: possible networks: 31, 32, 71, 72 (observes everthing)
*possible if: other waits
replace ObsWaWi2 = 1 if postion == 3 & ochoice == 0 & (net == 31 | net == 32 | net == 71 | net == 72)


//SECOND pos. 

*Nothing: possible networks: 31, 33, 51, 53, 61, 63, 81, 83
replace ObsNo2 = 1 if postion == 2 & (net == 31 | net == 33 | net == 51 | net == 53 | net == 61 | net == 63 | net == 81 | net == 83)

*Computer Withdraw: possible networks: 11, 71, 21, 41
replace ObsWi2 = 1 if postion == 2 & (net == 11 | net == 71 | net == 21 | net == 41)

*Player Withdraw: possible networks: 13, 73, 23, 43
replace ObsWi2 = 1 if postion == 2 & ochoice == 1 & (net == 13 | net == 73 | net == 23 | net == 43)

*Wait: possible networks: networks in which she observes BUT not the computer, because it's impatient
	*networks: 13, 73, 23, 43
replace ObsWa2 = 1 if postion == 2 & ochoice == 0 & (net == 13 | net == 73 | net == 23 | net == 43)


//FIRST pos.
*observes always nothing
replace ObsNo2 = 1 if postion == 1


//generating informationset variable
gen informationset = 0


*certain part: waiting and withdraw, withdraw and withdraw, waiting
replace informationset = 1 if ObsWaWi2 == 1
replace informationset = 2 if ObsWiWi2 == 1
replace informationset = 3 if ObsWa2 == 1

*uncertain part: withdraw, nothing
replace informationset = 4 if ObsWi2 == 1
replace informationset = 5 if ObsNo2 == 1


//uncertainty dummmy 
gen Struncert2 = 0
replace Struncert2 = 1 if ObsWi2 == 1 | ObsNo2 ==1


