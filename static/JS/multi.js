// Get a reference to the page tags
//##################################
var get_date = d3.select("#selectDate");
var get_city = d3.select("#selectCity");
var get_state = d3.select("#selectState");
var get_country = d3.select("#selectCountry");
var get_shape = d3.select("#selectShape");
var get_all = d3.select("#selectAll");
var tableData = data;
var filteredData = [];

// Load initial results
// ####################
load_all()

function load_all() {
    var tbody = d3.select("tbody");
    var tableData = data;
    tbody.html(" ");
  
    console.log(tableData);
  
    tableData.forEach((f) => {
      console.log(f);
      var row = tbody.append("tr");
      Object.entries(f).forEach(([key, value]) => {
        var cell = row.append("td");
        cell.text(value);
      });
    });
  }

// Create empty arrays to store each list of values
var listDates = [];
var listCities = [];
var listStates = [];
var listCountries = [];
var listShapes = [];

// Iterate through each Data record and fill LongLists
tableData.forEach((r) => {
  listDates.push(r.datetime);
  listCities.push(r.city);
  listStates.push(r.state);
  listCountries.push(r.country);
  listShapes.push(r.shape)
});

// Function to go through each list and create a short list by removing duplicates
function uniqueValues(myList) {
    var longList = myList;
    var shortList = [];
  
    // Iterate through the array
    for (var i = 0; i < longList.length; i++) {
        var currentWord = longList[i];
        if (shortList.indexOf(currentWord) == -1) {
            shortList.push(currentWord);
            } 
        }  
    // console.log(shortList);
    return shortList;
  }

// Call functions and sort results
shortDates = uniqueValues(listDates);
shortCities = uniqueValues(listCities).sort();
shortStates = uniqueValues(listStates).sort();
shortCountries = uniqueValues(listCountries).sort();
shortShapes = uniqueValues(listShapes).sort();

console.log(shortDates);
console.log(shortCities);
console.log(shortStates);
console.log(shortCountries);
console.log(shortShapes);

// Fill dropdown boxes when page is refreshed
function loadDropDowns(myId, myshortList, myText) {
    // var tbody = d3.select("tbody");
    var inputDate = d3.select(myId) 
   
    inputDate.html(" ");
  
    console.log(myshortList);
    var cell = inputDate.append("option").text(myText);
    
    myshortList.forEach((f) => {
      console.log(f);
      var cell = inputDate.append("option")
      cell.text(f);
  
      });
    };

// Fill dropdowns with shortLists
loadDropDowns("#selectDate",shortDates,"Select Date");
loadDropDowns("#selectCity",shortCities,"Select City");
loadDropDowns("#selectState",shortStates,"Select State");
loadDropDowns("#selectCountry",shortCountries,"Select Country");
loadDropDowns("#selectShape",shortShapes,"Select Shape");

// Lastly filter dataset after using dropdown boxes and display
function load_all_select() {

      tableData = data;
      filteredData = tableData
      // Get all inputElement values
      let inputValueDate = d3.select("#selectDate").property("value");
      let inputValueCity = d3.select("#selectCity").property("value");
      let inputValueState = d3.select("#selectState").property("value");
      let inputValueCountry = d3.select("#selectCountry").property("value");
      let inputValueShape = d3.select("#selectShape").property("value");

      console.log(inputValueDate);
      console.log(inputValueCity);
      console.log(inputValueState);
      console.log(inputValueCountry);
      console.log(inputValueShape);


      // For each inputElement where a value has been chosen from its dropdownlist, filter the 
      if (inputValueDate != "Select Date") {var filteredData = tableData.filter(tableData => {return tableData.datetime == inputValueDate});};
      tableData = filteredData;
      if (inputValueCity != "Select City") {var filteredData = tableData.filter(tableData => {return tableData.city == inputValueCity});};
      tableData = filteredData;
      if (inputValueState != "Select State")  {var filteredData = tableData.filter(tableData => {return tableData.state == inputValueState});}
      tableData = filteredData;
      if (inputValueCountry != "Select Country")  {var filteredData = tableData.filter(tableData => {return tableData.country == inputValueCountry});};
      tableData = filteredData;
      if (inputValueShape != "Select Shape")  {var filteredData = tableData.filter(tableData => {return tableData.shape == inputValueShape});};
      tableData = filteredData;

      console.log(filteredData.length);
      console.log(filteredData);
      tableData = filteredData;

      // Fill tbody with filteredData
      //###############################################################
      var tbody = d3.select("tbody");

      tbody.html(" ");

      filteredData.forEach((f) => {
          console.log(f);
          var row = tbody.append("tr");
          Object.entries(f).forEach(([key, value]) => {
            var cell = row.append("td");
            cell.text(value);
      });
    });
}

// Define what to do when value is selected/changed
get_date.on("change", function() {load_all_select()});
get_city.on("change", function() {load_all_select()});
get_state.on("change", function() {load_all_select()});
get_country.on("change", function() {load_all_select()});
get_shape.on("change", function() {load_all_select()});

get_all.on("click", function() {location.reload()});
