**Tabla Libro**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumLibro`      | INT          | -     | ✅  | ❌  | ❌   | ✅        | -                                       | -                                | Identificador del libro                |
| `Titulo`        | NVARCHAR     | 30    | ❌  | ❌  | ❌   | ❌        | -                                       | -                                | Titulo del libro                       |
| `Autor`         | NVARCHAR     | 20    | ❌  | ❌  | ❌   | ❌        | -                                       | -                                | Autor del libro                        | -
| `ISBN`          | NVARCHAR     | 20    | ❌  | ❌  | ❌   | ❌        | -                                       | -                                | ISBN del libro                         | -
| `Cantidad`      | INT          | -     | ❌  | ❌  | ❌   | ❌        | -                                       | -                                | Cantidad de libros                     | -


**Tabla Presta**


| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|---------------------------------|-----------------------------------------|
| `NumLibro`     | INT          | -      | ❌  | ✅  | ❌   | ✅         | -                                      | Libro(NumLibro)                      | Identificador del libro                  |
| `NumLector`     | INT         | -      | ❌  | ✅  | ❌   | ✅         | -                                      | Lector(NumLector)                     | Identificador del Doctor                 |


**Tabla Lector**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumLector`    | INT           | -     | ✅  | ❌  | ❌   | ✅          | -                                       | -                                | Identificador del Lector                 |
| `Nombre`        | NVARCHAR     | 30    | ❌  | ❌  | ❌   | ❌          | -                                       | -                                | Nombre completo del Lector               |
| `Apellido1`     | NVARCHAR     | 20    | ❌  | ❌  | ❌   | ❌          | -                                       | -                                | Apellido paterno del Lector              | -
| `Apellido2`     | NVARCHAR     | 20    | ❌  | ❌  | ❌   | ❌          | -                                       | -                                | Apellido materno del Lector              | -
| `NumMembresia`  | INT          | 20    | ❌  | ❌  | ❌   | ✅          | -                                       | -                                | Numero de membresia del lector           | -
