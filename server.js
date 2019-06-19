var express = require('express');
var bodyParser = require('body-parser');
var cookieParser = require('cookie-parser');
var session = require('express-session');
var morgan = require('morgan');
var User = require('./models/user');
var ES6Promise = require('es6-promise');
ES6Promise.polyfill();
var axios = require('axios');
var http = require('http');
var request = require('request');
var escape = require('pg-escape');
var jsonParser = bodyParser.json();
var pg = require("pg");
var fs = require("fs");
var client;
var conString = "postgres://postgres:postgres@localhost:5432/school"
var path = __dirname + '/views/';
var javascript_path = __dirname + '/javascripts/';
var pdf = require('html-pdf');


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
        expires: 6000000
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
        res.redirect('/add_std');
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

            console.log(password);

        User.findOne({ where: { username: username } }).then(function (user) {
            if (!user) {
                res.redirect('/login');
            } else if (!user.validPassword(password)) {
                res.redirect('/login');
            } else {
                req.session.user = user.dataValues;
                res.redirect('/add_std');
            }
        });
    });

app.get('/add_std', (req, res) => {
    if (req.session.user && req.cookies.user_sid && req.session.user.username == 'admin') {
        res.sendFile(__dirname + '/views/add_std.html');
    } else {
        res.redirect('/login');
    }
});
app.get('/add_std_form', (req, res) => {
    if (req.session.user && req.cookies.user_sid && req.session.user.username == 'admin') {
        res.sendFile(__dirname + '/views/add_std_form.html');
    } else {
        res.redirect('/login');
    }
});
app.get('/fees_page', (req, res) => {
    if (req.session.user && req.cookies.user_sid && req.session.user.username == 'admin') {
        res.sendFile(__dirname + '/views/fees_page.html');
    } else {
        res.redirect('/login');
    }
});
app.get('/add_class', (req, res) => {
    if (req.session.user && req.cookies.user_sid && req.session.user.username == 'admin') {
        res.sendFile(__dirname + '/views/add_class_form.html');
    } else {
        res.redirect('/login');
    }
});

app.post("/addStudent", function(req, res) {
    setupResponse(res);
    //console.log(req.body.data);
    var stdId=0;
    query_add_student = escape('INSERT INTO %s VALUES(%s) RETURNING id','student(gr_num, name, gender, dob, age, place_of_birth, nationality, religion, class_id, f_name, address, f_profession, m_profession, telephone_home, telephone_office, old_details, participation, awards, health)', ["'"+req.body.data.gr_num+"','"+req.body.data.name+"','"+req.body.data.gender+"','"+req.body.data.dob+"','"+req.body.data.age+"','"+req.body.data.place_of_birth+"','"+req.body.data.nationality+"','"+req.body.data.religion+"','"+req.body.data.class_id+"','"+req.body.data.f_name+"','"+req.body.data.address+"','"+req.body.data.f_profession+"','"+req.body.data.m_profession+"',"+req.body.data.telephone_home+","+req.body.data.telephone_office+",'"+req.body.data.old_details+"','"+req.body.data.participation+"','"+req.body.data.awards+"','"+req.body.data.health+"'"]);
    console.log(query_add_student);
    client.query(query_add_student, function(err, result) {
        if(err) {
            console.log(err);
        }
        else {
            stdId = result.rows[0].id;
            client.end();
            res.end(JSON.stringify({"status":"success", "stdId":stdId}));
        }
    })        
});

app.post("/addClass", function(req, res) {
    setupResponse(res);
    //console.log(req.body.data);
    var classId=0;
    query_add_class = escape('INSERT INTO %s VALUES(%s) RETURNING id','class(name)', ["'"+req.body.data.name+"'"]);
    console.log(query_add_class);
    client.query(query_add_class, function(err, result) {
        if(err) {
            console.log(err);
        }
        else {
            classId = result.rows[0].id;
            client.end();
            res.end(JSON.stringify({"status":"success", "classId":classId}));
        }
    })        
});

