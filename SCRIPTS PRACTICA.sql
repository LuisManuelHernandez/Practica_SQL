--EJERCICIO 2 CREACION DE LAS TABLAS ENTIDAD RELACION KEEPCODING

--Tabla de generos
CREATE TABLE genders (
gender_id SERIAL PRIMARY KEY,
gender VARCHAR(10)
);

--Tabla de paises
CREATE TABLE countries (
country_id SERIAL PRIMARY KEY,
country VARCHAR(20)
);

--Tabla de ciudades
CREATE TABLE cities (
city_id SERIAL PRIMARY KEY,
city VARCHAR(20)
);

--Tabla de bootcamps
CREATE TABLE bootcamps (
bootcamp_id SERIAL PRIMARY KEY,
bootcamp VARCHAR(30)
);

--Tabla de profesores
CREATE TABLE teachers (
teacher_id SERIAL PRIMARY KEY,
name VARCHAR(30),
surname VARCHAR(30),
gender_id INT,
country_id INT,
city_id INT,
email VARCHAR(30),
phone VARCHAR(20),
FOREIGN KEY(gender_id) REFERENCES
	genders(gender_id),
FOREIGN KEY (country_id) REFERENCES
	countries(country_id),
FOREIGN KEY (city_id) REFERENCES
	cities(city_id)
);

--Tabla de cursos
CREATE TABLE courses (
course_id SERIAL PRIMARY KEY,
course VARCHAR(30),
teacher_id INT,
FOREIGN KEY(teacher_id) REFERENCES
	teachers(teacher_id)
);

--Tabla de opciones para estudiantes aprobados o desaprobados
CREATE TABLE approved (
approved_id SERIAL PRIMARY KEY,
is_approved BOOLEAN
);

--Tabla de registro de pagos de estudiantes
CREATE TABLE student_payments (
student_payment_id SERIAL PRIMARY KEY,
student_payment_type VARCHAR(30)
);

--Tabla de opciones si se captó o no un cliente para Keepcoding
CREATE TABLE client_acquisition (
is_acquired_id SERIAL PRIMARY KEY,
is_acquired BOOLEAN
);

--Tabla de tipos de pagos de clientes captados
CREATE TABLE client_payments (
client_payment_id SERIAL PRIMARY KEY,
client_payment_type VARCHAR(30)
);

--Tabla de servicios administrativos de Keepcoding para estudiantes
CREATE TABLE administrative_services (
service_id SERIAL PRIMARY KEY,
services VARCHAR(30)
);

--Tabla de los departamentos de Keepcoding
CREATE TABLE departments (
department_id SERIAL PRIMARY KEY,
department_name VARCHAR(20)
);


--Tabla de las funciones de los trabajadores
CREATE TABLE worker_functions (
function_id SERIAL PRIMARY KEY,
functions VARCHAR(30)
);

--Tabla de los estudiantes
CREATE TABLE students (
student_id SERIAL PRIMARY KEY,
name VARCHAR(30),
surname VARCHAR(30),
age INT,
gender_id INT,
country_id INT,
city_id INT,
email VARCHAR(30),
phone VARCHAR(20),
FOREIGN KEY(gender_id) REFERENCES
	genders(gender_id),
FOREIGN KEY (country_id) REFERENCES
	countries(country_id),
FOREIGN KEY (city_id) REFERENCES
	cities(city_id)
);

--Tabla de trabajadores administrativos
CREATE TABLE administrative_staff (
worker_id SERIAL PRIMARY KEY,
name VARCHAR(30),
surname VARCHAR(30),
gender_id INT,
country_id INT,
city_id INT,
email VARCHAR(30),
phone VARCHAR(20),
FOREIGN KEY(gender_id) REFERENCES
	genders(gender_id),
FOREIGN KEY (country_id) REFERENCES
	countries(country_id),
FOREIGN KEY (city_id) REFERENCES
	cities(city_id)
);

--Tabla de registro de clientes que se inscriben o no a un bootcamp
CREATE TABLE client_database (
client_id SERIAL PRIMARY KEY,
name VARCHAR(30),
surname VARCHAR(30),
age INT,
gender_id INT,
country_id INT,
city_id INT,
phone VARCHAR(20),
email VARCHAR(30),
bootcamp_id INT,
worker_id INT,
registration_date DATE,
is_acquired_id INT,
client_payment_id INT,
monthly_installments INT,
FOREIGN KEY(gender_id) REFERENCES
	genders(gender_id),
FOREIGN KEY (country_id) REFERENCES
	countries(country_id),
FOREIGN KEY (city_id) REFERENCES
	cities(city_id),
FOREIGN KEY (bootcamp_id) REFERENCES
	bootcamps(bootcamp_id),
FOREIGN KEY (worker_id) REFERENCES
	administrative_staff(worker_id),
FOREIGN KEY (is_acquired_id) REFERENCES
	client_acquisition(is_acquired_id),
FOREIGN KEY (client_payment_id) REFERENCES
	client_payments(client_payment_id)
);

