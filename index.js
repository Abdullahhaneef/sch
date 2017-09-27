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

var conString = "postgres://ahaneef:123456@localhost:5432/revel_db"

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
app.use(express.static('public'));
  
router.get('/',function(req, res){
  res.sendFile(path + 'index.html');
});

router.get('/analytics',function(req, res){
  res.sendFile(path + 'analytics.html');
});

router.get('/transformation',function(req, res){
  res.sendFile(path + 'transformation.html');
});

router.get('/human_resources',function(req, res){
  res.sendFile(path + 'human_resources.html');
});

router.get('/admin_capability',function(req, res){
  res.sendFile(path + 'admin_capability.html');
});

//////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////ADMIN CAPABILITY///////////////////////////////////////////////////////////////////
///////////////////////////Add Employees////////////////////////////////////////////////////

app.post("/addEmployee", function(req, res) {
    setupResponse(res);
    var empId=0;
    query_add_employee = "INSERT INTO employees(name , community_id) values('"+req.body.empName+"',"+req.body.community+") RETURNING id";
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
app.post("/addAnalyticsEmpSkill", function(req, res) {
    setupResponse(res);
    query_add_skill = "INSERT INTO skill_survey (\
            emp_id, core_competency, tool_capability_id, category, \
            skill, experience_id, level_id, certification_id, learning_interest_id,community_id) VALUES "
    len = req.body.skill.length;
    for(i = 0; i < len; i++){
        query_add_skill = query_add_skill + "(" + req.body.empId + ",'" +req.body.core_competency[i] + "'\
        ," +req.body.tool_capability[i] + ",'" + req.body.category[i] + "','" + req.body.skill[i] + "'," + req.body.experience[i] + "\
        ," + req.body.level[i] + "," + req.body.certification[i] + "," + req.body.learning_interest[i] + ",1), "
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

////////////////////////////Add Transformation Skills///////////////////////////////////////////////
app.post("/addTransformationEmpSkill", function(req, res) {
    setupResponse(res);
    query_add_skill = "INSERT INTO skill_survey (\
            emp_id, core_competency, tool_capability_id, category, \
            skill, experience_id, level_id, certification_id, learning_interest_id,community_id) VALUES "
    len = req.body.skill.length;
    for(i = 0; i < len; i++){
        query_add_skill = query_add_skill + "(" + req.body.empId + ",'" +req.body.core_competency[i] + "'\
        ," +req.body.tool_capability[i] + ",'" + req.body.category[i] + "','" + req.body.skill[i] + "'," + req.body.experience[i] + "\
        ," + req.body.level[i] + "," + req.body.certification[i] + "," + req.body.learning_interest[i] + ",2), "
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


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////Add Human Element////////////////////////////////////////////////

app.post("/addHumanElement", function(req, res) {
    var query_add_human="";
    var category =[];
    var dimension =[];
    for (var i = 0; i<req.body.name.length; i++){
        if(req.body.name[i].split("_")[1] != undefined){
            if(req.body.name[i].split("_")[0] == 'personality'){
                category[i] = 'My Personality'
            }
            else if(req.body.name[i].split("_")[0] == 'satisfaction'){
                category[i] = 'My Satisfaction'
            }
            else if(req.body.name[i].split("_")[0] == 'habit'){
                category[i] = 'My Habits'
            }
            else if(req.body.name[i].split("_")[0] == 'motivation'){
                category[i] = 'My Motivations'
            }
            dimension[i] = req.body.name[i].split("_")[1].charAt(0).toUpperCase() + req.body.name[i].split("_")[1].slice(1);;
        }
        else{
            category[i] = req.body.name[i];
            dimension[i] = req.body.name[i];
        }
    }
    setupResponse(res);
    query_add_human = "INSERT INTO human_element_survey (emp_id, category, dimension, value, community_id) VALUES "
    len = category.length;
    for(i = 0; i < len; i++){
        var val = req.body.value[i].replace(/'/g, "''");
        query_add_human=query_add_human+"("+req.body.empId+",'"+category[i]+"','"+dimension[i]+"','"+val+"',"+req.body.community_id+" ), ";
    }
    client.query(query_add_human.substring(0, query_add_human.length - 2) + ";", function(err, result) {
        if(err) {
            console.log(err);
        }
        else {
            client.end();
        }
        res.end(JSON.stringify({"status":"success"}));
    });
});


//////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////Admin Capability/////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////Get Employees////////////////////////////////////////////////

app.get("/get_employees", function(req, res) {
    setupResponse(res);
    var employees;
    query_get_employee = "SELECT employees.id, employees.name as Name, community.name as Community, employees.is_active FROM employees\
                LEFT JOIN community ON community_id = community.id ORDER BY employees.id";
    client.query(query_get_employee, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            for (i=0; i<result.rows.length; i++){
                employees = result.rows;
            }
            client.end();
            res.end(JSON.stringify({"status":"success", "employees":employees}));
        }
    });
});

///////////////////////////////Delete Employee////////////////////////////////////////////////////
app.post("/delete_employee", jsonParser, function(req, res) {
    setupResponse(res);
    var query_delete_skill = "DELETE FROM skill_survey WHERE emp_id  = "+req.body['empId'];                
    client.query(query_delete_skill, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            var query_delete_employee = "DELETE FROM employees WHERE id  = "+req.body['empId'];
            client.query(query_delete_employee, function(err, result) {
                if(err) {
                    console.log(err)
                }
                else{
                    console.log("Successfully Delete");
                    client.end();
                    res.end(JSON.stringify({"status":"success","empid":req.body['empid']}));
                }
            });
        }
    });   
});

///////////////////////////////Update Employee/////////////////////////////////////////////////////

app.post("/update_employee", jsonParser, function(req, res) {
    setupResponse(res);

    var update_emp = "UPDATE employees SET name = '"+req.body['name']+"',is_active = '"+req.body['is_active']+"' WHERE id = "+req.body['empid'];
    client.query(update_emp, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            client.end();
            console.log("successful updated")
        }

        res.end(JSON.stringify({"status":"success"}));
    });   
});


////////////////////////////////////////////////////////////////////////////////////////////////////
app.use('*',function(req, res){
  res.send('Error 404: Not Found!');
});

app.listen(3000,function(){
  console.log('Server running at Port 3000');
});