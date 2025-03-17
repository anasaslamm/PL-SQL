begin
     case :APEX$ROW_STATUS
     when 'C' then -- Note: In EA2 this has been changed from I to C for consistency with Tabular Forms
         insert into EMPLOYEES ( EMPLOYEES_NAME, DEPT_ID, JOB_id, CITY )
         values ( :EMPLOYEES_NAME, :P11_DEPT_ID,	:JOB_id,	:CITY)
         returning EMP_ID into :EMP_ID;
     when 'U' then
         update EMPLOYEES SET 
          EMPLOYEES_NAME =  :EMPLOYEES_NAME, 
          DEPT_ID = :P11_DEPT_ID,
          JOB_id  =  :JOB_id,
          CITY = :CITY
          where EMP_ID  = :EMP_ID;
     when 'D' then
         delete EMPLOYEES
         where EMP_ID = :EMP_ID;
     end case;
end;



----------------======================----------------------



begin
     case :APEX$ROW_STATUS
     when 'C' then -- Note: In EA2 this has been changed from I to C for consistency with Tabular Forms
         insert into AC_PURCHASE_ORDER_ITEMS ( PO_ID, ITEM_NAME, ITEM_MEMORY, PTA_STATUS, COLOR, IMEI, QUANTITY, RATE, DISPLAY_RATE, STATUS )
         values ( :P6_PO_ID, :ITEM_NAME, :ITEM_MEMORY, :PTA_STATUS, :COLOR, :IMEI, :QUANTITY, :RATE, :DISPLAY_RATE, 'Y')
         returning PO_IDS into :PO_IDS;
     when 'U' then
         update AC_PURCHASE_ORDER_ITEMS SET 
            PO_ID = :P6_PO_ID,
            ITEM_NAME = :ITEM_NAME,
            ITEM_MEMORY = :ITEM_MEMORY,
            PTA_STATUS = :PTA_STATUS,
            COLOR = :COLOR,
            IMEI = :IMEI,
            QUANTITY = :QUANTITY,
            RATE = :RATE,
            DISPLAY_RATE = :DISPLAY_RATE,
            STATUS = 'Y' 
          where PO_IDS  = :PO_IDS;
     when 'D' then
         delete AC_PURCHASE_ORDER_ITEMS
         where  PO_IDS = :PO_IDS;
     end case;
end;