--Tabla de la realcion entre bootcamps y cursos y la duración de cada uno
CREATE TABLE bootcamps_courses_duration (
bootcamp_course_id SERIAL PRIMARY KEY,
bootcamp_id INT,
course_id INT,
start_date DATE,
end_date DATE,
FOREIGN KEY (bootcamp_id) REFERENCES
	bootcamps(bootcamp_id),
FOREIGN KEY (course_id) REFERENCES
	courses(course_id)
);

--Tabla de registro de estudiantes aprobados o desaprobados
CREATE TABLE approved_student_register (
register_id SERIAL PRIMARY KEY,
bootcamp_course_id INT,
student_id INT,
approved_id INT,
FOREIGN KEY (bootcamp_course_id) REFERENCES
	bootcamps_courses_duration(bootcamp_course_id),
FOREIGN KEY (student_id) REFERENCES
	students(student_id),
FOREIGN KEY (approved_id) REFERENCES
	approved(approved_id)
);

--Tabla de registro de pagos de estudiantes
CREATE TABLE student_payment_record (
payment_record_id SERIAL PRIMARY KEY,
student_id INT,
bootcamp_id INT,
student_payment_id INT,
monthly_installments INT,
payment_date DATE,
FOREIGN KEY (student_id) REFERENCES
	students(student_id),
FOREIGN KEY (bootcamp_id) REFERENCES
	bootcamps(bootcamp_id),
FOREIGN KEY (student_payment_id) REFERENCES
	student_payments(student_payment_id)
);


--Tabla de registro de servicios atendidos por algun trabajador administrativo para estudiantes
CREATE TABLE service_history (
service_history_id SERIAL PRIMARY KEY,
student_id INT,
service_id INT,
worker_id INT,
service_date DATE,
worker_comments VARCHAR(100),
FOREIGN KEY (student_id) REFERENCES
	students(student_id),
FOREIGN KEY (service_id) REFERENCES
	administrative_services(service_id),
FOREIGN KEY (worker_id) REFERENCES
	administrative_staff(worker_id)
);

--Tabla de registro de trabajadores, departamento al que pertenecen, funciones que realizan y servicios que atienden
CREATE TABLE employee_database (
employee_database_id SERIAL PRIMARY KEY,
worker_id INT,
department_id INT,
function_id INT,
service_id INT,
FOREIGN KEY (worker_id) REFERENCES
	administrative_staff(worker_id),
FOREIGN KEY (department_id) REFERENCES
	departments(department_id),
FOREIGN KEY (function_id) REFERENCES
	worker_functions(function_id),
FOREIGN KEY (service_id) REFERENCES
	administrative_services(service_id)
);



--EJERCICIO 3 CREAR TABLA DE ivr_detail.
--SOLUCION EN LA SIGUIENTE QUERY:
CREATE TABLE `keepcoding.ivr_detail` AS 
  SELECT 
    calls.ivr_id AS calls_ivr_id,
    calls.phone_number AS calls_phone_number,
    calls.ivr_result AS calls_ivr_result,
    calls.vdn_label AS calls_vdn_label,
    calls.start_date AS call_start_date,
    CAST(FORMAT_DATE("%Y%m%d",calls.start_date) AS INT64) AS calls_start_date_id,
    calls.end_date AS calls_end_date,
    CAST(FORMAT_DATE('%Y%m%d', calls.end_date) AS INT64) AS calls_end_date_id,
    calls.total_duration AS calls_total_duration,
    calls.customer_segment AS calls_customer_segment,
    calls.ivr_language AS calls_ivr_language,
    calls.steps_module AS calls_steps_module,
    calls.module_aggregation AS calls_module_aggregation,
    modules.module_sequece,
    modules.module_name,
    modules.module_duration,
    modules.module_result,
    steps.step_sequence,
    steps.step_name,
    steps.step_result,
    steps.step_description_error,
    steps.document_type,
    steps.document_identification,
    steps.customer_phone,
    steps.billing_account_id
  FROM `keepcoding.ivr_calls` calls 
  LEFT JOIN `keepcoding.ivr_modules` modules
  ON calls.ivr_id = modules.ivr_id
  LEFT JOIN `keepcoding.ivr_steps` steps
  ON calls.ivr_id = steps.ivr_id;



