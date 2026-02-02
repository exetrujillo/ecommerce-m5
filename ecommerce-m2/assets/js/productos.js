// /assets/js/productos.js

/* Necesitamos listar los productos con
 - id
 - Categoría
 - Nombre
 - Descripción
 - Imagen (ruta)
 - Precio
 - Stock
 - Especificaciones (Array de strings)
 - Tracklist (Array de strings, opcional) 

 Tendremos un array de objetos por categoría de productos
  1. Música
  2. Ropa
  3. Accesorios
  4. Collages
*/


/* =============== Productos de música ================ */
const productosMusica = [
  {
    id: 1,
    destacado: true,
    categoria: "musica",
    nombre: "Cassette Demos",
    descripcion: "Dinos que hay algo más indie que piratear tus propios cassettes... <br>Y no te creeremos!",
    imagen: "cassette.png",
    precio: 8000,
    stock: 500,
    especificaciones: [
      "Formato: Cassette",
      "Duración: 20 minutos",
      "Incluye libreto con letras y fotos exclusivas",
    ],
    tracklist: [
      "Instrucciones (demo)",
      "Todo es tan hermoso (demo)",
      "Aminoácido (demo)",
      "IOF (demo)",
      "Te Recuerdo (demo)",
      "Duelo (demo)"
    ],
  },
  {
    id: 2,
    destacado: true,
    categoria: "musica",
    nombre: 'Vinilo "malmenor"',
    descripcion: "Advertencia: <br> Llévalo sólo si tienes un tocadiscos a prueba de fuego 🥵. Perfecto para los amantes de la música que valoran la calidad y el formato clásico (y que tienen a mano un extintor)",
    imagen: "vinilo.png",
    precio: 22000,
    stock: 50,
    especificaciones: [
      'Formato: Vinilo 12"',
      "Duración: 45 minutos",
      "Incluye libreto con letras y fotos exclusivas"
    ],
    tracklist: [
      "Roma",
      "Como Siempre",
      "Nocturno",
      "Traición",
      "Ghetto",
      "Una vez más",
      "3 de Julio",
      "Chuchunco",
      "Maldito",
      "Empate",
      "Te Recuerdo",
      "Joaquín",
      "Duelo"
    ],
  }
];

/* =============== Productos de ropa ================ */
// El stock se maneja por talla
const productosRopa = [
  {
    id: 1,
    destacado: true,
    categoria: "ropa",
    nombre: 'Polera "Espera"',
    descripcion: "¿Cansado de esperar por esa <strike>mierda</strike>? No esperes más y llévate esta pilcha. No tienes por qué explicar cada decisión 🤪",
    imagen: "polera.png",
    precio: 15000,
    stock: { S: 20, M: 30, L: 25, XL: 15 },
    especificaciones: [
      "Material: Algodón Natural 100%",
      "Estampado: Vinilo",
      "El estampado aguanta unos 100 lavados",
    ],
  },
  {
    id: 2,
    destacado: true,
    categoria: "ropa",
    nombre: 'Polerón "Empate"',
    descripcion: "Si te tratan de la canina pero eres de quienes ladran con furia de vuelta (y comes corazones y esas cosas) ya sabes... Este es para ti ;)",
    imagen: "poleron.png",
    precio: 17500,
    stock: { S: 10, M: 15, L: 10, XL: 5 },
    especificaciones: [
      "Material: Algodón Natural 100%",
      "Estampado: Vinilo",
      "El estampado aguanta unos 100 lavados",
    ],
  },
];

/* =============== Productos de accesorios ================ */
const productosAccesorios = [
  {
    id: 1,
    destacado: true,
    categoria: "accesorios",
    nombre: "Totebag - Pero No",
    descripcion: "Si tienes linda tu casa, y además un perro nuevo, y en las mañanas subes los cerros, date el lujo de pasear con esta tote por Ñuñoa 😎",
    imagen: "totebag.png",
    precio: 8500,
    stock: 100,
    especificaciones: [
      "Material: Algodón Natural 100%",
      "Estampado: Vinilo",
      "El estampado aguanta unos 100 lavados",
      "Medidas: 42 x 38 cm"
    ],
  }
];

/* =============== Productos de collages ================ */
const productosCollages = [
  {
    id: 1,
    destacado: true,
    categoria: "collages",
    nombre: "Collage Enmarcado - por Ale Decap",
    descripcion: "¿Es que necesitan más presentación? Son una locura, sabemos que lo quieres tener en tu casa... o en la oficina... o debajo de tu almohada... Puedes elegir entre los distintos diseños disponibles.",
    imagen: "enmarcado.png",
    precio: 30000,
    stock: 100,
    especificaciones: [
      "Material: Impresión fotográfica de alta calidad",
      "Marco: Madera natural con vidrio protector",
      "Tamaño: 30 x 40 cm o 30 x 30 cm, dependiendo del diseño",
    ],
    disenos: ["Poeta", "IOF", "Empate", "Instrucciones"]
  }
];

const todosLosProductos = {
  musica: productosMusica,
  ropa: productosRopa,
  accesorios: productosAccesorios,
  collages: productosCollages
}

function obtenerProducto(categoria, id) {
  const productos = todosLosProductos[categoria];
  return productos ? productos.find(producto => producto.id === parseInt(id)) : null;
}

function obtenerProductosDestacados() {
  const destacados = [];
  
  for (const categoria in todosLosProductos) {
    const productos = todosLosProductos[categoria];
    const destacadosCategoria = productos.filter(p => p.destacado === true);
    
    destacadosCategoria.forEach(producto => {
      destacados.push({
        ...producto,
        categoria: categoria
      });
    });
  }
  
  return destacados;
}

export { todosLosProductos, obtenerProducto, obtenerProductosDestacados };