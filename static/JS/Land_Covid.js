//function to show the hamburger menu
function show() {
    document.getElementById('hamburger').classList.toggle('active');
}

//function to set the site to the top when the site refreshes
window.onbeforeunload = function () {
    window.scrollTo(0,0);
};