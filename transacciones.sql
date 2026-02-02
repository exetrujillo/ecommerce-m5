-- ==================== TRANSACCIONES Y CONSULTAS ====================
-- Archivo con transacciones y consultas de negocio (versión simplificada)
-- ==================== 1. ACTUALIZAR PRECIOS - OFERTA DE VERANO (-20%) ====================
BEGIN;

UPDATE especificaciones
SET
  precio = ROUND(precio * 0.8)
WHERE
  precio > 0;

COMMIT;

-- ==================== 2. STOCK CRÍTICO (<= 5 unidades) ====================
SELECT
  *
FROM
  especificaciones
WHERE
  stock <= 5
ORDER BY
  stock ASC;

-- ==================== 3. SIMULAR COMPRA DE 3 PRODUCTOS ====================
-- Simulación: Usuario "juan_perez" compra:
-- - 1 Cassette Demos (id_especificacion = 1)
-- - 2 Polera "Espera" talla M (id_especificacion = 4)
-- - 1 Totebag (id_especificacion = 9)
BEGIN;

INSERT INTO
  compras (id_usuario, estado_compra)
VALUES
  (2, 'pendiente');

INSERT INTO
  detalles_compra (
    id_compra,
    id_especificacion,
    cantidad,
    precio_unitario
  )
VALUES
  (1, 1, 1, 6400);

INSERT INTO
  detalles_compra (
    id_compra,
    id_especificacion,
    cantidad,
    precio_unitario
  )
VALUES
  (1, 4, 2, 12000);

INSERT INTO
  detalles_compra (
    id_compra,
    id_especificacion,
    cantidad,
    precio_unitario
  )
VALUES
  (1, 9, 1, 6800);

SELECT
  id_compra,
  37200 as subtotal,
  7068 as iva,
  44268 as total
FROM
  compras
WHERE
  id_compra = 1;

UPDATE compras
SET
  subtotal = 37200,
  total = 44268,
  estado_compra = 'pagada'
WHERE
  id_compra = 1;

UPDATE especificaciones
SET
  stock = stock - 1
WHERE
  id_especificacion = 1;

UPDATE especificaciones
SET
  stock = stock - 2
WHERE
  id_especificacion = 4;

UPDATE especificaciones
SET
  stock = stock - 1
WHERE
  id_especificacion = 9;

COMMIT;

-- ==================== 4. TOTAL DE VENTAS DE NOVIEMBRE 2025 ====================
SELECT
  COUNT(*) as total_compras,
  SUM(total) as total_ventas
FROM
  compras
WHERE
  estado_compra IN ('pagada', 'enviada', 'entregada')
  AND fecha_compra >= '2025-11-01'
  AND fecha_compra < '2025-12-01';

-- ==================== 5. COMPORTAMIENTO DEL USUARIO CON MÁS COMPRAS EN 2025 ====================
SELECT
  id_usuario,
  COUNT(*) as total_compras
FROM
  compras
WHERE
  estado_compra IN ('pagada', 'enviada', 'entregada')
  AND fecha_compra >= '2025-01-01'
  AND fecha_compra < '2026-01-01'
GROUP BY
  id_usuario
ORDER BY
  total_compras DESC
LIMIT
  1;

SELECT
  *
FROM
  compras
WHERE
  id_usuario = 2
  AND estado_compra IN ('pagada', 'enviada', 'entregada')
  AND fecha_compra >= '2025-01-01'
  AND fecha_compra < '2026-01-01'
ORDER BY
  fecha_compra DESC;

SELECT
  *
FROM
  detalles_compra
WHERE
  id_compra IN (
    SELECT
      id_compra
    FROM
      compras
    WHERE
      id_usuario = 2
      AND estado_compra IN ('pagada', 'enviada', 'entregada')
      AND fecha_compra >= '2025-01-01'
      AND fecha_compra < '2026-01-01'
  );