

use final_t

//dropping one observation from district 150
//dropping observation with name robert
//reasons - probable wrong data entry

drop in 15

//checking for unique district number

unique DistrictNumber

/*Number of unique values of DistrictNumber is  596
Number of records is  603*/

//figure out what is the deal with 7 observations 

duplicates tag DistrictNumber, gen(dup)

edit if dup==1

//14 observations 

/*district 1670 has two observations, one of them has rita
an employee name - probable wrong data entry - deleted*/

drop in 169

/*district 1850 has two observations, both get deleted because 
data entry is faulty, inconsistent data*/

drop in 190

//same command because the deletion of one observation changes the serial number

drop in 190

//district 3145 has two observations will be deleting one
/*deleting second observation - obvious data entry problem, there is problem in the
first observation as well, the name is missing but contract date shows that it is
in fact the same person, someone forgot to put in the name - I don't like the
person who had the data entry job*/

drop in 316

//district 5510 has 2 observations
//both completely messed up - data entry wrong, data missing, dropping both
 drop in 552
 drop in 552
 
 //district 5690
 //the data entry operator was possibly drunk - half the data missing
 //dropping both observations
 drop in 569
 drop in 569
 
 //district 5830 - 2 observations
 //dropping both because data is missing 
 drop in 583
 drop in 583
 
 //distirct 5840 - 2 observations
 //dropping both because data is missing
 drop in 583
 drop in 583
 
 save, replace
 
 //do the duplicates for every year and see what observations need to be dropped
 
 keep DistrictNumber DistrictName JobTitle09 EmployeeName09 BaseSalary09 FTE09 Yes09 BeginDate09 EndDate09
 
 duplicates tag DistrictNumber, gen(dup09)
 
 edit if dup09==1
 
 //turns out there is not duplicates
 clear 

 use final_t
 
keep DistrictNumber DistrictName JobTitle10 EmployeeName10 BaseSalary10 FTE10 Yes10 BeginDate10 EndDate10 
 
duplicates tag DistrictNumber, gen(dup10)
edit if dup10==1 
clear 
//no duplicates

 use final_t
 
keep DistrictNumber DistrictName JobTitle11 EmployeeName11 BaseSalary11 FTE11 Yes11 BeginDate11 EndDate11 
 
duplicates tag DistrictNumber, gen(dup11)
edit if dup11==1 
clear 

//no duplicates 

 use final_t
 
keep DistrictNumber DistrictName JobTitle12 EmployeeName12 BaseSalary12 FTE12 Yes12 BeginDate12 EndDate12 
 
duplicates tag DistrictNumber, gen(dup12)
edit if dup12==1 
clear 

//no duplicates

 use final_t
 
keep DistrictNumber DistrictName JobTitle13 EmployeeName13 BaseSalary13 FTE13 Yes13 BeginDate13 EndDate13 
 
duplicates tag DistrictNumber, gen(dup13)
edit if dup13==1
 
clear  
//no duplicates 
 
 
use final_t
 
keep DistrictNumber DistrictName JobTitle14 EmployeeName14 BaseSalary14 FTE14 Yes14 BeginDate14 EndDate14 
 
duplicates tag DistrictNumber, gen(dup14)
edit if dup14==1
 
clear  
 // no duplicates
 
 use final_t
 
keep DistrictNumber DistrictName JobTitle15 EmployeeName15 BaseSalary15 FTE15 Yes15 BeginDate15 EndDate15 
 
duplicates tag DistrictNumber, gen(dup15)
edit if dup15==1
 
clear
 //no duplicates
 
use final_t
 
keep DistrictNumber DistrictName JobTitle16 EmployeeName16 BaseSalary16 FTE16 Yes16 BeginDate16 EndDate16 
 
duplicates tag DistrictNumber, gen(dup16)
edit if dup16==1
 
clear
 //no duplicates
 
use final_t 
//shared09 variable
//0= not shared 1=shared 3=no information

generate shared09=0
unique Yes09 
// 6 unique total 591 

tab Yes09

replace shared09=1 if Yes09=="Yes"
replace shared09=1 if Yes09=="yes"

replace Yes09="Yes" if Yes09=="yes"
replace Yes09="No" if Yes09=="NO"
replace Yes09="No" if Yes09=="no"

replace shared09=3 if Yes09!="Yes" & Yes09!="No" 

edit if shared09==3

move shared09 Yes09

save, replace
clear

//shared10 variable 
//0= not shared 1=shared 3=no information

use final_t 

generate shared10=0
unique Yes10 
//3 unique 591 total

tab Yes10

replace shared10=1 if Yes10=="Y"

replace Yes10="Yes" if Yes10=="Y"
replace Yes10="No" if Yes10=="N"
replace shared10=3 if Yes10!="Yes" & Yes10!="No"

edit if shared10==3
move shared10 Yes10

save, replace
clear

//shared11 variable 
//0= not shared 1=shared 3=no information
use final_t

generate shared11=0
unique Yes11 
// 4 unique 591 total

tab Yes11

replace shared11=1 if Yes11=="Y"

replace Yes11="Yes" if Yes11=="Y"
replace Yes11="No" if Yes11=="N"
replace shared11=3 if Yes11!="Yes" & Yes11!="No"

edit if shared11==3
move shared11 Yes11

save, replace
clear


