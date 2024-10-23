<%@ page import="com.daza.api.servlet.controlagua.dto.Usuario" %>
<%@ page import="com.daza.api.servlet.controlagua.service.UsuarioService" %>
<%@ page import="com.daza.api.servlet.controlagua.service.UsuarioServiceImp" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="shortcut icon" href="imagenes/logoDIA.png" type="image/x-icon">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.css" rel="stylesheet" />
</head>
<body>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    UsuarioService service = new UsuarioServiceImp();
    List<Usuario> usuarios = service.listarUsuarios();
%>
<button data-drawer-target="sidebar-multi-level-sidebar" data-drawer-toggle="sidebar-multi-level-sidebar" aria-controls="sidebar-multi-level-sidebar" type="button" class="inline-flex items-center p-2 mt-2 ms-3 text-sm text-gray-500 rounded-lg sm:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600">
    <span class="sr-only">Open sidebar</span>
    <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
        <path clip-rule="evenodd" fill-rule="evenodd" d="M2 4.75A.75.75 0 012.75 4h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 4.75zm0 10.5a.75.75 0 01.75-.75h7.5a.75.75 0 010 1.5h-7.5a.75.75 0 01-.75-.75zM2 10a.75.75 0 01.75-.75h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 10z"></path>
    </svg>
</button>

