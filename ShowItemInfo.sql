Create or Replace Function AUCTION_ITEM_INFO_FUNC(itemId int) Return int
AS
    numItem int :=0;
    Begin
        Select Count(*) into numItem from AUCTION where ITEM_ID = itemId;
        If (numItem < 0) Then
            numItem:=0;
        End if;
        
        Return itemId;
        
    End;
/
SELECT * FROM AUCTION WHERE ITEM_ID ='3';

--SELECT AUCTION_ITEM_INFO_FUNC('3') FROM DUAL;

