clear //to clear previous memory
set matsize 10000 //to indicate the number of variable that can be a
version 12 //to indicate which version of stata has been used - remember to check
set more off // to run without pressing more options - runs automatically

********************* directory****************

//change directory location as per convenience

local worDir "C:\Users\sd901\Desktop\trial2"
cap mkdir `worDir'
cd `worDir'

import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\10_salary_r.xls", sheet("SD1709 new") firstrow

format JobTitle %-80s
destring CountyNumber, replace
destring DistrictNumber, replace
move JobTitle EmployeeName
generate supe=0
move supe JobTitle
save 10_salary_r, replace
clear

use 10_salary_r
unique DistrictNumber
//Number of unique values of DistrictNumber is  587

replace supe=1 if JobTitle=="SUPERINTENDENT"
replace supe=1 if JobTitle=="Superintendent"
replace supe=1 if JobTitle=="Chief School Administrator/District Superintendent"
replace supe=1 if JobTitle=="Superintendent Principal"
replace supe=1 if JobTitle=="Superintendent Interim"
replace supe=1 if JobTitle=="Superintendent PRINCIPAL"
replace supe=1 if JobTitle=="Superintendent Business Administrator"
replace supe=1 if JobTitle=="Superintendent (Interim)"
replace supe=1 if JobTitle=="Superintendent/Principal"
replace supe=1 if JobTitle=="Superintendent Principal, Head of CST"
replace supe=1 if JobTitle=="Superintendent Interim Superintendent"
replace supe=1 if JobTitle=="Superintendent Director of Curriculum"
replace supe=1 if JobTitle=="Superintendent Principal/CST Director/Teacher"
replace supe=1 if JobTitle=="Superintendent Superintendent/Principal 6-8"
replace supe=1 if JobTitle=="Superintendent Princiapl"
replace supe=1 if JobTitle=="Superintendent N/A"
replace supe=1 if JobTitle=="Superintendent SUPERINTENDENT"
replace supe=1 if JobTitle=="Superintendent principal"
replace supe=1 if JobTitle=="Superintendent Superintendent of Schools"
replace supe=1 if JobTitle=="Superintendent Superintendent"
replace supe=1 if JobTitle=="Superintendent Director of Special Services"
replace supe=1 if JobTitle=="Superintendent Board Secretary"
replace supe=1 if JobTitle=="Superintendent Middle School principal"
replace supe=1 if JobTitle=="Superintendent BUSINESS ADMINISTRATOR"
replace supe=1 if JobTitle=="Superintendent Chief School Administator"
replace supe=1 if JobTitle=="Superintendent LOA"
replace supe=1 if JobTitle=="Superintendent GUIDANCE COUNSELOR"
replace supe=1 if JobTitle=="Superintendent Interim State Supertendent"
replace supe=1 if JobTitle=="Superintendent PRINCIPAL/DIR SPEC SERVICES"
replace supe=1 if JobTitle=="Interim Superintendent"
replace supe=1 if JobTitle=="Superintendent Consultant"
replace supe=1 if JobTitle=="Superintendent tchr, curr coor, prin, bldg su"
replace supe=1 if JobTitle=="Superintendent  Principal"
replace supe=1 if JobTitle=="Superintendent chief school administrator"
replace supe=1 if JobTitle=="Superintendent /Principal"
replace supe=1 if JobTitle=="Interim Supt"
replace supe=1 if JobTitle=="Superintendent & Principal Stevenson School"



replace supe=1 if DistrictName=="SOUTH PLAINFIELD BORO" & BaseAnnualSalary1108=="165000"
replace supe=1 if DistrictName=="SALEM COUNTY VOCATIONAL" & BaseAnnualSalary1108=="213151"
replace supe=1 if DistrictName=="CITY OF ORANGE TWP" & BaseAnnualSalary1108=="186533"
replace supe=1 if DistrictName=="NEWTON TOWN" & BaseAnnualSalary1108=="145000"
replace supe=1 if DistrictName=="LEONIA BORO" & BaseAnnualSalary1108=="171826"
replace supe=1 if DistrictName=="HIGHLAND PARK BORO" & BaseAnnualSalary1108=="183400"
replace supe=1 if DistrictName=="FAIR HAVEN BORO" & BaseAnnualSalary1108=="145000"
replace supe=1 if DistrictName=="CAPE MAY CITY" & BaseAnnualSalary1108=="116968"





save 10_salary_r, replace
clear

use 10_salary_r
//drop total to renew total count 
sort DistrictNumber
by DistrictNumber: egen total=total(supe)
move total supe
save, replace 
clear

use 10_salary_r
//for editing the ones that have no superintendents
edit if total==0 
//for editing those that have more than one superintendents
edit if total>1

//fixing the ones that have total>1 
//district number 1610, FRANKLIN TWP - has two superintendents
//cannot decide which one to get rid off - markign with problem variable
//suggestion for Mike: DROP IT! 
generate problem=0
replace problem=1 if supe==1 & total>1
move problem total

//dropping one in dist 1610 because one is higher one is lower
//opting for higher one 
drop in 982

save, replace
clear

unique DistrictNumber
//587
unique DistrictNumber if total==0
 //37
unique DistrictNumber if total==1
//549
unique DistrictNumber if total>1
//1 

// 99% happy with data set! 

//formatting to keep merge file 
use 09_salary_r
keep if supe==1
rename JobTitle JobTitle10
rename EmployeeName EmployeeName10
rename  BaseAnnualSalary1109 BaseSalary10
rename  BeginningDateofContract BeginDate10
rename  EndingDateofContract EndDate10
rename FTE FTE10
rename SharedwithAnotherDistrictY Yes10
keep DistrictNumber DistrictName JobTitle10 EmployeeName10 BaseSalary10 BeginDate10 EndDate10 FTE10 Yes10
save 10_salary_m
clear
