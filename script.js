function toggleLogin() {
    document.getElementById("login-form").classList.remove("hidden");
    document.getElementById("signup-form").classList.add("hidden");
}

function toggleSignup() {
    document.getElementById("signup-form").classList.remove("hidden");
    document.getElementById("login-form").classList.add("hidden");
}

function login() {
    let username = document.getElementById("login-username").value;
    let password = document.getElementById("login-password").value;
    
    if (username && password) {
        alert("Login successful!");
    } else {
        alert("Please enter username and password.");
    }
}

function signup() {
    let username = document.getElementById("signup-username").value;
    let password = document.getElementById("signup-password").value;
    
    if (username && password) {
        alert("Signup successful! Please login.");
        toggleLogin();
    } else {
        alert("Please fill in all fields.");
    }
}

function findRepairShop() {
    let model = document.getElementById("phone-model").value;
    let result = document.getElementById("repair-shop-result");
    
    if (model) {
        result.innerText = "Nearest repair shop found for " + model + " at XYZ location.";
    } else {
        result.innerText = "Please select a phone model.";
    }
}
