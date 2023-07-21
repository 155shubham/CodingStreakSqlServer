/*Question
--Calculate % of subscribers of recharging before D-1, on D-1, on D, on D+1 and after D+1 where D is the data pack validity expiry.
*/

CREATE TABLE recharge
  (
     recharge_date Date
    , subscriber_id BIGINT
    , product_price INT
    , validity_in_days INT
    );
CREATE TABLE customer(
      subscriber_id BIGINT
      ,subStatus VARCHAR(10)
  );
INSERT INTO Recharge (recharge_date,subscriber_id,product_price,validity_in_days)
VALUES
  ('2023-07-01',1,0,30)
  ,('2023-06-28',2,5,30)
  ,('2023-07-02',3,10,30)
  ,('2023-07-03',4,15,30)
  ,('2023-07-28',5,20,30)
  ,('2023-06-09',6,5,30)
  ,('2023-06-19',7,5,30)
  ,('2023-06-20',8,5,30)
  ,('2023-06-21',9,5,30)
  ,('2023-06-22',10,5,30)
  ,('2023-06-18',11,5,30)
  ,('2023-06-20',12,5,30)
  ;
  
  INSERT INTO Customer(subscriber_id,subStatus)
  VALUES
  (1, 'Active')
  ,(2, 'Active')
  ,(3, 'Active')
  ,(4, 'Active')
  ,(5, 'Active')
  ,(6, 'Active')
  ,(7, 'Active')
  ,(8, 'Active')
  ,(9, 'Active')
  ,(10, 'Active')
  ,(11, 'Active')
  ,(12, 'Active')
  ;

