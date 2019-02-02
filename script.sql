connect system/oracle1;

drop user admin_vehiculos cascade;
drop user adm_vehiculos cascade;
drop user ad_vehiculos cascade;

drop tablespace Vehiculos
including contents and datafiles;

create tablespace Vehiculos datafile 'bdVehiculos.dbf' 
size 30 M autoextend on;

create user admin_vehiculos 
identified by adminvehiculos 
default tablespace Vehiculos;


create user adm_vehiculos 
identified by admvehiculos;


create user ad_vehiculos 
identified by advehiculos;

grant connect to admin_vehiculos; 
grant resource to admin_vehiculos;

connect admin_vehiculos/adminvehiculos;

CREATE TABLE Cliente
(
IdCliente number NOT NULL PRIMARY KEY, 
Nombres varchar(40) NOT NULL,
Ciudad varchar(15) NOT NULL, 
Edad number NULL, 
Sexo varchar(15) NOT NULL , 
Email varchar(40) NULL
);


---------------------------


------------------------

CREATE TABLE Vehiculo
(
 IdVehiculo number NOT NULL PRIMARY KEY, 
 Placa varchar(8) NOT NULL,
 Cilindraje number NOT NULL, 
 Precio number NOT NULL, 
 Color varchar(15) NULL
);



CREATE TABLE Agencia
(
 IdAgencia number NOT NULL PRIMARY KEY, 
 Nombre varchar(40) NOT NULL,
 Region varchar(25) NOT NULL, 
 Ciudad varchar(25) NOT NULL
);



CREATE TABLE Fabricacion
(
 IdFabricacion number NOT NULL PRIMARY KEY, 
 IdVehiculo number NOT NULL,
 AnioFabricacion number NOT NULL, 
 Pais varchar(25) NOT NULL,
 Marca varchar(25) NOT NULL,
 constraint FK_Vehiculo_Fabricacion foreign key(IdVehiculo) references Vehiculo(IdVehiculo) 
);



CREATE TABLE Reserva
(
 IdReserva number NOT NULL PRIMARY KEY, 
 Fecha_Inicio date NOT NULL,
 Fecha_Final date NOT NULL, 
 IdCliente number NOT NULL, 
 IdAgencia number NOT NULL, 
 IdVehiculo number NOT NULL, 
 Costo number NOT NULL,
 constraint FK_Cliente_Reserva foreign key(IdCliente) references Cliente(IdCliente),
 constraint FK_Agencia_Reserva foreign key(IdAgencia) references Agencia(IdAgencia),
 constraint FK_Vehiculo_Reserva foreign key(IdVehiculo) references Vehiculo(IdVehiculo)
);


