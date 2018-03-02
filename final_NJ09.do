clear //to clear previous memory
set matsize 10000 //to indicate the number of variable that can be a
version 12 //to indicate which version of stata has been used - remember to check
set more off // to run without pressing more options - runs automatically

********************* directory****************

//change directory location as per convenience

local worDir "C:\Users\sd901\Desktop\trial2"
cap mkdir `worDir'
cd `worDir'

import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\09_salary_r.xls", sheet("Salary & Benefits 1-1-08") firstrow
format JobTitle %-80s
destring CountyNumber, replace
destring DistrictNumber, replace
destring BaseAnnualSalary1108, replace
move JobTitle EmployeeName
generate supe=0
move supe JobTitle
save 09_salary_r, replace
clear


use 09_salary_r
unique DistrictNumber
//Number of unique values of DistrictNumber is  617

replace supe=1 if JobTitle=="SUPERINTENDENT"
replace supe=1 if JobTitle=="Superintendent"
replace supe=1 if JobTitle=="Chief School Administrator/District Superintendent"
replace supe=1 if JobTitle=="Superintendent of Schools"
replace supe=1 if JobTitle=="Chief School Administrator"
replace supe=1 if JobTitle=="Superintendent/Principal"
replace supe=1 if JobTitle=="0102 Chief School Administrator"
replace supe=1 if JobTitle=="CHIEF SCHOOL ADMINISTRATOR"
replace supe=1 if JobTitle=="Superintendent (Salary contract not settled for FY08)"
replace supe=1 if JobTitle=="Chief School Administrator / District Superintendent" 
replace supe=1 if JobTitle=="Chief School Administrator/Superintendent"
replace supe=1 if JobTitle=="Superintendent/Dir of Special Serv"
replace supe=1 if JobTitle=="0102  Superintendent"
replace supe=1 if JobTitle=="Superintendedent"
replace supe=1 if JobTitle=="Superintendent/Principal 6-8"
replace supe=1 if JobTitle=="Chief School Administrator/Principal" 
replace supe=1 if JobTitle=="Supt"
replace supe=1 if JobTitle=="SUPERINTENDENT OF SCHOOLS"
replace supe=1 if JobTitle=="Superintendent, CST Director, Curriculum , Principal"
replace supe=1 if JobTitle=="Superintendent/Director of CST"
replace supe=1 if JobTitle=="Superintendent of Schools (CSA)"
replace supe=1 if JobTitle=="Interim Superintendent"
replace supe=1 if JobTitle=="0102   Chief School Administrator/District Superintendent"
replace supe=1 if JobTitle=="Superintendent of Schools (Salary Includes LB Additional Comp)"
replace supe=1 if JobTitle=="CHIEF SCHOOL ADM/PRINCIPAL"
replace supe=1 if JobTitle=="Supt."
replace supe=1 if JobTitle=="Interim Supt"
replace supe=1 if JobTitle=="CSA/District Superintendent"
replace supe=1 if JobTitle=="Chief Schoool Administrator"
replace supe=1 if JobTitle=="Acting Supt/Principal"
replace supe=1 if JobTitle=="Superintendent 102,000; Dir. Of Special Services 68,000"
replace supe=1 if JobTitle=="SUPERINTENDENT/BUSINESS ADMINISTRATOR" 
replace supe=1 if JobTitle=="SUPERINTENDENT/PRINCIPAL"
replace supe=1 if JobTitle=="Superintendent / Principal / Director of Special Services" 
replace supe=1 if JobTitle=="Superintendent/Middle School Principal"
replace supe=1 if JobTitle=="SHARED SUPERINTENDENT"
replace supe=1 if JobTitle=="0102 DISTRICT SUPERINTENDENT"
replace supe=1 if JobTitle=="Chief Schoo Administrator/Superintendent"
replace supe=1 if JobTitle=="superintendent"
replace supe=1 if JobTitle=="Superintendnet"
replace supe=1 if JobTitle=="Superintendent/Principal/Teacher"
replace supe=1 if JobTitle=="Superintent"
replace supe=1 if JobTitle=="School Superintendent" 
replace supe=1 if JobTitle=="CHIEF SCHOOL ADMINISTRATOR/SCHOOL BUSINESS ADMINISTR."
replace supe=1 if JobTitle=="Interim Superintendent of Schools"
replace supe=1 if JobTitle=="Superintendent - total salary $157,875"
replace supe=1 if JobTitle=="Interim Superintendent/Principal"
replace supe=1 if JobTitle=="Supt/Principal"
replace supe=1 if JobTitle=="Superintendent/Principal/Curric Dir"
replace supe=1 if JobTitle=="Chief School Admin/Superintendent"
replace supe=1 if JobTitle=="Superintendent/Principle"
replace supe=1 if JobTitle=="Superintendent/Guidance"
replace supe=1 if JobTitle=="Chief School Administrator/Superintendet"
replace supe=1 if JobTitle=="Superintendent/Principal/Dir Spec Svc"
replace supe=1 if JobTitle=="District Superintendent"
replace supe=1 if JobTitle=="chief school administrator" 
replace supe=1 if JobTitle=="Interim-Superintendent"
replace supe=1 if JobTitle=="Superitendent" 
replace supe=1 if JobTitle=="SUPERINTENDENT OF SCHOOLS/ ACTING BUSINESS ADMIN"
replace supe=1 if JobTitle=="Chief School Adm./Supt / School Business Adm."
replace supe=1 if JobTitle=="Chief School Administrator / Principal"
replace supe=1 if JobTitle=="0120 Chief School Administrator"
replace supe=1 if JobTitle=="Superintendent\Principal"
replace supe=1 if JobTitle=="Superintendent/Consultant"
replace supe=1 if JobTitle=="Interim Chief School Administrator"
replace supe=1 if JobTitle=="Superintendant"
replace supe=1 if JobTitle=="CSA"
replace supe=1 if JobTitle=="CSA/Principal"
replace supe=1 if JobTitle=="Interim Principal/CSA"
replace supe=1 if JobTitle=="Chief School Administrator/ Superintendent"
replace supe=1 if JobTitle=="CHIEF SCHOOL ADMINISTRATOR/DISTRICT SUPERINTENDENT"
replace supe=1 if JobTitle=="Superitnendent"
replace supe=1 if JobTitle=="Superintedent"   
replace supe=1 if JobTitle=="SUPERINTENDANT"
replace supe=1 if JobTitle=="Principle/CSA"
replace supe=1 if JobTitle=="CSA/Principle"
replace supe=1 if JobTitle=="Supintendent"
replace supe=1 if JobTitle=="0102 Chief School Administrator"
                                 

