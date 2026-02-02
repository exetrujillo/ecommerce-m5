-- ==================== PRODUCTOS DE MÚSICA ====================

-- Cassette Demos
INSERT INTO productos (id_categoria, nombre, descripcion, imagen) VALUES
((SELECT id_categoria FROM categorias WHERE nombre_categoria = 'musica'), 
 'Cassette Demos', 
 'Dinos que hay algo más indie que piratear tus propios cassettes... <br>Y no te creeremos!',
 'cassette.png');

INSERT INTO especificaciones (id_producto, id_categoria, precio, stock, destacado) VALUES
((SELECT id_producto FROM productos WHERE nombre = 'Cassette Demos'),
 (SELECT id_categoria FROM categorias WHERE nombre_categoria = 'musica'),
 8000, 500, true);

INSERT INTO especificaciones_musica (id_especificacion, formato, tracklist) VALUES
(currval('especificaciones_id_especificacion_seq'),
 'cassette',
 ARRAY['Instrucciones (demo)', 'Todo es tan hermoso (demo)', 'Aminoácido (demo)', 'IOF (demo)', 'Te Recuerdo (demo)', 'Duelo (demo)']);

-- Vinilo "malmenor"
INSERT INTO productos (id_categoria, nombre, descripcion, imagen) VALUES
((SELECT id_categoria FROM categorias WHERE nombre_categoria = 'musica'), 
 'Vinilo "malmenor"', 
 'Advertencia: <br> Llévalo sólo si tienes un tocadiscos a prueba de fuego 🥵. Perfecto para los amantes de la música que valoran la calidad y el formato clásico (y que tienen a mano un extintor)',
 'vinilo.png');

INSERT INTO especificaciones (id_producto, id_categoria, precio, stock, destacado) VALUES
((SELECT id_producto FROM productos WHERE nombre = 'Vinilo "malmenor"'),
 (SELECT id_categoria FROM categorias WHERE nombre_categoria = 'musica'),
 22000, 50, true);

INSERT INTO especificaciones_musica (id_especificacion, formato, tracklist) VALUES
(currval('especificaciones_id_especificacion_seq'),
 'vinilo',
 ARRAY['Roma', 'Como Siempre', 'Nocturno', 'Traición', 'Ghetto', 'Una vez más', '3 de Julio', 'Chuchunco', 'Maldito', 'Empate', 'Te Recuerdo', 'Joaquín', 'Duelo']);