--EJERCICIO 4. GENERAR EL CAMPO vdn_aggregation

SELECT
	detail.calls_ivr_id,
    CASE
      WHEN detail.calls_vdn_label LIKE 'ATC%' THEN 'FRONT'
      WHEN detail.calls_vdn_label LIKE 'TECH%' THEN 'TECH'
      WHEN detail.calls_vdn_label LIKE 'ABSORPTION' THEN 'ABSORPTION'
      ELSE 'RESTO'
      END AS vdn_aggregation
FROM `keepcoding.ivr_detail` detail; 



--EJERCICIO 5.GENERAR LOS CAMPOS document_type Y document_identification

SELECT 
  details.calls_ivr_id,
  details.document_identification,
  details.document_type,
  details.calls_start_date_id
FROM `keepcoding.ivr_detail` details
WHERE details.document_identification != 'UNKNOWN' AND details.document_identification IS NOT NULL
QUALIFY row_number() over(partition by CAST(details.calls_ivr_id AS STRING) order by details.calls_start_date_id DESC) = 1
;



--EJERCICIO 6.GENERAR EL CAMPO customer_phone

SELECT 
  details.calls_ivr_id,
  details.customer_phone,
  details.module_sequece
FROM `keepcoding.ivr_detail` details
WHERE details.customer_phone != 'UNKNOWN' AND details.customer_phone IS NOT NULL
QUALIFY row_number() over(partition by CAST(details.calls_ivr_id AS STRING) order by details.module_sequece DESC) = 1
;



--EJERCICIO 7. GENERAR EL CAMPO billing_account_id

SELECT 
  details.calls_ivr_id,
  details.billing_account_id,
  details.module_sequece
FROM `keepcoding.ivr_detail` details
WHERE  details.billing_account_id != 'UNKNOWN' AND details.billing_account_id IS NOT NULL 
QUALIFY row_number() over(partition by CAST(details.calls_ivr_id AS STRING) order by details.module_sequece DESC) = 1
;



--EJERCICIO 8. GENERAR EL CAMPO masiva_lg

SELECT 
  details.calls_ivr_id,
  CASE
    WHEN details.module_name = 'AVERIA_MASIVA' THEN 1
    ELSE 0
    END AS masiva_lg
FROM `keepcoding.ivr_detail` details
QUALIFY row_number() over(partition by cast(details.calls_ivr_id as string) order by masiva_lg DESC) = 1;


--EJERCICIO 9. GENERAR EL CAMPO info_by_phone_lg

SELECT 
  details.calls_ivr_id,
  CASE
    WHEN details.step_name = 'CUSTOMERINFOBYPHONE.TX' AND details.step_result = 'OK' THEN 1
    ELSE 0
    END AS info_by_phone_lg
FROM `keepcoding.ivr_detail` details
QUALIFY row_number() over(partition by cast(details.calls_ivr_id as string) order by info_by_phone_lg DESC) = 1;



--EJERCICIO 10. GENERAR EL CAMPO info_by_dni_lg

SELECT 
  details.calls_ivr_id,
  CASE
    WHEN details.step_name = 'CUSTOMERINFOBYDNI.TX' AND details.step_result = 'OK' THEN 1
    ELSE 0
    END AS info_by_dni_lg
FROM `keepcoding.ivr_detail` details
QUALIFY row_number() over(partition by cast(details.calls_ivr_id as string) order by info_by_dni_lg DESC) = 1;



--EJERCICIO 11. GENERAR LOS CAMPOS repeated_phone_24H, cause_recall_phone_24H

WITH llamadas AS (
  SELECT
    details.calls_ivr_id,
    details.calls_phone_number,
    details.call_start_date AS start_timestamp
  FROM `keepcoding.ivr_detail` details
),

comparaciones AS (
  SELECT
    llamadas.calls_ivr_id,
    llamadas.calls_phone_number,
    llamadas.start_timestamp,
    COUNTIF(
      TIMESTAMP_DIFF(llamadas.start_timestamp, otras_llamadas.start_timestamp, HOUR) 
      BETWEEN 1 AND 24
    ) AS llamadas_previas_24h,
    COUNTIF(
      TIMESTAMP_DIFF(otras_llamadas.start_timestamp, llamadas.start_timestamp, HOUR) 
      BETWEEN 1 AND 24
    ) AS llamadas_posteriores_24h
  FROM llamadas
  LEFT JOIN llamadas AS otras_llamadas
    ON llamadas.calls_phone_number = otras_llamadas.calls_phone_number
   AND llamadas.calls_ivr_id != otras_llamadas.calls_ivr_id
  GROUP BY llamadas.calls_ivr_id, llamadas.calls_phone_number, llamadas.start_timestamp
)

