clear //to clear previous memory
set matsize 10000 //to indicate the number of variable that can be a
version 12 //to indicate which version of stata has been used - remember to check
set more off // to run without pressing more options - runs automatically

********************* directory****************

//change directory location as per convenience

local worDir "C:\Users\sd901\Desktop\trial2"
cap mkdir `worDir'
cd `worDir'

import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\12_salary_r.xls", sheet("12_salary") firstrow

rename title JobTitle
rename distname DistrictName
rename name EmployeeName

format JobTitle %-80s

move JobTitle EmployeeName
generate supe=0
move supe JobTitle
save 12_salary_r, replace
clear

use 12_salary_r

unique DistrictName
//Number of unique values of DistrictName is 570
//570 districts to be accounted for

replace supe=1 if JobTitle=="SUPERINTENDENT"
// 0 changes

replace supe=1 if JobTitle=="Superintendent"
//470 changes -> 101

replace supe=1 if JobTitle=="Chief School Administrator/District Superintendent"
//0 changes

replace supe=1 if JobTitle=="Superintendent Principal"
//34 changes - > 67

replace supe=1 if JobTitle=="Superintendent Interim"
//3 changes -> 64 

replace supe=1 if JobTitle=="Superintendent PRINCIPAL"
//12 changes ->52 

replace supe=1 if JobTitle=="Superintendent Business Administrator"
//3 changes ->49

replace supe=1 if JobTitle=="Superintendent (Interim)"
//1 change - >48

replace supe=1 if JobTitle=="Superintendent/Principal"
//0 change - > 48

replace supe=1 if JobTitle=="Superintendent Principal, Head of CST"
//0 change -> 48

replace supe=1 if JobTitle=="Superintendent Interim Superintendent"
//1 change -> 47 

replace supe=1 if JobTitle=="Superintendent Director of Curriculum"
//0 change -> 47

replace supe=1 if JobTitle=="Superintendent Principal/CST Director/Teacher"
//0 change - > 47

replace supe=1 if JobTitle=="Superintendent Superintendent/Principal 6-8"
// 0 change -> 47

replace supe=1 if JobTitle=="Superintendent Princiapl"
//0 change - > 47

replace supe=1 if JobTitle=="Superintendent N/A"
//0 changes - > 47

replace supe=1 if JobTitle=="Superintendent SUPERINTENDENT"
//0 changes - > 47

replace supe=1 if JobTitle=="Superintendent principal"
//0 change - > 47

replace supe=1 if JobTitle=="Superintendent Superintendent of Schools"
//1 change -> 46 

replace supe=1 if JobTitle=="Superintendent Superintendent"
//4 changes -> 42

replace supe=1 if JobTitle=="Superintendent Director of Special Services"
//3 changes ->39 

replace supe=1 if JobTitle=="Superintendent Board Secretary"
//0 changes -> 39

replace supe=1 if JobTitle=="Superintendent Middle School principal"
//1 change ->38

replace supe=1 if JobTitle=="Superintendent BUSINESS ADMINISTRATOR"
//1 change - > 37

replace supe=1 if JobTitle=="Superintendent Chief School Administator"
//0 change - > 37

replace supe=1 if JobTitle=="Superintendent LOA"
//0 change -> 37

replace supe=1 if JobTitle=="Superintendent GUIDANCE COUNSELOR"
//0 change ->37 

replace supe=1 if JobTitle=="Superintendent Interim State Supertendent"
//0 change-> 37

replace supe=1 if JobTitle=="Superintendent PRINCIPAL/DIR SPEC SERVICES"
//0 change-> 37

replace supe=1 if JobTitle=="Interim Superintendent"
//4 changes -> 33

replace supe=1 if JobTitle=="Superintendent Consultant"
//0 changes -> 33

replace supe=1 if JobTitle=="Superintendent tchr, curr coor, prin, bldg su"
//1 change -> 32

replace supe=1 if JobTitle=="Superintendent  Principal"
//0 change -> 32

replace supe=1 if JobTitle=="Superintendent chief school administrator"
//0 change -> 32

replace supe=1 if JobTitle=="Superintendent /Principal"
//1change -> 31

replace supe=1 if JobTitle=="Interim Supt"

replace supe=1 if JobTitle=="Superintendent Child Study Team Director"
//1 change -> 30

replace supe=1 if JobTitle=="Superintendent part-time interim Supt."
//2 changes -> 28

replace supe=1 if JobTitle=="Superintendent Chief School Administrator"
//1 change -> 27

replace supe=1 if JobTitle=="Superintendent Guidance Counselor"
//1 change -> 26 

replace supe=1 if JobTitle=="Superintendent State District Supt of Schls"
//1 chang e- > 25

replace supe=1 if JobTitle=="Superintendent PRINCIPAL/DIR SPECIAL SERVICES"
//1 change -> 24

replace supe=1 if JobTitle=="Acting Superintendent"
//2 changes - > 22 

replace supe=1 if JobTitle=="Superintendent Supervisor of Instruction"
//2 changes -> 20

replace supe=1 if JobTitle=="Interim superintendent/Prin"
//1 change-> 19

replace supe=1 if JobTitle=="Superintendent CSA"
//1 change - > 18

replace supe=1 if JobTitle=="Superintendent Shared Superintendent"
//2 change -> 16 

replace supe=1 if JobTitle=="Superintendent principal & CST Director"
//1 change - > 15

replace supe=1 if JobTitle=="Superintendent Principal/CST Dir/"
//1 change - > 14

replace supe=1 if JobTitle=="Superintendent Principal K-8"
//1 change - > 13

replace supe=1 if JobTitle=="Superintendent/Pincipal"
//1 chang e-> 12

replace supe=1 if JobTitle=="Superintendent Middle School Principal"
//1 change -> 11

replace supe=1 if JobTitle=="Superintendent Shared Services Superintendent"
//1 change -> 10 

replace supe=1 if JobTitle=="Superintendent PrincipaL"
//1 change -> 9

replace supe=1 if JobTitle=="Superintendent CST Director"
//1 change -> 8

replace supe=1 if JobTitle=="Superintendent Interim Principal"
//1 change -> 7

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
save, replace

use 12_salary_r


//woodland park 
//teaneck twp
//Belmar boro
replace supe=1 if DistrictName=="BELMAR BORO" & EmployeeName=="Robert Mahon"

replace supe=1 if DistrictName=="NEW HANOVER TWP" 

replace supe=1 if DistrictName=="TEANECK TWP" & EmployeeName=="BARBARA PINSAK"

replace supe=1 if DistrictName=="WOODLAND PARK" & EmployeeName=="JOHN DIGIOVACHINO"

save, replace












//going to repeat code - for updating total to search by total
unique DistrictName if total==0

edit if total==0

drop total

sort DistrictName
by DistrictName: egen total=total(supe)
move total supe 

generate problem=0
replace problem=1 if total>1
move problem total
generate problemobs=0
replace problemobs=1 if total>1 & supe==1 
move problemobs problem
save, replace
clear


unique DistrictName
//570
unique DistrictName if total==0
 //38 
unique DistrictName if total==1
//516
unique DistrictName if total>1
//16 



//all accounted for 






