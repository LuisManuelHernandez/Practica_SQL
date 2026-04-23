## 🗄️ Proyecto SQL: Diseño y Modelado de Base de Datos (KeepCoding).

Este repositorio contiene la solución técnica a la práctica del módulo de SQL y Modelado de Datos. El proyecto abarca desde el diseño lógico de una base de Datos relacional hasta la implementación de transformaciones complejas y la creación de una tabla de integración (Data Integration).


🚀 Entorno Tecnológico.

Para garantizar la escalabilidad y disponibilidad de la solución, se han utilizado las siguientes herramientas:
- Base de Datos: PostgreSQL.
- Infraestructura: Google Cloud Platform (GCP), donde se alojó la instancia de la base de datos para la ingesta, transformación y consulta de la data.


📐 1. Modelo de Datos.
- Archivo: DIAGRAMA ENTIDAD RELACION KEEPCODING.pdf

El diseño se basa en un ecosistema de formación académica (Bootcamps). La estructura garantiza la integridad referencial mediante el uso estratégico de Primary Keys y Foreign Keys.

Entidades Principales:
- Estructura Académica: Bootcamps, Cursos, Profesores.
- Gestión de Alumnos: Estudiantes, Pagos, Registro de Aprobados.
- Administración y Servicios: Personal administrativo, Historial de servicios, Departamentos y Funciones.


💻 2. Implementación SQL.
- Archivo: SCRIPTS PRACTICA.sql

El script está organizado en fases lógicas que representan el flujo de trabajo de un Data Engineer:

A. Definición de Estructura (DDL).
Creación de tablas siguiendo el estándar de PostgreSQL, asegurando que cada relación (Genders, Countries, Cities, Bootcamps, etc.) cumpla con las restricciones de integridad definidas en el Modelo de datos.

B. Ingesta y Transformación.
Consultas diseñadas para procesar la información, incluyendo el manejo de diversos tipos de documentos de identidad, segmentación de clientes y lógica de negocio.

C. Creación de Tabla de Integración (ivr_summary).
El script culmina con la generación de una tabla resumen avanzada que consolida información de múltiples fuentes:
- Identificación: Vinculación de ivr_id con documentos de identidad (DNI, Pasaporte, etc.).
- Lógica Temporal: Cálculo de duraciones y marcas de tiempo.
- Flags de Negocio: Implementación de lógica para identificar llamadas repetidas en 24 horas (repeated_phone_24H) y rellamadas por causa del sistema (cause_recall_phone_24H).


🛠️ Cómo utilizar este repositorio.
- Modelado: Revisa el PDF para entender las jerarquías y conexiones entre tablas.
- Data: Descargar la data CSV-practica.rar y descomprimirla para cargarla en el Google Cloud.
- Despliegue: Los scripts SQL pueden ejecutarse en cualquier instancia de PostgreSQL. Se recomienda el uso de pgAdmin 4 o la consola de Google Cloud SDK para la ejecución de los archivos.
- Consulta: El script final genera una vista integrada lista para ser consumida por herramientas de visualización como Looker o Power BI.
