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
log using superintendent_var
*Job titles for the year 2009
tab JobTitle
log close
clear

import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\10_salary_r.xls", sheet("SD1709 new") firstrow
log using superintendent_var, append
*Job titles for the year 2010
tab JobTitle
log close
clear

import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\11_salary_r.xls", sheet("Sheet1") firstrow
log using superintendent_var, append
*Job titles for the year 2011
tab title
log close
clear

import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\12_salary_r.xls", sheet("12_salary") firstrow
log using superintendent_var, append
*Job titles for the year 2012
tab title
log close
clear

import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\13_salary_r.xls", sheet("13_salary") firstrow
log using superintendent_var, append
*Job titles for the year 2013
tab TITLE
log close
clear

import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\14_salary_r.xls", sheet("14_salary") firstrow
log using superintendent_var, append
*Job titles for the year 2014
tab EMP_JOB_TITLE
log close
clear

import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\15_salary_r.xls", sheet("15_salary") firstrow
log using superintendent_var, append
*Job titles for the year 2015
tab EMP_JOB_TITLE
log close
clear 

import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\16_salary_r.xls", sheet("16_salary") firstrow
log using superintendent_var, append
*Job titles for the year 2016
tab EMP_JOB_TITLE
log close
clear
//done till here for trial 2 

// hold on to the ado file might not have to use the ado file at all or maybe in another folder
//actually didnt need to use the log file as well 

