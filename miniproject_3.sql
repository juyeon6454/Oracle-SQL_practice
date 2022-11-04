

-----------------------/*client*/------------------------

select * from clientlist;

create SEQUENCE seq_client_id
INCREMENT by 1
start with 1;

alter table clientlist add primary key (client_id);


---------------------/*product*/--------------------------

select * from productlist;

create SEQUENCE seq_product_id
INCREMENT by 1000
start with 1;

alter table productlist add primary key (product_id);

UPDATE productlist
SET product_name = '뷰센 치약'
WHERE product_id = 200;

-------------------/*order*/--------------------------------------

select * from orderlist;

drop SEQUENCE seq_order_id;
create SEQUENCE seq_order_id
INCREMENT by 1
start with 303;

alter table orderlist add primary key (order_id);

alter table orderlist add CONSTRAINT c_order_id_fk FOREIGN KEY (client_id)
REFERENCES clientlist(client_id);
alter table orderlist add CONSTRAINT p_order_id_fk FOREIGN KEY (product_id)
REFERENCES productlist(product_id);

UPDATE orderlist
SET client_id = 100,
    product_id = 201
WHERE order_id = 302 ;
commit;
/

UPDATE orderlist
SET product_name = '뷰센 치약'
WHERE order_id = 300;
---------------------------------프로시저-----------------------------------------
/*client 프로시저*/

CREATE OR REPLACE PROCEDURE UPDATE_CLIENT
    (v_client_id IN clientlist.client_id%type, 
    v_client_name IN clientlist.client_name%type,
    v_phonenumber IN clientlist.phonenumber%type,
    v_address IN clientlist.address%type,
    v_email IN clientlist.email%type)
IS

BEGIN
    INSERT INTO clientlist
    (client_id, client_name, phonenumber, address, email)
    VALUES 
    (v_client_id, v_client_name, v_phonenumber, v_address, v_email);

UPDATE clientlist
    commit;
END;
/
/*product 프로시저*/
CREATE OR REPLACE PROCEDURE UPDATE_PRODUCT
    (v_product_id IN productlist.product_id%type, 
    v_product_name IN productlist.product_name%type,
    v_product_price IN productlist.product_price%type,
    v_product_stock IN productlist.product_stock%type)
IS

BEGIN
    INSERT INTO  productlist
    (product_id, product_name, product_price, product_stock)
    VALUES 
    (v_product_id, v_product_name, v_product_price, v_product_stock);
  
    commit;
END;
/
/*order 프로시저*/
CREATE OR REPLACE PROCEDURE UPDATE_ORDER
    (v_order_id IN orderlist.order_id%type, 
    v_order_date IN orderlist.order_date%type, 
    v_client_name IN orderlist.client_name%type,
    v_client_phonenumber IN orderlist.client_phonenumber%type,
    v_client_address IN orderlist.client_address%type,
    v_product_name IN orderlist.product_name%type,
    v_product_stock IN orderlist.product_stock%type,
    v_product_price IN orderlist.product_price%type,
    v_client_id IN orderlist.client_id%type,
    v_product_id IN orderlist.product_id%type,
    v_client_name IN clientlist.client_name%type)
IS

BEGIN
    INSERT INTO orderlist
    (order_id, order_date, client_name, client_phonenumber, client_address, 
    product_name, product_stock, product_price, client_id, product_id)
    VALUES 
    (v_order_id, v_order_date, v_client_name, v_client_phonenumber, v_client_address, 
     v_product_name, v_product_stock, v_product_price,v_client_id,v_product_id);
    
    commit;
END;
/

--UPDATE orderlist
--    SET client_name = clientlist.client_name
--    WHERE orderlist.client_name = v_client_name;
--    COMMIT;



