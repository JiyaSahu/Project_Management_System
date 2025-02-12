<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="afterLogin.aspx.cs" Inherits="C__Project_Management_System.afterLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Management</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            background-color: #f4f4f4;
        }

        .logo {
            margin-bottom: 30px;
            text-align: center;
        }

            .logo img {
                max-width: 100%;
                height: auto;
            }

        .container {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 250px;
            background-color: #333;
            color: white;
            padding: 20px;
        }

            .sidebar h2 {
                margin-bottom: 20px;
            }

            .sidebar button {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                background-color: #007bff;
                border: none;
                color: white;
                cursor: pointer;
            }

        .projects-list {
            margin-top: 20px;
        }

        .project-item {
            color: black;
            background-color: #fff;
            padding: 10px;
            margin-bottom: 10px;
            cursor: pointer;
            border: 1px solid #ddd;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .sidebar .delete-button {
            width: 60px; /* Adjust as needed */
            height: 25px; /* Adjust as needed */
            background-color: red;
            color: white;
            border: none;
            font-size: 12px; /* Smaller font size */
            cursor: pointer;
            border-radius: 4px;
            padding: 2px; /* Less padding for a smaller button */
            text-align: center;
        }

        .content {
            flex-grow: 1;
            padding: 20px;
            background-color: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

            .header h2 {
                font-size: 24px;
            }

        .details-page {
            display: none;
        }

        .dynamicBox {
            display: flex;
        }

            .dynamicBox .content {
                display: flex;
                flex-direction: column;
                text-align: center;
                justify-content: center;
                gap: 5px;
                margin-top: 20px;
            }

        .circle {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            background-color: #fff;
            border: 1px solid #ddd;
            cursor: pointer;
            transition: transform 0.3s ease-in-out;
        }

            .circle:hover {
                transform: scale(1.1);
            }

        .tooltip {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #333;
            color: #fff;
            padding: 5px;
            border-radius: 5px;
            display: none;
        }

        .circle:hover .tooltip {
            display: block;
        }

        .user-section {
            text-align: right;
        }

        .user-name {
            cursor: pointer;
            font-weight: bold;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            right: 20px;
            background-color: #f9f9f9;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

                .dropdown-content a:hover {
                    background-color: #ddd;
                }

        .show {
            display: block;
        }

        .add-project-section {
            margin-top: 20px;
        }

            .add-project-section input {
                padding: 10px;
                width: 70%;
                margin-right: 10px;
            }

            .add-project-section button {
                padding: 10px 15px;
                background-color: #4d54ff;
                color: white;
                border: none;
                cursor: pointer;
            }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                height: auto;
            }

            .content {
                margin-top: 20px;
            }

            .circle {
                width: 100px;
                height: 100px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Sidebar -->
            <div class="sidebar">
                <div class="logo">
                    <img src="images/logo.png" alt="Logo" />
                </div>
                <button type="button" onclick="toggleAddProject()">Add Project</button>
                <div class="projects-list" id="projects-list"></div>
            </div>

            <!-- Main Content -->
            <div class="content">
                <div class="header">
                    <h2>Project Overview</h2>
                    <div class="dropdown">
                        <asp:Label ID="LabelUser" runat="server" class="user-name" Text="Guest ▼" OnClick="toggleDropdown()"></asp:Label>
                        <div class="dropdown-content" id="dropdown">
                            <a href="#">Profile</a>
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="Logout_Click">Logout</asp:LinkButton>
                            
                        </div>
                    </div>
                </div>

                <!-- Add Project Section -->
                <div id="add-project-section" class="add-project-section" style="display: none;">
                    <input type="text" id="project-input" placeholder="Enter project name" />
                    <button type="button" onclick="addNewProject()">Add Project</button>
                </div>

                <!-- Project Details -->
                <div id="details-page" class="details-page" style="display: none;">
                    <div class="header">
                        <h2 id="project-title">Project Details</h2>
                        <button type="button" onclick="goBack()">Back to Projects</button>
                    </div>
                    <p id="project-description">Description for this project will be here.</p>
                    <div class="dynamicBox">
                        <div class="content">
                            <a href="#" id="circle-link-1" onclick="checkAndShowProjectDetailsChart(0)">
                                <img src="images/chart.jpeg" class="circle" alt="Chart" />
                                <span class="tooltip">Chart Details</span>
                            </a>
                            <h1>Chart</h1>
                        </div>
                        <div class="content">
                            <a href="#" id="circle-link-2" onclick="checkAndShowProjectDetails(0)">
                                <img src="images/time.jpeg" alt="Team" class="circle" />
                                <span class="tooltip">Project Details</span>
                            </a>
                            <h1>Team Details</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Inline JavaScript -->
        <script>
            let projects = JSON.parse(localStorage.getItem('projects')) || [];
            let currentProjectIndex = null;

            window.onload = function () {
                loadProjects();
            };

            function toggleAddProject() {
                const addProjectSection = document.getElementById('add-project-section');
                addProjectSection.style.display = addProjectSection.style.display === 'block' ? 'none' : 'block';
            }

            function addNewProject() {
                const projectName = document.getElementById('project-input').value;
                if (projectName) {
                    const newProject = { id: projects.length + 1, name: projectName, chartData: [], teamData: [] };
                    projects.push(newProject);
                    localStorage.setItem('projects', JSON.stringify(projects));
                    document.getElementById('project-input').value = '';
                    loadProjects();
                    toggleAddProject();
                }
            }

            function loadProjects() {
                const projectList = document.getElementById('projects-list');
                projectList.innerHTML = '';
                projects.forEach((project, index) => {
                    const projectItem = document.createElement('div');
                    projectItem.className = 'project-item';
                    projectItem.textContent = project.name;
                    projectItem.setAttribute('onclick', `showProjectDetails(${index})`);

                    const deleteButton = document.createElement('button');
                    deleteButton.classList.add('delete-button');
                    deleteButton.textContent = 'Delete';
                    deleteButton.onclick = (e) => {
                        e.stopPropagation();
                        if (confirm('Are you sure you want to delete this project?')) {
                            deleteProject(index);
                        }
                    };

                    projectItem.appendChild(deleteButton);
                    projectList.appendChild(projectItem);
                });
            }

            function deleteProject(index) {
                projects.splice(index, 1);
                localStorage.setItem('projects', JSON.stringify(projects));
                loadProjects();
            }

            function showProjectDetails(index) {
                const project = projects[index];
                currentProjectIndex = index;
                document.getElementById('project-title').textContent = project.name;
                document.getElementById('project-description').textContent = 'Details for ' + project.name;
                document.getElementById('details-page').style.display = 'block';
                document.getElementById('projects-list').style.display = 'none';
            }

            function goBack() {
                document.getElementById('details-page').style.display = 'none';
                document.getElementById('projects-list').style.display = 'block';
            }

            

            // Check and show project details based on selection
            function checkAndShowProjectDetailsChart(chartType) {
                const project = projects[currentProjectIndex];
                if (chartType === 0) {
                    window.location.href = 'chartForm.html'; // Link to the Chart page
                    // Here you would replace the alert with the actual logic to show chart data
                } else {
                    window.location.href = 'chartDisplay.html';
                    // Here you would replace the alert with the actual logic to show team details
                }
            }

           

            function checkAndShowProjectDetails(chartType) {
                const project = projects[currentProjectIndex];
                if (chartType === 0) {
                    window.location.href = 'teamDetailsForm.html';

                    // Link to the Chart page
                    // Here you would replace the alert with the actual logic to show chart data
                } else {
                    window.location.href = 'teamDetailsDisplay.html';
                    
                    // Here you would replace the alert with the actual logic to show team details
                }
            }

            function toggleDropdown() {
                document.getElementById('dropdown').classList.toggle('show');
            }

            window.onclick = function (event) {
                if (!event.target.matches('.user-name')) {
                    const dropdowns = document.getElementsByClassName('dropdown-content');
                    for (let i = 0; i < dropdowns.length; i++) {
                        dropdowns[i].classList.remove('show');
                    }
                }
            };
        </script>
    </form>
</body>
</html>
