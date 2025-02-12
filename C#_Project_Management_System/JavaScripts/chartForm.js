// SDLC phases data
const sdlcPhases = {
    Waterfall: ["Requirement Analysis", "System Design", "Implementation", "Testing", "Deployment", "Maintenance"],
    Agile: ["Concept", "Inception", "Iteration/Construction", "Release", "Production", "Retirement"],
    Scrum: ["Product Backlog", "Sprint Planning", "Daily Scrum", "Sprint Review", "Sprint Retrospective"]
};

window.onload = function () {
    loadSavedData();
};

document.getElementById('model').addEventListener('change', function () {
    const selectedModel = this.value;
    generatePhaseInputs(selectedModel);
});

document.getElementById('sdlcForm').addEventListener('submit', function (e) {
    e.preventDefault();
    saveFormData();
});

function generatePhaseInputs(model) {
    const phasesDiv = document.getElementById('phases');
    phasesDiv.innerHTML = "";  // Clear old inputs

    const phases = sdlcPhases[model];
    phases.forEach(phase => {
        const phaseContainer = document.createElement('div');

        const label = document.createElement('label');
        label.innerText = `Who will work on ${phase}?`;

        const memberInput = document.createElement('input');
        memberInput.type = 'text';
        memberInput.name = phase + "_member";

        const daysLabel = document.createElement('label');
        daysLabel.innerText = `Days for ${phase}:`;

        const daysInput = document.createElement('input');
        daysInput.type = 'number';
        daysInput.name = phase + "_days";
        daysInput.min = 1;

        phaseContainer.appendChild(label);
        phaseContainer.appendChild(memberInput);
        phaseContainer.appendChild(daysLabel);
        phaseContainer.appendChild(daysInput);

        phasesDiv.appendChild(phaseContainer);
    });
}

function saveFormData() {
    const model = document.getElementById('model').value;
    const formData = {
        model: model,
        phases: {}
    };

    // Get input values
    const inputs = document.querySelectorAll('#phases input');
    inputs.forEach(input => {
        const phaseName = input.name.split('_')[0];
        if (!formData.phases[phaseName]) {
            formData.phases[phaseName] = {};
        }
        if (input.name.includes('_member')) {
            formData.phases[phaseName].member = input.value;
        } else if (input.name.includes('_days')) {
            formData.phases[phaseName].days = input.value;
        }
    });

    localStorage.setItem('sdlcData', JSON.stringify(formData));
    window.location.href = 'chartDisplay.html';  // Redirect to diagram page
}


function loadSavedData() {
    const savedData = JSON.parse(localStorage.getItem('sdlcData'));
    if (savedData) {
        document.getElementById('model').value = savedData.model;
        generatePhaseInputs(savedData.model);

        const inputs = document.querySelectorAll('#phases input');
        inputs.forEach(input => {
            const phaseName = input.name.split('_')[0];
            const type = input.name.split('_')[1];
            input.value = savedData.phases[phaseName][type] || '';
        });
    }
}