//creating ado file 
cap program drop ado1
program define ado1
replace supe=1 if JobTitle=="Superintendent" | JobTitle=="Principal" | JobTitle=="Chief School Administrator" | JobTitle=="0102  Superintendent"
replace supe=1 if JobTitle=="0102 Chief School Administrator" | JobTitle=="0102 DISTRICT SUPERINTENDENT" | JobTitle=="0102   Chief School Administrator/Distr" | JobTitle=="0102   Chief School Administrator/Distr"
replace supe=1 if JobTitle=="0120 Chief School Administrator " | JobTitle=="CHIEF SCHOOL ADM/PRINCIPAL " | JobTitle=="CHIEF SCHOOL ADMINISTRATOR" | JobTitle=="CHIEF SCHOOL ADMINISTRATOR/DISTRICT SUP"
replace supe=1 if JobTitle=="CHIEF SCHOOL ADMINISTRATOR/SCHOOL BUSIN" | JobTitle=="Chief Schoo Administrator/Superintenden" | JobTitle=="Chief School Adm./Supt / School Busines" | JobTitle=="Chief School Admin/Superintendent" 
replace supe=1 if JobTitle=="Chief School Administrator" | JobTitle=="Chief School Administrator / District S" | JobTitle=="Chief School Administrator / District S" | JobTitle=="Chief School Administrator / Principal"
replace supe=1 if JobTitle=="Chief School Administrator/ Superintend" | JobTitle=="Chief School Administrator/District Sup" | JobTitle=="Chief School Administrator/Principal" | JobTitle=="Chief School Administrator/Superintende"
replace supe=1 if JobTitle=="Chief School Administrator/Superintende" | JobTitle=="Chief Schoool Administrator" | JobTitle=="SCH. BUSINESS ADMIN" | JobTitle=="SCHOOL BUS. ADMIN"
replace supe=1 if JobTitle=="SCHOOL BUSINESS ADMIN" | JobTitle=="SCHOOL BUSINESS ADMIN." | JobTitle=="SCHOOL BUSINESS ADMINISTRATOR" | JobTitle=="SCHOOL BUSINESS ADMINISTRATOR/ BOARD SE"
replace supe=1 if JobTitle=="SCHOOL BUSINESS ADMINISTRATOR/BOARD SEC" | JobTitle=="SCHOOL PRINCIPAL" | JobTitle=="SUPERINTENDANT" | JobTitle=="SUPERINTENDENT"
replace supe=1 if JobTitle=="SUPERINTENDENT OF SCHOOLS" | JobTitle=="SUPERINTENDENT OF SCHOOLS/ ACTING BUSIN" | JobTitle=="SUPERINTENDENT/BUSINESS ADMINISTRATOR" | JobTitle=="SUPERINTENDENT/PRINCIPAL"
replace supe=1 if JobTitle=="School Superintendent" | JobTitle=="Superintedent" | JobTitle=="Superintendant" | JobTitle=="Superintendedent"
replace supe=1 if JobTitle=="Superintendent" | JobTitle=="Superintendent" | JobTitle=="Superintendent (Salary contract not set" | JobTitle=="Superintendent - total salary $157,875" 
replace supe=1 if JobTitle=="Superintendent / Principal / Director o" | JobTitle=="Superintendent 102,000; Dir. Of Special" | JobTitle=="Superintendent of Schools" | JobTitle=="Superintendent of Schools (CSA)" 
replace supe=1 if JobTitle=="Superintendent of Schools (Salary Inclu" | JobTitle=="Superintendent, CST Director, Curriculu" | JobTitle=="Superintendent/Consultant" | JobTitle=="Superintendent/Dir of Special Serv" 
replace supe=1 if JobTitle=="Superintendent/Director of CST" | JobTitle=="Superintendent/Guidance" | JobTitle=="Superintendent/Middle School Principal" | JobTitle=="Superintendent/Principal"
replace supe=1 if JobTitle=="Superintendent/Principal 6-8" | JobTitle=="Superintendent/Principal/Curric Dir" | JobTitle=="Superintendent/Principal/Dir Spec Svc" | JobTitle=="Superintendent/Principal/Teacher"
replace supe=1 if JobTitle=="Superintendent/Principle" | JobTitle=="Superintendent\Principal" | JobTitle=="Superintendnet" | JobTitle=="Superintent"
replace supe=1 if JobTitle=="Superitendent" | JobTitle=="Superitnendent" | JobTitle=="chief school administrator" | JobTitle=="superintendent"
replace supe=1 if JobTitle=="SUPERVISOR - Principal" | JobTitle=="School Principal" | JobTitle=="Superintendent" | JobTitle=="Superintendent & Principal Stevenson Sc"
replace supe=1 if JobTitle=="Superintendent (Interim)" | JobTitle=="Superintendent .." | JobTitle=="Superintendent /Principal" | JobTitle=="Superintendent BUSINESS ADMINISTRATOR"
replace supe=1 if JobTitle=="Superintendent BUSINESS ADMINISTRATOR" | JobTitle=="Superintendent Bldngs & Grounds" | JobTitle=="Superintendent Board Secretary" | JobTitle=="Superintendent Business"
replace supe=1 if JobTitle=="Superintendent Business Administrator" | JobTitle=="Superintendent Chief School Administato" | JobTitle=="Superintendent Consultant" | JobTitle=="Superintendent Director of Curriculum"
replace supe=1 if JobTitle=="Superintendent Director of Special Serv" | JobTitle=="Superintendent GUIDANCE COUNSELOR" | JobTitle=="Superintendent Interim" | JobTitle=="Superintendent Interim State Supertende"
replace supe=1 if JobTitle=="Superintendent Interim Superintendent" | JobTitle=="Superintendent LOA" | JobTitle=="Superintendent Middle School principal" | JobTitle=="Superintendent N/A"
replace supe=1 if JobTitle=="Superintendent PRINCIPAL" | JobTitle=="Superintendent PRINCIPAL/DIR SPEC SERVI" | JobTitle=="Superintendent Princiapl" | JobTitle=="Superintendent Principal"
replace supe=1 if JobTitle=="Superintendent Principal, Head of CST" | JobTitle=="Superintendent Principal/CST Director/T" | JobTitle=="Superintendent S/E Supr./LDTC" | JobTitle=="Superintendent SUPERINTENDENT"
replace supe=1 if JobTitle=="Superintendent Superintendent" | JobTitle=="Superintendent Superintendent of School" | JobTitle=="Superintendent Superintendent/Principal" | JobTitle=="Superintendent Supervisor of Buildings" 
replace supe=1 if JobTitle=="Superintendent Supervisor-Bldgs and Gro" | JobTitle=="Superintendent chief school administrat" | JobTitle=="Superintendent principal" | JobTitle=="Superintendent tchr, curr coor, prin, b"
replace supe=1 if JobTitle=="Superintendent  Principal" | JobTitle=="Superintendent's Secretary" | JobTitle=="Superintendent/Principal" | JobTitle=="Regional Superintendent"
replace supe=1 if JobTitle=="Superintendent" | JobTitle=="Superintendent (Interim)" | JobTitle=="Superintendent /Principal" | JobTitle=="Superintendent Asst Board Secretary"
replace supe=1 if JobTitle=="Superintendent BUSINESS ADMINISTRATOR" | JobTitle=="Superintendent Business Administrator" | JobTitle=="Superintendent CSA" | JobTitle=="Superintendent CST Director"
replace supe=1 if JobTitle=="Superintendent Chief School Administrat" | JobTitle=="Superintendent PRINCIPAL" | JobTitle=="Superintendent PRINCIPAL/DIR SPECIAL SE" | JobTitle=="Superintendent PrincipaL"
replace supe=1 if JobTitle=="Superintendent Principal" | JobTitle=="Superintendent Principal K-8" | JobTitle=="Superintendent Principal/CST Dir/" | JobTitle=="Superintendent State District Supt of S"
replace supe=1 if JobTitle=="Superintendent Superintendent" | JobTitle=="Superintendent Superintendent of School" | JobTitle=="Superintendent principal & CST Director" | JobTitle=="Superintendent tchr, curr coor, prin, b"
replace supe=1 if JobTitle=="Superintendent/Pincipal" | JobTitle=="Principal" | JobTitle=="Principal Principal" | JobTitle=="Superintendent"
replace supe=1 if JobTitle=="Superintendent /Principal" | JobTitle=="Superintendent Acting Superintendent" | JobTitle=="Superintendent Asst Business Administra" | JobTitle=="Superintendent BUSINESS ADMIN/PRINCIPAL"
replace supe=1 if JobTitle=="Superintendent Business Administrator" | JobTitle=="Superintendent PRINCIPAL" | JobTitle=="Superintendent PRINCIPAL/DIRECTOR" | JobTitle=="Superintendent Principal"
replace supe=1 if JobTitle=="Superintendent Principal K-8" | JobTitle=="Superintendent Principal/ CST Director" | JobTitle=="Superintendent Principal/CST Coordinato" | JobTitle=="Superintendent School Business Administ"
replace supe=1 if JobTitle=="Superintendent Superintendent" | JobTitle=="Superintendent Superintendent Gibbsboro" | JobTitle=="Superintendent Superintendent of School"
replace supe=1 if JobTitle=="Superintendent/Principal"
replace supe=1 if JobTitle=="Principal" | JobTitle=="Principal Superintendent" | JobTitle=="Principal Supv of Instruc & Curric" | JobTitle=="Superintendent"
replace supe=1 if JobTitle=="Superintendent (Interim Supt.)" | JobTitle=="Superintendent /Principal (Interim)" | JobTitle=="Superintendent CST Director" | JobTitle=="Superintendent PRINCIPAL"
replace supe=1 if JobTitle=="Superintendent Principal" | JobTitle=="Superintendent Principal K-8" | JobTitle=="Superintendent Principal School # 3" | JobTitle=="Superintendent Principal/CST Director"
replace supe=1 if JobTitle=="Superintendent Princpal" | JobTitle=="Superintendent School Business Administ" | JobTitle=="Superintendent Superin/Princ/Superv" | JobTitle=="Superintendent Superintendent"
replace supe=1 if JobTitle=="Superintendent Tri-district" | JobTitle=="Superintendent Tri-district shared" | JobTitle=="Superintendent YSC" | JobTitle=="Superintendent tchr, curr coor, prin, b"
replace supe=1 if JobTitle=="Superintendent" | JobTitle=="Superintendent" | JobTitle=="Superintendent"
end


