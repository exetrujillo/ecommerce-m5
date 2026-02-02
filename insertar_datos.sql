-- ==================== INSERTAR DATOS ====================
-- Datos de productos basados en ecommerce-m2/assets/js/productos.js
--
-- ORDEN DE EJECUCIÓN:
-- 1. crear_tablas.sql (crear esquema)
-- 2. insertar_datos.sql (este archivo - categorías)
-- 3. insertar_musica.sql
-- 4. insertar_ropa.sql
-- 5. insertar_accesorios.sql
-- 6. insertar_collages.sql
-- 7. insertar_usuarios.sql (opcional)
-- 8. validar_datos.sql (verificar datos)
-- ==================== CATEGORÍAS ====================
INSERT INTO
  categorias (nombre_categoria)
VALUES
  ('musica'),
  ('ropa'),
  ('accesorios'),
  ('collages');