/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
// Make sure the DOM is fully loaded before trying to access elementsư

    var newPassword = document.getElementById("newPassword");
    var confirmPassword = document.getElementById("confirmPassword");
    var registrationForm = document.getElementById("registrationForm");

    registrationForm.addEventListener("submit", function (event) {
        var passwordUser = newPassword.value;
        var confirmPasswordUser = confirmPassword.value;

        if (passwordUser != confirmPasswordUser) {
            alert("Passwords do not match. Please re-enter your password.");
            event.preventDefault(); 
        }
    });



