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
app.get('/fees_history', (req, res) => {
    if (req.session.user && req.cookies.user_sid && req.session.user.username == 'admin') {
        res.sendFile(__dirname + '/views/fees_history.html');
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

app.get('/update_std', (req, res) => {
    if (req.session.user && req.cookies.user_sid && req.session.user.username == 'admin') {
        res.sendFile(__dirname + '/views/update_std_form.html');
    } else {
        res.redirect('/login');
    }
});

app.post("/addStudent", function(req, res) {
    setupResponse(res);
    var stdId=0;
    var month;
    var issue_date;
    var due_date;
    if (req.body.data.telephone_home == ''){
        req.body.data.telephone_home = null;
    }
    if (req.body.data.telephone_office == ''){
        req.body.data.telephone_office = null;
    }
    if (req.body.data.admission_fees == ''){
        req.body.data.admission_fees = null;
    }



    if (req.body.data.monthly_fees == ''){
        req.body.data.monthly_fees = null;
    }
    if (req.body.data.dob == ''){
        req.body.data.dob = '01-01-1900';
    }
    if (req.body.data.age == ''){
        req.body.data.age = 0;
    }    
    query_get_date = "SELECT max(month) as month, max(issue_date) as issue_date, max(due_date) as due_date from student;"
    client.query(query_get_date, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            for (i=0; i<result.rows.length; i++){
                console.log(result.rows);
                dates = result.rows;
            }
            if (dates[0]['month'] != null){
                dates[0]['month'] = "'"+dates[0]['month']+"'"
                dates[0]['issue_date'] = "'"+dates[0]['issue_date']+"'"
                dates[0]['due_date'] = "'"+dates[0]['due_date']+"'"
            }
            query_add_student = escape('INSERT INTO %s VALUES(%s) RETURNING id','student(gr_num, name, gender, dob, age,\
                                         place_of_birth, nationality, religion, class_id, f_name, address, f_profession, \
                                         m_profession, telephone_home, telephone_office, old_details, participation, \
                                         awards, health, monthly_fees, issue_date, due_date, month, sibling )\
                                         ', ["'"+req.body.data.gr_num+"','"+req.body.data.name+"','"+req.body.data.gender+"',\
                                         '"+req.body.data.dob+"','"+req.body.data.age+"','"+req.body.data.place_of_birth+"',\
                                         '"+req.body.data.nationality+"','"+req.body.data.religion+"','"+req.body.data.class_id+"',\
                                         '"+req.body.data.f_name+"','"+req.body.data.address+"','"+req.body.data.f_profession+"',\
                                         '"+req.body.data.m_profession+"',"+req.body.data.telephone_home+","+req.body.data.telephone_office+",\
                                         '"+req.body.data.old_details+"','"+req.body.data.participation+"','"+req.body.data.awards+"',\
                                         '"+req.body.data.health+"',"+req.body.data.monthly_fees+",\
                                         "+dates[0]['issue_date']+","+dates[0]['due_date']+","+dates[0]['month']+",'"+req.body.data.sibling+"'"]);
            console.log(query_add_student);
            client.query(query_add_student, function(err, result) {
                if(err) {
                    console.log(err);
                }
                else {
                    stdId = result.rows[0].id;
                }
            })
            client.end();
            res.end(JSON.stringify({"status":"success", "stdId":stdId}));
        }
    });
});

app.post("/updateSetStudent", function(req, res) {
    setupResponse(res);
    console.log(req.body.data)
    query_update_student = "UPDATE student SET name='"+req.body.data.name+"'\
                    , gender='"+req.body.data.gender+"', dob='"+req.body.data.dob+"', age='"+req.body.data.age+"'\
                    , telephone_home='"+req.body.data.telephone_home+"', telephone_office='"+req.body.data.telephone_office+"'\
                    , place_of_birth='"+req.body.data.place_of_birth+"', religion='"+req.body.data.religion+"'\
                    , nationality='"+req.body.data.nationality+"', f_name='"+req.body.data.f_name+"'\
                    , address='"+req.body.data.address+"', f_profession='"+req.body.data.f_profession+"'\
                    , m_profession='"+req.body.data.m_profession+"', old_details='"+req.body.data.old_details+"'\
                    , participation='"+req.body.data.participation+"', awards='"+req.body.data.awards+"'\
                    , health='"+req.body.data.health+"', class_id='"+req.body.data.class_id+"', sibling='"+req.body.data.sibling+"'\
                     WHERE id = "+req.body.data.stdId+";"
    console.log(query_update_student);
    client.query(query_update_student, function(err, result) {
        if(err) {
            console.log(err);
        }
        else {
            client.end();
            res.end(JSON.stringify({"status":"success"}));
        }
    })        
});

app.post("/addClass", function(req, res) {
    setupResponse(res);
    var classId=0;
    query_add_class = escape('INSERT INTO %s VALUES(%s) RETURNING id','class(name)', ["'"+req.body.data.name+"'"]);

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

app.post("/searchHistory", function(req, res) {
    setupResponse(res);

    var students;
    var query_get_history = "SELECT * FROM history WHERE "
    for (i=0;i<Object.keys(req.body.data).length;i++){
        var accessKey = Object.keys(req.body.data)[i];
        query_get_history = query_get_history + accessKey +" = '" + req.body.data[accessKey] + "'  AND "
    }
    query_get_history  = query_get_history.substring(0, query_get_history.length - 6);
    query_get_history = query_get_history + ";";
    console.log(query_get_history);
    client.query(query_get_history, function(err, result) {
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
app.post("/get_student_id", jsonParser, function(req, res) {
    setupResponse(res);
    var student;
    console.log(req.body.data)
    query_get_student_id = "SELECT *\
                            FROM student WHERE id = "+req.body.data['stdId']+";"
    client.query(query_get_student_id, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            for (i=0; i<result.rows.length; i++){
                student = result.rows;
            }
            client.end();
            res.end(JSON.stringify({"status":"success", "student":student}));
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

const _MS_PER_DAY = 1000 * 60 * 60 * 24;

// a and b are javascript Date objects
function dateDiffInDays(a, b) {
  // Discard the time and time-zone information.
  const utc1 = Date.UTC(a.getFullYear(), a.getMonth(), a.getDate());
  const utc2 = Date.UTC(b.getFullYear(), b.getMonth(), b.getDate());

  return Math.floor((utc2 - utc1) / _MS_PER_DAY);
}

app.post("/change_month", jsonParser, function(req, res) {
    setupResponse(res);
    var arrears_value = 0;
    var current_penalty_value = 0;
    var students;

    query_get_student = "INSERT INTO public.history(id,\
                            gender, dob, age, section_id, telephone_home, telephone_office, \
                            name, place_of_birth, religion, nationality, f_name, address, \
                            f_profession, m_profession, old_details, participation, awards, \
                            health, gr_num, create_date, class_id, admission_fees, monthly_fees, \
                            arrears, security_fees, annual_fees, misc_fees, current_penalty, \
                            issue_date, due_date, receive_date, month, transport_fees,sibling,transport_arears)\
                            SELECT * FROM student;\
                        SELECT id, gr_num, due_date, receive_date, monthly_fees, security_fees, arrears, annual_fees, \
                        misc_fees, transport_fees, current_penalty,transport_arears FROM student \
                        WHERE receive_date is null or receive_date > due_date;\
                        "
    client.query(query_get_student, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            for (i=0; i<result.rows.length; i++){
                students = result.rows;
            }
            var update_penalty_query=""
            if (students){
                for(i=0; i<students.length; i++){
                    if(students[i]["receive_date"] != null){
                        var a = new Date(students[i]["due_date"]);
                        var b = new Date(students[i]["receive_date"]);
                        difference = dateDiffInDays(a, b);
                        update_penalty_query = update_penalty_query + " UPDATE student SET current_penalty = " + difference*10 + " \
                                                WHERE id = " + students[i]["id"] + ";"
                    }
                    else{
                        var arrears_val = students[i]["monthly_fees"] + students[i]["security_fees"] + students[i]["annual_fees"] + students[i]["misc_fees"] + students[i]["arrears"] + students[i]["current_penalty"];                    
                        var transport_arrears_val = students[i]["transport_fees"] + students[i]["transport_arears"]; 
                        var a = new Date(students[i]["due_date"]);
                        var b = new Date(req.body["issue_date"]);
                        difference = dateDiffInDays(a, b);
                        update_penalty_query = update_penalty_query + " UPDATE student SET current_penalty = " + difference*10 + "\
                                                        , arrears = " + arrears_val + ", transport_arears = " + transport_arrears_val + " WHERE id = " + students[i]["id"] + ";"
                    }
                }
            }
            client.query(update_penalty_query, function(err, result) {
                if(err) {
                    console.log(err)
                }
                else {
                    var query_change_month = "\
                                                UPDATE student SET \
                                                month='"+req.body['month']+"', \
                                                issue_date='"+req.body['issue_date']+"', \
                                                due_date='"+req.body['due_date']+"', \
                                                receive_date=null;"
                    client.query(query_change_month, function(err, result) {
                        if(err) {
                            console.log(err)
                        }
                        else {
                            client.end();
                            res.end(JSON.stringify({"status":"success"}));
                        }
                    });                    
                }
            });            
        }
    });
});

app.post("/update_student_fee", jsonParser, function(req, res) {
    console.log(req.body);
    setupResponse(res);
    for (i=0;i<Object.keys(req.body).length;i++){
        var accessKey = Object.keys(req.body)[i];
        if(req.body[accessKey] == ""){
            req.body[accessKey] = 0;
        }
    }

    if (req.body['receive_date']==0){
        req.body['receive_date'] = null;
    }
    else{
        req.body['receive_date'] = "'"+req.body["receive_date"]+"'"
    }
    var query_update_student = "UPDATE student SET \
                                admission_fees="+req.body['admission_fees']+", \
                                monthly_fees="+req.body['monthly_fees']+", \
                                arrears="+req.body['arrears']+", \
                                transport_arears="+req.body['transport_arrears']+", \
                                security_fees="+req.body['security_fees']+", \
                                annual_fees="+req.body['annual_fees']+", \
                                misc_fees="+req.body['misc_fees']+", \
                                transport_fees="+req.body['transport_fees']+", \
                                current_penalty="+req.body['current_penalty']+", \
                                receive_date="+req.body['receive_date']+"\
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
});

app.post("/update_all_fees", jsonParser, function(req, res) {
    setupResponse(res);
    for (i=0;i<Object.keys(req.body).length;i++){
        var accessKey = Object.keys(req.body)[i];
        if(req.body[accessKey] == ""){
            req.body[accessKey] = 0;
        }
    }
    var query_update_student = "UPDATE student SET \
                                monthly_fees="+req.body['monthly_fees']+", \
                                security_fees="+req.body['security_fees']+", \
                                annual_fees="+req.body['annual_fees']+", \
                                misc_fees="+req.body['misc_fees']+";";
    client.query(query_update_student, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            client.end();
            res.end(JSON.stringify({"status":"success"}));
        }
    });
});


app.post("/delete_student", jsonParser, function(req, res) {
    setupResponse(res);
    var query_delete_student = "DELETE FROM student \
                                WHERE id="+req.body['stdId']+";"
    client.query(query_delete_student, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            client.end();
            res.end(JSON.stringify({"status":"success"}));
        }
    });
});


// route for handling 404 requests(unavailable routes)
app.use(function (req, res, next) {
  res.status(404).send("Sorry can't find that!")
});


// start the express server
app.set('host', process.env.HOST || '0.0.0.0');
app.listen(app.get('port'),app.get('host'),() => console.log(`App started on port ${app.get('port')} and host ${app.get('host')}`));