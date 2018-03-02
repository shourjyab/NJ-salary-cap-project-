clear //to clear previous memory
set matsize 10000 //to indicate the number of variable that can be a
version 12 //to indicate which version of stata has been used - remember to check
set more off // to run without pressing more options - runs automatically

********************* directory****************

//change directory location as per convenience

local worDir "C:\Users\sd901\Desktop\trial2"
cap mkdir `worDir'
cd `worDir'

import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\2010 school level data.xls", sheet("SQL Results") firstrow
save sld_10, replace 
clear 

//has been converted to microsoft excel 97-03 before importing into stata
import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\2015 school level data.xls", sheet("SQL Results") firstrow
save sld_15, replace
clear 

//has been converted to microsoft excel 97-03 before importing into stata
import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\2016a school level data.xls", sheet("SQL Results") firstrow
save sld_16, replace
clear 

//imported as it was
import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\2014 school level data.xlsx", sheet("SQL Results") firstrow
save sld_14, replace 
clear 

//imported as it is
import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\2013 school level data.xlsx", sheet("Sheet1") firstrow
save sld_13, replace 
clear

//imported as it is
import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\2012 school level data.xlsx", sheet("Sheet1") firstrow
save sld_12, replace
clear 

//imported as it is 
import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\2011 school level data.xls", sheet("Sheet1") firstrow
save sld_11, replace
clear 

//converted to excel 97-03
import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\2009a school level data.xls", sheet("2009 school level data") firstrow
save sld_09, replace
clear

//2016 data 
//possible limitation using class 11-12 to find high schools
//trying adding a total for all and see how it goes 
use sld_16

//dropping the district BERGEN CO SPECIAL SERVICE
//reason the district has mixed up data on children with special needs as well the schools
//no school mentioned for the children with special needs

drop if  LEA_NAME=="BERGEN CO SPECIAL SERVICE"

//to check the school name variable 

//district total - 8111 
//county total -389 

//problem is that district total and county total are probably counted as schools
//would mess up the eventual data set, have to flag these


generate nonschoolobs=0
replace nonschoolobs=1 if SCHOOL_NAME=="District Total" | SCHOOL_NAME=="County Total"

//8500 observations changed - means all the two problems are fixed 

//keep in mind nonschoolobs=0 means it is a school = 1 means its not a school

//to check for high school 

generate chk09=0

replace chk09=1 if  GRADE_LEVEL=="09" & nonschoolobs!=1

move chk09 PRGCODE

//done before 
/*Bergen DIST_ID 0285 has students with special needs also listed
as a result another count has been used which basically has nothing
to do with the dataset otherwise. Other districts do not have that data
and if i drop these observations, the data that we need does not get affected
hence dropping for convenience*/

generate chk10=0

replace chk10=1 if  GRADE_LEVEL=="10" & nonschoolobs!=1

move chk10 PRGCODE

generate chk11=0

replace chk11=1 if  GRADE_LEVEL=="11" & nonschoolobs!=1

move chk11 PRGCODE

generate chk12=0

replace chk12=1 if  GRADE_LEVEL=="12" & nonschoolobs!=1

move chk12 PRGCODE

//introducing variable to find high school status of districts
//hst to find high schools to cover 11 and 12 

//isn't there a place where I can find the number of high schools in NJ 
//https://high-schools.com/directory/nj/
//says 964 - let's use this as a reference 


generate hst=0
move hst PRGCODE
replace hst=1 if chk11==1 & nonschoolobs!=1
replace hst=1 if chk12==1 & nonschoolobs!=1

//another variable to add up the total 

sort DIST_ID
by DIST_ID: egen hstotal=total(hst) 
move hstotal PRGCODE

generate highschool=0 

move highschool PRGCODE



sort DIST_ID
replace highschool=1 if hstotal>0

//districts with high school can be viewed with highschool=1

rename COUNTY_ID county_id
rename DIST_ID dist_id
rename  ROW_TOTAL enroll_2016

keep if SCHOOL_NAME=="District Total" & GRADE_LEVEL=="TOTAL"

//the chk09-10-11-12 variables are pretty much useless from here on
//hstotal and highschool pretty much do the job 
//making it look like the format needed keeping the req variables
//+2 which I think will make sense

rename hstotal hstotal16
rename highschool highschool16

keep county_id dist_id enroll_2016 hstotal16 highschool16

