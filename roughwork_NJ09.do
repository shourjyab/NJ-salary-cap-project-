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
move JobTitle EmployeeName
generate supe=0
move supe JobTitle
save 09_salary_r, replace
clear

use 09_salary_r
replace supe=1 if JobTitle=="Superintendent"
// result shows 311 changes made
/*unique DistrictName
Number of unique values of DistrictName is  600
Number of records is  3593 */
//600 unique districts 
//311 have superintendents, so am looking for the other 289 

replace supe=1 if JobTitle=="SUPERINTENDENT"
//24 changes made -> 289-24= 265 disticts unaccounted for

replace supe=1 if JobTitle=="Chief School Administrator/District Superintendent" 
//6 changes made -> 259 unaccounted for

replace supe=1 if JobTitle=="Superintendent of Schools" 
//60 changes made - > 199 disticts unaccounted for 

log using countfordu_var

bysort DistrictName: list DistrictName JobTitle if supe==0

log close

//the log file helps sort out more job titles that are yet not used

replace supe=1 if JobTitle=="Chief School Administrator"
//37 real changes made - > 162 unaccounted for 

replace supe=1 if JobTitle=="Superintendent/Principal"
//21 real changes made - > 141 unaccounted for 

replace supe=1 if JobTitle=="0102 Chief School Administrator"
//3 changes made - > 138 unaccounted for 

replace supe=1 if JobTitle=="CHIEF SCHOOL ADMINISTRATOR"
//4 changes made - > 134 unaccounted for 

replace supe=1 if JobTitle=="Superintendent (Salary contract not settled for FY08)"
//1 change made -> 133 unaccounted for 

replace supe=1 if JobTitle=="Chief School Administrator / District Superintendent" 
//2 changes made - > 131 unaccounted for 

replace supe=1 if JobTitle=="Chief School Administrator/Superintendent"
//2 changes made -> 129 unaccounted for 

replace supe=1 if JobTitle=="Superintendent/Dir of Special Serv"
// 2 changes - > 127 

replace supe=1 if JobTitle=="0102  Superintendent"
// 1 change -> 126 

replace supe=1 if JobTitle=="Superintendedent"
//1 change - > 125 

replace supe=1 if JobTitle=="Superintendent/Principal 6-8"
//1 change -> 124

replace supe=1 if JobTitle=="Chief School Administrator/Principal" 
//2 change -> 122

replace supe=1 if JobTitle=="Supt"
//2 change - > 120

replace supe=1 if JobTitle=="SUPERINTENDENT OF SCHOOLS"
// 5 changes -> 115

replace supe=1 if JobTitle=="Superintendent, CST Director, Curriculum , Principal"
// 1 change - > 114 

save, replace

//can go before the above save replace as well - 114 unaccounted for

sort DistictName
by DistrictName: egen total=total(supe)
move total supe  

log using countfordu2_var
sort DistrictName
by DistrictName: list JobTitle if total==0
log close

replace supe=1 if JobTitle=="Superintendent/Director of CST"
//1 change -> 113 

replace supe=1 if JobTitle=="Superintendent of Schools (CSA)"
// 1 change - > 112 

replace supe=1 if JobTitle=="Interim Superintendent"
//23 change - > 89 

replace supe=1 if JobTitle=="0102 Chief School Administrator " 
//1 change -> 88 


replace supe=1 if JobTitle=="0102   Chief School Administrator/District Superintendent"
//1 change - > 87 

replace supe=1 if JobTitle=="Superintendent of Schools (Salary Includes LB Additional Comp)"
// 1 change - > 86


replace supe=1 if JobTitle=="CHIEF SCHOOL ADM/PRINCIPAL"
// 1 change -> 85 

replace supe=1 if JobTitle=="Supt."
//1 change -> 84 

replace supe=1 if JobTitle=="Interim Supt"
//1 change -> 83 

replace supe=1 if JobTitle=="CSA/District Superintendent"
//1 change - > 82 

replace supe=1 if JobTitle=="Chief Schoool Administrator"
//1 change - > 81 

replace supe=1 if JobTitle=="Acting Supt/Principal"
//1 change - > 80 

replace supe=1 if JobTitle=="Superintendent 102,000; Dir. Of Special Services 68,000"
// 1 change -> 79 

replace supe=1 if JobTitle=="SUPERINTENDENT/BUSINESS ADMINISTRATOR" 
//1 change - > 78

replace supe=1 if JobTitle=="SUPERINTENDENT/PRINCIPAL"
//3 change - 75 

replace supe=1 if JobTitle=="Superintendent / Principal / Director of Special Services" 
//1 change - 74 

replace supe=1 if JobTitle=="Superintendent/Middle School Principal"
//1 change - 73 

replace supe=1 if JobTitle=="SHARED SUPERINTENDENT"
//1 change - 72 

replace supe=1 if JobTitle=="0102 DISTRICT SUPERINTENDENT"
//1change - 71 

replace supe=1 if JobTitle=="Chief Schoo Administrator/Superintendent"
//1 change - 70 

replace supe=1 if JobTitle=="superintendent"
//1 change - 69 

replace supe=1 if JobTitle=="Superintendnet"
//1 change - 68

replace supe=1 if JobTitle=="Superintendent/Principal/Teacher"
//1 change - 67 

replace supe=1 if JobTitle=="Superintent"
//1 change - 66 

replace supe=1 if JobTitle=="School Superintendent" 
//2 changes - 64 

replace supe=1 if JobTitle=="CHIEF SCHOOL ADMINISTRATOR/SCHOOL BUSINESS ADMINISTR."
//1 change - 63 

