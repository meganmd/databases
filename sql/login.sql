--Login

--If USERNME = USERNAME
-- AND PASSWORD = PASSWORD 
--SHOW USER MANAGEMENT & VIEW REPORTS
create or replace function Login_Func(username string, password string) Return INTEGER
  AS
    answer int := 0;
    loginBoolean1 int :=0;
	Begin
		Select Count(*) into loginBoolean1 from ACCOUNT where username= USERNAME AND password = PASSWORD;
		If  (loginBoolean1>0) Then
			answer := 1;
		End If;
		Return  answer;
	End;
  
--select Login_Func('admin','super') from dual;