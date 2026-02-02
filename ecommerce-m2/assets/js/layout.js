// /assets/js/layout.js

// La idea es que este me sirva para cargar el navbar y el 
// footer en todas las páginas con rutas dinámicas
function cargarLayout(){
  // buscar el path actual
  const path = window.location.pathname;
  let urlBase = "";

  // url final según la ruta
  if(path.includes("/pages/productos/")){
    urlBase = "../../";
  } else if(path.includes("/pages/")){
    urlBase = "../";
  } else {
    urlBase = "./";
  }

  window.BASE_URL = urlBase;

  // cargar navbar y footer
  $.get(urlBase + "components/navbar.html", function(data){
    const navbarHTML = data.replace(/{BASE_URL}/g, urlBase);
    $("#navbar").html(navbarHTML);
  });

  $.get(urlBase + "components/footer.html", function(data){
    const footerHTML = data.replace(/{BASE_URL/g, urlBase);
    $("#footer").html(footerHTML);
  });

  $("main").addClass("min-vh-100");
}

// ejecutar la función al cargar el documento
$(document).ready(function(){
  cargarLayout();
});
