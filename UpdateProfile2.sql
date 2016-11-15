Create or Replace Procedure CUSTOMER_UPDATE_PROFILE_PROC(username1 VARCHAR, fname1 VARCHAR, lname1 VARCHAR, email1 VARCHAR, phone1 CHAR, oldPassword VARCHAR,newPassword VARCHAR, retypePassword VARCHAR ) 
as total integer;
    Begin
        select case
          when exists(
            select * from CUSTOMER where username1 = USERNAME) 
          then 1 else 0
        end
        into total
        from dual;
        
        if total = 1 then
            
          if (newPassword=retypePassword) then
          Update CUSTOMER set FNAME = fname1, LNAME = lname1, EMAIL = email1, PHONE = phone1 where username1 = USERNAME and EXISTS (Select * FROM ACCOUNT where PASSWORD = oldPassword 
            and USERNAME = username1);
          Update ACCOUNT set PASSWORD = newPassword where USERNAME = username1 and PASSWORD = oldPassword;
        end if;
        
        else
          INSERT INTO CUSTOMER VALUES (username1, phone1, email1, fname1, lname1);
        end if;
      end; 

execute CUSTOMER_UPDATE_PROFILE_PROC('emininem', 'Emininem', 'Uhh', 'mm@gmail.com', '3204242656', 'musiciscool', 'musicissocool', 'musicissocool');
insert into customer values('johngreg', '999999999', 'Emininem@ylkj.com', 'emmu', 'last');