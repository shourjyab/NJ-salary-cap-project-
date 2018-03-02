clear //to clear previous memory
set matsize 10000 //to indicate the number of variable that can be a
version 12 //to indicate which version of stata has been used - remember to check
set more off // to run without pressing more options - runs automatically

********************* directory****************

//change directory location as per convenience

local worDir "C:\Users\sd901\Desktop\trial2"
cap mkdir `worDir'
cd `worDir'

import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\15_salary_r.xls", sheet("15_salary") firstrow

rename EMP_JOB_TITLE JobTitle
rename DISTNAME DistrictName
rename EMP_NAME EmployeeName
rename EMP_DISTRICT_ID DistrictNumber

format JobTitle %-80s

move JobTitle EmployeeName
generate supe=0
move supe JobTitle
save 15_salary_r, replace
clear

use 15_salary_r
unique DistrictNumber
//Number of unique values of DistrictNumber is 586

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
replace supe=1 if JobTitle=="Superintendent Child Study Team Director"
replace supe=1 if JobTitle=="Superintendent part-time interim Supt."
replace supe=1 if JobTitle=="Superintendent Chief School Administrator"
replace supe=1 if JobTitle=="Superintendent Guidance Counselor"
replace supe=1 if JobTitle=="Superintendent State District Supt of Schls"
replace supe=1 if JobTitle=="Superintendent PRINCIPAL/DIR SPECIAL SERVICES"
replace supe=1 if JobTitle=="Acting Superintendent"
replace supe=1 if JobTitle=="Superintendent Supervisor of Instruction"
replace supe=1 if JobTitle=="Interim superintendent/Prin"
replace supe=1 if JobTitle=="Superintendent CSA"
replace supe=1 if JobTitle=="Superintendent Shared Superintendent"
replace supe=1 if JobTitle=="Superintendent principal & CST Director"
replace supe=1 if JobTitle=="Superintendent Principal/CST Dir/"
replace supe=1 if JobTitle=="Superintendent Principal K-8"
replace supe=1 if JobTitle=="Superintendent/Pincipal"
replace supe=1 if JobTitle=="Superintendent Middle School Principal"
replace supe=1 if JobTitle=="Superintendent Shared Services Superintendent"
replace supe=1 if JobTitle=="Superintendent PrincipaL"
replace supe=1 if JobTitle=="Superintendent CST Director"
replace supe=1 if JobTitle=="Superintendent Interim Principal"
replace supe=1 if JobTitle=="Superintendent INTERIM SUPT"
replace supe=1 if JobTitle=="Superintendent ÿprincipal"
replace supe=1 if JobTitle=="Superintendent Superintendent Gibbsboro 40%"
replace supe=1 if JobTitle=="Superintendent INTERIM"
replace supe=1 if JobTitle=="Superintendent Director Child Study Team"
replace supe=1 if JobTitle=="Superintendent Principal/ CST Director"
replace supe=1 if JobTitle=="Superintendent Asst Business Administrator"
replace supe=1 if JobTitle=="Principal Acting Superintendent"
replace supe=1 if JobTitle=="Superintendent Acting Superintendent"
replace supe=1 if JobTitle=="Superintendent PRINCIPAL/DIRECTOR"
replace supe=1 if JobTitle=="Superintendent SUPT BERLIN 60%"
replace supe=1 if JobTitle=="Superintendent Direct of Special Services"
replace supe=1 if JobTitle=="Superintendent CST Supervisor"
replace supe=1 if JobTitle=="Superintendent part time interim Supt."
replace supe=1 if JobTitle=="Superintendent Principal/CST Coordinator"
replace supe=1 if JobTitle=="Superintendent ÿPrincipal/Supervisor"
replace supe=1 if JobTitle=="Superintendent Child Study Team Supervisor"
replace supe=1 if JobTitle=="Superintendent INTERIM SUPERINTENT"
replace supe=1 if JobTitle=="Superintendent BUSINESS ADMIN/PRINCIPAL"
replace supe=1 if JobTitle=="Superintendent OTS Principal"
replace supe=1 if JobTitle=="Superintendent Supt in Seaside Heights & Park"
replace supe=1 if JobTitle=="Superintendent School Business Administrator"
replace supe=1 if JobTitle=="Superintendent na"
replace supe=1 if JobTitle=="Business Administrator Interim Superintendent"
replace supe=1 if JobTitle=="Superintendent SUPT BERLIN 60%"
replace supe=1 if JobTitle=="Superintendent Tri-district shared"
replace supe=1 if JobTitle=="Superintendent /Principal (Interim)"
replace supe=1 if JobTitle=="Superintendent Princpal"
replace supe=1 if JobTitle=="Superintendent SHARED"
replace supe=1 if JobTitle=="Superintendent Director Child Study Team"
replace supe=1 if JobTitle=="Superintendent Principal/CST Director"
replace supe=1 if JobTitle=="Superintendent Interim/Business Administrator"
replace supe=1 if JobTitle=="Superintendent Asst Business Administrator"
replace supe=1 if JobTitle=="Superintendent Curriculum Supervisor"
replace supe=1 if JobTitle=="Principal Superintendent"
replace supe=1 if JobTitle=="Superintendent Interim Superintendent/Princip"
replace supe=1 if JobTitle=="Superintendent INTERIM"
replace supe=1 if JobTitle=="Superintendent Director of Special Education"
replace supe=1 if JobTitle=="Superintendent Tri-district"
replace supe=1 if JobTitle=="Superintendent MIDDDLE SCHOOL PRINCIPAL"
replace supe=1 if JobTitle=="Superintendent Principal School # 3"
replace supe=1 if JobTitle=="Superintendent Interim/CST Director"
replace supe=1 if JobTitle=="Superintendent Superin/Princ/Superv"
replace supe=1 if JobTitle=="Superintendent Child Study Team Supervisor"
replace supe=1 if JobTitle=="Superintendent (Interim Supt.)"
replace supe=1 if JobTitle=="Superintendent Interim Supt/Principal"
replace supe=1 if JobTitle=="Superintendent School Business Administrator"
replace supe=1 if JobTitle=="Superintendent - Interim"