save enroll_2016, replace

clear

use sld_16

egen chktotal09=total(chk09)
//472

egen chktotal10=total(chk10)
//472

egen chktotal11=total(chk11)
//471

egen chktotal12=total(chk12)
//475
save, replace
clear

//2015 data 

use sld_15

//same issues with Bergen 
/*Bergen DIST_ID 0285 has students with special needs also listed
as a result another count has been used which basically has nothing
to do with the dataset otherwise. Other districts do not have that data
and if i drop these observations, the data that we need does not get affected
hence dropping for convenience*/

drop if  LEA_NAME=="BERGEN CO SPECIAL SERVICE"

generate nonschoolobs=0
replace nonschoolobs=1 if SCHOOL_NAME=="District Total" | SCHOOL_NAME=="County Total"

generate chk09=0

replace chk09=1 if  GRADE_LEVEL=="09" & nonschoolobs!=1

move chk09 PRGCODE

generate chk10=0

replace chk10=1 if  GRADE_LEVEL=="10" & nonschoolobs!=1

move chk10 PRGCODE

generate chk11=0

replace chk11=1 if  GRADE_LEVEL=="11" & nonschoolobs!=1

move chk11 PRGCODE

generate chk12=0

replace chk12=1 if  GRADE_LEVEL=="12" & nonschoolobs!=1

move chk12 PRGCODE

save, replace

generate hst=0
move hst PRGCODE
replace hst=1 if chk11==1 & nonschoolobs!=1
replace hst=1 if chk12==1 & nonschoolobs!=1

sort DIST_ID
by DIST_ID: egen hstotal=total(hst) 
move hstotal PRGCODE

generate highschool=0 

move highschool PRGCODE

sort DIST_ID
replace highschool=1 if hstotal>0

rename COUNTY_ID county_id
rename DIST_ID dist_id
rename  ROW_TOTAL enroll_2015

keep if SCHOOL_NAME=="District Total" & GRADE_LEVEL=="TOTAL"

rename hstotal hstotal15
rename highschool highschool15

keep county_id dist_id enroll_2015 hstotal15 highschool15


save enroll_2015, replace

clear

use sld_15

egen chktotal09=total(chk09)
//468

egen chktotal10=total(chk10)
//471

egen chktotal11=total(chk11)
//472

egen chktotal12=total(chk12)
//473
save, replace
clear

//2014 data 

use sld_14

//same issues with Bergen 
/*Bergen DIST_ID 0285 has students with special needs also listed
as a result another count has been used which basically has nothing
to do with the dataset otherwise. Other districts do not have that data
and if i drop these observations, the data that we need does not get affected
hence dropping for convenience*/

drop if  LEA_NAME=="BERGEN CO SPECIAL SERVICE"

generate nonschoolobs=0
replace nonschoolobs=1 if SCHOOL_NAME=="District Total" | SCHOOL_NAME=="County Total"

generate chk09=0

replace chk09=1 if  GRADE_LEVEL=="09" & nonschoolobs!=1

move chk09 PRGCODE

generate chk10=0

replace chk10=1 if  GRADE_LEVEL=="10" & nonschoolobs!=1

move chk10 PRGCODE

generate chk11=0

replace chk11=1 if  GRADE_LEVEL=="11" & nonschoolobs!=1

move chk11 PRGCODE

generate chk12=0

replace chk12=1 if  GRADE_LEVEL=="12" & nonschoolobs!=1

move chk12 PRGCODE

save, replace

generate hst=0
move hst PRGCODE
replace hst=1 if chk11==1 & nonschoolobs!=1
replace hst=1 if chk12==1 & nonschoolobs!=1

sort DIST_ID
by DIST_ID: egen hstotal=total(hst) 
move hstotal PRGCODE

generate highschool=0 

move highschool PRGCODE

sort DIST_ID
replace highschool=1 if hstotal>0

rename COUNTY_ID county_id
rename DIST_ID dist_id
rename  ROW_TOTAL enroll_2014

keep if SCHOOL_NAME=="District Total" & GRADE_LEVEL=="TOTAL"

rename hstotal hstotal14
rename highschool highschool14

keep county_id dist_id enroll_2014 hstotal14 highschool14


save enroll_2014, replace

clear

/* some observatios have decimal values!!!!*/
//observation number 9 199.5
//how can there be .5 kids! 

