-- ==================== PRODUCTOS ====================

-- Categorias
CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre_categoria VARCHAR(15)
        CHECK(nombre_categoria IN ('musica', 'ropa', 'accesorios', 'collages'))
        UNIQUE 
        NOT NULL
);

-- Productos
CREATE TABLE productos(
    id_producto SERIAL PRIMARY KEY,
    id_categoria INTEGER NOT NULL
        REFERENCES categorias(id_categoria),
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(500),
    imagen VARCHAR(500)
);

-- ========== ESPECIFICACIONES BASE ==========
CREATE TABLE especificaciones (
    id_especificacion SERIAL PRIMARY KEY,
    id_producto INTEGER NOT NULL
        REFERENCES productos(id_producto)
        ON DELETE CASCADE,
    id_categoria INTEGER NOT NULL
        REFERENCES categorias(id_categoria),
    precio INTEGER NOT NULL CHECK (precio >= 0),
    stock INTEGER NOT NULL CHECK (stock >= 0),
    destacado BOOLEAN DEFAULT FALSE
);

-- ========== ESPECIFICACIONES POR CATEGORÍA ==========

-- Especificaciones MÚSICA
CREATE TABLE especificaciones_musica (
    id_especificacion INTEGER PRIMARY KEY
        REFERENCES especificaciones(id_especificacion)
        ON DELETE CASCADE,
    formato VARCHAR(20) NOT NULL CHECK (formato IN ('vinilo', 'cassette', 'cd', 'digital')),
    tracklist TEXT[]
);

-- Especificaciones ROPA
CREATE TABLE especificaciones_ropa (
    id_especificacion INTEGER PRIMARY KEY
        REFERENCES especificaciones(id_especificacion)
        ON DELETE CASCADE,
    talla VARCHAR(5) NOT NULL CHECK (talla IN ('XS', 'S', 'M', 'L', 'XL', 'XXL'))
);

-- Especificaciones ACCESORIOS
CREATE TABLE especificaciones_accesorios (
    id_especificacion INTEGER PRIMARY KEY
        REFERENCES especificaciones(id_especificacion)
        ON DELETE CASCADE
);

-- Especificaciones COLLAGES
CREATE TABLE especificaciones_collages (
    id_especificacion INTEGER PRIMARY KEY
        REFERENCES especificaciones(id_especificacion)
        ON DELETE CASCADE,
    diseno VARCHAR(50) NOT NULL,  -- 'Poeta', 'IOF', 'Empate', 'Instrucciones'
    tamanio VARCHAR(10) NOT NULL,  -- '30x40', '30x30'
    con_marco BOOLEAN NOT NULL DEFAULT TRUE
);

-- ================== USUARIOS ==================

-- Usuarios
CREATE TABLE usuarios(
    id_usuario SERIAL PRIMARY KEY,
    nombre_usuario VARCHAR(100) UNIQUE NOT NULL,
    hash_password VARCHAR(60) NOT NULL, -- bcrypt
    correo VARCHAR(100) UNIQUE NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ultima_conexion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado_usuario VARCHAR(20)
        CHECK (estado_usuario IN ('activo', 'inactivo', 'suspendido'))
        NOT NULL DEFAULT 'activo'
);

-- ================== COMPRAS ==================
CREATE TABLE compras(
    id_compra SERIAL PRIMARY KEY,
    id_usuario INTEGER NOT NULL
        REFERENCES usuarios(id_usuario),
    fecha_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ultima_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado_compra VARCHAR(20)
        CHECK (estado_compra IN ('pendiente', 'pagada', 'enviada', 'entregada', 'cancelada', 'fallida'))
        NOT NULL DEFAULT 'pendiente',
    subtotal INTEGER    -- -- -- -- -- -- Solo la suma de los precios de detalles de compra 
        CHECK (subtotal >= 0) -- -- -- -- por lo que tendría que referenciarlo
        DEFAULT 999999,
    precio_envio INTEGER -- -- -- -- -- - Calculado en el futuro, por ahora 0.
        CHECK (precio_envio >= 0)
        DEFAULT 0,
    total INTEGER -- precio subtotal + envío
        CHECK (total >= 0)
        DEFAULT 999999
);

-- Detalles de Compra
CREATE TABLE detalles_compra (
    id_detalle SERIAL PRIMARY KEY,
    id_compra INTEGER NOT NULL
        REFERENCES compras(id_compra)
        ON DELETE CASCADE,
    id_especificacion INTEGER NOT NULL
        REFERENCES especificaciones(id_especificacion),
    cantidad INTEGER NOT NULL CHECK (cantidad > 0),
    precio_unitario INTEGER NOT NULL CHECK (precio_unitario >= 0)
);