//all the variables for job titles across different years have been 
//renames as JobTitle for uniformity - easier to work 


//creating the superintendent variable for 2009 
import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\09_salary_r.xls", sheet("Salary & Benefits 1-1-08") firstrow
save 09_salary_r, replace
clear 
use 09_salary_r 
generate supe=0
move supe JobTitle
ado1
save, replace
clear

//2010
import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\10_salary_r.xls", sheet("SD1709 new") firstrow
save 10_salary_r, replace
clear
use 10_salary_r
generate supe=0
move supe JobTitle
ado1
save, replace
clear



//2011
import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\11_salary_r.xls", sheet("Sheet1") firstrow
rename title JobTitle
save 11_salary_r, replace
clear
use 11_salary_r
generate supe=0
move supe JobTitle
ado1
save, replace
clear


//2012
import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\12_salary_r.xls", sheet("12_salary") firstrow
rename title JobTitle
save 12_salary_r, replace
clear
use 12_salary_r
generate supe=0
move supe JobTitle
ado1
save, replace
clear

//2013 
import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\13_salary_r.xls", sheet("13_salary") firstrow
rename TITLE JobTitle
save 13_salary_r, replace
clear
use 13_salary_r
generate supe=0
move supe JobTitle
ado1
save, replace
clear


//2014
import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\14_salary_r.xls", sheet("14_salary") firstrow
rename EMP_JOB_TITLE JobTitle
save 14_salary_r, replace
clear
use 14_salary_r
generate supe=0
move supe JobTitle
ado1
save, replace
clear


