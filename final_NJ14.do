clear //to clear previous memory
set matsize 10000 //to indicate the number of variable that can be a
version 12 //to indicate which version of stata has been used - remember to check
set more off // to run without pressing more options - runs automatically

********************* directory****************

//change directory location as per convenience

local worDir "C:\Users\sd901\Desktop\trial2"
cap mkdir `worDir'
cd `worDir'

import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\14_salary_r.xls", sheet("14_salary") firstrow

rename EMP_JOB_TITLE JobTitle
rename DISTNAME DistrictName
rename EMP_NAME EmployeeName
rename EMP_DISTRICT_ID DistrictNumber

format JobTitle %-80s

move JobTitle EmployeeName
generate supe=0
move supe JobTitle
save 14_salary_r, replace
clear

use 14_salary_r
unique DistrictNumber
//Number of unique values of DistrictNumber is 593

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
replace supe=1 if EMP_JOB_TITLE_2 =="Int Supt/Bd Sec'y"
replace supe=1 if EMP_JOB_TITLE_2 =="Acting Superintendent"
replace supe=1 if EMP_JOB_TITLE_2 =="Interim Supt."

save, replace



use 14_salary_r
//drop total to renew total count 
sort DistrictNumber
by DistrictNumber: egen total=total(supe)
move total supe
save, replace 
clear

use 14_salary_r
//for editing the ones that have no superintendents
edit if total==0 
//for editing those that have more than one superintendents
edit if total>1


 
generate problem=0
replace problem=1 if supe==1 & total>1
move problem total

//when renewing problem value 
drop problem

 
save, replace
clear

unique DistrictNumber
//593
unique DistrictNumber if total==0
 //15
unique DistrictNumber if total==1
//578
unique DistrictNumber if total>1
//0 

// 99% happy with data set! 

//formatting to keep merge file 
use 14_salary_r
keep if supe==1
rename JobTitle JobTitle14
rename EmployeeName EmployeeName14
rename EMP_BASE_SAL BaseSalary14
rename EMP_BEGIN_DATE BeginDate14
rename EMP_END_DATE EndDate14
rename EMP_FTE FTE14
rename EMP_SHARED Yes14
keep DistrictNumber DistrictName JobTitle14 EmployeeName14 BaseSalary14 BeginDate14 EndDate14 FTE14 Yes14
save 14_salary_m
clear