<aside id="sidebar-multi-level-sidebar" class="fixed top-0 left-0 w-64 h-screen transition-transform -translate-x-full sm:translate-x-0 shadow-lg bg-gradient-to-b from-gray-50 to-gray-200 dark:from-gray-800 dark:to-gray-900" aria-label="Sidebar">
    <div class="h-full px-4 py-6 overflow-y-auto">
        <ul class="space-y-6 font-medium">
            <li>
                <a href="#" class="flex items-center justify-center flex-col">
                    <img src="https://cdn-icons-png.flaticon.com/256/8421/8421331.png" class="w-2/6 transition-transform transform hover:scale-105 duration-300" alt="Logo-DIA">
                    <h4 class="mt-2 text-2xl font-bold text-gray-700 dark:text-gray-200 hover:text-gray-900 dark:hover:text-white transition-colors duration-300">DIA</h4>
                </a>
            </li>

            <!-- Usuarios -->
            <li>
                <a href="user?action=listar" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-200 dark:hover:bg-gray-700 transition-colors duration-300">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="flex-shrink-0 w-5 h-5 text-gray-600 transition-colors duration-300 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" >
                        <path d="M4.5 6.375a4.125 4.125 0 1 1 8.25 0 4.125 4.125 0 0 1-8.25 0ZM14.25 8.625a3.375 3.375 0 1 1 6.75 0 3.375 3.375 0 0 1-6.75 0ZM1.5 19.125a7.125 7.125 0 0 1 14.25 0v.003l-.001.119a.75.75 0 0 1-.363.63 13.067 13.067 0 0 1-6.761 1.873c-2.472 0-4.786-.684-6.76-1.873a.75.75 0 0 1-.364-.63l-.001-.122ZM17.25 19.128l-.001.144a2.25 2.25 0 0 1-.233.96 10.088 10.088 0 0 0 5.06-1.01.75.75 0 0 0 .42-.643 4.875 4.875 0 0 0-6.957-4.611 8.586 8.586 0 0 1 1.71 5.157v.003Z"/>
                    </svg>
                    <span class="ms-3 text-gray-700 dark:text-gray-300">Usuarios</span>
                </a>
            </li>

            <!-- Control -->
            <li>
                <a href="control?action=listar" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-200 dark:hover:bg-gray-700 transition-colors duration-300">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-6 h-6 text-gray-600 dark:text-gray-400 transition-colors duration-300">
                        <path d="M21.731 2.269a2.625 2.625 0 0 0-3.712 0l-1.157 1.157 3.712 3.712 1.157-1.157a2.625 2.625 0 0 0 0-3.712ZM19.513 8.199l-3.712-3.712-8.4 8.4a5.25 5.25 0 0 0-1.32 2.214l-.8 2.685a.75.75 0 0 0 .933.933l2.685-.8a5.25 5.25 0 0 0 2.214-1.32l8.4-8.4Z"/>
                    </svg>
                    <span class="ms-3 text-gray-700 dark:text-gray-300">Control</span>
                </a>
            </li>

            <li>
                <a href="agregar-control.jsp" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-200 dark:hover:bg-gray-700 transition-colors duration-300">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-6 h-6 text-gray-600 dark:text-gray-400 transition-colors duration-300">
                        <path fill-rule="evenodd" d="M12 2.25c-5.385 0-9.75 4.365-9.75 9.75s4.365 9.75 9.75 9.75 9.75-4.365 9.75-9.75S17.385 2.25 12 2.25ZM12.75 6a.75.75 0 0 0-1.5 0v6c0 .414.336.75.75.75h4.5a.75.75 0 0 0 0-1.5h-3.75V6Z" clip-rule="evenodd" />
                    </svg>
                    <span class="ms-3 text-gray-700 dark:text-gray-300">Controlar</span>
                </a>
            </li>

            <li>
                <a href="buscar.jsp" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-200 dark:hover:bg-gray-700 transition-colors duration-300">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="flex-shrink-0 w-6 h-6 text-gray-600 dark:text-gray-400 transition-colors duration-300 group-hover:text-gray-900 dark:group-hover:text-white">
                        <path fill-rule="evenodd" d="M10.5 3.75a6.75 6.75 0 1 0 0 13.5 6.75 6.75 0 0 0 0-13.5ZM2.25 10.5a8.25 8.25 0 1 1 14.59 5.28l4.69 4.69a.75.75 0 1 1-1.06 1.06l-4.69-4.69A8.25 8.25 0 0 1 2.25 10.5Z" clip-rule="evenodd" />
                    </svg>
                    <span class="flex-1 ms-3 text-gray-700 dark:text-gray-300">Buscar</span>
                    <span class="inline-flex items-center justify-center w-5 h-5 text-sm font-medium text-blue-800 bg-blue-100 rounded-full dark:bg-blue-900 dark:text-blue-300"><%=usuarios.size()%></span>
                </a>
            </li>


            <!-- Otros ítems aquí con mismo estilo... -->
            <li>
                <button type="button" class="flex items-center w-full p-2 text-base text-gray-900 transition duration-300 rounded-lg group hover:bg-gray-200 dark:text-white dark:hover:bg-gray-700" aria-controls="dropdown-example" data-collapse-toggle="dropdown-example">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="flex-shrink-0 w-6 h-6 text-gray-600 transition-colors duration-300 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white">
                        <path fill-rule="evenodd" d="M18.685 19.097A9.723 9.723 0 0 0 21.75 12c0-5.385-4.365-9.75-9.75-9.75S2.25 6.615 2.25 12a9.723 9.723 0 0 0 3.065 7.097A9.716 9.716 0 0 0 12 21.75a9.716 9.716 0 0 0 6.685-2.653Zm-12.54-1.285A7.486 7.486 0 0 1 12 15a7.486 7.486 0 0 1 5.855 2.812A8.224 8.224 0 0 1 12 20.25a8.224 8.224 0 0 1-5.855-2.438ZM15.75 9a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0Z" clip-rule="evenodd" />
                    </svg>
                    <span class="flex-1 ms-3 text-left rtl:text-right text-gray-700 dark:text-gray-300">Perfil</span>
                    <svg class="w-4 h-4 transition-transform duration-300 group-hover:rotate-180" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4" />
                    </svg>
                </button>
                <ul id="dropdown-example" class="hidden py-2 space-y-2">
                    <li>
                        <a href="personalizar.jsp" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-200 dark:hover:bg-gray-700 group">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="flex-shrink-0 w-5 h-5 text-gray-600 transition-colors duration-300 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white">
                                <path fill-rule="evenodd" d="M11.078 2.25c-.917 0-1.699.663-1.85 1.567L9.05 4.889c-.02.12-.115.26-.297.348a7.493 7.493 0 0 0-.986.57c-.166.115-.334.126-.45.083L6.3 5.508a1.875 1.875 0 0 0-2.282.819l-.922 1.597a1.875 1.875 0 0 0 .432 2.385l.84.692c.095.078.17.229.154.43a7.598 7.598 0 0 0 0 1.139c.015.2-.059.352-.153.43l-.841.692a1.875 1.875 0 0 0-.432 2.385l.922 1.597a1.875 1.875 0 0 0 2.282.818l1.019-.382c.115-.043.283-.031.45.082.312.214.641.405.985.57.182.088.277.228.297.35l.178 1.071c.151.904.933 1.567 1.85 1.567h1.844c.916 0 1.699-.663 1.85-1.567l.178-1.072c.02-.12.114-.26.297-.349.344-.165.673-.356.985-.57.167-.114.335-.125.45-.082l1.02.382a1.875 1.875 0 0 0 2.28-.819l.923-1.597a1.875 1.875 0 0 0-.432-2.385l-.84-.692c-.095-.078-.17-.229-.154-.43a7.614 7.614 0 0 0 0-1.139c-.016-.2.059-.352.153-.43l.84-.692c.708-.582.891-1.59.433-2.385l-.922-1.597a1.875 1.875 0 0 0-2.282-.818l-1.02.382c-.114.043-.282.031-.449-.083a7.49 7.49 0 0 0-.985-.57c-.183-.087-.277-.227-.297-.348l-.179-1.072a1.875 1.875 0 0 0-1.85-1.567h-1.843ZM12 15.75a3.75 3.75 0 1 0 0-7.5 3.75 3.75 0 0 0 0 7.5Z" clip-rule="evenodd" />
                            </svg>
                            <span class="ms-3 text-gray-700 dark:text-gray-300">Personalizar</span>
                        </a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="login.jsp" class="flex items-center p-2 text-gray-900 rounded-lg transition-colors duration-300 dark:text-white hover:bg-gray-200 dark:hover:bg-gray-700 group">
                    <svg class="flex-shrink-0 w-6 h-6 text-gray-600 transition-colors duration-300 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 16" aria-hidden="true">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 8h11m0 0L8 4m4 4-4 4m4-11h3a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-3" />
                    </svg>
                    <span class="flex-1 ms-3 text-gray-700 dark:text-gray-300 whitespace-nowrap">Iniciar Sesión</span>
                </a>
            </li>


            <!-- Cerrar sesión -->
            <li>
                <a href="logout" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-200 dark:hover:bg-gray-700 transition-colors duration-300">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-6 h-6 text-gray-600 dark:text-gray-400 transition-colors duration-300">
                        <path fill-rule="evenodd" d="M16.5 3.75a1.5 1.5 0 0 1 1.5 1.5v13.5a1.5 1.5 0 0 1-1.5 1.5h-6a1.5 1.5 0 0 1-1.5-1.5V15a.75.75 0 0 0-1.5 0v3.75a3 3 0 0 0 3 3h6a3 3 0 0 0 3-3V5.25a3 3 0 0 0-3-3h-6a3 3 0 0 0-3 3V9A.75.75 0 1 0 9 9V5.25a1.5 1.5 0 0 1 1.5-1.5h6ZM5.78 8.47a.75.75 0 0 0-1.06 0l-3 3a.75.75 0 0 0 0 1.06l3 3a.75.75 0 0 0 1.06-1.06l-1.72-1.72H15a.75.75 0 0 0 0-1.5H4.06l1.72-1.72a.75.75 0 0 0 0-1.06Z"/>
                    </svg>
                    <span class="ms-3 text-gray-700 dark:text-gray-300">Cerrar Sesión</span>
                </a>
            </li>
        </ul>
    </div>
</aside>

<script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.js"></script>

</body>
</html>
