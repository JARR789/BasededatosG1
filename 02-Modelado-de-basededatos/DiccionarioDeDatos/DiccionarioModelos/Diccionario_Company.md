**Tabla Employee**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `EmployeeId`    | INT          | -     | ✅  | ❌  | ❌   | ✅        | -                                        | -                                | employee identifier             |
| `firstname`      | NVARCHAR     | 20  | ❌  | ❌  | ❌   | ❌        | -                                       | -                                | employee name           |
| `lastname`     | NVARCHAR     | 20    | ❌  | ❌  | ❌   | ❌        | -                                       | -                                | employee's last name           | -
| `ssn`     | NVARCHAR     | 20         | ❌  | ❌  | ❌   | ❌        | -                                       | -                                | Social Secutity Number           | -
| `salary`          |   MONEY        | -    | ❌  | ❌  | ❌   | ❌       | -                                       | -                                | employee's salary                | -
| `birthdate`      | DATE        | 12    | ❌  | ❌  | ❌   | ❌        | -                                       | -                                | employee's birthdate                   | -
| `address`      | NVARCHAR        | 200    | ❌  | ❌  | ❌   | ❌        | -                                       | -                                | employee's address                  | -
| `gender`      | NVARCHAR        | 20    | ❌  | ❌  | ❌   | ❌        | -                                       | -                                | employee's gender                  | -
| `DepartmentId`   | INT           | -     | ❌  | ✅  | ❌   | ❌          | -                                       | Department(DepartmentId)                                | the department that the client belongs 
| `Boss`             | INT           | -     | ❌  | ✅  | ❌   | ❌          | -                                       | Employee(EmployeeId)                              | the boss of the employees



**Tabla Dependent**


| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|---------------------------------|-----------------------------------------|
| `Name Dependent`   | INT         | -      | ✅  | ❌  | ❌   | ✅         | -                                      | -                               | dependent's name             |
| `EmployeeId`       | INT         | -      | ✅  | ✅  | ❌   | ✅         | -                                      | Employee(EmployeeId)            | employee identifier  
| `gender`           | NVARCHAR    | 20     | ❌  | ❌  | ❌   | ❌         | -                                      | -                               | dependent's gender               |
| `relationship`     | NVARCHAR    | 20     | ❌  | ❌  | ❌   | ❌         | -                                      | -                               | relationship between the  dependent and the employee                     |

**Tabla Department**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `DepartmentId`  | INT           | -     | ✅  | ❌  | ❌   | ✅          | -                                       | -                                | department's identifier                 |
| `nameDepartment`| NVARCHAR      | 20     | ❌  | ❌  | ❌   | ✅          | -                                       | -                                | department's name                       |
| `numDepartment` | NVARCHAR       | 15    | ❌  | ❌  | ❌   | ❌          | -                                       | -                                |department's number                          | -
| `startdate`       | DATE       | -     | ❌  | ❌  | ❌   | ❌          | -                                       | -                                | department's startdate                          | -
| `Manager`         | NVARCHAR     | 20    | ❌  | ❌  | ❌   | ❌          | -                                       | -                                | department's Manager                       | -

**Tabla Project**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `ProjectId`  | INT           | -     | ✅  | ❌  | ❌   | ✅          | -                                       | -                                | Project identifier                 |
| `nameproject`| NVARCHAR      | 20     | ❌  | ❌  | ❌   | ✅          | -                                       | -                                | Project name                       |
| `numproject ` | INT       | -    | ❌  | ❌  | ❌   | ❌          | -                                       | -                                |Project number                          | -
| `location`       | NVARCHAR       | 100     | ❌  | ❌  | ❌   | ❌          | -                                       | -                                | Project location                          | -
| `DepartmentId`         | INT     | -    | ❌  | ✅  | ❌   | ❌          | -                                       | Department(DepartmentId)                                | department to which the project belongs | -