insert into Cliente values(001,'Marcos
Morante','Quevedo',20,'Masculino','mpiedrac@gmail.com');

insert into Cliente values(002,'Andrea
Mazacon','Guayaquil',10,'Femenino','mandrea@gmail.com');

insert into Cliente values(003,'Alexandra
Duarte','Quevedo',30,'Femenino','alexa123@gmail.com');

insert into Cliente values(004,'Carlos
Cabezas','Ambato',34,'Masculino','carloscabezas@gmail.com');

insert into Cliente values(005,'Mariano
Aguire','Cuenca',25,'Masculino','mariano1988@gmail.com');

insert into Cliente values(006,'Guissela
Suarez','Manabi',18,'Femenino','guisselasuarez@gmail.com'); 
insert into Cliente values(007,'Gabriela
Garcia','Esmeraldas',24,'Femenino','mpiedrac@gmail.com');

insert into Cliente values(008,'Mauricio
Marquez','Manta',40,'Masculino','mauricio133@gmail.com');

insert into Cliente values(009,'Monica
Contreras','Palenque',21,'Femenino','monica830@gmail.com');

insert into Cliente values(010,'Pedro
Almeida','Jujan',34,'Masculino','pedro1324@gmail.com');

--Registros de la Tabla Vehículo

insert into Vehiculo values(001,'0111',19771,10.000,'Celeste'); 
insert into Vehiculo values(002,'0112',19992,12.000,'Fucsia'); 
insert into Vehiculo values(003,'0113',19983,13.000,'Amarillo'); 
insert into Vehiculo values(004,'0114',20014,14.000,'Morado'); 
insert into Vehiculo values(005,'0115',19755,15.000,'Plomo'); 
insert into Vehiculo values(006,'0116',19796,11.000,'Azul'); 
insert into Vehiculo values(007,'0117',19807,18.000,'Rojo'); 
insert into Vehiculo values(008,'0118',19888,20.000,'Blanco'); 
insert into Vehiculo values(009,'0119',19879,30.000,'Negro'); 
insert into Vehiculo values(010,'0110',199610,25.000,'Verde'); 

-- Registros de la tabla Agencia
insert into Agencia values(001,'MotorSport','Costa','Esmeraldas'); 
insert into Agencia values(002,'General Motors','Costa','Guayaquil'); 
insert into Agencia values(003,'Daimler','Sierra','Quito');
insert into Agencia values(004,'Nissan Motor','Sierra','Cuenca'); 
insert into Agencia values(005,'SAIC Motors','oriente','Pastaza'); 
insert into Agencia values(006,'Renault','Oriente','Napo');
insert into Agencia values(007,'Super Autos','Oriente','Orellana'); 
insert into Agencia values(008,'Autos Max','Costa','Manabi'); 
insert into Agencia values(009,'Autos Rojas','Sierra','Cañar'); 
insert into Agencia values(010,'Autos Bambu','Oriente','Morona'); 

-- Registros de la tabla Fabricación

insert into Fabricacion values(001,001,'2015','Ecuador','Nissan'); 
insert into Fabricacion values(002,002,'2015','Mexico','Chevrolet'); 
insert into Fabricacion values(003,003,'2015','El Salvador','BMW'); 
insert into Fabricacion values(004,004,'2015','Brasil','Mercedes'); 
insert into Fabricacion values(005,005,'2015','Portugal','Isuzu'); 
insert into Fabricacion values(006,006,'2015','Brasil','Kia');
insert into Fabricacion values(007,007,'2015','Colombia','Mazda'); 
insert into Fabricacion values(008,008,'2015','Chile','Toyota'); 
insert into Fabricacion values(009,009,'2015','Canada','Scoda');
insert into Fabricacion values(010,010,'2015','Alemania','Wolfswagen');



--Registros de la tabla Reserva

insert into Reserva values(001,'02/01/2015','05/01/2015',001,001,001,20); 
insert into Reserva values(002,'08/01/2015','11/01/2015',002,002,002,10); 
insert into Reserva values(003,'15/05/2015','20/05/2015',003,003,003,15); 
insert into Reserva values(004,'18/06/2015','22/06/2015',004,004,004,5); 
insert into Reserva values(005,'20/07/2015','24/07/2015',005,005,005,30); 
insert into Reserva values(006,'25/08/2015','30/08/2015',006,006,006,5); 
insert into Reserva values(007,'04/09/2015','08/09/2015',007,007,007,51); 
insert into Reserva values(008,'10/10/2015','25/10/2015',008,008,008,55); 
insert into Reserva values(009,'18/11/2015','27/11/2015',009,009,009,50); 
insert into Reserva values(010,'20/12/2015','31/12/2015',010,010,010,47); 




Set serveroutput on

Create or replace procedure crear_cliente( 
 jt_oracle_n in varchar2,
 dc_oracle_cd in VARCHAR2,
 vm_oracle_ed in number,
 cp_oracle_sexo in VARCHAR2, 
 jt_oracle_email in VARCHAR2)
is
 cp_oracle_id number; 
 Begin 
 select max(idcliente)+1 into cp_oracle_id 
 from cliente; 
  if cp_oracle_id is null then   
   cp_oracle_id:=1;
  end if;
  Insert INTO cliente 
  values(cp_oracle_id,jt_oracle_n,dc_oracle_cd, vm_oracle_ed,cp_oracle_sexo, jt_oracle_email);
END;
/
show errors procedure crear_cliente;

------------------------------------

Create or replace procedure crear_agencia( 
 jt_oracle_n in varchar2,
 dc_oracle_rg in VARCHAR2,
 vm_oracle_cd in VARCHAR2)
is
 cp_oracle_id number; 
 Begin  
  select max(idagencia)+1 into cp_oracle_id 
  from agencia;
  if cp_oracle_id is null then   
   cp_oracle_id:=1;
  end if;  
   Insert INTO agencia 
   values(cp_oracle_id,jt_oracle_n,dc_oracle_rg,vm_oracle_cd);  
END;
/




-----------------------------------------

Create or replace procedure crear_vehiculo(  
 jt_oracle_pl in varchar,
 dc_oracle_cl in number,
 vm_oracle_p in number,
 cp_oracle_cr in VARCHAR2)
is
 cp_oracle_id number; 
 Begin  
 select max(IdVehiculo)+1 into cp_oracle_id 
 from vehiculo;
 if cp_oracle_id is null then   
   cp_oracle_id:=1;
 end if;
  Insert INTO vehiculo 
  values(cp_oracle_id,jt_oracle_pl,dc_oracle_cl,vm_oracle_p,cp_oracle_cr); 
END;
/

-------------------------------------------
create or replace procedure ver_reservas(dc_oracle_placa vehiculo.placa%type,dc_oracle_cursor out sys_refcursor)
is
begin
  open dc_oracle_cursor for select  v.Placa,  c.Nombres,r.costo, c.sexo, r.Fecha_Inicio, r.Fecha_Final
  from reserva r inner join vehiculo v on v.idvehiculo=r.idvehiculo
  inner join cliente c on c.idcliente=r.idcliente
  where v.placa like dc_oracle_placa||'%';
end;
/

show errors procedure ver_reservas;
-------------------------------------------


SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE 
ConsultaVehiculos(cp_oracle_Color vehiculo.color%Type)
IS
 pTotal number; 
BEGIN
 Select distinct count(f.idfabricacion) INTO pTotal From fabricacion f
 INNER JOIN vehiculo v ON f.Idvehiculo = v.Idvehiculo 
 Where upper(v.color) = upper(cp_oracle_Color);
 dbms_output.put_line('Total Vehiculos: '||to_char(pTotal)); 
END;
/


-------------------------------------------

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE ConsultaPlacaVehiculo(dc_oracle_placa vehiculo.placa%Type)
IS
 datos VARCHAR2(50); 
BEGIN
 Select pais INTO datos From fabricacion f
 INNER JOIN vehiculo v ON f.Idvehiculo = v.Idvehiculo 
 Where upper(v.placa) = upper(dc_oracle_placa); 
 dbms_output.put_line('el pais de fabricacion del vehiculo es: ' || datos); 
END; 
/
-------------------------------

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE ConsultaIncrementoPrecio(jt_oracle_agencia agencia.nombre%Type)
 IS 
BEGIN
 Update Reserva r Set r.costo = r.costo + (r.costo * 0.12)
 Where r.idagencia = (Select idagencia From agencia Where upper(NOMBRE) = upper(jt_oracle_agencia)); 
END;
/

---------------------------

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE ClienteMayorEdad(cp_oracle_ciudad cliente.ciudad %Type)
IS
 valor number; 
BEGIN
 Select distinct count(cliente.idcliente) INTO valor  From cliente 
 Where cliente.edad = any (select edad from cliente where cliente.edad>=18 and upper(cliente.ciudad)=upper(cp_oracle_ciudad));
dbms_output.put_line('el total de clientes es: ' || to_char(valor) || ' de la ciudad de: ' ||
cp_oracle_ciudad ); 
END;
/

------------------------------------------------------------------

Create or replace function costoVehiculo (dc_oracle_valor vehiculo.precio%type)
return VARCHAR2
Is
 valorret varchar2(30); 
Begin
 valorret:= '';
If dc_oracle_valor <=9000 then valorret:= ' vehiculoeconomico'; 
 else valorret:= ' vehiculocostoso'; 
 end if;
 return valorret;
end;
/


----------------------------------------------------------

create or replace function incrementoIvaReserva(dc_oracle_costo reserva.costo%type)
 return number 
is
begin
  return dc_oracle_costo + (dc_oracle_costo * 0.12);
end;
/

----------------------------------------------

create or replace function nombrecliente(cp_oracle_id cliente.idcliente%TYPE)
return VARCHAR2 is
ret varchar2 (50);
begin
 select nombres into ret from cliente
  where idcliente = cp_oracle_id;
 return ret;
end nombrecliente;
/

-----------------------------------



create table auditoria( 
 usuario VARCHAR(20), 
 fecha timestamp default sysdate,
 v_viejo number, 
 v_nuevo number
);

-----------------------------------


create or replace trigger actualizar_registros_reserva 
 after update  on Reserva for each row begin
if updating then
 insert into auditoria values(user,default,:old.costo,:new.costo);
end if;
end; 
/


show errors trigger actualizar_registros_reserva;

create or replace procedure ver_auditoria(dc_oracle_cursor out sys_refcursor)
is
begin
  open dc_oracle_cursor for select *
  from auditoria;
end;
/
show errors procedure ver_auditoria;