replace supe=1 if EMP_JOB_TITLE_2 =="Interim Superintendent"
replace supe=1 if EMP_JOB_TITLE_2 =="Supt/Principal"
replace supe=1 if EMP_JOB_TITLE_2 =="Superintendent"
replace supe=1 if EMP_JOB_TITLE_2 =="Interim Supt/Principal"
replace supe=1 if EMP_JOB_TITLE_2 =="Int Supt/Bd Sec'y"


save, replace
clear

use 15_salary_r
//drop total to renew total count 
sort DistrictNumber
by DistrictNumber: egen total=total(supe)
move total supe
save, replace 
clear

use 15_salary_r
//for editing the ones that have no superintendents
edit if total==0 
//for editing those that have more than one superintendents
edit if total>1

//fixing total>1
//1. dist num - 1376 3 supers - mark with prob
//2 dist has same pricipal and super delete one obs and add salary to one 
drop in 868
replace  EMP_BASE_SALARY=121056 if  DistrictNumber==1490 &  EMP_BASE_SALARY==60528
//3. two supers can be fixed one is asst something dist 1860 
replace supe=0 if DistrictNumber==1860 & EMP_JOB_TITLE_2 =="Superintendent"
//4. dist 2660 repeated obs 
drop in 1500
//5. dist 3620 same as 3 
replace supe=0 if DistrictNumber==3620 & EMP_JOB_TITLE_2 =="Superintendent"
//6. 3960 same as above 
replace supe=0 if DistrictNumber==3960 & JobTitle=="Administrative Assistant"
//7. dist 5245 - repeated observation 
drop in 3167
 //8. dist 5670 same as 3  
 replace supe=0 if DistrictNumber==5670 & EMP_JOB_TITLE_2=="Superintendent" 
 
 
 
generate problem=0
replace problem=1 if supe==1 & total>1
move problem total

//when renewing problem value 
drop problem

//dropping lowest salaries
drop in 778
drop in 781 
save, replace
clear

unique DistrictNumber
//586
unique DistrictNumber if total==0
 //10
unique DistrictNumber if total==1
//575
unique DistrictNumber if total>1
//1

// 99% happy with data set! 

//formatting to keep merge file 
use 15_salary_r
keep if supe==1
rename JobTitle JobTitle15
rename EmployeeName EmployeeName15
rename EMP_BASE_SAL BaseSalary15
rename EMP_BEGIN_DATE BeginDate15
rename EMP_END_DATE EndDate15
rename EMP_FTE FTE15
rename EMP_SHARED Yes15
keep DistrictNumber DistrictName JobTitle15 EmployeeName15 BaseSalary15 BeginDate15 EndDate15 FTE15 Yes15
save 15_salary_m
clear
