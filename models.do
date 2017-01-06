//RAW
logit choice response3 if clever == 0
outreg2 using buta.doc, replace ctitle(Basic) 
logit choice response3 if clever == 1
outreg2 using okos.doc, replace ctitle(Basic) 


//RAW, <=5
logit choice response3 if clever == 0 & period<=5
outreg2 using buta.doc, append ctitle(per<=5)
logit choice response3 if clever == 1 & period<=5
outreg2 using okos.doc, append ctitle(per<=5)

//RAW, <=10
logit choice response3 if clever == 0 & period<=10
outreg2 using buta.doc, append ctitle(per<=10)
logit choice response3 if clever == 1 & period<=10
outreg2 using okos.doc, append ctitle(per<=10')


//ALL CTRL
logit choice response3 riskav gender Struncert if clever == 0
outreg2 using buta.doc, append ctitle(ALL controlls)
logit choice response3 observation riskav gender Struncert if clever == 1
outreg2 using okos.doc, append ctitle(ALL controlls)

//ALL CTRL+ period
logit choice response3 riskav gender Struncert period if clever == 0
outreg2 using buta.doc, append ctitle(ALL controlls+per)
logit choice response3 observation riskav gender Struncert2 period if clever == 1
outreg2 using okos.doc, append ctitle(ALL controlls+per)

//ALL CTRL, <=5
logit choice response3 observation gender riskav Struncert if clever == 0 & period<=5
outreg2 using buta.doc, append ctitle(ALL controlls per<=5)
logit choice response3 observation riskav gender Struncert2 if clever == 1 & period<=5
outreg2 using okos.doc, append ctitle(ALL controlss per<=5)

//ALL CTRL, <=10
logit choice response3 observation gender riskav Struncert2 if clever == 0 & period<=10
outreg2 using buta.doc, append ctitle(ALL controlls per<=10)
logit choice response3 observation riskav gender Struncert2 if clever == 1 & period<=10
outreg2 using okos.doc, append ctitle(ALL controlss per<=10)
