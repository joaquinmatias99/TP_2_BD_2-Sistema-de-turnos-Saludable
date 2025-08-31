USE Saludable;

INSERT INTO Estado (nombre) VALUES
('Activo'),
('Inactivo'),
('Reservado'),
('Confirmado'),
('Cancelado');

INSERT INTO Dia (nombre) VALUES
('Lunes'),
('Martes'),
('Miércoles'),
('Jueves'),
('Viernes'),
('Sábado'),
('Domingo');

INSERT INTO Especialidad (nombre) VALUES
('Radiologia'),
('Cardiologia'),
('Dermatologia');

INSERT INTO Obra_Social (nombre) VALUES
('OSDE'),
('Swiss Medical'),
('Medife'),
('PAMI');


INSERT INTO Horario (hora_inicio, hora_fin, id_dia) VALUES
('08:00:00', '12:00:00', 1), -- Lunes
('14:00:00', '18:00:00', 2), -- Martes
('10:00:00', '14:00:00', 3), -- Miercoles
('09:00:00', '13:00:00', 4); -- Jueves

INSERT INTO Medico (nombre, apellido, dni, telefono, email, id_especialidad, id_estado) VALUES
('Carlos', 'López', '34567890', '1156789012', 'carlos.lopez@saludable.com', 1, 1),
('Ana', 'Rodríguez', '45678901', '1143210987', 'ana.rodriguez@saludable.com', 2, 1),
('Laura', 'García', '56789012', '1190123456', 'laura.garcia@saludable.com', 3, 1);

INSERT INTO Paciente (nombre, apellido, email, dni, telefono, id_obra_social) VALUES
('Juan', 'Pérez', 'juan.perez@email.com', '12345678', '1123456789', 1),
('María', 'Gómez', 'maria.gomez@email.com', '23456789', '1198765432', 2),
('Sofía', 'Fernández', 'sofia.f@email.com', '34567890', '1122334455', 3);

INSERT INTO Servicio (nombre, id_especialidad) VALUES
('Servicio de Radiología', 1),
('Servicio de Cardiología', 2),
('Servicio de Dermatología', 3);

INSERT INTO Equipo (nombre, id_servicio) VALUES
('Tomógrafo', 1),
('Equipo de Rayos X', 1),
('Electrocardiógrafo', 2);

INSERT INTO Practica (nombre, precio, id_servicio) VALUES
('Radiografía de Tórax', 5000.00, 1),
('Tomografía', 12000.00, 1),
('Electrocardiograma', 8000.00, 2),
('Consulta Dermatológica', 6500.00, 3);

-- Inserción en Tablas Intermedias

INSERT INTO Medico_Servicio (id_medico, id_servicio) VALUES
(1, 1), -- Dr. López trabaja en Servicio de Radiología
(2, 2), -- Dra. Rodríguez trabaja en Servicio de Cardiología
(3, 3), -- Dra. García trabaja en Servicio de Dermatología
(1, 2); -- Dr. López también puede trabajar en Servicio de Cardiología

INSERT INTO Servicio_Obra_Social (id_servicio, id_obra_social) VALUES
(1, 1), -- El servicio de Radiología es cubierto por OSDE
(1, 2), -- y por Swiss Medical
(2, 2), -- El servicio de Cardiología es cubierto por Swiss Medical
(2, 3), -- y por Medife
(3, 1); -- El servicio de Dermatología es cubierto por OSDE

INSERT INTO Medico_Horario_Dia (id_medico, id_horario, id_dia) VALUES
(1, 1, 1), -- Dr. López disponible Lunes de 8am-12pm
(1, 2, 1), -- Dr. López disponible Lunes de 2pm-6pm (aunque sea la misma hora, es otro horario)
(2, 3, 3), -- Dra. Rodríguez disponible Miércoles de 10am-2pm
(3, 4, 4); -- Dra. García disponible Jueves de 9am-1pm


-- Tabla principal

INSERT INTO Turno (fecha, id_horario, id_medico, id_estado, id_paciente, id_practica) VALUES
('2025-09-01', 1, 1, 3, 1, 1), -- Turno para Juan Pérez con Dr. López, Radiografía de Tórax, Lunes 8am
('2025-09-03', 3, 2, 4, 2, 3), -- Turno para María Gómez con Dra. Rodríguez, Electrocardiograma, Miércoles 10am
('2025-09-04', 4, 3, 3, 3, 4); -- Turno para Sofía Fernández con Dra. García, Consulta Dermatológica, Jueves 9am