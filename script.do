cd "C:\Users\Bence\Desktop\bankrun\adatok"
import excel using big.xlsx, firstrow clear




//I. DATASET MANIPULATION

//aggregated response
gen time = time1+time2+time3
gen response = 45-time

//generating missing values instead of 0 secs for waiting times 
replace time1=. if time1 == 0 & (postion == 2 | postion == 3)
replace time2=. if time2 == 0 & (postion == 1 | postion == 3)
replace time3=. if time3 == 0 & (postion == 1 | postion == 2)

//generating response time form time vars (note, max time 45 sec, if time is negative, response = 45 + time)
//generating overdue variable for participants made decision after the time limit
gen response1 = 0
gen response2 = 0
gen response3 = 0

gen overdue1 = .
gen overdue2 = .
gen overdue3 = .


replace response1 = 45-time1
replace response2 = 45-time2
replace response3 = 45-time3


*overdues
replace overdue1 = 1 if time1<0 & postion == 1
replace overdue1 = 0 if time1>=0 & postion == 1 

replace overdue2 = 1 if time2<0 & postion == 2
replace overdue2 = 0 if time2>=0 & postion == 2

replace overdue3 = 1 if time3<0 & postion == 3
replace overdue3 = 0 if time3>=0 & postion == 3

*changing waiting's code (just for convenience): from 2 to 0
replace choice = 0 if choice == 2 
replace ochoice = 0 if ochoice == 2

*cognitive
gen sqCRT_sum = CRT_sum^2

gen clever = 0
replace clever = 1 if CRT_sum==1|CRT_sum==2|CRT_sum==3

gen clever2 = 0
replace clever2 = 1 if CRT_sum==2|CRT_sum==3


tabulate CRT_sum, generate(CRT_sum)

gen response_sum0 = response*CRT_sum1
gen response_sum1 = response*CRT_sum2
gen response_sum2 = response*CRT_sum3
gen response_sum3 = response*CRT_sum4

gen response1_sum0 = response1*CRT_sum1
gen response1_sum1 = response1*CRT_sum2
gen response1_sum2 = response1*CRT_sum3
gen response1_sum3 = response1*CRT_sum4

gen response2_sum0 = response2*CRT_sum1
gen response2_sum1 = response2*CRT_sum2
gen response2_sum2 = response2*CRT_sum3
gen response2_sum3 = response2*CRT_sum4

gen response3_sum0 = response3*CRT_sum1
gen response3_sum1 = response3*CRT_sum2
gen response3_sum2 = response3*CRT_sum3
gen response3_sum3 = response3*CRT_sum4


*response*_uncertainty
gen response1_Struncert = response1*Struncert
gen response2_Struncert = response2*Struncert
gen response3_Struncert = response3*Struncert



//INFORMATION SET
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