//2015
import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\15_salary_r.xls", sheet("15_salary") firstrow
rename EMP_JOB_TITLE JobTitle
save 15_salary_r, replace
clear
use 15_salary_r
generate supe=0
move supe JobTitle
ado1
save, replace
clear


//2016 
import excel "C:\Users\sd901\Dropbox\2016_Fall_Shourjya\nj_salary_cap\raw_data\16_salary_r.xls", sheet("16_salary") firstrow
rename EMP_JOB_TITLE JobTitle
save 16_salary_r, replace
clear
use 16_salary_r
generate supe=0
move supe JobTitle
ado1
save, replace
clear

//rename all district codes as DistNum for uniformity - create total variable

use 09_salary_r
rename DistrictNumber DistNum
destring DistNum, replace
sort DistNum
by DistNum: egen total=total(supe)
move total supe
save, replace
clear

use 10_salary_r
rename DistrictNumber DistNum
destring DistNum, replace
sort DistNum
by DistNum: egen total=total(supe)
move total supe
save, replace
clear

use 11_salary_r
rename dist DistNum
destring DistNum, replace
sort DistNum
by DistNum: egen total=total(supe)
move total supe
save, replace
clear

use 12_salary_r
rename dist DistNum
destring DistNum, replace
sort DistNum
by DistNum: egen total=total(supe)
move total supe
save, replace
clear

use 13_salary_r
rename DIST DistNum
destring DistNum, replace
sort DistNum
by DistNum: egen total=total(supe)
move total supe
save, replace
clear

use 14_salary_r
rename EMP_DISTRICT_ID DistNum
destring DistNum, replace
sort DistNum
by DistNum: egen total=total(supe)
move total supe
save, replace
clear

use 15_salary_r
rename EMP_DISTRICT_ID DistNum
destring DistNum, replace
sort DistNum
by DistNum: egen total=total(supe)
move total supe
save, replace
clear

