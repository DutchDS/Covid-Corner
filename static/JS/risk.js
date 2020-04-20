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
var get_model = d3.select("#selectModel");

var get_gender = d3.select("#selectGender");
var get_age = d3.select("#selectAge");

var get_submit = d3.select("#submitAll");

var listModel = [];
var listGender = [];
var listAge = [];

// listModel = ['Classification','Deep Learning','Random Forest','K-Nearest Neighbor']
listModel = ['Decision Tree','Random Forest','K-Nearest Neighbor']

listGender = ['Male','Female']
listAge = ['<= 39 years old','40 - 49 years old','50 - 59 years old','60 - 69 years old','70 - 79 years old','=> 80 years old']

console.log(listModel);
console.log(listGender);
console.log(listAge);

function loadDropDowns(myId, myshortList) {
    // var tbody = d3.select("tbody");
    var inputDate = d3.select(myId) 
   
    inputDate.html(" ");
  
    console.log(myshortList);
    var cell = inputDate.append("option").text(" ");
    
    myshortList.forEach((f) => {
      console.log(f);
      cell = inputDate.append("option")
      cell.text(f);
  
      });
    };


// Lastly put together an array for the prediction models - modelArray needs all 0's and 1' equal to what the model is expecting

function preArray() {

    let modelString = ""
    let chosenModel = ""

    // Get all inputElement values - NEEDS TO BE COMPLETED FOR ALL FEATURES
    // let inputModel = d3.select("#selectModel").property("value");

    let inputModel = 'model3'
    let inputGender = d3.select("#selectGender").property("value");
    let inputAge = d3.select("#selectAge").property("value");
    
    let inputPrecondition = $('#precondition:checked').val();
    
    let inputFromHotspot = $('#from_hotspot:checked').val();
    let inputVisitHotspot = $('#visit_hotspot:checked').val();

    let inputPneumonia = $('#pneumonia:checked').val();
    let inputFever = $('#fever:checked').val();
    let inputCough = $('#cough:checked').val();
    let inputSputum = $('#sputum:checked').val();
    let inputChills = $('#chills:checked').val();

    let inputMalaise = $('#malaise:checked').val();
    let inputBreath = $('#breath:checked').val();
    let inputFatigue = $('#fatigue:checked').val();
    let inputDiarrhea = $('#diarrhea:checked').val();
    let inputHeadache = $('#headache:checked').val();

    let inputThroatAche = $('#throatache:checked').val();
    let inputSoreness = $('#soreness:checked').val();

    console.log("Model:", inputModel);
    console.log("Gender: ", inputGender);
    console.log("Age: ", inputAge);
    console.log("Precondition: ", inputPrecondition);
    console.log("From Hotspot: ", inputFromHotspot);
    console.log("Visit Hotspot :", inputVisitHotspot);
     
    console.log("Pneumonia: ", inputPneumonia);
    console.log("Fever: ", inputFever);
    console.log("Cough: ", inputCough);
    console.log("Sputum: ", inputSputum);
    console.log("Chills: ",inputChills);

    console.log("Malaise: ", inputMalaise);
    console.log("Shortness Of Breath: ", inputBreath);
    console.log("Fatigue: ", inputFatigue);
    console.log("Diarrhea: ", inputDiarrhea);
    console.log("Headache: ",inputHeadache);

    console.log("Throat Ache: ", inputThroatAche);
    console.log("Soreness: ",inputSoreness);

    if (inputModel=='Decision Tree') {chosenModel='model1';}
      // else if (inputModel=='Deep Learning') {chosenModel='model2'}
      else if (inputModel=='Random Forest') {chosenModel='model3'}
      else {chosenModel='model4'};

    if (inputGender=='Male') {s1="1"} else {s1 = "0";};
    if (inputGender=='Female') {s2="1"} else {s2 = "0";};

    if (inputAge=='<= 39 years old') {s3="1"} else {s3 = "0";};
    if (inputAge=='40 - 49 years old') {s4="1"} else {s4 = "0";};
    if (inputAge=='50 - 59 years old') {s5="1"} else {s5 = "0";};
    if (inputAge=='60 - 69 years old') {s6="1"} else {s6 = "0";};
    if (inputAge=='70 - 79 years old') {s7="1"} else {s7 = "0";};
    if (inputAge=='=> 80 years old') {s8="1"} else {s8 = "0";};

    if (inputPrecondition==0) {s9 = "1";} else {s9 = "0";};
    if (inputFromHotspot==0) {s10 = "1";} else {s10 = "0";};
    if (inputVisitHotspot==0) {s11 = "1";} else {s11 = "0";};
    if (inputPneumonia==0) {s12 = "1";} else {s12 = "0";};
    if (inputFever==0) {s13 = "1";} else {s13 = "0";};
    if (inputCough==0) {s14 = "1";} else {s14 = "0";};
    if (inputSputum==0) {s15 = "1";} else {s15 = "0";};
    if (inputChills==0) {s16 = "1";} else {s16 = "0";};
    if (inputMalaise==0) {s17 = "1";} else {s17 = "0";};
    if (inputBreath==0) {s18 = "1";} else {s18 = "0";};
    if (inputFatigue==0) {s19 = "1";} else {s19 = "0";};
    if (inputDiarrhea==0) {s20 = "1";} else {s20 = "0";};
    if (inputHeadache==0) {s21 = "1";} else {s21 = "0";};
    if (inputThroatAche==0) {s22 = "1";} else {s22 = "0";};
    if (inputSoreness==0) {s23 = "1";} else {s23 = "0";};



    modelString = s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23
    console.log(chosenModel)
    console.log(modelString)
    return [chosenModel, modelString]

}


