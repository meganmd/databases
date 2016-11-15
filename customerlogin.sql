--Customer login

--If USERNME = USERNAME
-- AND PASSWORD = PASSWORD 
--SHOW CUSTOMER MANAGEMENT PAGE
create or replace function Customer_Login_Func(username string, password string) Return INTEGER
  AS
    answer int := 0;
    loginBoolean1 int :=0;
    username1 int :='';
		password1 int := '';
	Begin
		Select Count(*) into loginBoolean1 from ACCOUNT where username= USERNAME AND password = PASSWORD;
		If  (loginBoolean1>0) Then
			answer := 1;
		End If;
		Return  answer;
	End ;