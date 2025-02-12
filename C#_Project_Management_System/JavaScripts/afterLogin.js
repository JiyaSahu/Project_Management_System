// JavaScript Logic:
// Initial project storage setup
let projects = JSON.parse(localStorage.getItem('projects')) || [];
let currentProjectIndex = null; // Store the index of the currently selected project

window.onload = function () {
    loadProjects(); // Load projects when the page loads
};

// Toggle the visibility of the Add Project section
function toggleAddProject() {
    const addProjectSection = document.getElementById('add-project-section');
    addProjectSection.style.display = addProjectSection.style.display === 'block' ? 'none' : 'block';
}

// Function to add a new project to the list
function addNewProject() {
    const projectName = document.getElementById('project-input').value;
    if (projectName) {
        // Create a new project with unique ID
        const newProject = { id: projects.length + 1, name: projectName, chartData: [], teamData: [] };
        projects.push(newProject);
        localStorage.setItem('projects', JSON.stringify(projects)); // Save projects to local storage
        document.getElementById('project-input').value = ''; // Clear input
        loadProjects(); // Refresh project list
        toggleAddProject(); // Hide the add project section
    }
}

// Load and display the list of projects
function loadProjects() {
    const projectList = document.getElementById('projects-list');
    projectList.innerHTML = ''; // Clear current list
    projects.forEach((project, index) => {
        const projectItem = document.createElement('div');
        projectItem.classList.add('project-item');
        projectItem.textContent = project.name; // Display project name
        projectItem.setAttribute('onclick', `showProjectDetails(${index})`); // Set click event to show details

        // Create a delete button
        const deleteButton = document.createElement('button');
        deleteButton.classList.add('delete-button');
        deleteButton.textContent = 'Delete';
        deleteButton.onclick = (e) => {
            e.stopPropagation(); // Prevent triggering the project detail
            deleteProject(index);
        };

        projectItem.appendChild(deleteButton); // Append delete button to project item
        projectList.appendChild(projectItem); // Add project item to the list
    });
}

// Function to delete a project
function deleteProject(index) {
    if (confirm('Are you sure you want to delete this project?')) {
        projects.splice(index, 1); // Remove the project from the array
        localStorage.setItem('projects', JSON.stringify(projects)); // Update local storage
        loadProjects(); // Refresh project list
    }
}

// Show project details when a project is clicked
function showProjectDetails(index) {
    const project = projects[index];
    currentProjectIndex = index; // Save the index of the current project
    document.getElementById('project-title').textContent = project.name; // Set project title
    document.getElementById('project-description').textContent = 'Details for ' + project.name; // Placeholder for description
    document.getElementById('details-page').style.display = 'block'; // Show details page
    document.getElementById('projects-list').style.display = 'none'; // Hide project list
}

// Go back to project list
function goBack() {
    document.getElementById('details-page').style.display = 'none'; // Hide details page
    document.getElementById('projects-list').style.display = 'block'; // Show project list
}

// Check and show project details based on selection
function checkAndShowProjectDetailsChart(chartType) {
    const project = projects[currentProjectIndex];
    if (chartType === 0) {
        window.location.href = 'index.html'; // Link to the Chart page
        // Here you would replace the alert with the actual logic to show chart data
    } else {
        window.location.href = 'diagram2.html';
        // Here you would replace the alert with the actual logic to show team details
    }
}


function checkAndShowProjectDetails(chartType) {
    const project = projects[currentProjectIndex];
    if (chartType === 0) {
        window.location.href = 'teamDetailsInput2.html'; // Link to the Chart page
        // Here you would replace the alert with the actual logic to show chart data
    } else {
        window.location.href = 'display.html';
        // Here you would replace the alert with the actual logic to show team details
    }
}

// Toggle dropdown menu visibility
function toggleDropdown() {
    document.getElementById('dropdown').classList.toggle('show'); // Toggle dropdown visibility
}

// Close the dropdown if clicked outside
window.onclick = function (event) {
    if (!event.target.matches('.user-name')) {
        const dropdowns = document.getElementsByClassName("dropdown-content");
        for (let i = 0; i < dropdowns.length; i++) {
            const openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) {
                openDropdown.classList.remove('show');
            }
        }
    }
}