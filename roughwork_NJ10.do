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

unique DistrictName
//Number of unique values of DistrictName is 572
//572 districts to be accounted for

replace supe=1 if JobTitle=="SUPERINTENDENT"
// 0 changes made - sure there is problem , look into it at the end

replace supe=1 if JobTitle=="Superintendent"
//466 changes made - > 106

replace supe=1 if JobTitle=="Chief School Administrator/District Superintendent"
//0 changes

replace supe=1 if JobTitle=="Superintendent Principal"
//32 changes - > 74

replace supe=1 if JobTitle=="Superintendent Interim"
//5 changes -> 71 

replace supe=1 if JobTitle=="Superintendent PRINCIPAL"
//2 changes ->69 

replace supe=1 if JobTitle=="Superintendent Business Administrator"
//2 changes ->67

replace supe=1 if JobTitle=="Superintendent (Interim)"
//1 change - >66

replace supe=1 if JobTitle=="Superintendent/Principal"
//1 change - > 65

replace supe=1 if JobTitle=="Superintendent Principal, Head of CST"
//1 change -> 64

replace supe=1 if JobTitle=="Superintendent Interim Superintendent"
//3 change -> 61 

replace supe=1 if JobTitle=="Superintendent Director of Curriculum"
//1 change -> 60

replace supe=1 if JobTitle=="Superintendent Principal/CST Director/Teacher"
//1 change - > 59

replace supe=1 if JobTitle=="Superintendent Superintendent/Principal 6-8"
//1change -> 58

replace supe=1 if JobTitle=="Superintendent Princiapl"
//1 change - > 57

replace supe=1 if JobTitle=="Superintendent N/A"
//2 changes - > 55

replace supe=1 if JobTitle=="Superintendent SUPERINTENDENT"
//2 changes - > 53

replace supe=1 if JobTitle=="Superintendent principal"
//1 change - > 52

replace supe=1 if JobTitle=="Superintendent Superintendent of Schools"
//1 change -> 51 

replace supe=1 if JobTitle=="Superintendent Superintendent"
//5 changes -> 46

replace supe=1 if JobTitle=="Superintendent Director of Special Services"
//3 changes ->43 

replace supe=1 if JobTitle=="Superintendent Board Secretary"
//2 changes -> 41

replace supe=1 if JobTitle=="Superintendent Middle School principal"
//1 change ->40

replace supe=1 if JobTitle=="Superintendent BUSINESS ADMINISTRATOR"
//3 change - > 37

replace supe=1 if JobTitle=="Superintendent Chief School Administator"
//1 change - > 36

replace supe=1 if JobTitle=="Superintendent LOA"
//1 change -> 35

replace supe=1 if JobTitle=="Superintendent GUIDANCE COUNSELOR"
//1 change ->34 

replace supe=1 if JobTitle=="Superintendent Interim State Supertendent"
//1 change-> 33

replace supe=1 if JobTitle=="Superintendent PRINCIPAL/DIR SPEC SERVICES"
//1 change-> 32

replace supe=1 if JobTitle=="Interim Superintendent"
//2 changes -> 30

replace supe=1 if JobTitle=="Superintendent Consultant"
//1 changes -> 29

replace supe=1 if JobTitle=="Superintendent tchr, curr coor, prin, bldg su"
//1 change -> 28

replace supe=1 if JobTitle=="Superintendent  Principal"
//1 change -> 26

replace supe=1 if JobTitle=="Superintendent chief school administrator"
//1 change -> 25

replace supe=1 if JobTitle=="Superintendent /Principal"
//1change -> 24

replace supe=1 if JobTitle=="Interim Supt"
//1 change ->23

unique DistrictName if total==0

save, replace
//35 districts do not have a superintendent - rest accounted for - no problem var



//going to repeat code - for updatint toal to search by total
edit if total==0

drop total

sort DistrictName
by DistrictName: egen total=total(supe)
move total supe 



unique DistrictName
// 572

unique DistrictName if total==0
//35 

unique DistrictName if total==1
//528

unique DistrictName if total>1 
//9 

edit if total>1

generate problem=0
replace problem=1 if total>1
move problem total

generate problemobs=0
replace problemobs=1 if total>1 & supe==1 
move problemobs problem
save, replace 
 