SELECT
  calls_ivr_id,
  calls_phone_number,
  start_timestamp,
  CASE WHEN llamadas_previas_24h > 0 THEN 1 ELSE 0 END AS repeated_phone_24H,
  CASE WHEN llamadas_posteriores_24h > 0 THEN 1 ELSE 0 END AS cause_recall_phone_24H
FROM comparaciones;




--EJERCICIO 12. CREAR TABLA DE ivr_summary

CREATE TABLE `keepcoding.ivr_summary` AS
WITH 
-- 4. VDN aggregation
vdn AS (
  SELECT
    CAST(calls_ivr_id AS STRING) AS ivr_id,
    CASE
      WHEN calls_vdn_label LIKE 'ATC%' THEN 'FRONT'
      WHEN calls_vdn_label LIKE 'TECH%' THEN 'TECH'
      WHEN calls_vdn_label = 'ABSORPTION' THEN 'ABSORPTION'
      ELSE 'RESTO'
    END AS vdn_aggregation
  FROM `keepcoding.ivr_detail`
),

-- 5. Document type & identification
dni_and_type AS (
  SELECT 
    CAST(calls_ivr_id AS STRING) AS ivr_id,
    document_type,
    document_identification,
    ROW_NUMBER() OVER(PARTITION BY CAST(calls_ivr_id AS STRING) ORDER BY calls_start_date_id DESC) AS rn
  FROM `keepcoding.ivr_detail`
  WHERE document_identification IS NOT NULL AND document_identification != 'UNKNOWN'
),
dni_and_type_clean AS (
  SELECT ivr_id, document_type, document_identification
  FROM dni_and_type
  WHERE rn = 1
),

-- 6. Customer phone
customer AS (
  SELECT 
    CAST(calls_ivr_id AS STRING) AS ivr_id,
    customer_phone,
    ROW_NUMBER() OVER(PARTITION BY CAST(calls_ivr_id AS STRING) ORDER BY module_sequece DESC) AS rn
  FROM `keepcoding.ivr_detail`
  WHERE customer_phone IS NOT NULL AND customer_phone != 'UNKNOWN'
),
customer_clean AS (
  SELECT ivr_id, customer_phone
  FROM customer
  WHERE rn = 1
),

-- 7. Billing account
billing AS (
  SELECT 
    CAST(calls_ivr_id AS STRING) AS ivr_id,
    billing_account_id,
    ROW_NUMBER() OVER(PARTITION BY CAST(calls_ivr_id AS STRING) ORDER BY module_sequece DESC) AS rn
  FROM `keepcoding.ivr_detail`
  WHERE billing_account_id IS NOT NULL AND billing_account_id != 'UNKNOWN'
),
billing_clean AS (
  SELECT ivr_id, billing_account_id
  FROM billing
  WHERE rn = 1
),

-- 8. Masiva flag
masiva AS (
  SELECT
    CAST(calls_ivr_id AS STRING) AS ivr_id,
    CASE WHEN module_name = 'AVERIA_MASIVA' THEN 1 ELSE 0 END AS masiva_lg,
    ROW_NUMBER() OVER(PARTITION BY CAST(calls_ivr_id AS STRING) ORDER BY CASE WHEN module_name = 'AVERIA_MASIVA' THEN 1 ELSE 0 END DESC) AS rn
  FROM `keepcoding.ivr_detail`
),
masiva_clean AS (
  SELECT ivr_id, masiva_lg
  FROM masiva
  WHERE rn = 1
),

-- 9. Info by phone
info_phone AS (
  SELECT
    CAST(calls_ivr_id AS STRING) AS ivr_id,
    CASE WHEN step_name = 'CUSTOMERINFOBYPHONE.TX' AND step_result = 'OK' THEN 1 ELSE 0 END AS info_by_phone_lg,
    ROW_NUMBER() OVER(PARTITION BY CAST(calls_ivr_id AS STRING) ORDER BY CASE WHEN step_name = 'CUSTOMERINFOBYPHONE.TX' AND step_result = 'OK' THEN 1 ELSE 0 END DESC) AS rn
  FROM `keepcoding.ivr_detail`
),
info_phone_clean AS (
  SELECT ivr_id, info_by_phone_lg
  FROM info_phone
  WHERE rn = 1
),

