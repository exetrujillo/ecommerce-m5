-- ==================== PRODUCTOS DE ACCESORIOS ====================
-- Totebag - Pero No
INSERT INTO
  productos (id_categoria, nombre, descripcion, imagen)
VALUES
  (
    (
      SELECT
        id_categoria
      FROM
        categorias
      WHERE
        nombre_categoria = 'accesorios'
    ),
    'Totebag - Pero No',
    'Si tienes linda tu casa, y además un perro nuevo, y en las mañanas subes los cerros, date el lujo de pasear con esta tote por Ñuñoa 😎',
    'totebag.png'
  );

INSERT INTO
  especificaciones (
    id_producto,
    id_categoria,
    precio,
    stock,
    destacado
  )
VALUES
  (
    (
      SELECT
        id_producto
      FROM
        productos
      WHERE
        nombre = 'Totebag - Pero No'
    ),
    (
      SELECT
        id_categoria
      FROM
        categorias
      WHERE
        nombre_categoria = 'accesorios'
    ),
    8500,
    100,
    true
  );

INSERT INTO
  especificaciones_accesorios (id_especificacion)
VALUES
  (
    currval ('especificaciones_id_especificacion_seq')
  );