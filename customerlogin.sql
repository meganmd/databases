--Customer login

--If USERNME = USERNAME
-- AND PASSWORD = PASSWORD 
--SHOW CUSTOMER MANAGEMENT PAGE
Create or Replace function Customer_Login_Func(username1 string, password1 string) Return INTEGER
  AS
    loginBoolean1 int :=0;
    username1 int :='';
		password1 int := '';
	Begin
		Select Count(*) into numEmps from ACCOUNT where username1= USERNAME AND password1 = PASSWORD;
		If  (loginBoolean1>0) Then
			answer := 1;
		End If;
		Return  answer;
	End ;