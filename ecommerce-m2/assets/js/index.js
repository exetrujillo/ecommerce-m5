// /assets/js/index.js
import { obtenerProductosDestacados } from './productos.js';

function renderDestacados() {
  const productosDestacados = obtenerProductosDestacados();
  
  if (productosDestacados.length === 0) {
    console.warn('No hay productos destacados para mostrar');
    return;
  }
  
  const container = $('#tarjetas-productos-destacados');
  
  const tarjetasHTML = productosDestacados.map(producto => {
    const urlProducto = getUrlProducto(producto);
    
    return `
      <div class="col">
        <div class="card h-100">
          <img src="${window.BASE_URL}assets/img/${producto.imagen}" 
               class="card-img-top" 
               alt="${producto.nombre}">
          <div class="card-body">
            <h5 class="card-title">${producto.nombre}</h5>
            <p class="card-text">${producto.descripcion}</p>
            <a href="${urlProducto}" class="btn btn-danger">Ver más »</a>
          </div>
        </div>
      </div>
    `;
  }).join('');
  
  container.html(tarjetasHTML);
}

// generar la url dinamica
function getUrlProducto(producto) {
  const baseUrl = window.BASE_URL || './';
  return `${baseUrl}pages/productos/${producto.categoria}.html?id=${producto.id}`;
}

// ejecutar todo
$(document).ready(function() {
  renderDestacados();
});
