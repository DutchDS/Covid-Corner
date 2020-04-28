//function to show the hamburger menu
function show() {
  document.getElementById('hamburger').classList.toggle('active');
}

//function to set the site to the top when the site refreshes
window.onbeforeunload = function () {
  window.scrollTo(0,0);
};

// Get a reference to the page tags
//##################################
var get_submit = d3.select("#submitAll");

// TO BE CREATED!
var url_get_states = "/api/v1.0/states_list"
var url = "/api/v1.0/bar_states";
var get_shape = d3.select("#selectState");

var url_get_counties = "/api/v1.0/counties_list"
var url_counties = "/api/v1.0/bar_counties";
var get_county = d3.select("#selectCounty");

var get_company= d3.select("#selectCompany");

var listCompanies = []

var chosen_state = ""

d3.select("#selectState").append("option").text("Select State");
d3.select("#selectCounty").append("option").text("Select County");
d3.select("#selectCompany").append("option").text("Select Company");
// d3.select("#selectCompany").append("option").text("Select Company");

// ###### FIRST BOX - FILL STATES ##### //
function loadDropDown_States(myId, myText) {d3.json(url_get_states).then(function(response) {

  var shortStates = []

  for (var i in response) {
      shortStates.push(response[i].state_name)
          }
 
      var inputDate = d3.select(myId) 
  
      inputDate.html(" ");
  
      console.log(shortStates);
      var cell = inputDate.append("option").text(myText);
  
      shortStates.forEach((f) => {
      var cell = inputDate.append("option")
      cell.text(f);
      });
  })};

loadDropDown_States("#selectState","Select State");

// ###### SECOND BOX - FILL COUNTIES BASED ON SELECTED STATE ##### //
function loadDropDown_Counties(myId, state, myText) {d3.json(url_get_counties).then(function(response) {

  // Create an array with only those counties within a chosen state
  var shortShapesCounties = []

  for (var i in response) {
      if (response[i].state == state)
          shortShapesCounties.push(response[i].county)
          }
 
  var inputDate = d3.select(myId) 
  
  inputDate.html(" ");
  
  console.log(shortShapesCounties);
  var cell = inputDate.append("option").text(myText);
  
  shortShapesCounties.forEach((f) => {
      var cell = inputDate.append("option")
      cell.text(f);
      });
  })};

// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  
// ###### THIRD BOX - FILL COMPANIES BASED ON SELECTED STATE, COUNTY ##### //
function loadDropDown_Companies(myId, state, county, myText) {
  
  url_get_companies = '/api/v1.0/companies_list/' +  state + '/' + county
  console.log(url_get_companies)
  
  d3.json(url_get_companies).then(function(response) {

  // Create an array with only those counties within a chosen state
  var listCompanies = []

  for (var i in response) {
      listCompanies.push(response[i].company_name)
          }
 
  var inputTag = d3.select(myId) 
  
  console.log(myId)
  inputTag.html(" ");
  
  console.log(listCompanies);
  var cell = inputTag.append("option").text(myText);
  
  listCompanies.forEach((f) => {
      var cell = inputTag.append("option")
      cell.text(f);
      });
  })};

// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

// ###### THIRD BOX - FILL STORES ##### //  
// function loadDropDowns(myId, myshortList, myText) {
//     // var tbody = d3.select("tbody");
//     var inputDate = d3.select(myId) 
    
//     inputDate.html(" ");
  
//     // d3.select("#selectCompany").append("option").text("Select Company");
//     console.log(myshortList);

//     var cell = inputDate.append("option").text(myText);
    
//     myshortList.forEach((f) => {
//       console.log(f);
//       cell = inputDate.append("option")
//       cell.text(f);
  
//       });
//     };

// listCompanies = ['Schnucks','Ace','CarX','Dierbergs','Shell Gas Station']
// console.log(listCompanies)
// loadDropDowns("#selectCompany",listCompanies, "Select Company");

get_shape.on("change", function() {
    let inputValueShape = d3.select("#selectState").property("value");
    state = inputValueShape
    chosen_state = state
    loadDropDown_Counties("#selectCounty",state,"Select County");
    console.log(state)
    // get_data(state)
  })
  
get_county.on("change", function() {
    let inputValueCounty = d3.select("#selectCounty").property("value");
    chosen_county = inputValueCounty
    console.log(chosen_state, chosen_county);
    loadDropDown_Companies("#selectCompany",chosen_state, chosen_county,"Select Company");
     });

//  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
get_company.on("change", function() {

    if (chosen_state == "" | chosen_county == "") {
      $(document).ready(function(){
        $("#alert-message").html("Chose both State and County First");
       });
    }
    else {
        let inputValueCompany = d3.select("#selectCompany").property("value");
        chosen_company = inputValueCompany
        console.log(chosen_state, chosen_county, chosen_company);}
      });
//  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

// WE HAVE TO THINK ABOUT THIS ONE.... On Submit the page should be redirected to an endpoint from FLASK
get_submit.on("click", function() {
  url_visit_id = "/api/v1.0/get_visit_id"

  console.log(url_visit_id)

  // get_model_data(url_model)

  d3.json(url_visit_id).then(function(response) {
    
    console.log(response);
    
    console.log(response[0]);

    unique_VISIT_ID = chosen_company + "_" + response[0].VISIT_ID
    // if (response.prediction == 1) {
      // alert("Based on statistics, things aren't looking so well. Please see a doctor as soon as possible!" );
      $(document).ready(function(){
        $("#alert-message").html(" ");
        $("#alert-message").append("New VISIT_ID: " + unique_VISIT_ID);
        $("#alert-message").append("<br>");
        // $("#alert-message").append("<br>" + "Chosen Model: " + response.model) ;
        // $("#alert-message").append("<br>" + "Test Score: " + response.test_score);
      });

    
    })
});

    //opens the alert box
    $(document).ready(function(){
      $("#bar_model").html("");

      $("#submitAll").click(function() {
        $("#alert")
        .css("display","table")
        .animate({opacity : 1}, 250);
      });
      
      $("#submitAll").click(function() {
        $("#bar_model")
        .css("height", "500px");
      });
    });

    //closes alert box
    $(document).ready(function(){
      $(".note-close").click(function() {
        $("#alert")
        .css("display","none");
      });
    });