use 16_salary_r
rename EMP_DISTRICT_ID DistNum
destring DistNum, replace
sort DistNum
by DistNum: egen total=total(supe)
move total supe
save, replace
clear

//part with unique and total

use 09_salary_r
log using superintendent_var, append
*unique job titles for 09
unique DistNum
log close
clear

use 10_salary_r
log using superintendent_var, append
*unique job titles for 10
unique DistNum
log close
clear

use 11_salary_r
log using superintendent_var, append
*unique job titles for 11
unique DistNum
log close
clear

use 12_salary_r
log using superintendent_var, append
*unique job titles for 12
unique DistNum
log close
clear

use 13_salary_r
log using superintendent_var, append
*unique job titles for 13
unique DistNum
log close
clear


use 14_salary_r
log using superintendent_var, append
*unique job titles for 14
unique DistNum
log close
clear

use 15_salary_r
log using superintendent_var, append
*unique job titles for 15
unique DistNum
log close
clear

use 16_salary_r
log using superintendent_var, append
*unique job titles for 16
unique DistNum
log close
clear

// calculating total=0, total=1, total>1

 
use 09_salary_r
log using superintendent_var, append
*calculating total=0,1 & total>1
*for the year 09
unique DistNum if total==0
unique DistNum if total==1
unique DistNum if total>1 
log close
clear

use 10_salary_r
log using superintendent_var, append
*calculating total=0,1 & total>1
*for the year 10
unique DistNum if total==0
unique DistNum if total==1
unique DistNum if total>1 
log close
clear

use 11_salary_r
log using superintendent_var, append
*calculating total=0,1 & total>1
*for the year 11
unique DistNum if total==0
unique DistNum if total==1
unique DistNum if total>1 
log close
clear

use 12_salary_r
log using superintendent_var, append
*calculating total=0,1 & total>1
*for the year 12
unique DistNum if total==0
unique DistNum if total==1
unique DistNum if total>1 
log close
clear

use 13_salary_r
log using superintendent_var, append
*calculating total=0,1 & total>1
*for the year 13
unique DistNum if total==0
unique DistNum if total==1
unique DistNum if total>1 
log close
clear

use 14_salary_r
log using superintendent_var, append
*calculating total=0,1 & total>1
*for the year 14
unique DistNum if total==0
unique DistNum if total==1
unique DistNum if total>1 
log close
clear

use 15_salary_r
log using superintendent_var, append
*calculating total=0,1 & total>1
*for the year 15
unique DistNum if total==0
unique DistNum if total==1
unique DistNum if total>1 
log close
clear

use 16_salary_r
log using superintendent_var, append
*calculating total=0,1 & total>1
*for the year 16
unique DistNum if total==0
unique DistNum if total==1
unique DistNum if total>1 
log close
clear

//to check total==0 and total>1 

//to check the total=0 values
/*browse if total==0
browse if total>1*/