use sld_14

egen chktotal09=total(chk09)
//471

egen chktotal10=total(chk10)
//473

egen chktotal11=total(chk11)
//471

egen chktotal12=total(chk12)
//471
save, replace
clear

//2013 data 
use sld_13


//same issues with Bergen 
/*Bergen DIST_ID 0285 has students with special needs also listed
as a result another count has been used which basically has nothing
to do with the dataset otherwise. Other districts do not have that data
and if i drop these observations, the data that we need does not get affected
hence dropping for convenience*/

drop if  DISTRICTNAME=="Bergen County Special Services"

generate nonschoolobs=0
replace nonschoolobs=1 if SCHOOLNAME=="District Total" | SCHOOLNAME=="County Total"

generate chk09=0

replace chk09=1 if  GRADE_LEVEL=="09" & nonschoolobs!=1

move chk09 PRGCODE

generate chk10=0

replace chk10=1 if  GRADE_LEVEL=="10" & nonschoolobs!=1

move chk10 PRGCODE

generate chk11=0

replace chk11=1 if  GRADE_LEVEL=="11" & nonschoolobs!=1

move chk11 PRGCODE

generate chk12=0

replace chk12=1 if  GRADE_LEVEL=="12" & nonschoolobs!=1

move chk12 PRGCODE

save, replace

generate hst=0
move hst PRGCODE
replace hst=1 if chk11==1 & nonschoolobs!=1
replace hst=1 if chk12==1 & nonschoolobs!=1

sort DISTRICTCODE
by DISTRICTCODE: egen hstotal=total(hst) 
move hstotal PRGCODE

generate highschool=0 

move highschool PRGCODE

sort DISTRICTCODE  
replace highschool=1 if hstotal>0

rename COUNTYCODE county_id
rename DISTRICTCODE dist_id
rename  ROW_TOTAL enroll_2013

keep if SCHOOLNAME=="District Total" & GRADE_LEVEL=="TOTAL"

rename hstotal hstotal13
rename highschool highschool13

keep county_id dist_id enroll_2013 hstotal13 highschool13


save enroll_2013, replace

clear

use sld_13

egen chktotal09=total(chk09)
//468

egen chktotal10=total(chk10)
//466

egen chktotal11=total(chk11)
//467

egen chktotal12=total(chk12)
//462
save, replace
clear

//2012 data

use sld_12

drop if DistrictName=="Bergen County Special Services"

generate nonschoolobs=0
replace nonschoolobs=1 if SchoolName=="District Total" | SchoolName=="County Total"


generate chk09=0

replace chk09=1 if PRGCODE=="09" & nonschoolobs!=1

move chk09 PRGCODE

generate chk10=0

replace chk10=1 if PRGCODE=="10" & nonschoolobs!=1

move chk10 PRGCODE

generate chk11=0

replace chk11=1 if PRGCODE=="11" & nonschoolobs!=1

move chk11 PRGCODE

generate chk12=0

replace chk12=1 if PRGCODE=="12" & nonschoolobs!=1

move chk12 PRGCODE

save, replace



generate hst=0
move hst PRGCODE
replace hst=1 if chk11==1 & nonschoolobs!=1
replace hst=1 if chk12==1 & nonschoolobs!=1

sort DIST_ID
by DIST_ID: egen hstotal=total(hst) 
move hstotal PRGCODE

generate highschool=0 

move highschool PRGCODE

sort DIST_ID  
replace highschool=1 if hstotal>0

rename COUNTY_ID county_id
rename DIST_ID dist_id
rename  ROW_TOTAL enroll_2012

keep if SchoolName=="District Total" & PRGCODE=="55"

rename hstotal hstotal12
rename highschool highschool12

keep county_id dist_id enroll_2012 hstotal12 highschool12


save enroll_2012, replace

clear

use sld_12

egen chktotal09=total(chk09)
//453

egen chktotal10=total(chk10)
//451

egen chktotal11=total(chk11)
//445

egen chktotal12=total(chk12)
//443
save, replace
clear

//again data set has decimal points! 

//2011 data 

use sld_11 

drop if  DistrictName=="BERGEN COUNTY SPECIAL SERVICES DISTRICT"


generate nonschoolobs=0
replace nonschoolobs=1 if SchoolName=="Total"
replace nonschoolobs=1 if SchoolName=="County Total"


generate chk09=0

