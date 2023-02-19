create database ADB_Examen1

use ADB_Examen1

create table Direccion(
idDireccion int PRIMARY KEY IDENTITY(1,1)NOT NULL,
colonia varchar(100) NOT NULL,
calle int NOT NULL,
numeroLocalCasa int NOT NULL,
bloque int NOT NULL)

create table Telefonos(
idTelefono int PRIMARY KEY IDENTITY(1,1) NOT NULL,
numeroTelefono int NOT NULL)

Create table Proveedores(
idProveedor int PRIMARY KEY IDENTITY(1,1) NOT NULL,
nombre varchar(50) NOT NULL,
idDireccion int NOT NULL constraint fk_Proveedor_Direccion foreign key(idDireccion) references Direccion(idDireccion)
)

create table Clientes(
idClientes int PRIMARY KEY IDENTITY(1,1) NOT NULL,
primerNombre varchar(30) NOT NULL,
primerApellido varchar(30) NOT NULL,
segundoApellido varchar(30) NOT NULL,
genero varchar (1) NOT NULL,
numeroIdentidad int NOT NULL,
idTelefono int NOT NULL constraint fk_Clientes_telefono foreign key(idTelefono) references Telefonos(idTelefono),
correoElectronico varchar(100) NOT NULL,
idDireccion int NOT NULL constraint fk_Clientes_Direccion foreign key(idDireccion) references Direccion(idDireccion),
credito bit NOT NULL)

create table Empleados(
idEmpleados int PRIMARY KEY IDENTITY(1,1) NOT NULL,
nombre varchar (50) NOT NULL,
edad int NOT NULL,
idTelefono int NOT NULL constraint fk_Empleado_telefono foreign key(idTelefono) references Telefonos(idTelefono)
)

create table Categorias(
idCategoria int PRIMARY KEY IDENTITY(1,1) NOT NULL,
nombreCategoria varchar(50) NOT NULL
)

create table Productos(
idProductos int PRIMARY KEY IDENTITY (1,1) NOT NULL,
nombreProducto varchar(50) NOT NULL,
idCategoria int constraint fk_Productos_Categorias foreign key(idCategoria) references Categorias(idCategoria),
fechaPrimeraCompra date,
precio int,
aumento bit,
promedioVentaSemanal int
)

create table Inventario(
idInventario int PRIMARY KEY NOT NULL IDENTITY(1,1),
idProducto int constraint fk_Inventario_Producto foreign key(idProducto) references Productos(idProductos),
cantidadProducto int)

create table pagosCredito(
idPagosCreditos int PRIMARY KEY IDENTITY(1,1) NOT NULL,
idClientes int constraint fk_Pagos_Clientes foreign key(idClientes) references Clientes(idClientes),
cantidad int,
porPagar float,
fecha date
)

create table Ordenes(
idOrdenes int PRIMARY KEY IDENTITY(1,1) NOT NULL,
idProveedor int constraint fk_Ordenes_Proveedores foreign key(idProveedor) references Proveedores(idProveedor),
nombreRepresentante varchar(100) NOT NULL,
idEmpleado int constraint fk_Ordenes_Empleado foreign key(idEmpleado) references Empleados(idEmpleados) NOT NULL,
idProducto int constraint fk_Ordenes_Productos foreign key(idProducto) references Productos(idProductos),
cantidad int,
totalAPagar float,
continuacion bit,
nuevo bit,
pagoInsitu bit,
fecha date
)