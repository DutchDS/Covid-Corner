//SVG attributes
let svg = d3.select("#bar-race").append("svg")
                                .attr("height",600)
                                .attr("width",960);

let count_duration = 500;

let top_num = 12;
let height = 600;
let width = 960;

const margin = {
    top: 80,
    right: 0,
    bottom: 0,
    left: 0
};

let chart_padding = (height-(margin.bottom + margin.top))/(top_num*5);

let chart_title = svg.append("text")
                     .attr("class","title")
                     .attr("y", 24)
                     .html("Covid-19 Cases by State");

let ytitle = svg.append("text")
                .attr("class", "ytitle")
                .attr("y", 55)
                .html("Count of Positive Cases");

let caption = svg.append("text")
                 .attr("class","caption")
                 .attr("x", width)
                 .attr("y", height)
                 .html("Source: Johns Hopkins University Center for Systems Science and Engineering (JHU CSSE)");

let initial_date = 20200101;

//Load data with D3
d3.csv("assets/data/us_states_covid19_daily.csv").then(function(infection) {
    console.log(infection[0]);

    //This will generate random colors for the bar chart
    function randomcolor() {
        let color_value = '0123456789ABCDEF';
        let color = "#";
        for (let i = 0; i < 0; i++) {
            color += color_value[Math.floor(Math.random() * 16)];
        }
        return color;
    }

    infection.forEach(function(data) {
        // console.log(data.date);

        let positive = parseInt(data.positive);

        data.date = + data.date;
        data.state = +data.state;
        sum_positive = +positive;
        nan_positive = isNaN(positive) ? 0 : positive;

        // console.log(sum_positive);
    });

    //Sorts the Data
    let positive_Slice = infection.filter(function(d) {
        console.log(d);
        d.date == initial_date && !isNaN(d.positive)
    }).sort(function(a,b) {
        b.positive - a.positive;
    }).slice(0, top_num);

    console.log("Slice Check: ", positive_Slice);

});
