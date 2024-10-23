document.getElementById('menu-icon').addEventListener('click', function () {
    const navList = document.getElementById('nav-list');
    navList.classList.toggle('active');
});


// Resalta las filas al hacer clic
const tableRows = document.querySelectorAll('tbody tr');

tableRows.forEach(row => {
    row.addEventListener('click', () => {
        // Eliminar resaltado previo
        tableRows.forEach(r => r.style.backgroundColor = '');
        // Aplicar resaltado
        row.style.backgroundColor = '#d1ecf1';
    });
});

// Evento para los botones de acción
const actionButtons = document.querySelectorAll('.action-btn');

actionButtons.forEach(button => {
    button.addEventListener('click', (event) => {
        event.stopPropagation(); // Evitar que el clic afecte la fila
        if (button.classList.contains('btn-primary')) {
            alert('Editando registro...');
        } else if (button.classList.contains('btn-danger')) {
            if (confirm('¿Seguro que deseas eliminar este registro?')) {
                alert('Registro eliminado');
            }
        }
    });
});
