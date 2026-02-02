// /assets/js/carrito.js
import { obtenerProducto } from './productos.js';

// Productos de ejemplo en el carrito (simulación)
const productosEnCarrito = [
  { categoria: 'musica', id: 2, cantidad: 1 },
  { categoria: 'ropa', id: 1, cantidad: 2, talla: 'M' },
  { categoria: 'collages', id: 1, cantidad: 1, diseno: 'Poeta' }
];

/* =============== FUNCION PRINCIPAL =================== */
function cargarCarrito() {
  renderProductosCarrito();
  renderResumenCarrito();
}

/* ============= FUNCIONES SECUNDARIAS ================= */
function renderProductosCarrito() {
  const container = $('#productos-carrito-container');
  
  if (productosEnCarrito.length === 0) {
    container.html(`
      <div class="col-12">
        <div class="alert alert-info">
          Tu carrito está vacío. <a href="../index.html">Ir a comprar</a>
        </div>
      </div>
    `);
    return;
  }

  const productosHTML = productosEnCarrito.map((item, index) => {
    const producto = obtenerProducto(item.categoria, item.id);
    if (!producto) return '';

    const detalleExtra = item.talla ? `${capitalizar(item.categoria)} - Talla ${item.talla}` 
                       : item.diseno ? `Arte Visual - Diseño "${item.diseno}"`
                       : capitalizar(item.categoria);

    return `
      <div class="col">
        <div class="card h-100">
          <img src="${window.BASE_URL}assets/img/${producto.imagen}" 
               class="card-img-top" 
               alt="${producto.nombre}">
          <div class="card-body">
            <h5 class="card-title">${producto.nombre}</h5>
            <p class="card-text">${detalleExtra}</p>
            <p class="fw-bold text-danger fs-5">${producto.precio.toLocaleString('es-CL')} CLP</p>
            <div class="d-flex align-items-center gap-2 mb-2">
              <label for="cantidad${index}" class="form-label mb-0">Cantidad:</label>
              <input type="number" 
                     class="form-control form-control-sm cantidad-input" 
                     style="width: 70px;" 
                     id="cantidad${index}" 
                     value="${item.cantidad}" 
                     min="1"
                     data-index="${index}">
            </div>
            <button class="btn btn-danger btn-sm w-100 btn-eliminar" data-index="${index}">
              Eliminar
            </button>
          </div>
        </div>
      </div>
    `;
  }).join('');

  container.html(productosHTML);

  // Event listeners
  $('.btn-eliminar').on('click', function() {
    const index = $(this).data('index');
    eliminarProducto(index);
  });

  $('.cantidad-input').on('change', function() {
    const index = $(this).data('index');
    const nuevaCantidad = parseInt($(this).val());
    actualizarCantidad(index, nuevaCantidad);
  });
}

function renderResumenCarrito() {
  const container = $('#resumen-carrito');
  
  const subtotal = calcularSubtotal();
  const envio = 5000;
  const total = subtotal + envio;

  const resumenHTML = `
    <div class="d-flex justify-content-between mb-2">
      <span>Subtotal:</span>
      <span>${subtotal.toLocaleString('es-CL')} CLP</span>
    </div>
    <div class="d-flex justify-content-between mb-2">
      <span>Envío:</span>
      <span>${envio.toLocaleString('es-CL')} CLP</span>
    </div>
    <hr>
    <div class="d-flex justify-content-between mb-3">
      <strong>Total:</strong>
      <strong class="text-danger fs-4">${total.toLocaleString('es-CL')} CLP</strong>
    </div>
    
    <button class="btn btn-danger w-100 mb-2" id="btn-pagar">Proceder al Pago</button>
    <button class="btn btn-outline-danger w-100" id="btn-vaciar">Vaciar Carrito</button>
  `;

  container.html(resumenHTML);

  // Event listeners
  $('#btn-pagar').on('click', function() {
    alert('Funcionalidad de pago no implementada (demo)');
  });

  $('#btn-vaciar').on('click', function() {
    if (confirm('¿Estás seguro de vaciar el carrito?')) {
      vaciarCarrito();
    }
  });
}

function calcularSubtotal() {
  return productosEnCarrito.reduce((total, item) => {
    const producto = obtenerProducto(item.categoria, item.id);
    return total + (producto ? producto.precio * item.cantidad : 0);
  }, 0);
}

function eliminarProducto(index) {
  productosEnCarrito.splice(index, 1);
  cargarCarrito();
  console.log('Producto eliminado (demo)');
}

function actualizarCantidad(index, nuevaCantidad) {
  if (nuevaCantidad > 0) {
    productosEnCarrito[index].cantidad = nuevaCantidad;
    renderResumenCarrito();
    console.log('Cantidad actualizada (demo)');
  }
}

function vaciarCarrito() {
  productosEnCarrito.length = 0;
  cargarCarrito();
  alert('Carrito vaciado (demo)');
}

function capitalizar(str) {
  return str.charAt(0).toUpperCase() + str.slice(1);
}

/* =============== EJECUTAR TODO =================== */
$(document).ready(function() {
  cargarCarrito();
});
