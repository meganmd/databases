Create or Replace Procedure CUSTOMER_UPDATE_PROFILE_PROC(username1 VARCHAR, fname1 VARCHAR,
lname1 VARCHAR, email1 VARCHAR, phone1 CHAR, oldPassword VARCHAR,newPassword VARCHAR, 
retypePassword VARCHAR ) 
as total integer;
    Begin
        select case
          when exists(
            select * from CUSTOMER where username = USERNAME1
          ) 
          then 1 else 0
        end
        into total
        from dual;
        
        if total = 1 then
            
          if (newPassword=retypePassword) then
          Update CUSTOMER set FNAME = fname1, LNAME = lname1, EMAIL = email1, PHONE = phone1 
            where username = username1 
            and EXISTS (
              Select * FROM ACCOUNT where PASSWORD = oldPassword 
              and USERNAME = username1
            );
          Update ACCOUNT set PASSWORD = newPassword where USERNAME = username1 and PASSWORD = oldPassword;
        end if;
        
        else
          if (newPassword = retypePassword) then
            INSERT INTO CUSTOMER(username, phone, email, fname, lname)
                        VALUES (username1, phone1, email1, fname1, lname1);
            Update ACCOUNT set PASSWORD = newPassword where USERNAME = username1 and PASSWORD = oldPassword;
          end if;
        end if;
      end; 

set linesize 500;
insert into account values('sillybob', 'mypassword', 0,0);
INSERT into customer values('sillybob', '8888888888', 'bb@b', 'bob', 'billy');
Select username, password, fname, lname, email from user_list_view where username = 'sillybob';
execute customer_update_profile_proc('sillybob', 'silly', 'bob', 'sbb@b', '7777777777', 'mypassword','mypassword2', 'mypassword2');
Select username, password, fname, lname, email from user_list_view where username = 'sillybob';
rollback;
insert into customer values('johngreg', '9999999999', 'Emininem@ylkj.com', 'emmu', 'last');