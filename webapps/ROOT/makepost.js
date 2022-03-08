function loadFile(input) {
    var fileNameList = "Input File : ";
    var fileContents = input.files;
    var fileName = document.getElementById('fileName');
    var imageCount;
    fileNameList = fileNameList + fileContents[0].name;
    for(imageCount = 1; imageCount < fileContents.length; imageCount++){
        fileNameList = fileNameList + ', ' + fileContents[imageCount].name;
    }
    fileName.textContent = fileNameList;
};