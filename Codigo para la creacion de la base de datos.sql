--creamos la base de datos, ejecutamos por secciones

create database db_ventas
go

--comando 2...
use db_ventas
go
--usamos un usuario especifico... security> login
--usuario sa>properties>PW=1234> elegimos base de datos
--db_ventas..
-- nos conectamos con sql authentucacion "connect"
-- configurar propiedades y security de laptop....

create table clientes(

idcliente varchar(10) primary key,
nombre varchar(20),
apellidos varchar(20),
dni varchar(8),
ruc varchar(11),
edad int,
sexo char(1),
telefono char(9),
direccion varchar(90)
)
go

---creamos proveedores
create table proveedor(
idproveedor varchar(10) primary key,
razon varchar(30),
ruc varchar(11),
telefono char(9),
direccion varchar(50)
)
go
----categoria
create table categoria(
idcategoria int identity primary key,
descripcion varchar(15)

)
go
----
create table productos(
idproducto varchar(10) primary key,
serie varchar(30),
nombre varchar(30),
f_ingreso date,
f_vencimiento date,
prec_compra decimal(9,2),
prec_venta decimal(9,2),
cantidad int,
idcategoria int references categoria(idcategoria) -- haciendo uso de llaves

)
go

-----
create table empleados(
idempleado varchar(5) primary key,
nombre varchar(20),
apellidos varchar(20),
dni varchar(8),
telefono varchar(9),
direccion varchar(30),
)
go

create table usuarios(
idusuario int identity primary key,
idempleado varchar(5) references empleados(idempleado),
usuario varchar(20),
passW varchar(20), ---deberia ser privado?
acceso varchar(20),
estado char(2)
)
go

----
create table compras(
idcompra int identity primary key,
fecha date,
hora varchar(10),
num_documento varchar(7),
tipo_documento varchar(7),
subtotal decimal(8,2),
igv decimal(8,2),
total decimal(8,2),
estado varchar(20),
idusuario int references usuarios (idusuario),
idproveedor varchar(10) references proveedor (idproveedor)
)
go

create table detalle_compras(
iddetallecompras int identity primary key,
idcompra int references compras(idcompra),
idproducto varchar(10) references productos(idproducto),
cantidad int,
precio decimal(8,2),
total decimal(8,2),
)
go

create table ventas(
idventas int identity primary key,
fecha date,
hora varchar(10),
serie varchar(7),
no_doc varchar(7),
tipo_doc varchar(7),
subtotal decimal(8,2),
iva decimal(8,2),
total decimal(8,2),
estado varchar(20),
idusuario int references usuarios(idusuario),
idcliente varchar(10) references clientes(idcliente),
)
go

create table detalle_ventas(
iddetalleventas int identity primary key,
idventa int references ventas (idventas),
idproducto varchar(10) references productos(idproducto),
cantidad int,
precio decimal(8,2),
total decimal(8,2)
)
go