// Fill dropdowns with shortLists
loadDropDowns("#selectModel",listModel);
loadDropDowns("#selectGender",listGender);
loadDropDowns("#selectAge",listAge);

//This is to show the alert box
// function newAlert() {
//   // document.getElementById('alert').style.display = 'table';
//   $("#alert").css("display","table")
//   console.log('something is working!');
//   }


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


function get_model_data(url_model) {d3.json(url_model).then(function(response) {
    console.log("in the model part")
    console.log(url_model)
    console.log(response);

    chart_data = response

    create_model_chart(chart_data)
    // create_chart_countries(chart_data)
})}
  

function create_model_chart(bar_data) {   

  console.log(bar_data)
  bar_model = []
  bar_train_score = []
  bar_test_score = []

  for (var i in bar_data) {
      bar_model.push(bar_data[i].model)
      bar_train_score.push(bar_data[i].train_score)
      bar_test_score.push(bar_data[i].test_score)
  }

  x_values = bar_model

  y_trace1 = bar_train_score;
  y_trace2 = bar_test_score;

console.log(x_values)
console.log(y_trace1)

var trace1 = {
  x: x_values,
  y: y_trace1,
  name: "Training Scores",
  type: "bar",
  marker: {
      color: '#91dada'
    }
}
var trace2 = {
  x: x_values,
  y: y_trace2,
  name: "Testing Scores",
  type: "bar",
  marker: {
      color: '#337d7d'
    }
}

var barData = [trace1, trace2]

var barLayout = {
      // barmode:"stack", 
      title: { text: "Scoring models for " + d3.select("#selectGender").property("value") + " and " + d3.select("#selectAge").property("value") ,
              font: {
                  family: 'Oswald',
                  size: 24
                  }
              },
      legend: {
          orientation: 'h',
          x: 0.25, 
          y: -0.15
              },
      // paper_bgcolor: "#0e173d",
              font: {
                  family: 'Oswald',
                  size: 16
                  },
      yaxis: {fixedrange: true},
      xaxis: {fixedrange: true}
      

  };

  Plotly.newPlot("bar_model", barData, barLayout);
  console.log("Plot done")
}