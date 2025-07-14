-- Crear la base de datos
CREATE DATABASE ClinicaMedica;
GO

USE ClinicaMedica;
GO

-- Tabla PROVINCIA (precargada)
CREATE TABLE Provincia (
    IdProvincia INT PRIMARY KEY IDENTITY(1,1),
    NombreProvincia VARCHAR(100) NOT NULL
);

-- Tabla LOCALIDAD (precargada)
CREATE TABLE Localidad (
    IdLocalidad INT PRIMARY KEY IDENTITY(1,1),
    NombreLocalidad VARCHAR(100) NOT NULL,
    IdProvincia INT NOT NULL,
    FOREIGN KEY (IdProvincia) REFERENCES Provincia(IdProvincia)
);

-- Tabla ESPECIALIDAD (precargada)
CREATE TABLE Especialidad (
    IdEspecialidad INT PRIMARY KEY IDENTITY(1,1),
    NombreEspecialidad VARCHAR(100) NOT NULL
);

-- Tabla USUARIO (para login de médicos y admin)
CREATE TABLE Usuario (
    IdUsuario INT PRIMARY KEY IDENTITY(1,1),
    NombreUsuario VARCHAR(100) NOT NULL,
    Contraseña VARCHAR(100) NOT NULL,
    TipoUsuario VARCHAR(20) NOT NULL CHECK (TipoUsuario IN ('Admin', 'Medico'))
);

-- Tabla MÉDICO (con columna Activo)
CREATE TABLE Medico (
    IdMedico INT PRIMARY KEY IDENTITY(1,1),
    Legajo VARCHAR(20) NOT NULL,
    DNI VARCHAR(20) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Sexo VARCHAR(20) NOT NULL,
    Nacionalidad VARCHAR(50) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Direccion VARCHAR(200),
    CorreoElectronico VARCHAR(100),
    Telefono VARCHAR(20),
    DiasAtencion VARCHAR(50),
    HorarioAtencion VARCHAR(50),
    IdUsuario INT,
    IdLocalidad INT,
    IdProvincia INT,
    IdEspecialidad INT NOT NULL,
    Activo BIT NOT NULL DEFAULT 1,
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario),
    FOREIGN KEY (IdLocalidad) REFERENCES Localidad(IdLocalidad),
    FOREIGN KEY (IdProvincia) REFERENCES Provincia(IdProvincia),
    FOREIGN KEY (IdEspecialidad) REFERENCES Especialidad(IdEspecialidad)
);

-- Tabla PACIENTE (con columna Activo)
CREATE TABLE Paciente (
    IdPaciente INT PRIMARY KEY IDENTITY(1,1),
    DNI VARCHAR(20) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Sexo VARCHAR(20) NOT NULL,
    Nacionalidad VARCHAR(50) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Direccion VARCHAR(200),
    CorreoElectronico VARCHAR(100),
    Telefono VARCHAR(20),
    IdLocalidad INT,
    IdProvincia INT,
    Activo BIT NOT NULL DEFAULT 1,
    FOREIGN KEY (IdLocalidad) REFERENCES Localidad(IdLocalidad),
    FOREIGN KEY (IdProvincia) REFERENCES Provincia(IdProvincia)
);

-- Tabla TURNO
CREATE TABLE Turno (
    IdTurno INT PRIMARY KEY IDENTITY(1,1),
    Fecha DATE NOT NULL,
    Hora TIME NOT NULL,
    Estado VARCHAR(20) CHECK (Estado IN ('Presente', 'Ausente')),
    ObservacionConsulta VARCHAR(500),
    IdMedico INT NOT NULL,
    IdPaciente INT NOT NULL,
    FOREIGN KEY (IdMedico) REFERENCES Medico(IdMedico),
    FOREIGN KEY (IdPaciente) REFERENCES Paciente(IdPaciente),
    CONSTRAINT UC_Turno UNIQUE (IdMedico, Fecha, Hora)
);

-- ========================
-- DATOS PRECARGADOS
-- ========================

-- Provincias
INSERT INTO Provincia (NombreProvincia) VALUES 
('Buenos Aires'),
('Córdoba'),
('Santa Fe'),
('Mendoza'),
('Tucumán');

-- Localidades
INSERT INTO Localidad (NombreLocalidad, IdProvincia) VALUES 
('La Plata', 1),
('Mar del Plata', 1),
('Córdoba Capital', 2),
('Rosario', 3),
('Godoy Cruz', 4),
('San Miguel de Tucumán', 5);

-- Especialidades
INSERT INTO Especialidad (NombreEspecialidad) VALUES 
('Cardiología'),
('Pediatría'),
('Traumatología'),
('Dermatología'),
('Neurología');

-- Usuarios
INSERT INTO Usuario (NombreUsuario, Contraseña, TipoUsuario) VALUES 
('admin1', 'admin123', 'Admin'),
('medico1', 'medico123', 'Medico');
