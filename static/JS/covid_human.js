am4core.ready(function() {

am4core.useTheme(am4themes_dark);
am4core.useTheme(am4themes_animated);
// Themes end

// Create chart instance
let chart = am4core.create("bar-race", am4charts.XYChart);

// Add data
chart.dataSource.url = "/static/data/states_total.csv";
chart.dataSource.parser = new am4core.CSVParser();
chart.dataSource.parser.options.useColumnNames = true;
chart.numberFormatter.bigNumberPrefixes = [
    {"number": 1e+3, "suffix": "K"},
    {"number": 1e+6, "suffix": "M"},
    {"number": 1e+9, "suffix": "B"}
];

// Create axes
let yAxis = chart.yAxes.push(new am4charts.CategoryAxis());
yAxis.dataFields.category = "state";
yAxis.renderer.grid.template.location = 0;
yAxis.renderer.labels.template.fontSize = 10;
yAxis.renderer.minGridDistance = 5;

let xAxis = chart.xAxes.push(new am4charts.ValueAxis());
xAxis.renderer.labels.template.fontSize = 9;
xAxis.renderer.minGridDistance = 4;
// Create series
let series = chart.series.push(new am4charts.ColumnSeries());
series.dataFields.valueX = "total";
series.dataFields.categoryY = "state";
series.columns.template.tooltipText = "{categoryY}: [bold]{valueX}[/]";
series.columns.template.strokeWidth = 0;
series.columns.template.adapter.add("fill", function(fill, t) {
    return chart.colors.getIndex(t.dataItem.index);
});


chart.cursor = new am4charts.XYCursor();

});