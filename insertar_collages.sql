-- ==================== PRODUCTOS DE COLLAGES ====================
-- Collage Enmarcado - por Ale Decap
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
        nombre_categoria = 'collages'
    ),
    'Collage Enmarcado - por Ale Decap',
    '¿Es que necesitan más presentación? Son una locura, sabemos que lo quieres tener en tu casa... o en la oficina... o debajo de tu almohada... Puedes elegir entre los distintos diseños disponibles.',
    'enmarcado.png'
  );

-- Collage Enmarcado - Diseño "Poeta" (30x40)
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
        nombre = 'Collage Enmarcado - por Ale Decap'
    ),
    (
      SELECT
        id_categoria
      FROM
        categorias
      WHERE
        nombre_categoria = 'collages'
    ),
    30000,
    25,
    true
  );

INSERT INTO
  especificaciones_collages (id_especificacion, diseno, tamanio, con_marco)
VALUES
  (
    currval ('especificaciones_id_especificacion_seq'),
    'Poeta',
    '30x40',
    true
  );

-- Collage Enmarcado - Diseño "IOF" (30x30)
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
        nombre = 'Collage Enmarcado - por Ale Decap'
    ),
    (
      SELECT
        id_categoria
      FROM
        categorias
      WHERE
        nombre_categoria = 'collages'
    ),
    30000,
    25,
    true
  );

INSERT INTO
  especificaciones_collages (id_especificacion, diseno, tamanio, con_marco)
VALUES
  (
    currval ('especificaciones_id_especificacion_seq'),
    'IOF',
    '30x30',
    true
  );

-- Collage Enmarcado - Diseño "Empate" (30x40)
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
        nombre = 'Collage Enmarcado - por Ale Decap'
    ),
    (
      SELECT
        id_categoria
      FROM
        categorias
      WHERE
        nombre_categoria = 'collages'
    ),
    30000,
    25,
    true
  );

INSERT INTO
  especificaciones_collages (id_especificacion, diseno, tamanio, con_marco)
VALUES
  (
    currval ('especificaciones_id_especificacion_seq'),
    'Empate',
    '30x40',
    true
  );

-- Collage Enmarcado - Diseño "Instrucciones" (30x30)
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
        nombre = 'Collage Enmarcado - por Ale Decap'
    ),
    (
      SELECT
        id_categoria
      FROM
        categorias
      WHERE
        nombre_categoria = 'collages'
    ),
    30000,
    25,
    true
  );

INSERT INTO
  especificaciones_collages (id_especificacion, diseno, tamanio, con_marco)
VALUES
  (
    currval ('especificaciones_id_especificacion_seq'),
    'Instrucciones',
    '30x30',
    true
  );