app.post("/searchStd", function(req, res) {
    setupResponse(res);
    console.log(Object.keys(req.body.data).length)

    var students;
    var query_get_student = ""
    if(req.body.data["nothing"]){
        var query_get_student = "SELECT *\
                            FROM student;"
    }
    else{
        var query_get_student = "SELECT * FROM student WHERE "
        for (i=0;i<Object.keys(req.body.data).length;i++){
            var accessKey = Object.keys(req.body.data)[i];
            query_get_student = query_get_student + accessKey +" = '" + req.body.data[accessKey] + "'  AND "
        }
        query_get_student  = query_get_student.substring(0, query_get_student.length - 6);
        query_get_student = query_get_student + ";";
    }
    console.log(query_get_student);
    client.query(query_get_student, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            for (i=0; i<result.rows.length; i++){
                students = result.rows;
            }
            client.end();
            res.end(JSON.stringify({"status":"success", "students":students}));
        }
    });        
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

app.get("/get_student", function(req, res) {
    setupResponse(res);
    var students;
    query_get_student = "SELECT *\
                            FROM student order by id Desc;"
    client.query(query_get_student, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            for (i=0; i<result.rows.length; i++){
                students = result.rows;
            }
            client.end();
            res.end(JSON.stringify({"status":"success", "students":students}));
        }
    });
});

app.get("/get_class", function(req, res) {
    setupResponse(res);
    var employees;
    query_get_class = "SELECT * \
                            FROM class\
                            ";
    client.query(query_get_class, function(err, result) {
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

app.post("/update_student_fee", jsonParser, function(req, res) {
    setupResponse(res);
    console.log(req.body);
    console.log(Object.keys(req.body).length);
    for (i=0;i<Object.keys(req.body).length;i++){
        console.log(Object.keys(req.body)[i])
        var accessKey = Object.keys(req.body)[i];
        if(req.body[accessKey] == ""){
            req.body[accessKey] = 0;
        }
        //var accessKey = Object.keys(req.body.data)[i];
        //query_get_student = query_get_student + accessKey +" = '" + req.body.data[accessKey] + "'  AND "
    }
    var query_update_student = "UPDATE student SET \
                                admission_fees="+req.body['admission_fees']+", \
                                monthly_fees="+req.body['monthly_fees']+", \
                                arrears="+req.body['arrears']+", \
                                security_fees="+req.body['security_fees']+", \
                                annual_fees="+req.body['annual_fees']+", \
                                misc_fees="+req.body['misc_fees']+", \
                                current_penalty="+req.body['current_penalty']+" \
                                WHERE id="+req.body['stdId']+";"
    console.log(query_update_student);
    client.query(query_update_student, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            client.end();
            res.end(JSON.stringify({"status":"success"}));
        }
    });
    //query_get_student  = query_get_student.substring(0, query_get_student.length - 6);
    //query_get_student = query_get_student + ";";    
    //res.end(JSON.stringify({"status":"success"}));
});

app.post("/print_challan", jsonParser, function(req, res) {
    setupResponse(res);
    console.log(req.body);
    res.end(JSON.stringify({"status":"success"}));
});

app.get("/challans/:fileId", function(req, res) {
    fs.readFile(__dirname + '/'+req.params.fileId+'.pdf' , function (err,data){
        res.contentType("application/pdf");
        res.send(data);
        res.end(JSON.stringify({"status":"pdf_success"}));
    });
});
/*
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
});*/
/*
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
});*/

// route for handling 404 requests(unavailable routes)
app.use(function (req, res, next) {
  res.status(404).send("Sorry can't find that!")
});


// start the express server
app.set('host', process.env.HOST || '0.0.0.0');
app.listen(app.get('port'),app.get('host'),() => console.log(`App started on port ${app.get('port')} and host ${app.get('host')}`));