const sdlcPhases = {
    Waterfall: ["Requirement Analysis", "System Design", "Implementation", "Testing", "Deployment", "Maintenance"],
    Agile: ["Concept", "Inception", "Iteration/Construction", "Release", "Production", "Retirement"],
    Scrum: ["Product Backlog", "Sprint Planning", "Daily Scrum", "Sprint Review", "Sprint Retrospective"]
};

document.getElementById('model').addEventListener('change', function () {
    generatePhaseInputs(this.value);
});

document.getElementById('sdlcForm').addEventListener('submit', function (e) {
    e.preventDefault();
    saveFormData();
    // alert("Data saved! You can view it on the display page.");
    window.location.href = "teamDetailsDisplay.html";

});

function generatePhaseInputs(model) {
    const phasesDiv = document.getElementById('phases');
    phasesDiv.innerHTML = "";

    const phases = sdlcPhases[model];
    phases.forEach(phase => {
        const phaseContainer = document.createElement('div');

        const label = document.createElement('label');
        label.innerText = `Who will work on ${phase}?`;

        const memberInput = document.createElement('input');
        memberInput.type = 'text';
        memberInput.placeholder = "Enter Team Member Name";

        const emailInput = document.createElement('input');
        emailInput.type = 'email';
        emailInput.placeholder = "Enter Team Member Email";

        const startDateInput = document.createElement('input');
        startDateInput.type = 'date';

        const endDateInput = document.createElement('input');
        endDateInput.type = 'date';

        phaseContainer.append(label, memberInput, emailInput, startDateInput, endDateInput);
        phasesDiv.appendChild(phaseContainer);
    });
}

function saveFormData() {
    const model = document.getElementById('model').value;
    const data = {
        model,
        members: Array.from(document.querySelectorAll('#phases > div')).map(div => ({
            name: div.querySelector('input[type="text"]').value,
            email: div.querySelector('input[type="email"]').value,
            start: div.querySelector('input[type="date"]').value,
            end: div.querySelectorAll('input[type="date"]')[1].value,
        }))
    };
    localStorage.setItem('teamData', JSON.stringify(data));
}

function loadSavedData() {
    const savedData = JSON.parse(localStorage.getItem('teamData'));
    if (savedData) {
        document.getElementById('model').value = savedData.model;
        generatePhaseInputs(savedData.model);
    }
}

window.onload = loadSavedData;