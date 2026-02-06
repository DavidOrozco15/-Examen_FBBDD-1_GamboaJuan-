# 🚲 CampusBike - Sistema de Gestión de Inventario y Ventas

Este proyecto contiene el diseño lógico y relacional de una base de datos diseñada para optimizar la operación de **CampusBike**, una empresa dedicada a la comercialización de bicicletas y repuestos.

## 📋 Descripción del Simulacro
El objetivo es resolver cuatro desafíos principales:
1. **Fidelización de Clientes:** Seguimiento detallado de interacciones.
2. **Cadena de Suministro:** Centralización de proveedores y pedidos.
3. **Análisis Estratégico:** Registro robusto de ventas y compras.
4. **Control de Stock:** Gestión precisa de repuestos y accesorios.

## 🛠️ Solución de Base de Datos
Se ha implementado un modelo relacional normalizado que utiliza una arquitectura de **Encabezado-Detalle** para garantizar la integridad y escalabilidad de los datos.

### Entidades Principales
* **Clientes:** Información de contacto y perfiles.
* **Interacciones:** Historial de contacto para servicios personalizados.
* **Productos:** Inventario centralizado con niveles de stock mínimo.
* **Proveedores:** Directorio de suministros y términos comerciales.
* **Ventas/Compras:** Módulos transaccionales con desgloses detallados.

## 📊 Modelo Entidad-Relación (Lógica)
El diseño resuelve relaciones de **Muchos a Muchos (N:M)** mediante las siguientes tablas asociativas:
- **Venta_Detalle:** Une Ventas con Productos.
- **Compra_Detalle:** Une Compras con Productos.

| Relación | Cardinalidad | Propósito |
| :--- | :--- | :--- |
| Clientes -> Ventas | 1:N | Historial de compras por cliente |
| Proveedores -> Productos | 1:N | Identificación de origen por artículo |
| Venta_Encabezado -> Venta_Detalle | 1:N | Desglose de artículos vendidos |
| Productos -> Venta_Detalle | 1:N | Control de salida de inventario |

## ⚙️ Tecnologías Utilizadas
* **Diagramación:** Modelado Entidad-Relación (MER) y Modelo Relacional.
* **Lenguaje:** SQL Estándar.

---
*Este proyecto fue desarrollado como parte de un simulacro de examen para la gestión de bases de datos relacionales.*