//shared12 variable
//0= not shared 1=shared 3=no information

use final_t

generate shared12=0
unique Yes12 
// 4 unique 591 total

tab Yes12

replace shared12=1 if Yes12=="Y"

replace Yes12="Yes" if Yes12=="Y"
replace Yes12="No" if Yes12=="N"
replace shared12=3 if Yes12!="Yes" & Yes12!="No"

edit if shared12==3
move shared12 Yes12

save, replace
clear

//shared13 variables
//0= not shared 1=shared 3=no information

use final_t

generate shared13=0
unique Yes13 
// 4 unique 591 total

tab Yes13

replace shared13=1 if Yes13=="Y"

replace Yes13="Yes" if Yes13=="Y"
replace Yes13="No" if Yes13=="N"
replace shared13=3 if Yes13!="Yes" & Yes13!="No"

edit if shared13==3
move shared13 Yes13

save, replace
clear

//shared14 variable
//0= not shared 1=shared 3=no information

use final_t

generate shared14=0
unique Yes14 
// 3 unique 591 total

tab Yes14

replace shared14=1 if Yes14=="Y"

replace Yes14="Yes" if Yes14=="Y"
replace Yes14="No" if Yes14=="N"
replace shared14=3 if Yes14!="Yes" & Yes14!="No"

edit if shared14==3
move shared14 Yes14

save, replace
clear

//shared15 variable
//0= not shared 1=shared 3=no information

use final_t

generate shared15=0
unique Yes15 
// 3 unique 591 total

tab Yes15

replace shared15=1 if Yes15=="Y"

replace Yes15="Yes" if Yes15=="Y"
replace Yes15="No" if Yes15=="N"
replace shared15=3 if Yes15!="Yes" & Yes15!="No"

edit if shared15==3
move shared15 Yes15

save, replace
clear

//shared16 variable
//0= not shared 1=shared 3=no information


use final_t

generate shared16=0
unique Yes16 
// 3 unique 591 total

tab Yes16

replace shared16=1 if Yes16=="Y"

replace Yes16="Yes" if Yes16=="Y"
replace Yes16="No" if Yes16=="N"
replace shared16=3 if Yes16!="Yes" & Yes16!="No"

edit if shared16==3
move shared16 Yes16

save, replace
clear

//descriptive stats for the shared values

use final_t 

tab shared09
tab shared10
tab shared11
tab shared12
tab shared13
tab shared14
tab shared15
tab shared16

save, replace
clear

//fixing dates for years

use final_t 

tab BeginDate09
generate start_09=substr(BeginDate09, -4,4)
move start_09 BeginDate09
destring start_09, replace 

save, replace
clear


use final_t

tab BeginDate10

tostring BeginDate10, generate(BeginDate10str)
move BeginDate10str BeginDate10

generate start_10=substr(BeginDate10str, 1,4)
move start_10 BeginDate10
destring start_10, replace 

save, replace
clear


use final_t

tab BeginDate11


generate start_11=substr(BeginDate11, 1,4)
move start_11 BeginDate11
destring start_11, replace 

save, replace
clear

use final_t

tab BeginDate12

generate start_12=substr(BeginDate12,1,4)
move start_12 BeginDate12

destring start_12, replace 

save, replace
clear


use final_t

tab BeginDate13

generate start_13=substr(BeginDate13,1,4)
move start_13 BeginDate13

destring start_13, replace 

save, replace
clear

use final_t

tab BeginDate14

generate start_14=year(BeginDate14)
move start_14 BeginDate14  

save, replace
clear

use final_t

tab BeginDate15

generate start_15=year(BeginDate15)
move start_15 BeginDate15 

save, replace
clear 

use final_t

tab BeginDate16

generate start_16=year(BeginDate16)
move start_16 BeginDate16

save, replace
clear 

use final_t 

tab EndDate09
generate end_09=substr(EndDate09, -4,4)
move end_09 EndDate09
destring end_09, replace 

tab EndDate10

tostring EndDate10, generate(EndDate10str)
move EndDate10str EndDate10

generate end_10=substr(EndDate10str,1,4)
move end_10 BeginDate10

tab BeginDate11


generate end_11=substr(EndDate11, 1,4)
move end_11 EndDate11

destring end_11, replace 

tab BeginDate12

generate end_12=substr(EndDate12,1,4)
move end_12 EndDate12

destring end_12, replace 

tab EndDate13

generate end_13=substr(EndDate13,1,4)
move end_13 EndDate13

destring end_13, replace

tab EndDate14

generate end_14=year(EndDate14)
move end_14 EndDate14  

tab EndDate15

generate end_15=year(EndDate15)
move end_15 EndDate15

tab EndDate16

generate end_16=year(EndDate16)
move end_16 EndDate16



save, replace
clear

use final_t
keep  DistrictNumber DistrictName EmployeeName09 BaseSalary09 start_09 end_09 EmployeeName10 BaseSalary10 start_10 end_10 EmployeeName11 BaseSalary11 start_11 end_11 EmployeeName12 BaseSalary12 start_12 end_12 EmployeeName13 BaseSalary13 start_13 end_13 EmployeeName14 BaseSalary14 start_14 end_14 EmployeeName15 BaseSalary15 start_15 end_15 EmployeeName16 BaseSalary16 start_16 end_16








