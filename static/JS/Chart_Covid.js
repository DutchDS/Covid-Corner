//function to show the hamburger menu
function show() {
    document.getElementById('hamburger').classList.toggle('active');
}

//function to set the site to the top when the site refreshes
window.onbeforeunload = function () {
    window.scrollTo(0,0);
};

var url = "/api/v1.0/bar_states";
var get_shape = d3.select("#selectShape");

var url_countries = "/api/v1.0/bar_countries";
var get_country = d3.select("#selectCountry");

var url_get_counties = "/api/v1.0/counties_list"
var url_counties = "/api/v1.0/bar_counties";
var get_county = d3.select("#selectCounty");

var chosen_state = ""

function get_data(state) {d3.json(url).then(function(response) {
    console.log("in the d3.json NEW part")
    console.log(response);

    var shortShapes = []
    // var today = new Date()
    // var yesterday =  formatDate(today.setDate(today.getDate() - 1));

    for (var i in response) {
        if (formatDate(response[i].date) == '2020-04-01')
            shortShapes.push(response[i].state)
        }

    var chart_data = []   

    console.log(state)
    
    // if (state == "All")
    //     chart_data = response
    // else
    chart_data =  response.filter(response => {return response.state == state});

    console.log(shortShapes)        
    loadDropDowns("#selectShape",shortShapes,"Select State");
    create_chart(chart_data)
})}

function get_data_country(country) {d3.json(url_countries).then(function(response) {
    console.log("in the d3.json NEW part")
    console.log(response);

    var shortShapes = []
    // var today = new Date()
    // var yesterday =  formatDate(today.setDate(today.getDate() - 1));

    for (var i in response) {
        if (formatDate(response[i].date) == '2020-04-01')
            shortShapes.push(response[i].country)
        }

    var chart_data = []   

    console.log(country)
    
    // if (country == "All")
    //     chart_data = response
    // else
    chart_data =  response.filter(response => {return response.country == country});

    console.log(shortShapes)        
    loadDropDowns("#selectCountry",shortShapes,"Select Country");
    create_chart_countries(chart_data)
    console.log(chart_data)
})}

function get_data_county(state, county) {d3.json(url_counties).then(function(response) {
    console.log("in the d3.json NEW part")
    console.log(response);

    var chart_data = []   
    
    if (state == "All" & county == "All")
        alert("Please select a state first!" );
    else
        chart_data =  response.filter(response => {return response.county == county & response.state==state});

    console.log(state)
    console.log(county)
    console.log(chart_data)

    create_chart_counties(chart_data)
    console.log(chart_data)
})}

var state = 'All'
var country = 'All'
var county = 'All'

get_data(state);
get_data_country(country);
d3.select("#selectCounty").append("option").text("Select County");

console.log("went through the bar charts script")

