var lan1 = null;
var lan2 = null;
var lan3 = null;
var signup = null;
var signin = null;
var userInformation = null;
var logoutset = null;
var sizeFlag = null;
var innerWidth1 = null;

window.onload = function(event){
    lan1 = document.getElementById("lan1");
    lan2 = document.getElementById("lan2");
    lan3 = document.getElementById("lan3");
    userInformation = document.getElementById("userInformation");
    logoutset = document.getElementById("logoutset");
    signup = document.getElementById("signup");
    signin = document.getElementById("signin");

    innerWidth1 = window.innerWidth;
    if(innerWidth1 > 900){
        sizeFlag = 1;
    } else if (innerWidth1 <= 900){
        lan1.textContent = "en";
        lan2.textContent = "kr";
        lan3.textContent = "jp";
        sizeFlag = 0;
        if(userInformation != null) {
            userInformation.parentElement.removeChild(logoutset);
        } else if(signin != null) {
            signin.parentElement.removeChild(signup);
        }

    }
}



window.onresize = function(event){
    var innerWidth2 = window.innerWidth
    if(innerWidth2 > 900 && sizeFlag == 0){
        lan1.textContent = "English";
        lan2.textContent = "Korean";
        lan3.textContent = "Japanese";
        sizeFlag = 1;

        if(userInformation != null) {
            userInformation.parentElement.appendChild(logoutset);
        } else if(signin != null) {
            signin.parentElement.appendChild(signup);
        }

    } else if (innerWidth2 <= 900 && sizeFlag == 1) {
        lan1.textContent = "en";
        lan2.textContent = "kr";
        lan3.textContent = "jp";
        sizeFlag = 0;

        if(userInformation != null) {
            userInformation.parentElement.removeChild(logoutset);
        } else if(signin != null) {
            signin.parentElement.removeChild(signup);
        }

    }

}