# Página de e-commerce JS

## Descripción
Proyecto de e-commerce desarrollado con JavaScript, HTML y CSS. Incluye funcionalidades como carrito de compras y diseño responsivo.

## Tecnologías Utilizadas
- HTML5
- CSS3
- JavaScript (ES6+)
- Bootstrap 5
- jQuery

## Capturas de pantalla
  ![Captura Hero Section](./assets/img/screenshot1.jpg)
  ![Captura Sección Productos Destacados](./assets/img/screenshot2.jpg)

## Estructura del Proyecto
```sh
\ECOMMERCE-M2
│   index.html
│   README.md
├───assets
│   ├───css
│   ├───fonts
│   ├───img
│   ├───js
│   ├───json
│   └───vendors
│       ├───bootstrap
│       └───jquery
├───components
└───pages
    └───productos
```
Donde la carpeta `assets` contiene todos los recursos estáticos, `components` incluye fragmentos reutilizables de HTML, y `pages` alberga las diferentes páginas del sitio.

La carpeta `pages/productos` contiene una página por categoría de producto, que carga los productos de manera dinámica. Estos producos están guardados en `assets/js/productos.js`.

## Requisitos Tarea
- [x] Barra de navegación
- [x] Links de navegación
- [x] Listar productos en tarjetas
- [ ] Botones para comprar
- [ ] Link a carrito de compras
- [x] Footer con información de la tienda
- [x] Páginas de descripción del producto

### Desafíos extra
- [x] Hacer las páginas de productos dinámicas
- [ ] Usar localStorage para el carrito 
- [ ] Cambiar los errores por querysting por algo que se vea en el DOM