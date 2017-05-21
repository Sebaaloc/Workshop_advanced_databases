/*Instructions for executing successfully the script, please keep in mind the order, everything is carefully placed in the order it should be executed. Example, first execute types_of_vechicles 
and then vehicles. This is due to the foreign keys and avoid updating the tables so it all is rather smooth.*/


--Creating table type_of_vehicles.
CREATE TABLE type_of_vehicles(
id_type INTEGER NOT NULL,
description VARCHAR(50) NOT NULL, --COLOCAR TAMAÑO EN GRAFICA
CONSTRAINT PK_type_of_vehicles_id_type PRIMARY KEY(id_type)
)


--Creating table vehicles.
CREATE TABLE vehicles(
id_vehicle INTEGER NOT NULL,
registration_number INTEGER NOT NULL,
plate VARCHAR(10) NOT NULL,
status VARCHAR(15)NOT NULL,
mileage INTEGER NOT NULL,
model_Ve VARCHAR(5) NOT NULL,
id_type INTEGER NOT NULL,
value_Ve INTEGER NOT NULL, 
replacement_val INTEGER NOT NULL,
bought_date DATE NOT NULL,
tax_date DATE NOT NULL,
requires_qualification VARCHAR(5) NOT NULL,
CONSTRAINT PK_vehicles_id_vehicle PRIMARY KEY(id_vehicle),
CONSTRAINT FK_type_of_vehicles1 FOREIGN KEY (id_type) REFERENCES type_of_vehicles(id_type)
)


--Creating table qualification_per_driver.
CREATE TABLE qualification_per_driver(
id_driver INTEGER NOT NULL,
id_qualification INTEGER NOT NULL,
status VARCHAR(15) NOT NULL,
assignment_date DATE NOT NULL,
CONSTRAINT FK_qualifications FOREIGN KEY (id_qualification) REFERENCES driver_qualification(id_dq),
CONSTRAINT FK_driver FOREIGN KEY (id_driver) REFERENCES drivers(id_drivers)
)


--Creating table driver_qualification.
CREATE TABLE driver_qualification(
id_dq INTEGER NOT NULL,
description VARCHAR(30) NOT NULL,
CONSTRAINT PK_driver_qualification PRIMARY KEY(id_DQ)
)


--Creating table drivers.
CREATE TABLE drivers(
id_drivers INTEGER NOT NULL,
employee_name VARCHAR(100) NOT NULL,
CONSTRAINT PK_drivers_id_drivers PRIMARY KEY(id_drivers)
)


--Creating table drivers_vehicles.
CREATE TABLE drivers_vehicles(
id_DVehicles INTEGER NOT NULL,
id_v INTEGER NOT NULL,
CONSTRAINT FK_drivers_vehicles FOREIGN KEY (id_DVehicles) REFERENCES drivers(id_drivers),
CONSTRAINT FK_vehicles_id_vehicle FOREIGN KEY (id_v) REFERENCES vehicles(id_vehicle)
)


--Creating table service_details.
CREATE TABLE service_details(
id_service INTEGER NOT NULL,
id_vehicles INTEGER NOT NULL,
name_S VARCHAR(20) NOT NULL, 
description varchar(100) NOT NULL,
issue_date DATE NOT NULL,
status VARCHAR(15) NOT NULL,
CONSTRAINT PK_service_details PRIMARY KEY(id_service),
CONSTRAINT FK_vehicles FOREIGN KEY (id_vehicles) REFERENCES vehicles(id_vehicle)
)


--Creating table type_of_service.
CREATE TABLE type_of_service(
id_TService INTEGER NOT NULL,
description VARCHAR(100) NOT NULL,
CONSTRAINT PK_type_of_service PRIMARY KEY(id_TService)
)


--Creating table service.
CREATE TABLE service(
id_service INTEGER NOT NULL,
id_TService INTEGER NOT NULL,
CONSTRAINT PK_service FOREIGN KEY (id_service) REFERENCES service_details(id_service),
CONSTRAINT FK_type_of_service FOREIGN KEY (id_TService) REFERENCES type_of_service(id_TService)
)


--Creating table repair_costs.
CREATE TABLE repair_costs(
id_number INTEGER NOT NULL,
id_vehicles INTEGER NOT NULL,
repair_cost INTEGER NOT NULL,
date_repair DATE NOT NULL,
description VARCHAR(100) NOT NULL,
amount INTEGER NOT NULL,
status VARCHAR(10) NOT NULL,
CONSTRAINT PK_repair_costs PRIMARY KEY(id_number),
CONSTRAINT FK_vehicles_repair FOREIGN KEY (id_vehicles) REFERENCES vehicles(id_vehicle)
)


