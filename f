// Class representing a family member
class FamilyMember {
  constructor(name, age, gender) {
    this.name = name; // The name of the family member
    this.age = age; // The age of the family member
    this.gender = gender; // The gender of the family member
  }

  // Method to increment the age of the family member
  celebrateBirthday() {
    this.age += 1;
  }

  // Method to change the name of the family member
  changeName(newName) {
    this.name = newName;
  }
}

// Array to store all family members
const familyMembers = [];

// Function to handle the submission of a new family member
function submitFamilyMember() {
  const nameInput = document.getElementById('name'); // Input element for name
  const name = nameInput.value; // Value of the name input
  const ageInput = document.getElementById('age'); // Input element for age
  const age = parseInt(ageInput.value); // Parsed value of the age input
  const genderInput = document.getElementById('gender'); // Input element for gender
  const gender = genderInput.value; // Value of the gender input

  // Create a new family member object
  const familyMember = new FamilyMember(name, age, gender);
  familyMembers.push(familyMember); // Add the new family member to the array
  reloadFamilyMembers(); // Refresh the displayed list of family members
}

// Function to reload the list of family members in the table
function reloadFamilyMembers() {
  const familyList = document.getElementById("familyMembers").tBodies[0]; // Get the table body element
  familyList.innerHTML = ''; // Clear the table body

  // Loop through each family member and add them to the table
  for (const familyMember of familyMembers) {
    const row = document.createElement('tr'); // Create a new table row
    const index = familyMembers.indexOf(familyMember); // Get the index of the family member
    row.innerHTML = `
      <td>${familyMember.name}</td>
      <td>${familyMember.age}</td>
      <td>${familyMember.gender}</td>
      <td>
        <button onclick="celebrateBirthday(${index})">Add Age</button> <!-- Button to increase age -->
        <button onclick="changeName(${index})">Change Name</button> <!-- Button to change name -->
      </td>
    `;
    familyList.appendChild(row); // Append the row to the table
  }
}

// Function to increment the age of a specific family member
function celebrateBirthday(index) {
  familyMembers[index].celebrateBirthday(); // Call the method to increase age
  reloadFamilyMembers(); // Refresh the displayed list
}

// Function to change the name of a specific family member
function changeName(index) {
  const newName = prompt('Enter the new name:'); // Prompt the user for a new name
  if (newName) {
    familyMembers[index].changeName(newName); // Update the name if a new one is provided
    reloadFamilyMembers(); // Refresh the displayed list
  }
}