replace supe=1 if JobTitle=="Interim Superintendent of Schools"
//2 change - 61 

replace supe=1 if JobTitle=="Superintendent - total salary $157,875"
//1 change - 60 


replace supe=1 if JobTitle=="Interim Superintendent/Principal"
// i change -> 59 

replace supe=1 if JobTitle=="Supt/Principal"
//1 change - > 58 

replace supe=1 if JobTitle=="Superintendent/Principal/Curric Dir"
// 1 change - > 57 

replace supe=1 if JobTitle=="Chief School Admin/Superintendent"
//1 change -> 56

replace supe=1 if JobTitle=="Superintendent/Principle"
//1 change - > 55 

replace supe=1 if JobTitle=="Superintendent/Guidance"
//1 change -> 54 

replace supe=1 if JobTitle=="Chief School Administrator/Superintendet"
//1 change - >53

replace supe=1 if JobTitle=="Superintendent/Principal/Dir Spec Svc"
 //1 change -> 52 
 
replace supe=1 if JobTitle=="District Superintendent"
//4 changes - > 48 

replace supe=1 if JobTitle=="chief school administrator" 
//1 change - > 47 

replace supe=1 if JobTitle=="Interim-Superintendent"
//1 change - > 46 

replace supe=1 if JobTitle=="Superitendent" 
//1 change -> 45 

replace supe=1 if JobTitle=="SUPERINTENDENT OF SCHOOLS/ ACTING BUSINESS ADMIN"
// 1 change - > 44 

replace supe=1 if JobTitle=="Chief School Adm./Supt / School Business Adm."
//1 change - > 43

replace supe=1 if JobTitle=="Chief School Administrator / Principal"
//1 change - > 42 

replace supe=1 if JobTitle=="0120 Chief School Administrator"
//1 change - > 41 

replace supe=1 if JobTitle=="Superintendent\Principal"
//1 change -> 40 

replace supe=1 if JobTitle=="Superintendent/Consultant"
//1 change -> 39 

replace supe=1 if JobTitle=="Interim Chief School Administrator"
//1 change -> 38 

replace supe=1 if JobTitle=="Superintendant"
//1 change -> 37 

unique DistrictName if total==0
//43 hence mismatch remember to go through one more checking phase

save, replace

use 09_salary_r 
drop total 
sort DistrictName
by DistrictName: egen total=total(supe)
move total supe 

save, replace 

use 09_salary_r
generate problem=0
edit if total==0
move problem JobTitle 

replace problem=1 if DistrictName=="CAPE MAY CITY"

replace problem=1 if DistrictName=="CITY OF ORANGE TWP"

replace problem=1 if DistrictName=="HIGHLAND PARK BORO"

replace problem=1 if DistrictName=="Leonia Boro"

replace problem=1 if DistrictName=="NEWTON TOWN"

replace problem=1 if DistrictName=="SALEM COUNTY VOCATIONAL"

replace problem=1 if DistrictName=="SOUTH PLAINFIELD BORO"

replace supe=1 if JobTitle=="CSA"

replace supe=1 if JobTitle=="CSA/Principal"

replace supe=1 if JobTitle=="Interim Principal/CSA"

replace supe=1 if JobTitle=="Superintendent"



replace supe=1 if JobTitle=="CSA/Principle"

replace supe=1 if JobTitle=="Principle/CSA"

save, replace

use 09_salary_r
destring BaseAnnualSalary1108, replace
replace supe=1 if DistrictName=="CAPE MAY CITY" & BaseAnnualSalary1108=="116968"
replace supe=1 if DistrictName=="CITY OF ORANGE TWP" & BaseAnnualSalary1108=="186533"
replace supe=1 if DistrictName=="HIGHLAND PARK BORO" & BaseAnnualSalary1108=="183400"
replace supe=1 if DistrictName=="NEWTON TOWN" & BaseAnnualSalary1108=="145000"
replace supe=1 if DistrictName=="SALEM COUNTY VOCATIONAL" & BaseAnnualSalary1108=="213151"
replace supe=1 if DistrictName=="SOUTH PLAINFIELD BORO" & BaseAnnualSalary1108=="165000"
replace supe=1 if DistrictName=="FAIR HAVEN BORO" & BaseAnnualSalary1108=="145000"
save, replace

use 09_salary_r
drop total 
sort DistrictName
by DistrictName: egen total=total(supe)
move total supe 
save, replace 

use 09_salary_r
//tab to see the ones which have non-numeric problems 
destring BaseAnnualSalary1108, replace ignore("-") 
sort DistrictNumber
by DistrictNumber:egen maximum=max(BaseAnnualSalary1108)
gen difference= BaseAnnualSalary1108-maximum 
move difference total 

edit if supe==1 & difference!=0

edit if supe==0 & difference==0

save, replace
clear

use 09_salary_r

unique DistrictName 
//600

unique DistrictName if total==1
//553

unique DistrictName if total==0
//37
edit if total==0

unique DistrictName if total>1
//10

edit if total>1

generate problem=0
replace problem=1 if total>1
move problem total

generate problemobs=0
move problemobs problem
replace problemobs=1 if total>1 & supe==1
save, replace
/*JobTitle//LEONIA BORO
Superintendent*/

//all accounted for 
//problem - 1/0 shows the total>1 observations 
//problemobs - 1/0 picks up the specific observations from the dist which are the problem


//running but I am not sure how to interpret this - not clear to me
//note is csa a superintendent? 