replace chk09=1 if PRGCODE=="09" & nonschoolobs!=1

move chk09 PRGCODE

generate chk10=0

replace chk10=1 if PRGCODE=="10" & nonschoolobs!=1

move chk10 PRGCODE

generate chk11=0

replace chk11=1 if PRGCODE=="11" & nonschoolobs!=1

move chk11 PRGCODE

generate chk12=0

replace chk12=1 if PRGCODE=="12" & nonschoolobs!=1

move chk12 PRGCODE

save, replace

generate hst=0
move hst PRGCODE
replace hst=1 if chk11==1 & nonschoolobs!=1
replace hst=1 if chk12==1 & nonschoolobs!=1

sort DIST_ID
by DIST_ID: egen hstotal=total(hst) 
move hstotal PRGCODE

generate highschool=0 

move highschool PRGCODE

sort DIST_ID  
replace highschool=1 if hstotal>0

rename Cocode county_id
rename DIST_ID dist_id
rename  ROW_TOTAL enroll_2011

keep if SchoolName=="Total" & PRGCODE=="55"

rename hstotal hstotal11
rename highschool highschool11

keep county_id dist_id enroll_2011 hstotal11 highschool11


save enroll_2011, replace

clear

use sld_11

egen chktotal09=total(chk09)
//431

egen chktotal10=total(chk10)
//434

egen chktotal11=total(chk11)
//429

egen chktotal12=total(chk12)
//435
save, replace
clear


//2010 data

use sld_10

drop if DISTRICT_NAME=="BERGEN CO SPECIAL SERVICE"

generate nonschoolobs=0
replace nonschoolobs=1 if SCHOOL_NAME=="DISTRICT_TOTAL"
replace nonschoolobs=1 if SCHOOL_NAME=="COUNTY_TOTAL"

generate chk09=0

replace chk09=1 if PROGRAM_CODE=="09" & nonschoolobs!=1

move chk09 PROGRAM_CODE

generate chk10=0

replace chk10=1 if PROGRAM_CODE=="10" & nonschoolobs!=1

move chk10 PROGRAM_CODE

generate chk11=0

replace chk11=1 if PROGRAM_CODE=="11" & nonschoolobs!=1

move chk11 PROGRAM_CODE

generate chk12=0

replace chk12=1 if PROGRAM_CODE=="12" & nonschoolobs!=1

move chk12 PROGRAM_CODE

save, replace


generate hst=0
move hst PROGRAM_CODE
replace hst=1 if chk11==1 & nonschoolobs!=1
replace hst=1 if chk12==1 & nonschoolobs!=1

sort DIST_ID
by DIST_ID: egen hstotal=total(hst) 
move hstotal PROGRAM_CODE

generate highschool=0 

move highschool PROGRAM_CODE

sort DIST_ID  
replace highschool=1 if hstotal>0

rename COUNTY_CODE county_id
rename DIST_ID dist_id
rename  ROW_TOTAL enroll_2010

keep if SCHOOL_NAME=="DISTRICT_TOTAL" & PROGRAM_CODE=="55"

rename hstotal hstotal10
rename highschool highschool10

keep county_id dist_id enroll_2010 hstotal10 highschool10


save enroll_2010, replace

clear

use sld_10

egen chktotal09=total(chk09)
//1264

egen chktotal10=total(chk10)
//879

egen chktotal11=total(chk11)
//739

egen chktotal12=total(chk12)
//738
save, replace
clear

//2009 data

use sld_09

drop if DIST=="0285-BERGEN CO SPECIAL SERVICE"

generate dist_id=substr(DIST,1,4)
move dist_id DIST

replace SCH= trim(SCH)

generate nonschoolobs=0
replace nonschoolobs=1 if SCH=="999-DISTRICT TOTAL"
replace nonschoolobs=1 if SCH=="999-COUNTY TOTAL"

replace PROGRAM=trim(PROGRAM)

generate chk09=0


replace chk09=1 if PROG==13 & nonschoolobs!=1

generate chk10=0
move chk10 PROGRAM

replace chk10=1 if PROG==14 & nonschoolobs!=1

generate chk11=0
move chk11 PROGRAM

replace chk11=1 if PROG==15 & nonschoolobs!=1

generate chk12=0
move chk12 PROGRAM

replace chk12=1 if PROG==16 & nonschoolobs!=1

save, replace




