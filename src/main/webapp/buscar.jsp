<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html lang="es" datatype="HTML">
<head>
    <title>Buscar | DIA</title>
    <meta charset="UTF-8" lang="es" name="DIA">
    <script src="https://cdn.tailwindcss.com"></script>
    <link type="text/css" rel="stylesheet" href="estilos/style.css" >
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

<style>@import url(https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.min.css);
</style>
<style>
    .min-w-80 {
        min-width: 20rem;
    }
    .resize::-webkit-resizer,
    .resize-x::-webkit-resizer,
    .resize-y::-webkit-resizer {
        background-color: transparent;
    }
    .resize:after,
    .resize-x:after,
    .resize-y:after {
        display: block;
        position: absolute;
        bottom: 5px;
        right: 5px;
        width: 24px;
        height: 24px;
        content: '\F045D';
        font: normal normal normal 24px/1 "Material Design Icons";
        text-rendering: auto;
        line-height: 24px;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        color: rgba(0,0,0,0.3);
    }
</style>

<div class="flex">
    <jsp:include page="aside.jsp" />

    <main class="p-4 sm:ml-64 w-full">
        <div class="p-4 border-2 border-gray-200 border-dashed rounded-lg dark:border-gray-700">


    <div class="flex justify-center items-center gap-2 p-6">
        <h2 class="text-blue-500 text-6xl font-mono">B</h2>
        <h2 class="text-red-500 text-6xl font-mono">U</h2>
        <h2 class="text-yellow-400 text-6xl font-mono">S</h2>
        <h2 class="text-blue-500 text-6xl font-mono">C</h2>
        <h2 class="text-green-500 text-6xl font-mono">A</h2>
        <h2 class="text-red-500 text-6xl font-mono">R</h2>

    </div>

    <div class="w-full mx-auto rounded-xl bg-gray-100 shadow-lg p-10 text-gray-800 relative overflow-hidden resize-x min-w-80 max-w-3xl" x-data="app()" x-init="generatePassword()">
        <div class="relative mt-1">
            <input type="text" id="search" class="w-full pl-3 pr-10 py-2 border-2 border-gray-200 rounded-xl hover:border-gray-300 focus:outline-none focus:border-blue-500 transition-colors" placeholder="Escribe un nombre..." onkeyup="buscarUsuario()" />
            <button class="block w-7 h-7 text-center text-xl leading-0 absolute top-2 right-2 text-gray-400 focus:outline-none hover:text-gray-900 transition-colors"><i class="mdi mdi-magnify"></i></button>
        </div>
        <div class="absolute top-0 left-0 w-full h-2 flex">
            <div class="h-2 bg-blue-500 flex-1"></div>
            <div class="h-2 bg-red-500 flex-1"></div>
            <div class="h-2 bg-yellow-300 flex-1"></div>
            <div class="h-2 bg-blue-500 flex-1"></div>
            <div class="h-2 bg-green-500 flex-1"></div>
            <div class="h-2 bg-red-500 flex-1"></div>
        </div>
    </div>

            <!-- Resultados -->
            <div id="resultados" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mt-6"></div>

            <script>
                function buscarUsuario() {
                    // Obtener el valor del input de búsqueda
                    var query = document.getElementById("search").value;

                    // Hacer la solicitud Ajax
                    var xhr = new XMLHttpRequest();
                    xhr.open("GET", "buscar?query=" + query, true);
                    xhr.setRequestHeader("Content-Type", "application/json");

                    xhr.onreadystatechange = function () {
                        if (xhr.readyState == 4 && xhr.status == 200) {
                            var resultados = JSON.parse(xhr.responseText);
                            var listaResultados = document.getElementById("resultados");
                            listaResultados.innerHTML = "";

                            // Mostrar los resultados
                            if (resultados.length === 0) {
                                listaResultados.innerHTML = "<p class='text-gray-500 text-center col-span-3'>No se encontraron usuarios.</p>";
                            }

                            resultados.forEach(function(usuario) {
                                var div = document.createElement("div");

                                // Agregar clases de Tailwind
                                div.classList.add(
                                    "bg-white",
                                    "p-6",
                                    "border",
                                    "border-gray-200",
                                    "rounded-lg",
                                    "shadow-md",
                                    "hover:shadow-lg",
                                    "transition",
                                    "ease-in-out",
                                    "duration-300",
                                    "mb-4"
                                );

                                // Crear contenido del usuario con concatenación clásica
                                var content =
                                    '<h2 class="text-xl font-semibold text-gray-800 mb-2">' + usuario.nombre + ' ' + usuario.apellido + '</h2>' +
                                    '<p class="text-gray-600"><strong>Horas acumuladas:</strong> ' + usuario.horasAcumuladas + '</p>' +
                                    '<p class="text-gray-600"><strong>Minutos Semana:</strong> ' + usuario.minutosGratisSemana + '</p>' +
                                    '<p class="text-gray-600"><strong>Rol:</strong> ' + usuario.rol + '</p>';


                                // Añadir el contenido al div
                                div.innerHTML = content;

                                // Añadir el div al contenedor de resultados
                                listaResultados.appendChild(div);
                            });
                        }
                    };

                    xhr.send();
                }
            </script>


        </div>
    </main>
</div>

<script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.js"></script>

</body>
</html>
