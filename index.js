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

var conString = "postgres://postgres@localhost:5433/revel_db"

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

router.get('/analytics_update',function(req, res){
  res.sendFile(path + 'analytics.html');
});

router.get('/human_element_update',function(req, res){
  res.sendFile(path + 'human_resources.html');
});

router.get('/transformation',function(req, res){
  res.sendFile(path + 'transformation.html');
});

router.get('/transformation_update',function(req, res){
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
    for(i = 0; i < len-1; i++){
        var val = req.body.value[i].replace(/'/g, "''");
        if (category[i] == 'My Motivations'){
            val = val.substring(0, val.length -2);
        }
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


/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////Admin Capability/////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////Get Employees////////////////////////////////////////////////

app.get("/get_employees", function(req, res) {
    setupResponse(res);
    var employees;
    query_get_employee = "SELECT employees.id, employees.name as Name, community.name as Community, employees.is_active\
                            FROM employees\
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
    var query_delete_skill = "DELETE FROM skill_survey WHERE emp_id  = "+req.body['empId']+"; \
                            DELETE FROM human_element_survey WHERE emp_id = "+req.body['empId']+"; \
                            DELETE FROM employees WHERE id  = "+req.body['empId']+";";                              
    client.query(query_delete_skill, function(err, result) {
        if(err) {
            console.log(err);
        }
        else {
            console.log("Successfully Delete");
            client.end();
            res.end(JSON.stringify({"status":"success","empId":req.body['empId']}));
        }
    });
});

///////////////////////////////Update Employee/////////////////////////////////////////////////////

app.post("/update_employee", jsonParser, function(req, res) {
    setupResponse(res);
    var update_emp = "UPDATE employees SET name = '"+req.body['name']+"',is_active = '"+req.body['is_active']+"' WHERE id = "+req.body['empId'];
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

///////////////////////////////Update Analytic Skills/////////////////////////////////////////////////////

app.post("/update_analytics_skills", jsonParser, function(req, res) {
    setupResponse(res);
     var update_analytic_skills = "";
    for (var index = 0; index<req.body['updatedAnalyticsIds'].length; index++){
        update_analytic_skills = update_analytic_skills+"UPDATE skill_survey SET experience_id = '"+req.body['updatedAnalyticsExp'][index]+"', \
        level_id = "+req.body['updatedAnalyticsLvl'][index]+", \
        certification_id = "+req.body['updatedAnalyticsCer'][index]+",  \
        learning_interest_id = "+req.body['updatedAnalyticsInt'][index]+" \
        WHERE emp_id = "+req.body['empId']+" \
        AND skill = '"+req.body['updatedAnalyticsIds'][index]+"';"
    } 
    client.query(update_analytic_skills, function(err, result) {
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

app.post("/update_transformation_skills", jsonParser, function(req, res) {
    setupResponse(res);
     var update_transformation_skills = "";
    for (var index = 0; index<req.body['updatedTransformationIds'].length; index++){
        update_transformation_skills = update_transformation_skills+"UPDATE skill_survey SET experience_id = '"+req.body['updatedTransformationExp'][index]+"', \
        level_id = "+req.body['updatedTransformationLvl'][index]+", \
        certification_id = "+req.body['updatedTransformationCer'][index]+",  \
        learning_interest_id = "+req.body['updatedTransformationInt'][index]+" \
        WHERE emp_id = "+req.body['empId']+" \
        AND skill = '"+req.body['updatedTransformationIds'][index]+"';"
    } 
    client.query(update_transformation_skills, function(err, result) {
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


//////////////////////////////Get Analytics and Transformation Skills////////////////////////////////////////////////////
app.post("/get_skills", jsonParser, function(req, res) {
    setupResponse(res);
    var skills;
    var query_get_skills ="Select skill_survey.skill, experience.name as experience,level.name as level, \
                certification.value as certification,learning_interest.name as learning_interest\
                from skill_survey\
                Left join experience on experience.id = experience_id\
                Left join level on level.id =level_id\
                Left join certification on certification.id =certification_id\
                left join learning_interest on learning_interest.id = learning_interest_id\
                WHERE skill_survey.emp_id = "+req.body['empId']+"\
                order by skill_survey.id;"
    client.query(query_get_skills, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            for (i=0; i<result.rows.length; i++){
                skills = result.rows;
            }
            client.end();
        }
        res.end(JSON.stringify({"status":"success" , "skills":skills}));
    });   
});

//////////////////////////////Get Human Elements////////////////////////////////////////////////////
app.post("/get_human_elements", jsonParser, function(req, res) {
    setupResponse(res);
    var human_element;
    var query_get_human_elements ="Select category, dimension as dimension, value as value FROM human_element_survey WHERE emp_id = "+req.body['empId']+" ORDER by id;"
    client.query(query_get_human_elements, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            for (i=0; i<result.rows.length; i++){
                human_element = result.rows;
            }
            client.end();
        }
        res.end(JSON.stringify({"status":"success" , "human_element":human_element}));
    });   
});

//////////////////////////update Human Element form////////////////////////////////////////////////
app.post("/update_human_element", jsonParser, function(req, res) {
    setupResponse(res);
    var update_human_elements = "";
    for (var index = 0; index<req.body['humanElementId'].length; index++){
        if (req.body['humanElementValue'][index] == '1st' || req.body['humanElementValue'][index] == '2nd' || req.body['humanElementValue'][index] == '3rd'
         || req.body['humanElementValue'][index] == '4th' || req.body['humanElementValue'][index] == '5th' || req.body['humanElementValue'][index] == '6th' 
         || req.body['humanElementValue'][index] == '7th' || req.body['humanElementValue'][index] == '8th' || req.body['humanElementValue'][index] == '9th' 
         || req.body['humanElementValue'][index] == '10th'){
            update_human_elements = update_human_elements+"UPDATE human_element_survey SET value = '"+req.body['humanElementValue'][index].substring(0, req.body['humanElementValue'][index].length - 2)+"' \
            WHERE emp_id = "+req.body['empId']+" \
            AND dimension = '"+req.body['humanElementId'][index]+"';";
        }
        else{
            update_human_elements = update_human_elements+"UPDATE human_element_survey SET value = '"+req.body['humanElementValue'][index]+"' \
            WHERE emp_id = "+req.body['empId']+" \
            AND dimension = '"+req.body['humanElementId'][index]+"';"
        }
    }
    client.query(update_human_elements, function(err, result) {
        if(err) {
            console.log(err)
            res.end(JSON.stringify({"status":"failed"}));
        }
        else {
            client.end();
            console.log("successful updated")
            res.end(JSON.stringify({"status":"success"}));
        }
    });   
});

////////////////////////////////////////////////////////////////////////////////////////////////////
app.use('*',function(req, res){
  res.send('Error 404: Not Found!');
});

app.listen(3000,function(){
  console.log('Server running at Port 3000');
});