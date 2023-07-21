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

  /*
  /* Basic check */

select     c.subscriber_id
           , DATE_ADD(r.recharge_date, INTERVAL r.validity_in_days DAY) AS expiry_date
           , r.recharge_date
           , DATE(now()) AS todays_date
from       recharge r 
inner join customer c on r.subscriber_id = c.subscriber_id
WHERE      DATE_ADD(r.recharge_date, INTERVAL r.validity_in_days DAY) = DATE(now());


/* Functional check */

select      MIN(recharge_date) AS min_group_recharge_date
            , DATE_ADD(r.recharge_date, INTERVAL r.validity_in_days DAY) AS expiry_date
            , COUNT(c.subscriber_id) AS noOfSubscribers
            ,CASE 
            WHEN (DATE_ADD(r.recharge_date, INTERVAL r.validity_in_days DAY) > DATE_ADD(DATE(NOW()), INTERVAL 1 DAY)) THEN "GreaterThanD+1"
              WHEN (DATE_ADD(r.recharge_date, INTERVAL r.validity_in_days DAY) = DATE_ADD(DATE(NOW()), INTERVAL 1 DAY)) THEN "D+1"
              WHEN (DATE_ADD(r.recharge_date, INTERVAL r.validity_in_days DAY) = DATE_ADD(DATE(NOW()), INTERVAL 0 DAY)) THEN "D"
              WHEN (DATE_ADD(r.recharge_date, INTERVAL r.validity_in_days DAY) = DATE_ADD(DATE(NOW()), INTERVAL -1 DAY)) THEN "D-1"
              WHEN (DATE_ADD(r.recharge_date, INTERVAL r.validity_in_days DAY) < DATE_ADD(DATE(NOW()), INTERVAL -1 DAY)) THEN "LessThanD-1"
              ELSE ""
             END AS group_custom_days
from       recharge r 
inner join customer c on r.subscriber_id = c.subscriber_id
GROUP BY  expiry_date ,group_custom_days
ORDER BY expiry_date;


/* Query with counts of categorized subscribers */
select      MIN(DATE_ADD(r.recharge_date, INTERVAL r.validity_in_days DAY)) AS min_group_expiry_date
            ,COUNT(c.subscriber_id) AS noOfSubscribers
            ,CASE 
            WHEN (DATE_ADD(r.recharge_date, INTERVAL r.validity_in_days DAY) > DATE_ADD(DATE(NOW()), INTERVAL 1 DAY)) THEN "GreaterThanD+1"
              WHEN (DATE_ADD(r.recharge_date, INTERVAL r.validity_in_days DAY) = DATE_ADD(DATE(NOW()), INTERVAL 1 DAY)) THEN "D+1"
              WHEN (DATE_ADD(r.recharge_date, INTERVAL r.validity_in_days DAY) = DATE_ADD(DATE(NOW()), INTERVAL 0 DAY)) THEN "D"
              WHEN (DATE_ADD(r.recharge_date, INTERVAL r.validity_in_days DAY) = DATE_ADD(DATE(NOW()), INTERVAL -1 DAY)) THEN "D-1"
              WHEN (DATE_ADD(r.recharge_date, INTERVAL r.validity_in_days DAY) < DATE_ADD(DATE(NOW()), INTERVAL -1 DAY)) THEN "LessThanD-1"
              ELSE ""
             END AS group_custom_days
from       recharge r 
inner join customer c on r.subscriber_id = c.subscriber_id
GROUP BY  group_custom_days
ORDER BY min_group_expiry_date;
  */


