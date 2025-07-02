# 📘 Diccionario de Datos – Plantilla General
**Tabla Cliente**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumCliente`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                        | -                                | Identificador del cliente               |
| `Nombre`        | VARCHAR      | 20   | ❌  | ❌  | ❌   | ❌     | -          | -                                | Nombre completo del cliente             |
| `Apellido1`          | NVARCHAR          | 20      | ❌  | ❌  | ❌   | ❌     | -         | -                                | Apellido del cliente                        |
| `Apellido2`        | VARCHAR      | 20    | ❌  | ❌  | ❌   |  ✅    | -                  | -                                | Apellido 2 del cliente                      |
| `curp`      | NCHAR          | -      | ❌  | ❌  |  ✅  | ❌     | -                                        | -               |-curp del cliente    |

**Tabla Sucursal**
| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumCliente`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                        | -                                | Identificador del cliente               |
| `Nombre`        | VARCHAR      | 20   | ❌  | ❌  | ❌   | ❌     | -          | -                                | Nombre completo del cliente             |
| `Apellido1`          | NVARCHAR          | 20      | ❌  | ❌  | ❌   | ❌     | -         | -                                | Apellido del cliente                        |
| `Apellido2`        | VARCHAR      | 20    | ❌  | ❌  | ❌   |  ✅    | -                  | -                                | Apellido 2 del cliente                      |
| `curp`      | NCHAR          | -      | ❌  | ❌  |  ✅  | ❌     | -                                        | -               |-curp del cliente    |

**Tabla Sucursal**
| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumCliente`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                        | -                                | Identificador del cliente               |
| `Nombre`        | VARCHAR      | 20   | ❌  | ❌  | ❌   | ❌     | -          | -                                | Nombre completo del cliente             |
| `Apellido1`          | NVARCHAR          | 20      | ❌  | ❌  | ❌   | ❌     | -         | -                                | Apellido del cliente                        |
| `Apellido2`        | VARCHAR      | 20    | ❌  | ❌  | ❌   |  ✅    | -                  | -                                | Apellido 2 del cliente                      |
| `curp`      | NCHAR          | -      | ❌  | ❌  |  ✅  | ❌     | -                                        | -               |-curp del cliente    |
