**Tabla Paciente**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumPaciente`   | INT          | -     | ✅  | ❌  | ❌   | ✅        | -                                       | -                                | Identificador del paciente             |
| `Nombre`        | NVARCHAR     | 30    | ❌  | ❌  | ❌   | ❌        | -                                       | -                                | Nombre completo del paciente           |
| `Apellido1`     | NVARCHAR     | 20    | ❌  | ❌  | ❌   | ❌        | -                                       | -                                | Apellido paterno del paciente          | -
| `Apellido2`     | NVARCHAR     | 20    | ❌  | ❌  | ❌   | ❌        | -                                       | -                                | Apellido materno del paciente          | -

**Tabla Consulta**


| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|---------------------------------|-----------------------------------------|
| `NumPaciente`   | INT         | -      | ❌  | ✅  | ❌   | ✅         | -                                      | Paciente(NumPaciente)                   | Identificador del paciente               |
| `NumDoctor`     | INT         | -      | ❌  | ✅  | ❌   | ✅         | -                                      | Doctor(NumDoctor)                               | Identificador del Doctor       |
| `FechaConsulta` | DATE        | 20     | ❌  | ❌  | ❌   | ❌         | -                                      | -                               | Fecha de la consulta                     |
| `Atencion`      | NVARCHAR    | 100    | ❌  | ❌  | ❌   | ❌         | -                                      | -                               | Atencion medica de la consulta           |


**Tabla Doctores**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumDoctor`    | INT           | -     | ✅  | ❌  | ❌   | ✅          | -                                     | -                                | Identificador del Doctor                 |
| `Nombre`        | NVARCHAR     | 30    | ❌  | ❌  | ❌   | ❌          | -                                       | -                                | Nombre completo del Doctor               |
| `Apellido1`     | NVARCHAR     | 20    | ❌  | ❌  | ❌   | ❌          | -                                       | -                                | Apellido paterno del Doctor              | -
| `Apellido2`     | NVARCHAR     | 20    | ❌  | ❌  | ❌   | ❌          | -                                       | -                                | Apellido materno del Doctor              | -
