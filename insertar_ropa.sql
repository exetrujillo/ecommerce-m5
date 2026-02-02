-- ==================== PRODUCTOS DE ROPA ====================
-- Polera "Espera"
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
        nombre_categoria = 'ropa'
    ),
    'Polera "Espera"',
    '¿Cansado de esperar por esa <strike>mierda</strike>? No esperes más y llévate esta pilcha. No tienes por qué explicar cada decisión 🤪',
    'polera.png'
  );

-- Polera "Espera" - Talla S
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
        nombre = 'Polera "Espera"'
    ),
    (
      SELECT
        id_categoria
      FROM
        categorias
      WHERE
        nombre_categoria = 'ropa'
    ),
    15000,
    20,
    true
  );

INSERT INTO
  especificaciones_ropa (id_especificacion, talla)
VALUES
  (
    currval ('especificaciones_id_especificacion_seq'),
    'S'
  );

-- Polera "Espera" - Talla M
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
        nombre = 'Polera "Espera"'
    ),
    (
      SELECT
        id_categoria
      FROM
        categorias
      WHERE
        nombre_categoria = 'ropa'
    ),
    15000,
    30,
    true
  );

INSERT INTO
  especificaciones_ropa (id_especificacion, talla)
VALUES
  (
    currval ('especificaciones_id_especificacion_seq'),
    'M'
  );

-- Polera "Espera" - Talla L
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
        nombre = 'Polera "Espera"'
    ),
    (
      SELECT
        id_categoria
      FROM
        categorias
      WHERE
        nombre_categoria = 'ropa'
    ),
    15000,
    25,
    true
  );

INSERT INTO
  especificaciones_ropa (id_especificacion, talla)
VALUES
  (
    currval ('especificaciones_id_especificacion_seq'),
    'L'
  );

-- Polera "Espera" - Talla XL
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
        nombre = 'Polera "Espera"'
    ),
    (
      SELECT
        id_categoria
      FROM
        categorias
      WHERE
        nombre_categoria = 'ropa'
    ),
    15000,
    15,
    true
  );

INSERT INTO
  especificaciones_ropa (id_especificacion, talla)
VALUES
  (
    currval ('especificaciones_id_especificacion_seq'),
    'XL'
  );

-- Polerón "Empate"
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
        nombre_categoria = 'ropa'
    ),
    'Polerón "Empate"',
    'Si te tratan de la canina pero eres de quienes ladran con furia de vuelta (y comes corazones y esas cosas) ya sabes... Este es para ti ;)',
    'poleron.png'
  );

-- Polerón "Empate" - Talla S
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
        nombre = 'Polerón "Empate"'
    ),
    (
      SELECT
        id_categoria
      FROM
        categorias
      WHERE
        nombre_categoria = 'ropa'
    ),
    17500,
    10,
    true
  );

INSERT INTO
  especificaciones_ropa (id_especificacion, talla)
VALUES
  (
    currval ('especificaciones_id_especificacion_seq'),
    'S'
  );

-- Polerón "Empate" - Talla M
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
        nombre = 'Polerón "Empate"'
    ),
    (
      SELECT
        id_categoria
      FROM
        categorias
      WHERE
        nombre_categoria = 'ropa'
    ),
    17500,
    15,
    true
  );

INSERT INTO
  especificaciones_ropa (id_especificacion, talla)
VALUES
  (
    currval ('especificaciones_id_especificacion_seq'),
    'M'
  );

-- Polerón "Empate" - Talla L
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
        nombre = 'Polerón "Empate"'
    ),
    (
      SELECT
        id_categoria
      FROM
        categorias
      WHERE
        nombre_categoria = 'ropa'
    ),
    17500,
    10,
    true
  );

INSERT INTO
  especificaciones_ropa (id_especificacion, talla)
VALUES
  (
    currval ('especificaciones_id_especificacion_seq'),
    'L'
  );

-- Polerón "Empate" - Talla XL
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
        nombre = 'Polerón "Empate"'
    ),
    (
      SELECT
        id_categoria
      FROM
        categorias
      WHERE
        nombre_categoria = 'ropa'
    ),
    17500,
    5,
    true
  );

INSERT INTO
  especificaciones_ropa (id_especificacion, talla)
VALUES
  (
    currval ('especificaciones_id_especificacion_seq'),
    'XL'
  );