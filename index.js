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
    setupResponse(res);
    query_add_skill = "INSERT INTO emp_skill_reference (\
            emp_id, core_competency_id, tool_capability_id, category_id, \
            skill_id, experience_id, level_id, certification_id, learning_interest_id) VALUES "
    len = req.body.skill.length;
    for(i = 0; i < len; i++){
        skill_id = i + 1;
        if(req.body.level[i] == ""){
            level_id = null;
        }
        else{
            level_id = req.body.level[i];
        }
        query_add_skill = query_add_skill + "(" + req.body.empId + "," +req.body.core_competency[i] + "\
        ," +req.body.tool_capability[i] + "," + req.body.category[i] + "," + skill_id + "," + req.body.experience[i] + "\
        ," + level_id + "," + req.body.certification[i] + "," + req.body.learning_interest[i] + "), "
    }
    client.query(query_add_skill.substring(0, query_add_skill.length - 2) + ";", function(err, result) {
        if(err) {
            console.log(err);
        }
        else {
            client.end();
            
        }
        res.end(JSON.stringify({"status":"success"}));
    });
});
//    

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