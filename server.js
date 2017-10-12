var express = require('express');
var bodyParser = require('body-parser');
var cookieParser = require('cookie-parser');
var session = require('express-session');
var morgan = require('morgan');
var User = require('./models/user');

var http = require('http');
var request = require('request');
var escape = require('pg-escape');
var jsonParser = bodyParser.json();
var pg = require("pg");
var fs = require("fs");
var client;
var conString = "postgres://postgres@localhost:5432/revel_db"
var path = __dirname + '/views/';
var javascript_path = __dirname + '/javascripts/';


// invoke an instance of express application.
var app = express();

// set our application port
app.set('port', 8090);

// set morgan to log info about our requests for development use.
app.use(morgan('dev'));

// initialize body-parser to parse incoming parameters requests to req.body
app.use(bodyParser.urlencoded({limit: '50mb', extended: true, parameterLimit:50000}));

// initialize cookie-parser to allow us access the cookies stored in the browser. 
app.use(cookieParser());

// initialize express-session to allow us track the logged-in user across sessions.
app.use(session({
    key: 'user_sid',
    secret: 'somerandonstuffs',
    resave: false,
    saveUninitialized: false,
    cookie: {
        expires: 600000
    }
}));

app.use(express.static('public'));
// This middleware will check if user's cookie is still saved in browser and user is not set, then automatically log the user out.
// This usually happens when you stop your express server after login, your cookie still remains saved in the browser.
app.use((req, res, next) => {
    if (req.cookies.user_sid && !req.session.user) {
        res.clearCookie('user_sid');        
    }
    next();
});


// middleware function to check for logged-in users
var sessionChecker = (req, res, next) => {
    if (req.session.user && req.cookies.user_sid) {
        res.redirect('/index');
    } else {
        next();
    }    
};

// middleware function to setup response
var setupResponse = function(res) {
    res.writeHead(200, {'Content-Type': 'application/json'});
    var pg = require("pg");
    client = new pg.Client(conString);
    client.connect();
};

// route for Home-Page
app.get('/', sessionChecker, (req, res) => {
    res.redirect('/login');
});


// route for user Login
app.route('/login')
    .get(sessionChecker, (req, res) => {
        res.sendFile(__dirname + '/views/login.html');
    })
    .post((req, res) => {
        var username = req.body.username,
            password = req.body.password;

        User.findOne({ where: { username: username } }).then(function (user) {
            if (!user) {
                res.redirect('/login');
            } else if (!user.validPassword(password)) {
                res.redirect('/login');
            } else if(user.dataValues.username == 'admin') {
                req.session.user = user.dataValues;
                res.redirect('/admin_capability');
            } else {
                req.session.user = user.dataValues;
                res.redirect('/index');
            }
        });
    });


// route for user's dashboard
app.get('/index', (req, res) => {
    if (req.session.user && req.cookies.user_sid) {
        res.sendFile(__dirname + '/views/index.html');
    } else {
        res.redirect('/login');
    }
});

app.get('/analytics', (req, res) => {
    if (req.session.user && req.cookies.user_sid) {
        res.sendFile(__dirname + '/views/analytics.html');
    } else {
        res.redirect('/login');
    }
});

app.get('/analytics', (req, res) => {
    if (req.session.user && req.cookies.user_sid) {
        res.sendFile(__dirname + '/views/analytics.html');
    } else {
        res.redirect('/login');
    }
});

app.get('/analytics_update', (req, res) => {
    if (req.session.user && req.cookies.user_sid) {
        res.sendFile(__dirname + '/views/analytics.html');
    } else {
        res.redirect('/login');
    }
});

app.get('/transformation', (req, res) => {
    if (req.session.user && req.cookies.user_sid) {
        res.sendFile(__dirname + '/views/transformation.html');
    } else {
        res.redirect('/login');
    }
});

app.get('/transformation_update', (req, res) => {
    if (req.session.user && req.cookies.user_sid) {
        res.sendFile(__dirname + '/views/transformation.html');
    } else {
        res.redirect('/login');
    }
});

