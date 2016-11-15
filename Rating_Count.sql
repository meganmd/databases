--Author: Ellen

create or replace function rating_count_func(username1 VARCHAR) Return Integer
As
   feedback int :=0;
   Begin
    Select count(*) into feedback FROM FEEBACK where username1 = USERNAME;
   Return answer;
  End;
  
--This function counts the number of feedbacks given for a fiven seller. This is done by counting
--all of the feedbacks where the username matches the given username.