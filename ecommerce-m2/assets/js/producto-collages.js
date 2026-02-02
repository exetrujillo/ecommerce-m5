// /assets/js/producto-collages.js
import { obtenerProducto } from "./productos.js";

// Links que usé
//
// - Para querystring: https://developer.mozilla.org/en-US/docs/Web/API/URLSearchParams#parsing_window.location

/* =============== FUNCION PRINCIPAL =================== */
function cargarProductoCollages() {
  // parsear el query string
  const paramsString = window.location.search;
  const searchParams = new URLSearchParams(paramsString);
  const idProducto = searchParams.get("id");
  if(!idProducto) {
    console.error("No se proporcionó un ID de producto en el query string");
    return;
  }

  // producto
  const producto = obtenerProducto('collages', idProducto);
  if(!producto) {
    console.error("No se encuentra el producto con este ID");
    return;
  }

  renderBreadcrumb(producto);
  renderFoto(producto);
  renderDescripcion(producto);
  renderCompra(producto);
  document.title = `${producto.nombre} - Violentistas de Siempre`;
}

/* ============= FUNCIONES SECUNDARIAS ================= */
function renderBreadcrumb(producto) {
  const breadcrumbContainer = $("#breadcrumb-container");
  const breadcrumbHtml = `
    <li class="breadcrumb-item"><a href="${window.BASE_URL}index.html">Inicio</a></li>
    <li class="breadcrumb-item"><a href="${window.BASE_URL}pages/collages.html">Collages</a></li>
    <li class="breadcrumb-item active" aria-current="page">${producto.nombre}</li>
  `;
  breadcrumbContainer.html(breadcrumbHtml);
}

function renderFoto(producto) {
  const fotoContainer = $("#foto-producto-container");
  const fotoHtml = `
    <img 
      src="${window.BASE_URL}assets/img/${producto.imagen}"
      alt="Foto ${producto.nombre}"
      class="img-fluid"
    >
  `;
  fotoContainer.html(fotoHtml);
}

function renderDescripcion(producto){
  const especiHtml = producto.especificaciones ? `
    <ul>${producto.especificaciones.map(esp => `<li>${esp}</li>`).join('')}</ul>
  ` : '';

  const descripcionContainer = $("#descripcion-producto-container");
  const descripcionHtml = `
    <h2>${producto.nombre}</h2>
    <p>${producto.descripcion}</p>
      ${especiHtml}
  `;
  descripcionContainer.html(descripcionHtml)
}

function renderCompra(producto) {
  const compraContainer = $("#compra-producto-container");
  const opcionesDiseno = producto.disenos.map((design) => 
    `<option value="${design}">${design}</option>`
  ).join('');
  const compraHtml = `
    <h3>Comprar</h3>
    <p class="fs-4 fw-bold">$${producto.precio.toLocaleString('es-CL')} CLP</p>
    <form id="form-agregar-carrito">
      <div class="mb-3">
        <label for="cantidad" class="form-label">Cantidad:</label>
        <input type="number" id="cantidad" name="cantidad" 
               class="form-control" value="1" min="1" max="${producto.stock}">
      </div>
      <div class="mb-3">
        <label for="diseno" class="form-label">Diseño:</label>
        <select id="diseno" name="diseno" class="form-select">
          ${opcionesDiseno}
        </select>
      </div>
      <button type="submit" class="btn btn-primary">Agregar al Carrito</button>
    </form>
  `;
  compraContainer.html(compraHtml);

  // Event listener para el formulario
  $('#form-agregar-carrito').on('submit', function(e) {
    e.preventDefault();
    agregarAlCarrito(producto);
  });
}

function agregarAlCarrito(producto) {
  const cantidad = parseInt($('#cantidad').val());
  const diseno = $('#diseno').val();
  
  console.log('Agregando al carrito:', {
    id: producto.id,
    nombre: producto.nombre,
    cantidad: cantidad,
    diseno: diseno,
    precio: producto.precio
  });
  
  // Falta implementar lógica real del carrito [ATENCIÓN]
  alert(`${cantidad} x ${producto.nombre} diseño "${diseno}" agregado al carrito!`);
}

/* =============== EJECUTAR TODO =================== */
$(document).ready(function() {
  cargarProductoCollages();
});