app.get('/human_resources', (req, res) => {
    if (req.session.user && req.cookies.user_sid) {
        res.sendFile(__dirname + '/views/human_resources.html');
    } else {
        res.redirect('/login');
    }
});

app.get('/human_element_update', (req, res) => {
    if (req.session.user && req.cookies.user_sid) {
        res.sendFile(__dirname + '/views/human_resources.html');
    } else {
        res.redirect('/login');
    }
});

app.get('/admin_capability', (req, res) => {
    if (req.session.user && req.cookies.user_sid && req.session.user.username == 'admin') {
        res.sendFile(__dirname + '/views/admin_capability.html');
    } else {
        res.redirect('/login');
    }
});

// route for user logout
app.get('/logout', (req, res) => {
    if (req.session.user && req.cookies.user_sid) {
        res.clearCookie('user_sid');
        res.redirect('/');
    } else {
        res.redirect('/login');
    }
});

//////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////ADMIN CAPABILITY///////////////////////////////////////////////////////////////////
///////////////////////////Add Employees////////////////////////////////////////////////////

app.post("/addEmployee", function(req, res) {
    setupResponse(res);
    var empId=0;
    query_check_email = escape("SELECT %s FROM %s WHERE %s","id","employees", "email = '"+req.body.email+"'");
    query_add_employee = escape('INSERT INTO %s VALUES(%s) RETURNING id','employees(name , community_id , email)', ["'"+req.body.empName+"',"+req.body.community+","+"'"+req.body.email+"'"]);
    client.query(query_check_email, function(err, result) {
        if(err) {
            console.log(err);
        }
        else {
            id = result.rows[0];
            if(id == undefined){
                client.query(query_add_employee, function(err, result) {
                    if(err) {
                        console.log(err);
                    }
                    else {
                        empId = result.rows[0].id;
                        client.end();
                        res.end(JSON.stringify({"status":"success", "empId":empId}));
                    }
                })                
            }
            else{
                res.end(JSON.stringify({"status":"employee_exist", "empId":id}));
            }
        }
    });    
});