generate hst=0
move hst PROGRAM
replace hst=1 if chk11==1 & nonschoolobs!=1
replace hst=1 if chk12==1 & nonschoolobs!=1

sort dist_id
by dist_id: egen hstotal=total(hst) 
move hstotal PROGRAM

generate highschool=0 

move highschool PROGRAM

sort dist_id 
replace highschool=1 if hstotal>0

rename  ROWTOT enroll_2009
generate county_id=substr(CO,1,2)
move county_id CO

keep if SCH=="999-DISTRICT TOTAL" & PROG==55

rename hstotal hstotal09
rename highschool highschool09

keep county_id dist_id enroll_2009 hstotal09 highschool09

save enroll_2009, replace

clear

use sld_09

egen chktotal09=total(chk09)
//361

egen chktotal10=total(chk10)
//360

egen chktotal11=total(chk11)
//361

egen chktotal12=total(chk12)
//358
save, replace
clear

//merging dats sets

use enroll_2009
merge m:m dist_id using enroll_2010
drop _merge
merge m:m dist_id using enroll_2011
drop _merge
merge m:m dist_id using enroll_2012
drop _merge
merge m:m dist_id using enroll_2013
drop _merge
merge m:m dist_id using enroll_2014
drop _merge
merge m:m dist_id using enroll_2015
drop _merge
merge m:m dist_id using enroll_2016
drop _merge

save enrollment_merge  
clear

//editing the 2010 variables 

use enrollment_merge
edit
rename  hstotal10 oldhstotal10
rename  highschool10 oldhighschool10
rename  enroll_2010 oldenroll_2010
save, replace
clear

use sld_10

drop if DISTRICT_NAME=="BERGEN CO SPECIAL SERVICE"
// yields 0 deletion, on checking I relaise I had svae data set
//after deletion , so that district is out of contention 

drop  chk09 chk10 chk11 chk12
drop nonschoolobs

generate nonschoolobs=0
replace nonschoolobs=1 if SCHOOL_NAME=="DISTRICT_TOTAL"
replace nonschoolobs=1 if SCHOOL_NAME=="COUNTY_TOTAL"

generate chk09=0
replace chk09=1 if PROGRAM_CODE=="13" & nonschoolobs!=1
//1264 changes made let's check this out 
//where the problem was - program code 09 meant grade 5, to use 13 which means grade 09
//changes made after correcting the mistake - 370 in all probabilty the 
//problem with the program code problem 

move chk09 PROGRAM_CODE
generate chk10=0
replace chk10=1 if PROGRAM_CODE=="14" & nonschoolobs!=1
move chk10 PROGRAM_CODE
generate chk11=0
replace chk11=1 if PROGRAM_CODE=="15" & nonschoolobs!=1
move chk11 PROGRAM_CODE
generate chk12=0
replace chk12=1 if PROGRAM_CODE=="16" & nonschoolobs!=1
move chk12 PROGRAM_CODE
save, replace

generate hst=0
move hst PROGRAM_CODE
replace hst=1 if chk11==1 & nonschoolobs!=1
replace hst=1 if chk12==1 & nonschoolobs!=1

sort DIST_ID
by DIST_ID: egen hstotal=total(hst) 
move hstotal PROGRAM_CODE

generate highschool=0 

move highschool PROGRAM_CODE

sort DIST_ID  
replace highschool=1 if hstotal>0

rename COUNTY_CODE county_id
rename DIST_ID dist_id
rename  ROW_TOTAL enroll_2010

keep if SCHOOL_NAME=="DISTRICT_TOTAL" & PROGRAM_CODE=="55"

rename hstotal hstotal10
rename highschool highschool10

keep county_id dist_id enroll_2010 hstotal10 highschool10
save enroll_2010, replace
clear

use sld_10
drop  chktotal09 chktotal11 chktotal12 chktotal10
egen chktotal09=total(chk09)
//370
egen chktotal10=total(chk10)
//370
egen chktotal11=total(chk11)
//365
egen chktotal12=total(chk12)
//366 
save, replace
clear

//merging it with the final data set 
use enrollment_merge
merge m:m dist_id using enroll_2010
drop _merge

move hstotal10 oldhighschool10
move highschool10 oldhighschool10
move enroll_2010 oldhighschool10

drop oldhstotal10 oldhighschool10 oldenroll_2010

save, replace
clear