--Creating table insurance_claims.
CREATE TABLE insurance_claims(
id_numberClaims INTEGER NOT NULL,
id_vehiclesc INTEGER NOT NULL,
loss_date DATE NOT NULL,
date_of_issue DATE NOT NULL,
nature_of_payment VARCHAR(100) NOT NULL,
daamges VARCHAR(100) NOT NULL,
CONSTRAINT PK_insurance_claims PRIMARY KEY(id_numberClaims),
CONSTRAINT FK_vehicles_claims FOREIGN KEY (id_vehiclesc) REFERENCES vehicles(id_vehicle)
)


----------------------------------
--adding data to type of vehicle--
----------------------------------


CREATE SEQUENCE type_sequence 
  START WITH 1
  INCREMENT BY 1;

INSERT INTO type_of_vehicles VALUES (type_sequence.nextval, 'Moped');
INSERT INTO type_of_vehicles VALUES (type_sequence.nextval, 'Motorcycle');
INSERT INTO type_of_vehicles VALUES (type_sequence.nextval, 'Trike motorcycle,');
INSERT INTO type_of_vehicles VALUES (type_sequence.nextval, 'Car');
INSERT INTO type_of_vehicles VALUES (type_sequence.nextval, 'Light rigid heavy vehicle');
INSERT INTO type_of_vehicles VALUES (type_sequence.nextval, 'Medium rigid heavy vehicle,');
INSERT INTO type_of_vehicles VALUES (type_sequence.nextval, 'Heavy rigid vehicle');
INSERT INTO type_of_vehicles VALUES (type_sequence.nextval, 'Tractor');
INSERT INTO type_of_vehicles VALUES (type_sequence.nextval, 'Wheelchair vehicle');

--select * from TYPE_OF_VEHICLES;

--------------------------
--adding data to vehicle--
--------------------------


CREATE SEQUENCE vehicle_sequence 
  START WITH 1
  INCREMENT BY 1;

INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11101,'abc897','Active',1014,'2011',1,5000000,2000000,'12/10/2010','12/10/2011','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11112,'ahu182','Active',1014,'2010',1,6050000,3000000,'20/12/2010','20/11/2011','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11113,'ovu819','Active',1014,'2010',9,5000000,4500000,'15/09/2010','30/08/2011','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11114,'uvj123','Active',1014,'2010',1,5000000,3000000,'10/08/2010','10/08/2011','no');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11115,'rbu839','Active',1014,'2011',6,5010000,4000000,'11/11/2011','12/10/2012','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11116,'ubo849','Active',1014,'2011',1,52000000,4000000,'10/10/2011','12/10/2012','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11117,'uab120','Active',1014,'2011',7,12000000,6000000,'02/11/2011','12/10/2012','no');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11118,'aub712','Active',1014,'2010',9,5000000,2500000,'08/03/2010','08/03/2011','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11119,'obu049','Active',1014,'2011',9,50500000,25000000,'12/10/2011','12/10/2012','no');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11110,'aob819','Active',1014,'2010',8,5000000,4000000,'05/10/2010','06/10/2011','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11111,'avi019','Active',1014,'2010',1,200000,100000,'27/03/2010','27/03/2011','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11112,'apv129','Active',1014,'2011',7,7000000,35000000,'12/10/2011','12/10/2012','no');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11113,'vja129','Active',1014,'2010',6,1040000,2000000,'17/07/2010','17/08/2011','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11114,'vub109','Active',1014,'2010',6,9060000,4500000,'01/10/2010','01/11/2011','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11115,'aib938','Active',1014,'2011',4,6020000,3000000,'12/01/2011','12/01/2012','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11116,'kau058','Active',1014,'2010',3,5550000,2000000,'08/10/2010','12/10/2011','no');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11117,'buo948','Active',1014,'2010',5,6200000,3000000,'04/06/2010','10/07/2011','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11118,'vua839','Active',1014,'2011',1,7500000,3500000,'04/10/2011','07/10/2012','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11119,'vua890','Active',1014,'2011',3,80000000,4000000,'09/12/2011','09/10/2012','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11120,'iao987','Active',1014,'2011',2,7014000,3500000,'08/07/2010','08/07/2011','no');

--select * from vehicles;

---------------------------
--adding data to services--
---------------------------
 
 
CREATE SEQUENCE typesservices_sequence 
  START WITH 1
  INCREMENT BY 1;

INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Automatic Transmission Fluid');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Battery and Cables');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Belts');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Brakes');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Cabin Air Filter');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Chassis Lubrication');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Dashboard Indicator Light On');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Coolant (Antifreeze)');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Engine Air Filter');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Engine Oil');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Exhaust');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Hoses');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Lights');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Power Steering Fluid');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Steering and Suspension');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Tire Inflation and Condition');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Wheel Alignment');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Windshield Washer Fluid');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Wiper Blades');

--select * from type_of_service;

