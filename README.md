This is my result for practicing html and JSP files and mysql.
Activated site is "http://envir-astro.ga" that I open.
Use tomcat8 in rasberrypi OS, mariadb-java-client-2.2.0.jar, commons-io-2.11.0.jar and commons-fileupload-1.4.jar.
There are sourse of "jsp", "css", "js" in "webapps/ROOT"

* upload file to server of rasberrypi
* manipulate contents with sql
* design in bootstrap and a little customized my css
* set servlet and blind real path and file in WEB-INF/xml

Defined table is

create table address(
	userID char(50) not null,
	userPassword char(50) not null,
    userNickname char(50) not null,
    userDate char(20) not null,
    primary key(userID)
    );

create table post(
	postID int auto_increment,
	userID char(50) not null,
	title varchar(100) not null,
    contents text not null,
    userNickname char(50) not null,
    uploadDate char(20) not null,
    imageCount int not null,
    imageDir varchar(300),
    imageNames varchar(300),
    primary key(postID)
    );
    
create table comments(
	commentsID int auto_increment,
    postID int not null,
    userID char(50) not null,
    contents text not null,
    userNickname char(50) not null,
    uploadDate char(20) not null,
	primary key(commentsID)
    );
