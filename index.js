var express = require('express'),
    http = require('http'),
    request = require('request');

var app = express();
var bodyParser = require('body-parser');
var jsonParser = bodyParser.json();
var pg = require("pg");
var fs = require("fs");
var dateTime = require('node-datetime');
var dt = dateTime.create();
var formatted = dt.format('m-d-Y');
var client;

///////Admin Capability/////////

var common_skills_list=[];
var requester_list=[];
//var resource_type_list=[];
var region_list =[];
var total_bandwidth1;
var average_bandwidth1;
var ADMIN_PDF_DIR_NAME = 'trend_analysis_reports/';
var doc;

var architecture_service_solution = [];
var architecture_service_solution_count = [];
var field_skills = [];
var field_skills_count = [];
var exec_accel = [];
var exec_accel_count = [];
var transformation = [];
var transformation_count = [];
var shared_service = [];
var shared_service_count = [];

/////////////////////////////////


//var conString = "pg://adminuz3epcl:JdQ3JSSSxwjt@toalgostage-lc6djk3xpsn3-2-toalgostage.cloudapps.cisco.com:56391/lc6djk3xpsn3";

var conString = "pg://postgres@localhost:5432/revel_ashes"
app.use(bodyParser.urlencoded({ extended: true })); 

var setupResponse = function(res) {
    res.writeHead(200, {'Content-Type': 'application/json'});
    var pg = require("pg");
    client = new pg.Client(conString);
    client.connect();
};

// var express = require('express');
// var app = express();
var router = express.Router();
  
var path = __dirname + '/views/';
var javascript_path = __dirname + '/javascripts/';

app.use('/',router);
app.use(express.static('public'))
  
router.get('/',function(req, res){
  res.sendFile(path + 'index.html');
});


//////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////ADMIN CAPABILITY///////////////////////////////////////////////////////////////////
///////////////////////////Get Employees////////////////////////////////////////////////////

app.post("/addEmpSkill", function(req, res) {
    console.log(req.body);
});


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





app.use('*',function(req, res){
  res.send('Error 404: Not Found!');
});


/*var server = app.listen(8090, process.env.OPENSHIFT_NODEJS_IP || '127.0.0.1', function () {
    console.log("Express server listening on " + server.address().address +':'+server.address().port);
});*/
app.listen(3000,function(){
  console.log('Server running at Port 3000');
});