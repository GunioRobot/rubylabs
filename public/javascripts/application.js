// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function greeting() {
    document.write("Hello. This is a Javascript");
}

function show_confirm() {
    var r=confirm("Press a button");
    if (r==true) {
	alert("You pressed OK!") }
    else {
	alert("You pressed Cancel!") }
}

function show_prompt() {
    var name=prompt("Please enter your name", "Harry Potter");
    if (name != null && name != "") {
	this.document.write("Hello " + name + "! How are you today?");
    }
}

function menu_list(n) {
    for (i=0; i<=n; i++) {
	if (i==3) {
	    continue;
	}
	document.write("<li>sidebar item " + i + "</li>");
	document.write("<br/>");
    }
}

function menu_listt(n,m) {
    var i=m;
    do {
	document.write("<li>while item " + i + "</li>");
	document.write("<br/>");
	i++;
    } while (i<n);
}

function my_cars() {
    var x;
    var mycars = new Array();
    mycars[0] = "Saab";
    mycars[1] = "Volvo";
    mycars[2] = "BMW";

    for (x in mycars) {
	document.write(mycars[x] + "<br/>");
    }
}