----------------------------
--adding data to insurance--
----------------------------
 
 
CREATE SEQUENCE insurance_sequence 
  START WITH 1
  INCREMENT BY 1;

INSERT INTO insurance_claims VALUES (insurance_sequence.nextval,1,'16/12/2010','16/20/2010', 'credit card','the hood');
INSERT INTO insurance_claims VALUES (insurance_sequence.nextval,1,'20/02/2011','21/02/2011', 'credit card','the hood, again');
INSERT INTO insurance_claims VALUES (insurance_sequence.nextval,4,'14/02/2011','14/02/2011', 'credit card','blown wheel');
INSERT INTO insurance_claims VALUES (insurance_sequence.nextval,4,'14/03/2011','15/03/2011', 'credit card','blown wheel, coincidence or plain laziness to write?');
INSERT INTO insurance_claims VALUES (insurance_sequence.nextval,6,'10/10/2011','10/10/2011', 'credit card','leaving the car shop, the "amazing" driver crashed it... cursed luck');
INSERT INTO insurance_claims VALUES (insurance_sequence.nextval,15,'20/10/2011','20/10/2011', 'credit card','broken windshield');
INSERT INTO insurance_claims VALUES (insurance_sequence.nextval,15,'25/10/2011','25/10/2011', 'credit card','broken windshield, vandalism perhaps?');
INSERT INTO insurance_claims VALUES (insurance_sequence.nextval,10,'05/10/2011','05/10/2011', 'credit card','celebrating a year free of accidents the driver crashed and broke down the engine');
INSERT INTO insurance_claims VALUES (insurance_sequence.nextval,12,'13/10/2011','13/12/2011', 'credit card','little scratch that took months to notice');
INSERT INTO insurance_claims VALUES (insurance_sequence.nextval,13,'17/10/2011','18/10/2011', 'credit card','seat went out flying through the window');

--select * from insurance_claims;

---------------------------------
--adding data to service_details--
----------------------------------


CREATE SEQUENCE service_details_sequence
  START WITH 1
  INCREMENT BY 1;
  
INSERT INTO service_details_sequence VALUES (service_details_sequence.nextval,1, 'first check', 'checking the overall cables', sysdate, 'pending');
INSERT INTO service_details_sequence VALUES (service_details_sequence.nextval,3, 'routine', 'ran out of coolant', sysdate, 'pending'); 
INSERT INTO service_details_sequence VALUES (service_details_sequence.nextval,4, 'first check', 'cannot go out at night', sysdate, 'OK');
INSERT INTO service_details_sequence VALUES (service_details_sequence.nextval,10, 'overall check', 'broke lights', sysdate, 'needs repair');
INSERT INTO service_details_sequence VALUES (service_details_sequence.nextval,11, 'third check', 'flat tire', sysdate, 'pending');

--------------------------
--adding data to service--
---------------------------
  
  
INSERT INTO service_sequence VALUES (1, 2);
INSERT INTO service_sequence VALUES (2, 8);
INSERT INTO service_sequence VALUES (3, 13);
INSERT INTO service_sequence VALUES (4, 13);
INSERT INTO service_sequence VALUES (5, 16);
 
 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 


-------------------------------------------------
--Here starts the solution to the points 4 to 8--
-------------------------------------------------

/*Point 4. Create a view in which can be seen Registration_number, Mileage, Model, Current_value, class, Replacement_Value, Status, Required_special_qualification, Number_of_services, 
Total_money_spent_in_repair and should be only run by users associated to "finance_profile?"*/
CREATE OR REPLACE VIEW seeing_details AS
SELECT vehicles.registration_number,
       vehicles.mileage,
       vehicles.value_Ve,
       vehicles.model_Ve,
       type_of_vehicles.description, 
       vehicles.replacement_val,
       vehicles.status,
       vehicles.requires_qualification,
       COALESCE(aggregated_services.service_count, 0) as service_count,
       COALESCE(aggregated_costs.total_paid, 0) as total_paid
FROM vehicles JOIN type_of_vehicles on type_of_vehicles.id_type = vehicles.id_type

LEFT JOIN (select service_details.id_vehicles, 
      COUNT(service_details.id_service) AS service_count
      
FROM service_details GROUP BY service_details.id_vehicles) aggregated_services
ON aggregated_services.id_vehicles = vehicles.id_vehicle

LEFT JOIN (select repair_costs.id_vehicles, SUM(repair_cost) AS total_paid

FROM repair_costs GROUP BY repair_costs.id_vehicles) aggregated_costs

ON aggregated_costs.id_vehicles = vehicles.id_vehicle
WHERE vehicles.id_type IN (4, 5, 6, 7, 8) AND vehicles.bought_date >= sysdate - interval '2' year

ORDER BY vehicles.mileage DESC;

GRANT SELECT ON seeing_details TO second_user;




