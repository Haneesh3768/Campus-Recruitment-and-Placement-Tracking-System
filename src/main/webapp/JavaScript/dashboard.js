// Toggle the sidebar
function toggleSidebar() {
    const sidebar = document.getElementById('sidebar');
    sidebar.classList.toggle('active');
}

// Toggle the dropdown for the specified type
function toggleDropdown(type) {
    const dropdownContent = document.getElementById(`${type}-dropdown`);
    const arrow = dropdownContent.previousElementSibling.querySelector('.arrow');
    dropdownContent.classList.toggle('show');

    // Rotate arrow when dropdown is toggled
    if (dropdownContent.classList.contains('show')) {
        arrow.style.transform = "rotate(180deg)";
    } else {
        arrow.style.transform = "rotate(0deg)";
    }
}


// Logout function
function logout() {
    window.location.href = "/admin/"; // Redirect to the login page
}

