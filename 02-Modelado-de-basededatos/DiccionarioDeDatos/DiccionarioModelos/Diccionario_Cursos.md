**Tabla Estudiante**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumEstudiante` | INT          | -     | ✅  | ❌  | ❌   | ✅        | -                                       | -                                | Identificador del estudiante             |
| `Nombre`        | NVARCHAR     | 30    | ❌  | ❌  | ❌   | ❌        | -                                       | -                                | Nombre del estudiante           |
| `Apellido1`     | NVARCHAR     | 20    | ❌  | ❌  | ❌   | ❌        | -                                       | -                                | Apellido paterno del estudiante          | -
| `Apellido2`     | NVARCHAR     | 20    | ❌  | ❌  | ❌   | ❌        | -                                       | -                                | Apellido materno del estudiante          | -
| `Matricula`     | NVARCHAR     | 20    | ❌  | ❌  | ❌   | ✅        | -                                       | -                                | Matricula del estudiante               | -


**Tabla Insacripcion**


| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|---------------------------------|-----------------------------------------|
| `NumEstudiante` | INT         | -      | ❌  | ✅  | ❌   | ✅         | -                                      | Estudiante(NumEstudiante)                 | Identificador del estudiante             |
| `NumCurso`      | INT         | -      | ❌  | ✅  | ❌   | ✅         | -                                      | Curso(NumCurso)                      | Identificador del curso       |
|`FechaInscripcion`| DATE       | -      | ❌  | ❌  | ❌   | ❌         | -                                      | -                               | Fecha de la inscripcion                  |


**Tabla Curso**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumCurso`      | INT          | -     | ✅  | ❌  | ❌   | ✅          | -                                     | -                                | Identificador del Curso                 |
| `NombreCurso`   | NVARCHAR     | 30    | ❌  | ❌  | ❌   | ❌          | -                                       | -                                | Nombre del curso                        |
| `CodigoCurso`   | NVARCHAR     | 20    | ❌  | ❌  | ❌   | ❌          | -                                       | -                                | Codigo del curso              | -
