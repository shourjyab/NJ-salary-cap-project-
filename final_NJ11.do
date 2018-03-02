clear //to clear previous memory
set matsize 10000 //to indicate the number of variable that can be a
version 12 //to indicate which version of stata has been used - remember to check
set more off // to run without pressing more options - runs automatically

********************* directory****************

//change directory location as per convenience

local worDir "C:\Users\sd901\Desktop\trial2"
cap mkdir `worDir'
cd `worDir'

import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\11_salary_r.xls", sheet("Sheet1") firstrow

rename title JobTitle
rename distname DistrictName
rename name EmployeeName
rename dist DistrictNumber


format JobTitle %-80s
move JobTitle EmployeeName
generate supe=0
move supe JobTitle
save 11_salary_r, replace
clear

use 11_salary_r
unique DistrictNumber
//Number of unique values of DistrictNumber is  585

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
replace supe=1 if DistrictName=="BELMAR BORO" & EmployeeName=="Robert Mahon"
replace supe=1 if JobTitle=="Superintendent Superintendent Gibbsboro 40%"
replace supe=1 if JobTitle=="Superintendent INTERIM"
replace supe=1 if JobTitle=="Superintendent Principal/ CST Director"
replace supe=1 if JobTitle=="Superintendent Asst Business Administrator"
replace supe=1 if JobTitle=="Principal Acting Superintendent"
replace supe=1 if JobTitle=="Superintendent Acting Superintendent"
replace supe=1 if JobTitle=="Superintendent PRINCIPAL/DIRECTOR"
replace supe=1 if JobTitle=="Superintendent Direct of Special Services"
replace supe=1 if JobTitle=="Superintendent CST Supervisor"
replace supe=1 if JobTitle=="Superintendent part time interim Supt."
replace supe=1 if JobTitle=="Superintendent Principal/CST Coordinator"
replace supe=1 if DistrictName=="NEW HANOVER TWP" & base_sal==106800
replace supe=1 if JobTitle=="Superintendent Child Study Team Supervisor"
replace supe=1 if JobTitle=="Superintendent INTERIM SUPERINTENT"
replace supe=1 if JobTitle=="Superintendent BUSINESS ADMIN/PRINCIPAL"
replace supe=1 if JobTitle=="Superintendent INTERIM SUPERINTENDENT"
replace supe=1 if JobTitle=="Superintendent OTS Principal"
replace supe=1 if JobTitle=="Superintendent Supt in Seaside Heights & Park"
replace supe=1 if JobTitle=="Superintendent School Business Administrator"
replace supe=1 if JobTitle=="Superintendent na"
replace supe=1 if DistrictName=="WOODLAND PARK" & base_sal==126500
replace supe=1 if JobTitle=="Superintendent Director Child Study Team"
replace supe=1 if JobTitle=="Superintendent SUPT BERLIN 60%"

replace supe=1 if JobTitle=="Superintendent DIRECTOR OF SPECIAL SERVICES"


save 11_salary_r, replace
clear

use 11_salary_r
//drop total to renew total count 
sort DistrictNumber
by DistrictNumber: egen total=total(supe)
move total supe
save, replace 
clear

use 11_salary_r
//for editing the ones that have no superintendents
edit if total==0 
//for editing those that have more than one superintendents
edit if total>1

//fixing the ones that have total>1 
//1.district number 150, AUDUBON BORO 2 superintendents 
//different salaries - different people - DROP IT! 
//demarcating with variable problem
//2.disrtict number 840 - CINNAMINSON TWP 
// one is superintendent one is super of instruction
//changing supe value of the wrong one

replace supe=0 if JobTitle=="Superintendent Supervisor of Instruction" & DistrictNumber==840

//3.district number 1290 - has an acting super and a super
//changing supe=0 for acting super 
replace supe=0 if JobTitle=="Acting Superintendent" & DistrictNumber==1290

//4. district number 1670 - same as problem 1 in this set
//drop it - marked with problem variable

//5. district number 1434 GUTTENBERG TOWN 
//same as above

generate problem=0
replace problem=1 if supe==1 & total>1
move problem total


save, replace
clear

unique DistrictNumber
//585
unique DistrictNumber if total==0
 //25
unique DistrictNumber if total==1
//557
unique DistrictNumber if total>1
//3

// 99% happy with data set! 

//formatting to keep merge file 
use 11_salary_r
keep if supe==1
rename JobTitle JobTitle11
rename EmployeeName EmployeeName11
rename  base_sal BaseSalary11
rename  start_date BeginDate11
rename  end_date EndDate11
rename fte FTE11
rename shared Yes11
keep DistrictNumber DistrictName JobTitle11 EmployeeName11 BaseSalary11 BeginDate11 EndDate11 FTE11 Yes11
save 11_salary_m
clear