replace supe=1 if DistrictName=="SOUTH PLAINFIELD BORO" & BaseAnnualSalary1108=="165000"
replace supe=1 if DistrictName=="SALEM COUNTY VOCATIONAL" & BaseAnnualSalary1108=="213151"
replace supe=1 if DistrictName=="CITY OF ORANGE TWP" & BaseAnnualSalary1108=="186533"
replace supe=1 if DistrictName=="NEWTON TOWN" & BaseAnnualSalary1108=="145000"
replace supe=1 if DistrictName=="LEONIA BORO" & BaseAnnualSalary1108=="171826"
replace supe=1 if DistrictName=="HIGHLAND PARK BORO" & BaseAnnualSalary1108=="183400"
replace supe=1 if DistrictName=="FAIR HAVEN BORO" & BaseAnnualSalary1108=="145000"
replace supe=1 if DistrictName=="CAPE MAY CITY" & BaseAnnualSalary1108=="116968"
replace supe=1 if DistrictName=="BUTLER BORO" & BaseAnnualSalary1108=="149972"




save 09_salary_r, replace
clear

use 09_salary_r
//drop total to renew total count 
sort DistrictNumber
by DistrictNumber: egen total=total(supe)
move total supe
save, replace 
clear

use 09_salary_r
//for editing the ones that have no superintendents
edit if total==0 
//for editing those that have more than one superintendents
edit if total>1

//fixing the ones that have total>1 
//1. District number 1040, district name - Delaware TWP
//same observation repeated twice - hence dropping 

edit
drop in 559

//2. Same person holding the pricipal and superintendent post
//adding both incomes to one observation and dropping the other 
replace BaseAnnualSalary1108="109455" if DistrictName=="ESTELL MANOR CITY" & BaseAnnualSalary1108=="87564"
drop in 909

//3. PARAMUS BORO records a superintendent and an interim one
//dropping interim 
drop in 2292 

//4. WARREN COUNTY VOCATIONAL same person is principal and superintendent 
//adding incomes both to one observation and dropping the other - dropping one fist because they are identical
drop in 3361
replace BaseAnnualSalary1108="125000" if DistrictName=="WARREN COUNTY VOCATIONAL" & BaseAnnualSalary1108=="62500"

save, replace
clear

//keeping the problem vaue there just for parity

generate problem=0
replace problem=1 if supe==1 & total>1
move problem total



unique DistrictNumber
//617
unique DistrictNumber if total==0
 //38
unique DistrictNumber if total==1
//579
unique DistrictNumber if total>1
//0

// 99% happy with data set! 

//formatting to keep merge file 
use 09_salary_r
keep if supe==1
rename JobTitle JobTitle09
rename EmployeeName EmployeeName09
rename  BaseAnnualSalary1108 BaseSalary09
rename  BeginningDateofContract BeginDate09
rename  EndingDateofContract EndDate09
rename FTE FTE09
rename YesorNo Yes09
keep DistrictNumber DistrictName JobTitle09 EmployeeName09 BaseSalary09 BeginDate09 EndDate09 FTE09 Yes09
save 09_salary_m
clear
 
 
 //destring base salary 
 destring BaseSalary09, ignore ("-") replace
 
//merging
use 09_salary_m
merge 1:1 DistrictNumber DistrictName using 10_salary_m
drop _merge
merge m:m DistrictNumber using 11_salary_m
drop _merge
merge m:m DistrictNumber using 12_salary_m
drop _merge
merge m:m DistrictNumber using 13_salary_m
drop _merge
merge m:m DistrictNumber using 14_salary_m
drop _merge
merge m:m DistrictNumber using 15_salary_m
drop _merge
merge m:m DistrictNumber using 16_salary_m
drop _merge
save final_t, replace
clear




