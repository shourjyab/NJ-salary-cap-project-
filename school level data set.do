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



use sld_16
keep  COUNTY_ID DIST_ID SCHOOL_NAME GRADE_LEVEL ROW_TOTAL
keep if SCHOOL_NAME=="District Total" & GRADE_LEVEL=="TOTAL"
rename ROW_TOTAL enroll_16

keep COUNTY_ID DIST_ID enroll_16 

save enroll_2016, replace 
clear


use sld_15
keep  COUNTY_ID DIST_ID SCHOOL_NAME GRADE_LEVEL ROW_TOTAL
keep if SCHOOL_NAME=="District Total" & GRADE_LEVEL=="TOTAL"
rename ROW_TOTAL enroll_15

keep COUNTY_ID DIST_ID enroll_15

save enroll_2015, replace 
clear


use sld_14
keep  COUNTY_ID DIST_ID SCHOOL_NAME GRADE_LEVEL ROW_TOTAL
keep if SCHOOL_NAME=="District Total" & GRADE_LEVEL=="TOTAL"
rename ROW_TOTAL enroll_14

keep COUNTY_ID DIST_ID enroll_14

save enroll_2014, replace 
clear


use sld_13
keep  COUNTYCODE DISTRICTCODE SCHOOLNAME GRADE_LEVEL ROW_TOTAL
keep if SCHOOLNAME=="District Total" & GRADE_LEVEL=="TOTAL"
rename ROW_TOTAL enroll_13

keep COUNTYCODE DISTRICTCODE enroll_13
rename COUNTYCODE COUNTY_ID
rename DISTRICTCODE DIST_ID

save enroll_2013, replace 
clear

use sld_12
//wonky data set can't find the grade level variable

clear

use sld_11
//wonky data set can't find the grade level variable

clear

use sld_10
keep  COUNTY_CODE DIST_ID SCHOOL_NAME PROGRAM_NAME ROW_TOTAL
//cannot catch the program name with total - some problem
//with how it has been coded 

drop if PROGRAM_NAME=="Auditory Impairments"
drop if PROGRAM_NAME=="Autism"
drop if PROGRAM_NAME=="Behavioral Disabilties"
drop if PROGRAM_NAME=="Cognitive Mild"
drop if PROGRAM_NAME=="Cognitive Moderate"
drop if PROGRAM_NAME=="Cognitive Servere"
drop if PROGRAM_NAME=="FT Post Secondary"
drop if PROGRAM_NAME=="Full Day  Kindergarten"
drop if PROGRAM_NAME=="Full Day Pre Kindergarten"
drop if PROGRAM_NAME=="Full Day Preschool Dis"
drop if PROGRAM_NAME=="Grade 1"
drop if PROGRAM_NAME=="Grade 10"
drop if PROGRAM_NAME=="Grade 10 Voc"
drop if PROGRAM_NAME=="Grade 11"
drop if PROGRAM_NAME=="Grade 11 Voc"
drop if PROGRAM_NAME=="Grade 12"
drop if PROGRAM_NAME=="Grade 12 Voc"
drop if PROGRAM_NAME=="Grade 2"
drop if PROGRAM_NAME=="Grade 3"
drop if PROGRAM_NAME=="Grade 4"
drop if PROGRAM_NAME=="Grade 5"
drop if PROGRAM_NAME=="Grade 6"
drop if PROGRAM_NAME=="Grade 7"
drop if PROGRAM_NAME=="Grade 8"
drop if PROGRAM_NAME=="Grade 9"
drop if PROGRAM_NAME=="Grade 9 Voc"
drop if PROGRAM_NAME=="Half Day  Kindergarten"
drop if PROGRAM_NAME=="Half Day Pre Kindergarten"
drop if PROGRAM_NAME=="Half Day Preschool Dis"
drop if PROGRAM_NAME=="Learning and/or Lang Dis  Mild/Mod"
drop if PROGRAM_NAME=="Learning and/or Lang Dis  Servere"
drop if PROGRAM_NAME=="Multiple Disabilities"
drop if PROGRAM_NAME=="PT Post Secondary"
drop if PROGRAM_NAME=="Spec Ed Voc"
drop if PROGRAM_NAME=="Visual Impairments"

keep if SCHOOL_NAME=="DISTRICT_TOTAL"

rename COUNTY_CODE COUNTY_ID
rename ROW_TOTAL enroll_10

keep COUNTY_ID DIST_ID enroll_10 

save enroll_2010, replace
clear

use sld_09
keep  CO DIST SCH PROGRAM ROWTOT

drop if PROGRAM=="Auditory Impairments"
drop if PROGRAM=="Autism"
drop if PROGRAM=="Behavioral Disability"
drop if PROGRAM=="Cognitive-Mild"
drop if PROGRAM=="Cognitive-Moderate"
drop if PROGRAM=="Cognitive-Severe"
drop if PROGRAM=="FT Post Secondary Prg"
drop if PROGRAM=="Full-Day Kindergarten"
drop if PROGRAM=="Full-Day Pre-Kind."
drop if PROGRAM=="Full-Day Presch Dis."
drop if PROGRAM=="Grade 1"
drop if PROGRAM=="Grade 10"
drop if PROGRAM=="Grade 10-Voc Only"
drop if PROGRAM=="Grade 11"
drop if PROGRAM=="Grade 11-Voc Only"
drop if PROGRAM=="Grade 12"
drop if PROGRAM=="Grade 12-Voc Only"
drop if PROGRAM=="Grade 2"
drop if PROGRAM=="Grade 3"
drop if PROGRAM=="Grade 4"
drop if PROGRAM=="Grade 5"
drop if PROGRAM=="Grade 6"
drop if PROGRAM=="Grade 7"
drop if PROGRAM=="Grade 8"
drop if PROGRAM=="Grade 9"
drop if PROGRAM=="Grade 9-Voc Only"
drop if PROGRAM=="Half-Day Kindergarten"
drop if PROGRAM=="Half-Day Pre-Kind."
drop if PROGRAM=="Half-Day Presch Dis."
drop if PROGRAM=="Learn&/orLang Dis Mld"
drop if PROGRAM=="Learn&/orLang Dis.Sev"
drop if PROGRAM=="Multiple Disabilities"
drop if PROGRAM=="PT Post Secondary Prg"
drop if PROGRAM=="Visual  Impairments"


