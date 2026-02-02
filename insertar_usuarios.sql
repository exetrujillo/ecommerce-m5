-- ==================== USUARIOS DE EJEMPLO ====================
-- Usuario 1: Admin/Vendedor
INSERT INTO
  usuarios (
    nombre_usuario,
    hash_password,
    correo,
    estado_usuario
  )
VALUES
  (
    'admin',
    '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
    'admin@malmenor.cl',
    'activo'
  );

-- Password: admin123 (hash bcrypt)
-- Usuario 2: Cliente de prueba 1
INSERT INTO
  usuarios (
    nombre_usuario,
    hash_password,
    correo,
    estado_usuario
  )
VALUES
  (
    'juan_perez',
    '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
    'juan@example.com',
    'activo'
  );

-- Password: admin123 (hash bcrypt)
-- Usuario 3: Cliente de prueba 2
INSERT INTO
  usuarios (
    nombre_usuario,
    hash_password,
    correo,
    estado_usuario
  )
VALUES
  (
    'maria_gonzalez',
    '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
    'maria@example.com',
    'activo'
  );

-- Password: admin123 (hash bcrypt)
-- Usuario 4: Cliente inactivo
INSERT INTO
  usuarios (
    nombre_usuario,
    hash_password,
    correo,
    estado_usuario
  )
VALUES
  (
    'pedro_lopez',
    '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
    'pedro@example.com',
    'inactivo'
  );

-- Password: admin123 (hash bcrypt)
-- Usuario 5: Cliente suspendido
INSERT INTO
  usuarios (
    nombre_usuario,
    hash_password,
    correo,
    estado_usuario
  )
VALUES
  (
    'juan_lopez',
    '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
    'juan_l@example.com',
    'suspendido'
  );

-- Password: admin123 (hash bcrypt)