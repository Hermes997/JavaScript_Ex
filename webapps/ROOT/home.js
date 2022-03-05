window.onload = function(event){
    var lan1 = document.getElementById("lan1");
    var lan2 = document.getElementById("lan2");
    var lan3 = document.getElementById("lan3");
    var signup = document.getElementById("signup");
    var signin = document.getElementById("signin");
    var userInfomation = document.getElementById("userInfomation");
    var logoutset = document.getElementById("logoutset");
    var sizeFlag = 0;
    var innerWidth1 = window.innerWidth;
    if(innerWidth1 > 900){
        lan1.textContent = "English";
        lan2.textContent = "Korean";
        lan3.textContent = "Japanese";
        sizeFlag = 1;
    } else if (innerWidth1 <= 900){
        signin.parentElement.removeChild(signup);
        userInfomation.parentElement.reremoveChildmove(logoutset);
        lan1.textContent = "en";
        lan2.textContent = "kr";
        lan3.textContent = "jp";
        sizeFlag = 0;
    }


    
}



window.onresize = function(event){
    var innerWidth2 = window.innerWidth
    if(innerWidth2 > 900 && sizeFlag == 0){
        lan1.textContent = "English";
        lan2.textContent = "Korean";
        lan3.textContent = "Japanese";
        sizeFlag = 1;
        signin.parentElement.appendChild(signup);
        userInfomation.parentElement.appendChild(logoutset);

    } else if (innerWidth2 <= 900 && sizeFlag == 1) {
        lan1.textContent = "en";
        lan2.textContent = "kr";
        lan3.textContent = "jp";
        sizeFlag = 0;
        signin.parentElement.removeChild(signup);
        userInfomation.parentElement.removeChild(logoutset);
    }

}