-- 10. Info by DNI
info_dni AS (
  SELECT
    CAST(calls_ivr_id AS STRING) AS ivr_id,
    CASE WHEN step_name = 'CUSTOMERINFOBYDNI.TX' AND step_result = 'OK' THEN 1 ELSE 0 END AS info_by_dni_lg,
    ROW_NUMBER() OVER(PARTITION BY CAST(calls_ivr_id AS STRING) ORDER BY CASE WHEN step_name = 'CUSTOMERINFOBYDNI.TX' AND step_result = 'OK' THEN 1 ELSE 0 END DESC) AS rn
  FROM `keepcoding.ivr_detail`
),
info_dni_clean AS (
  SELECT ivr_id, info_by_dni_lg
  FROM info_dni
  WHERE rn = 1
),
--11
antes_despues AS(
  WITH llamadas AS (
    SELECT
      CAST(details.calls_ivr_id AS STRING) AS calls_ivr_id,
      details.calls_phone_number,
      details.call_start_date AS start_timestamp
    FROM `keepcoding.ivr_detail` details
  ),
  comparaciones AS (
    SELECT
      llamadas.calls_ivr_id,
      llamadas.calls_phone_number,
      llamadas.start_timestamp,
      COUNTIF(
        TIMESTAMP_DIFF(llamadas.start_timestamp, otras_llamadas.start_timestamp, HOUR) 
        BETWEEN 1 AND 24
      ) AS llamadas_previas_24h,
      COUNTIF(
        TIMESTAMP_DIFF(otras_llamadas.start_timestamp, llamadas.start_timestamp, HOUR) 
        BETWEEN 1 AND 24
      ) AS llamadas_posteriores_24h
    FROM llamadas
    LEFT JOIN llamadas AS otras_llamadas
      ON llamadas.calls_phone_number = otras_llamadas.calls_phone_number
     AND llamadas.calls_ivr_id != otras_llamadas.calls_ivr_id
    GROUP BY llamadas.calls_ivr_id, llamadas.calls_phone_number, llamadas.start_timestamp
  )
  SELECT
    calls_ivr_id AS ivr_id,
    calls_phone_number,
    start_timestamp,
    CASE WHEN llamadas_previas_24h > 0 THEN 1 ELSE 0 END AS repeated_phone_24H,
    CASE WHEN llamadas_posteriores_24h > 0 THEN 1 ELSE 0 END AS cause_recall_phone_24H
  FROM comparaciones
),
-- resumen final
nuevo AS(
  SELECT
    CAST(calls.calls_ivr_id AS STRING) AS ivr_id,
    calls.calls_phone_number AS phone_number,
    calls.calls_ivr_result AS ivr_result,
    calls.call_start_date AS start_date,
    calls.calls_end_date AS end_date,
    calls.calls_total_duration AS total_duration,
    calls.calls_customer_segment AS customer_segment,
    calls.calls_ivr_language AS ivr_language,
    calls.calls_steps_module AS steps_module,
    calls.calls_module_aggregation AS module_aggregation
  FROM `keepcoding.ivr_detail` calls
)

SELECT
  nuevo.ivr_id,
  nuevo.phone_number,
  nuevo.ivr_result,
  vdn.vdn_aggregation,
  nuevo.start_date,
  nuevo.end_date,
  nuevo.total_duration,
  nuevo.customer_segment,
  nuevo.ivr_language,
  nuevo.steps_module,
  nuevo.module_aggregation,
  dni_and_type.document_type,
  dni_and_type.document_identification,
  customer.customer_phone,
  billing.billing_account_id,
  masiva.masiva_lg,
  info_phone.info_by_phone_lg,
  info_dni.info_by_dni_lg,
  antes_despues.repeated_phone_24H,
  antes_despues.cause_recall_phone_24H
FROM nuevo
INNER JOIN vdn            ON nuevo.ivr_id = vdn.ivr_id
INNER JOIN dni_and_type   ON nuevo.ivr_id = dni_and_type.ivr_id
INNER JOIN customer       ON nuevo.ivr_id = customer.ivr_id
INNER JOIN billing        ON nuevo.ivr_id = billing.ivr_id
INNER JOIN masiva         ON nuevo.ivr_id = masiva.ivr_id
INNER JOIN info_phone     ON nuevo.ivr_id = info_phone.ivr_id
INNER JOIN info_dni       ON nuevo.ivr_id = info_dni.ivr_id
INNER JOIN antes_despues  ON nuevo.ivr_id = antes_despues.ivr_id;



--EJERCICIO 13. CREAR FUNCIÓN DE LIMPIEZA DE ENTEROS

CREATE OR REPLACE FUNCTION keepcoding.clean_integer(numero INT64)
RETURNS INT64
AS (
  IF(numero IS NULL, -999999, numero)
);
--Ejemplo
select keepcoding.clean_integer(cast(calls_start_date_id as int64))
from `keepcoding.ivr_detail`

