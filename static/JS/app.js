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

var listCompanies = []

var chosen_state = ""

d3.select("#selectState").append("option").text("Select State");
d3.select("#selectCounty").append("option").text("Select County");
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

// ###### THIRD BOX - FILL STORES ##### //  
function loadDropDowns(myId, myshortList, myText) {
    // var tbody = d3.select("tbody");
    var inputDate = d3.select(myId) 
    
    inputDate.html(" ");
  
    // d3.select("#selectCompany").append("option").text("Select Company");
    console.log(myshortList);

    var cell = inputDate.append("option").text(myText);
    
    myshortList.forEach((f) => {
      console.log(f);
      cell = inputDate.append("option")
      cell.text(f);
  
      });
    };

listCompanies = ['Schnucks','Ace','CarX','Dierbergs','Shell Gas Station']
console.log(listCompanies)
loadDropDowns("#selectCompany",listCompanies, "Select Company");

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
    county = inputValueCounty
    console.log(chosen_state, county);
     });

// WE HAVE TO THINK ABOUT THIS ONE.... On Submit the page should be redirected to an endpoint from FLASK
get_submit.on("click", function() {
  
  let chosenModel = ""
  let modelString = ""
  let returnValues = []
  
  returnValues = preArray()
  chosenModel = returnValues[0]
  modelString = returnValues[1]

  console.log(chosenModel)
  console.log(modelString)
  
  url = "/api/v1.0/"+chosenModel+"/"+modelString
  url_model =  "/api/v1.0/bar_model/"+modelString

  console.log(url)
  console.log(url_model)

  get_model_data(url_model)

  d3.json(url).then(function(response) {
    
    console.log(response.prediction);
    if (response.prediction == 1) {
      // alert("Based on statistics, things aren't looking so well. Please see a doctor as soon as possible!" );
      $(document).ready(function(){
        $("#alert-message").html("");
        $("#alert-message").append("Based on statistics, things aren't looking so well. Please see a doctor as soon as possible!");
        $("#alert-message").append("<br>" + "Chosen Model: " + response.model) ;
        $("#alert-message").append("<br>" + "Test Score: " + response.test_score);
      });
    } 
    else if (response.prediction  == 2) {
      // alert("Your situation is severe, you will most likely have to go to the hospital!")
      $(document).ready(function(){
        $("#alert-message").html("");
        $("#alert-message").append("Your situation is severe, you will most likely have to go to the hospital!");
        $("#alert-message").append("<br>" + "Chosen Model: " + response.model );
        $("#alert-message").append("<br>" + "Test Score: " + response.test_score);
      });

    } 
    else if (response.prediction  == 3) { 
      // alert("You have will most likely be able to get well at home!" ) 
      $(document).ready(function(){
        $("#alert-message").html("");
        $("#alert-message").append("You have will most likely be able to get well at home!");
        $("#alert-message").append("<br>" + "Chosen Model: " + response.model);
        $("#alert-message").append("<br>" + "Test Score: " + response.test_score);
      });

    } 
    else {
      // alert ("Something went wrong, please try again")
      $(document).ready(function(){
        $("#alert-message").html("");
        $("#alert-message").append("Something went wrong, please try again!");
        $("#alert-message").append("<br>" + "Chosen Model: Error");
        $("#alert-message").append("<br>" + "Test Score: Error");
      });

    }

    
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