/*Point 5. Create a function to assign the name of a service, it should return a string.If a name already exists for the input code of vehicle on service_details then the returned string shall be null,
otherwise the string shall return a string that says 3000_service, 6000_service and 9000_service according to the mileage*/

CREATE OR REPLACE FUNCTION assign_name (vehicle_in IN integer)
RETURN varchar2 AS
   mileage_service VARCHAR2(20);
   mileageda number := 0;
   is_found number := 0;
BEGIN
--SELECT id_vehicles INTO is_found FROM service_details
  -- where id_vehicles = vehicle_in;
   
--if sql%found then 
	--mileage_service :='';
--else
		SELECT mileage INTO mileageda FROM vehicles where id_vehicle = vehicle_in;
    
		   if mileageda >= 0 AND mileageda <= 3000 then
			mileage_service := '3000_service';
		   else        
       if mileageda >3000 AND mileageda <=6000 then
			mileage_service := '6000_service';
		   else
			mileage_service := '9000_service';
end if;
end if; 
--end if;
   RETURN mileage_service;
END;


SELECT assign_name(2) FROM DUAL;

/*Point 6. Create a stored procedure which accepts the id of vehicle as argument, inside the procedure you should: Call the function to assign the name of the service, 
if the string is not empty, create a new service for that vehicle in status "Pending", current date, the name field should contain text "Mandatory 'X000_service', description: current mileage. 
If the string is empty do nothing.*/

CREATE OR REPLACE PROCEDURE REMOVE_LOCATION (vehicle_in IN number) AS
 name_service varchar(50);
 mileagenew int;
pointer_id number := service_details_sequence.nextval;
BEGIN
   name_service := assign_name(vehicle_in);
   SELECT mileage INTO mileagenew FROM vehicles where id_vehicle = vehicle_in;
     if name_service is not null then

         INSERT INTO service_details VALUES (pointer_id, vehicle_in,'Mandatory '||name_service, 'current mileage: '||mileagenew,SYSDATE,'pending');

INSERT INTO service VALUES (pointer_id, 1); 
INSERT INTO service VALUES (pointer_id, 2); 
INSERT INTO service VALUES (pointer_id, 3);
INSERT INTO service VALUES (pointer_id, 4); 
INSERT INTO service VALUES (pointer_id, 5); 
INSERT INTO service VALUES (pointer_id, 6); 
INSERT INTO service VALUES (pointer_id, 7); 
INSERT INTO service VALUES (pointer_id, 8); 
INSERT INTO service VALUES (pointer_id, 9); 
INSERT INTO service VALUES (pointer_id, 10); 
INSERT INTO service VALUES (pointer_id, 11); 
INSERT INTO service VALUES (pointer_id, 12); 
INSERT INTO service VALUES (pointer_id, 13); 
INSERT INTO service VALUES (pointer_id, 14); 
INSERT INTO service VALUES (pointer_id, 15); 
INSERT INTO service VALUES (pointer_id, 16); 
INSERT INTO service VALUES (pointer_id, 17);
INSERT INTO service VALUES (pointer_id, 18); 
INSERT INTO service VALUES (pointer_id, 19);

    end if;
END;


--Point 7. Create a trigger which once the mileage column is updated, calls the procedure that's just been created.

CREATE OR REPLACE TRIGGER update_mileage 
 AFTER UPDATE OF mileage ON vehicles 
 FOR EACH ROW
 
 BEGIN
      REMOVE_LOCATION(:new.id_vehicle);
 END;


/*Point 8. Create a stored procedure to decrease the current value of vehicles as follows: 
a. If the class of vehicle is Moped, Motorcycle and Trike motorcycle 2% of the current value. 
b. If the class of vehicle is Car, Light rigid heavy vehicle, Medium rigid heavy vehicle 3% of the current value. 
c. Otherwise 5% of the current value. 
d. Only "manager_profile?" is allowed to run the procedure and should print at the end "Number of vehicles updated successfully: xx*/

CREATE OR REPLACE PROCEDURE decrease_mileage AS
	counter_success number :=0;
BEGIN
	UPDATE vehicles SET mileage = (mileage*0.98) 
  WHERE id_type  IN (1, 2, 3);
	counter_success := sql%rowcount;

	UPDATE vehicles SET mileage = (mileage*0.97) 
  WHERE id_type  IN (4, 5, 6, 7);
	counter_success := counter_success + sql%rowcount;

	UPDATE vehicles SET mileage = (mileage*0.95) 
  WHERE id_type  IN (8, 9);
	counter_success := counter_success + sql%rowcount;

dbms_output.put_line('there were updated: ' || decrease_mileage || 'registers');

END;


BEGIN decrease_mileage ; END;

GRANT EXECUTE ON decrease_mileage TO first_user;