////////////////////////////Add Employee Skills///////////////////////////////////////////////
app.post("/addAnalyticsEmpSkill", function(req, res) {
    setupResponse(res);
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();
    if(dd<10){
        dd='0'+dd;
    } 
    if(mm<10){
        mm='0'+mm;
    } 
    var date = yyyy+'-'+mm+'-'+dd;
    query_add_skill = "INSERT INTO skill_survey (\
            emp_id, core_competency, tool_capability_id, category, \
            skill, experience_id, level_id, certification_id, learning_interest_id,community_id) VALUES ";
    len = req.body.skill.length;
    for(i = 0; i < len; i++){
        query_add_skill = query_add_skill + "(" + req.body.empId + ",'" +req.body.core_competency[i] + "'\
        ," +req.body.tool_capability[i] + ",'" + req.body.category[i] + "','" + req.body.skill[i] + "'," + req.body.experience[i] + "\
        ," + req.body.level[i] + "," + req.body.certification[i] + "," + req.body.learning_interest[i] + ",1), "
    }
    query_add_skill = query_add_skill.substring(0, query_add_skill.length - 2) + "; INSERT INTO skill_survey_history (\
            emp_id, core_competency, tool_capability_id, category, \
            skill,experience_id,level_id,certification_id,learning_interest_id,community_id,created_date) VALUES ";

    for(i = 0; i < len; i++){
        query_add_skill = query_add_skill + "(" + req.body.empId + ",'" +req.body.core_competency[i] + "'\
        ," +req.body.tool_capability[i] + ",'" + req.body.category[i] + "','" + req.body.skill[i] + "'," + req.body.experience[i] + "\
        ," + req.body.level[i] + "," + req.body.certification[i] + "," + req.body.learning_interest[i] + ",1,'"+date+"'), "
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
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();
    if(dd<10){
        dd='0'+dd;
    } 
    if(mm<10){
        mm='0'+mm;
    } 
    var date = yyyy+'-'+mm+'-'+dd;    
    query_add_skill = "INSERT INTO skill_survey (\
            emp_id, core_competency, tool_capability_id, category, \
            skill, experience_id, level_id, certification_id, learning_interest_id,community_id) VALUES "
    len = req.body.skill.length;
    for(i = 0; i < len; i++){
        query_add_skill = query_add_skill + "(" + req.body.empId + ",'" +req.body.core_competency[i] + "'\
        ," +req.body.tool_capability[i] + ",'" + req.body.category[i] + "','" + req.body.skill[i] + "'," + req.body.experience[i] + "\
        ," + req.body.level[i] + "," + req.body.certification[i] + "," + req.body.learning_interest[i] + ",2), "
    }
    query_add_skill = query_add_skill.substring(0, query_add_skill.length - 2) + "; INSERT INTO skill_survey_history (\
            emp_id, core_competency, tool_capability_id, category, \
            skill,experience_id,level_id,certification_id,learning_interest_id,community_id,created_date) VALUES ";

    for(i = 0; i < len; i++){
        query_add_skill = query_add_skill + "(" + req.body.empId + ",'" +req.body.core_competency[i] + "'\
        ," +req.body.tool_capability[i] + ",'" + req.body.category[i] + "','" + req.body.skill[i] + "'," + req.body.experience[i] + "\
        ," + req.body.level[i] + "," + req.body.certification[i] + "," + req.body.learning_interest[i] + ",2,'"+date+"'), "
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
    setupResponse(res);    
    var query_add_human="";
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();
    if(dd<10){
        dd='0'+dd;
    } 
    if(mm<10){
        mm='0'+mm;
    } 
    var date = yyyy+'-'+mm+'-'+dd;    
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
    query_add_human = "INSERT INTO human_element_survey (emp_id, category, dimension, value, community_id) VALUES ";
    len = category.length;
    for(i = 0; i < len-1; i++){
        var val = req.body.value[i].replace(/'/g, "''");
        if (category[i] == 'My Motivations'){
            val = val.substring(0, val.length -2);
        }
        query_add_human=query_add_human+"("+req.body.empId+",'"+category[i]+"','"+dimension[i]+"','"+val+"',"+req.body.community_id+" ), ";
    }
    query_add_human = query_add_human.substring(0, query_add_human.length - 2) + "; \
    INSERT INTO human_element_survey_history (emp_id, category,dimension,value,community_id,created_date) VALUES ";
    for(i = 0; i < len-1; i++){
        var val = req.body.value[i].replace(/'/g, "''");
        if (category[i] == 'My Motivations'){
            val = val.substring(0, val.length -2);
        }
        query_add_human=query_add_human+"("+req.body.empId+",'"+category[i]+"','"+dimension[i]+"','"+val+"',"+req.body.community_id+",'"+date+"' ), ";
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
    query_get_employee = "SELECT employees.id, employees.name as Name, employees.email, community.name as Community, employees.is_active\
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
////////////////////////////////////delete skills only///////////////////////////////////

app.post("/del_skills", jsonParser, function(req, res) {
    setupResponse(res);
    var query_delete_skill = escape("DELETE FROM %s WHERE %s; \
                            DELETE FROM %s WHERE %s;"
                            , "skill_survey" , "emp_id  = "+req.body['exist_id']
                            ,"human_element_survey", "emp_id  = "+req.body['exist_id']);
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
    console.log(req.body);
    var update_emp = escape("UPDATE %s SET %s WHERE %s", "employees" 
        , "name =  '"+req.body['name']+"', email =  '"+req.body['email']+"' ,is_active = '"+req.body['is_active']+"'"
        ,"id = "+req.body['empId']);
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

////////////////////////////////////////update transformation Skills//////////////////////////////////////////////

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



// route for handling 404 requests(unavailable routes)
app.use(function (req, res, next) {
  res.status(404).send("Sorry can't find that!")
});


// start the express server
app.listen(app.get('port'), () => console.log(`App started on port ${app.get('port')}`));