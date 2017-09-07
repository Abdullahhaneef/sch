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

var conString = "postgres://ahaneef:123456@localhost:5432/revel_ashes"

app.use(bodyParser.urlencoded({limit: '50mb', extended: true, parameterLimit:50000}));

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

router.get('/analytics',function(req, res){
  res.sendFile(path + 'analytics.html');
});

router.get('/transformation',function(req, res){
  res.sendFile(path + 'human_resources.html');
});


//////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////ADMIN CAPABILITY///////////////////////////////////////////////////////////////////
///////////////////////////Add Employees////////////////////////////////////////////////////

app.post("/addEmployee", function(req, res) {
    setupResponse(res);
    var empId=0;
    query_add_employee = "INSERT INTO employees(name) values('"+req.body.empName+"') RETURNING id";
    client.query(query_add_employee, function(err, result) {
        if(err) {
            console.log(err);
        }
        else {
            empId = result.rows[0].id;
            client.end();
            
        }
        res.end(JSON.stringify({"status":"success", "empId":empId}));
    });
});



////////////////////////////Add Employee Skills///////////////////////////////////////////////
app.post("/addEmpSkill", function(req, res) {
    console.log(req.body.empId);
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