function create_chart(bar_data) {   

    console.log(bar_data)
    bar_dates = []
    bar_positive = []
    bar_hospital = []
    bar_recovered = []
    bar_deceased = []
    bar_new_cases = []
    bar_new_hospitalizations = []
    bar_new_deaths = []

    for (var i in bar_data) {
        bar_positive.push(bar_data[i].pos_at_home)
        bar_hospital.push(bar_data[i].hospitalized_curr)
        bar_recovered.push(bar_data[i].recovered)
        bar_deceased.push(bar_data[i].death)
        bar_new_cases.push(bar_data[i].new_cases)
        bar_new_hospitalizations.push(bar_data[i].new_hospitalizations)
        bar_new_deaths.push(bar_data[i].new_deaths)
        bar_dates.push(formatDate(bar_data[i].date))
    }

    x_values = bar_dates

    y_trace1 = bar_positive;
    y_trace2 = bar_hospital;
    y_trace3 = bar_recovered;
    y_trace4 = bar_deceased;
    y_trace5 = bar_new_cases;
    y_trace6 = bar_new_hospitalizations;
    y_trace7 = bar_new_deaths;


console.log(x_values)
console.log(y_trace1)

var trace1 = {
    x: x_values,
    y: y_trace1,
    name: "Positive at Home",
    type: "bar",
    marker: {
        color: '#91dada'
      }
}
var trace2 = {
    x: x_values,
    y: y_trace2,
    name: "Positive in Hospital",
    type: "bar",
    marker: {
        color: '#337d7d'
      }
}
var trace3 = {
    x: x_values,
    y: y_trace3,
    name: "Recovered",
    type: "bar",
    marker: {
        color: 'lightgreen'
      }
}
var trace4 = {
    x: x_values,
    y: y_trace4,
    name: "Deceased",
    type: "bar",
    marker: {
        color: 'red'
      }
}
var trace5 = {
    x: x_values,
    y: y_trace5,
    name: "New Cases",
    type: "bar",
    marker: {
        color: '#91dada'
      }
}
var trace6 = {
    x: x_values,
    y: y_trace6,
    name: "New Cases in Hospital",
    type: "bar",
    marker: {
        color: '#337d7d'
      }
}
var trace7 = {
    x: x_values,
    y: y_trace7,
    name: "New Cases Deceased",
    type: "bar",
    marker: {
        color: 'red'
    }
}    
var barData = [trace1, trace2, trace3, trace4]
var barData2 = [trace5];
var barData3 = [trace7, trace6];

var barLayout = {
        barmode:"stack", 
        title: { text: "Virus spread over time for: " + state ,
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
var barLayout2 = {
    barmode:"stack", 
    title: { text: "New Cases for: " + state ,
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
var barLayout3 = {
    barmode:"stack", 
    title: { text: "New Hospitalizations & Death for: " + state ,
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
            font: {
                family: 'Oswald',
                size: 16
                },
    yaxis: {fixedrange: true},
    xaxis: {fixedrange: true}
    

};
    Plotly.newPlot("bar", barData, barLayout);
    Plotly.newPlot("bar2", barData2, barLayout2);
    Plotly.newPlot("bar3", barData3, barLayout3);
    console.log("Plot done")
}

function create_chart_countries(bar_data) {   

    console.log(bar_data)
    bar_dates = []
    bar_positive = []
    bar_recovered = []
    bar_deceased = []

    for (var i in bar_data) {
        bar_positive.push(bar_data[i].positive)
        bar_recovered.push(bar_data[i].recovered)
        bar_deceased.push(bar_data[i].deceased)
        bar_dates.push(formatDate(bar_data[i].date))
    }

    x_values = bar_dates

    y_trace1 = bar_positive;
    y_trace3 = bar_recovered;
    y_trace4 = bar_deceased;


console.log(x_values)
console.log(y_trace1)

var trace1 = {
    x: x_values,
    y: y_trace1,
    name: "Positive",
    type: "bar",
    marker: {
        color: '#91dada'
      }
}
var trace3 = {
    x: x_values,
    y: y_trace3,
    name: "Recovered",
    type: "bar",
    marker: {
        color: 'lightgreen'
      }
}
var trace4 = {
    x: x_values,
    y: y_trace4,
    name: "Deceased",
    type: "bar",
    marker: {
        color: 'red'
      }
}    
var barData4 = [trace1, trace3, trace4]

var barLayout4 = {
        barmode:"stack", 
        title: { text: "Virus spread over time for: " + country ,
                font: {
                    family: 'Oswald',
                    size: 24
                    }
                },
        legend: {
            orientation: 'h',
            x: 0.35, 
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

    Plotly.newPlot("bar_country", barData4, barLayout4);
    console.log("Plot done")
}

function create_chart_counties(bar_data) {   

    console.log(bar_data)
    bar_dates = []
    bar_positive = []
    bar_recovered = []
    bar_deceased = []

    for (var i in bar_data) {
        bar_positive.push(bar_data[i].positive)
        bar_recovered.push(bar_data[i].recovered)
        bar_deceased.push(bar_data[i].deceased)
        bar_dates.push(formatDate(bar_data[i].date))
    }

    x_values = bar_dates

    y_trace8 = bar_positive;
    y_trace9 = bar_recovered;
    y_trace10 = bar_deceased;


console.log(x_values)
console.log(y_trace8)

var trace8 = {
    x: x_values,
    y: y_trace8,
    name: "Positive",
    type: "bar",
    marker: {
        color: '#91dada'
      }
}
var trace9 = {
    x: x_values,
    y: y_trace9,
    name: "Recovered",
    type: "bar",
    marker: {
        color: 'lightgreen'
      }
}
var trace10 = {
    x: x_values,
    y: y_trace10,
    name: "Deceased",
    type: "bar",
    marker: {
        color: 'red'
      }
}    
var barData5 = [trace8, trace9, trace10]

var barLayout5 = {
        barmode:"stack", 
        title: { text: "Virus spread over time for: " + county + ", " + state, 
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

    Plotly.newPlot("bar_county", barData5, barLayout5);
    console.log("Plot done")
}

function loadDropDowns(myId, myshortList, myText) {
    // var tbody = d3.select("tbody");
    var inputDate = d3.select(myId) 
   
    inputDate.html(" ");
  
    console.log(myshortList);
    var cell = inputDate.append("option").text(myText);
    
    myshortList.forEach((f) => {
    //   console.log(f);
      var cell = inputDate.append("option")
      cell.text(f);
  
      });
    };

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

function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getUTCMonth() + 1),
        day = '' + d.getUTCDate(),
        year = d.getFullYear();
    
    if (month.length < 2) 
        month = '0' + month;
    if (day.length < 2) 
        day = '0' + day;
    
    return [year, month, day].join('-');
    }

get_shape.on("change", function() {
    let inputValueShape = d3.select("#selectShape").property("value");
    state = inputValueShape
    chosen_state = state
    loadDropDown_Counties("#selectCounty",state,"Select County");
    console.log(state)
    get_data(state)})
 

get_country.on("change", function() {
    let inputValueCountry = d3.select("#selectCountry").property("value");
    country = inputValueCountry
    console.log(country)
    get_data_country(country)});

get_county.on("change", function() {
    let inputValueCounty = d3.select("#selectCounty").property("value");
    county = inputValueCounty
    console.log(chosen_state, county)
    get_data_county(chosen_state, county)});