use 09_salary_r
sort DistrictName
edit if total==0
replace supe=1 if JobTitle=="Interim Superintendent" | JobTitle=="0102 Chief School Administrator" | JobTitle=="Superintendent" | JobTitle=="CSA/Principal"
replace supe=1 if JobTitle=="Chief School Administrator / District Superintendent" | JobTitle=="0102 Chief School Administrator/District Superintendent" | JobTitle=="Interim Superintendent                                           " 
replace supe=1 if JobTitle=="Interim Superintendent" | JobTitle=="CHIEF SCHOOL ADM/PRINCIPAL" | JobTitle=="Chief School Administrator/Superintendent" | JobTitle=="Interim Superintendent"
replace supe=1 if JobTitle=="Supt" | JobTitle=="Superintendent" | JobTitle=="Superintendent, CST Director, Curriculum , Principal" | JobTitle=="Interim Superintendent"
replace supe=1 if JobTitle=="Superintendent 102,000; Dir. Of Special Services 68,000" | JobTitle=="PRINCIPAL" | JobTitle=="Chief School Administrator/ Superintendent"
replace supe=1 if JobTitle=="0102   Chief School Administrator/District Superintendent " | JobTitle=="Superintendent / Principal / Director of Special Services" | JobTitle=="Chief School Administrator/District Superintendent" 
replace supe=1 if JobTitle=="SHARED SUPERINTENDENT" | JobTitle=="Chief Schoo Administrator/Superintendent" | JobTitle=="CHIEF SCHOOL ADMINISTRATOR/DISTRICT SUPERINTENDENT" 
replace supe=1 if JobTitle=="Chief School Administrator / District Superintendent" | JobTitle=="Supt/Principal" | JobTitle=="Superintendent" | JobTitle=="Chief School Administrator/District Superintendent"
replace supe=1 if JobTitle=="State Dist. Supt. Of Schools" | JobTitle=="Interim Superintendent" | JobTitle=="Supt" | JobTitle=="District Superintendent"
replace supe=1 if JobTitle=="Interim-Superintendent" | JobTitle=="SUPERINTENDENT OF SCHOOLS/ ACTING BUSINESS ADMIN" | JobTitle=="Chief School Adm./Supt / School Business Adm."
replace supe=1 if JobTitle=="District Superintendent" | JobTitle=="Superintendent" | JobTitle=="0120 Chief School Administrator" | JobTitle=="Chief School Administrator/Superintendent"
replace supe=1 if JobTitle=="0102   Chief School Administrator/District Superintendent" | JobTitle=="Supintendent" | JobTitle=="Interim Chief School Administrator" 
replace supe=1 if JobTitle=="Interim Superintendent" | JobTitle=="Interim Superintendent" | JobTitle=="Chief School Administrator/District Superintendent" | JobTitle=="Chief School Administrator/District Superintendent"
save, replace
edit if total>1
replace supe=0 if total>1 
replace supe=1 if JobTitle=="Superintendent/Director of CST" | JobTitle=="Superintendent" | JobTitle=="Superintendent of Schools" | JobTitle=="Superintendent/Principal" 
replace supe=1 if JobTitle=="SUPERINTENDENT" | JobTitle=="SUPERINTENDENT/PRINCIPAL" | JobTitle=="CHIEF SCHOOL ADMINISTRATOR" | JobTitle=="Chief School Administrator" 
replace supe=1 if JobTitle=="Interim Superintendent"
save, replace
drop total




sort DistNum
by DistNum: egen total=total(supe)


move total supe






//browse or edit for total>1 

list  DistrictName JobTitle total if total>1

//copy it to a word document and check the list 
sort DistrictName if total>3

generate superintendent=0
replace superintendent=1 if total>1 
replace superintendent=1 if total==1





replace 



save, replace




















//to check the total=0 values
/*browse if total==0
browse if total>1*/




//maybe us a word document to list problems 
clear
//nothing new in the code for the other files, maybe use an ado file to repeat 
 
//possible ado files to make the code shorter

//ado 2 program - did not work not sure why - will edit later
/*cap program ado2
program define ado2
sort DistNum
by DistNum: egen total=total(supe)
end

use 09_salary_r
ado2
save, replace
clear

use 10_salary_r
ado2
save, replace
clear

use 11_salary_r
ado2
save, replace
clear

use 12_salary_r
ado2
save, replace
clear

use 13_salary_r
ado2
save, replace
clear

use 14_salary_r
ado2
save, replace
clear

use 15_salary_r
ado2
save, replace
clear

use 16_salary_r
ado2
save, replace
clear*/ 

//ado3 - have not tried as yet
/*generate tzero=0
replace tzero=1 if total==0
generate tzeroc=sum(tzero)
move tzeroc tzero

generate tone=0
replace tone=1 if total==1
generate tonec=sum(tone)
move tonec tone

generate tmore=0
replace tmore=1 if total>1
generate tmorec=sum(tmore)
move tmorec tmore

save, replace
clear*/



