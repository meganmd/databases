--Login

--If USERNME = USERNAME
-- AND PASSWORD = PASSWORD 
--SHOW USER MANAGEMENT & VIEW REPORTS
Create or Replace function Login_Func(username1 string, password1 string) Return INTEGER
  AS
    loginBoolean int :=0;
    username1 int :='';
		password1 int := '';
	Begin
		Select Count(*) into numEmps from ACCOUNT where username1= USERNAME AND password1 = PASSWORD;
		If  (loginBoolean>0) Then
			answer := 1;
		End If;
		Return  answer;
	End ;
/* can be invoked using the following:
select COMPANY_isSmallDept_Func(1,2) from dual;
*/