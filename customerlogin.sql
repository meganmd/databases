--Customer login

--If USERNME = USERNAME
-- AND PASSWORD = PASSWORD 
--SHOW CUSTOMER MANAGEMENT PAGE
create or replace function Customer_Login_Func(username1 string, password1 string) Return INTEGER
  AS
    answer int := 0;
    loginBoolean1 int :=0;
	Begin
		Select Count(*) into loginBoolean1 from ACCOUNT where username1= USERNAME AND password1 = PASSWORD;
		If  (loginBoolean1>0) Then
			answer := 1;
		End If;
		Return  answer;
	End ;