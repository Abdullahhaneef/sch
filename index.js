var express = require('express'),
    http = require('http'),
    request = require('request');

var app = express();
var bodyParser = require('body-parser');
var jsonParser = bodyParser.json();
var PDFDocument = require("pdfkit");
var pg = require("pg");
var fs = require("fs");
const uuidV4 = require('uuid/v4');
var rgbHex = require('rgb-hex');
var dateTime = require('node-datetime');
var dt = dateTime.create();
var formatted = dt.format('m-d-Y');
var emp_index = 1;
var emp_info =[];
var emp_allocation_total=[];
var client;
var interest_skill1 = [];
var interest_skill2 = [];
var interest_skill3 = [];
var interest_skill4 = [];
var interest_skill5 = [];
var interest_skill6 = [];
var images = [];
var aptitude_skill1=[];
var aptitude_skill2=[];
var aptitude_skill3=[];
var aptitude_skill4=[];
var aptitude_skill5=[];
var aptitude_skill6=[];
var PDF_DIR_NAME = 'pdf_reports/';

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

var conString = "pg://abdullah:knysys@huresys.com:5432/jive_standalone"
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

router.get('/analytics',function(req, res){
  res.sendFile(path + 'analytics.html');
});


//////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////ADMIN CAPABILITY///////////////////////////////////////////////////////////////////
///////////////////////////Get Employees////////////////////////////////////////////////////

app.get("/get_employee", function(req, res) {
    setupResponse(res);
    values = [];
    var request_id;
    employees ="";
    var get_emp = "SELECT employees.empid,name,country,region,function,grade,title,is_active, as_data_center, as_cloud, as_enterprise_networking, as_dna, as_collaboration, as_digital_experience, as_security, as_service_provider, as_software, as_digital_transformation,as_services, as_technical_support, as_professional_services, as_managed_services, as_solutions, as_strategic_partners, fs_customer_facing, fs_partner_facing, fs_system_engineer, fs_sales_experience, fs_sales_mentoring, fs_demand_generation, fs_solution_selling, fs_vertical_selling, p_partner_program, es_event_planning, es_content_creation, es_planning_logistics, es_interlocking, es_securing_funding, es_orchestrating_events, es_polling_market_research, es_reporting_analysis, es_designing_executing_pilots, es_presentation_skills, es_executive_presence, es_communication_skills, es_building_fostering_relationships, ts_driving_best_practices, ts_innovative_thinking, ts_designing_process_improvements, ts_incubating_new_ideas, ts_lighthouse_accounts, ts_evolving_gtm_approach, os_strategy_development, os_annual_planning, os_ops_review_qbr_development, os_reporting_analysis, os_budget_management, os_project_management, os_powerpoint, os_website_development, os_social_media, os_business_intelligence, os_macroeconomics, os_data_analytics_industry_knowledge, os_digital_capabilities_platform, os_knowledge_learning_platforms, os_designing_reports_dashboards, os_coordinating_it_teams, os_application_development FROM employees LEFT OUTER JOIN aptitude ON employees.empid = aptitude.empid  ORDER BY employees.empid";
    client.query(get_emp, function(err, result) {
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
  

///////////////////////////////////////////////////////////////////////////////////////////////////////////////

app.post("/add_employee", function(req, res) {
    setupResponse(res);
    values = [];
    values_name = [];
    var aptitude= [];
    var interest= [];
    var request_id;

    for (i = 0; i < req.body['data'].length; i++){
        values[i] = req.body['data'][i]['value'];
        values_name[i] = req.body['data'][i]['name'];
    }
    addEmployee(values,res,values_name);

});


function addEmployee(values,resp,values_name){
    var emp_basic=[];
    for(i=0; i<7; i++){
        emp_basic[i]=values[i];
    }
    emp_basic[7] = true;
    query_add_employee = "INSERT INTO employees(name,country,region,function,grade,title,images,is_active) values($1,$2,$3,$4,$5,$6,$7,$8) RETURNING empid";
    client.query(query_add_employee,emp_basic, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            request_id = result.rows[0].empid;
            addAptitude(request_id,values,resp,values_name);
        }
    });   
}

function addAptitude(request_id,emp,resp,values_name){
    var aptitude_col="";
    var aptitude_val="";
    if (values_name.length > 7){
        for(i=7;i<values_name.length;i++){
            if (!values_name[i].startsWith("i")) {
                aptitude_col=aptitude_col + values_name[i]+",";
                aptitude_val=aptitude_val + "'"+values[i]+"',";
            }
        }
        aptitude_query = "INSERT INTO aptitude (empid,"+aptitude_col.substring(0, aptitude_col.length - 1)+") values ("+request_id+","+aptitude_val.substring(0, aptitude_val.length - 1)+")";
    }
    else{
        aptitude_query = "INSERT INTO aptitude (empid) values ("+request_id+")";
    }
    client.query(aptitude_query, function(err, result) {
         if(err) {
             console.log(err)
        }
         else {
            console.log("successfully added aptitude");
            addInterest(request_id,emp,resp,values_name);
         }
     });   
}

function addInterest(request_id,emp,resp,values_name){
    var interest_col= "";
    var interest_val= "";
    if (values_name.length > 7){
        for(i=7;i<values_name.length;i++){
            if (values_name[i].startsWith("i")) {
                interest_col = interest_col + values_name[i].substring(1) + ",";
                interest_val = interest_val + "'"+values[i]+"',"; 
            }
        }
        interest_query = "INSERT INTO interest (empid,"+interest_col.substring(0, interest_col.length - 1)+") values ("+request_id+","+interest_val.substring(0, interest_val.length - 1)+")";
    }
    else{
        interest_query = "INSERT INTO interest (empid) values ("+request_id+")";
    }
    client.query(interest_query, function(err, result) {
         if(err) {
             console.log(err)
        }
         else {
            client.end();
            console.log("successfully added interest");
         }
     });  

    resp.end(JSON.stringify({"status":"success"}));
   
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////

app.post("/delete_employee", jsonParser, function(req, res) {
    setupResponse(res);
    var query_delete_emp = "DELETE FROM employees WHERE empid  = "+req.body['empid'];                
    client.query(query_delete_emp, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            client.end();
            console.log("successful deleted")
            }

            res.end(JSON.stringify({"status":"success","empid":req.body['empid']}));
        });   
});


/////////////////////////////////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////////////////////////////////////

app.post("/show_interest", jsonParser, function(req, res) {
    setupResponse(res);
    interest ="";
    var get_int = "SELECT * FROM interest WHERE empid = "+req.body["empid"];                
    client.query(get_int, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            for (i=0; i<result.rows.length; i++){
                interest = result.rows;
            }
            client.end();
            res.end(JSON.stringify({"status":"success", "interest":interest}));
        }
    });    
    

});

///////////////////////////////////////////////////////////////////////////////////////////////////////////////

app.post("/show_aptitude", jsonParser, function(req, res) {
    setupResponse(res);
    aptitude ="";
    var get_int = "SELECT * FROM aptitude WHERE empid = "+req.body["empid"];                
    client.query(get_int, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            for (i=0; i<result.rows.length; i++){
                aptitude = result.rows;
            }
            client.end();
            res.end(JSON.stringify({"status":"success", "aptitude":aptitude}));
        }
    });    
    

});
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

app.post("/get_allocation", jsonParser, function(req, res) {
    setupResponse(res);
    allocation ="";
    var get_int = "SELECT * from existing_resource_allocation, emp_allocation_ref Where emp_allocation_ref.existing_resource_allocation_id = existing_resource_allocation.id AND emp_allocation_ref.emp_id = "+req.body["empid"] + " ORDER BY existing_resource_allocation.priority";                
    client.query(get_int, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            for (i=0; i<result.rows.length; i++){
                allocation = result.rows;
            }
            client.end();
            res.end(JSON.stringify({"status":"success", "allocation":allocation}));
        }
    });    
});

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

app.post("/deleteAllocation_employee", jsonParser, function(req, res) {
    setupResponse(res);

    employees ="";
    var query_delete_allocation = "DELETE FROM emp_allocation_ref WHERE existing_resource_allocation_id  = "+req.body['id'] +" AND emp_id = "+req.body['empid'];                
    client.query(query_delete_allocation, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            client.end();
            console.log("successful deleted")
            }

            res.end(JSON.stringify({"status":"success", "empid":req.body['empid']}));
        });   
});

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

app.post("/updateAllocation_employee", jsonParser, function(req, res) {
    setupResponse(res);

    var update_allocation = "UPDATE existing_resource_allocation SET department = '"+req.body['department']+"', priority = '"+req.body['priority']+"',initiative = '"+req.body['initiative']+"', alignment_to_gpo = '"+req.body['gpo']+"' WHERE id = "+req.body['id'];
    var update_allocation_ref = "UPDATE emp_allocation_ref SET percent_allocation = "+req.body['percent']+" WHERE existing_resource_allocation_id = "+req.body['id']+ " AND emp_id = "+req.body['empid'];
    client.query(update_allocation, function(err, result) {
        if(err) {
            console.log(err);
        }
        else {
            client.query(update_allocation_ref, function(err, result) {
            if(err) {
                console.log(err);
            }
            else {
                client.end();
                res.end(JSON.stringify({"status":"success", "empid":req.body['empid']}));
                }

                });
            }
        
        });   
});

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

app.post("/addAllocationRecord", jsonParser, function(req, res) {
    setupResponse(res);
    var id;
    var query_add_allocation = "INSERT INTO existing_resource_allocation(department, priority, initiative, alignment_to_gpo) VALUES('"+req.body['department']+"','"+req.body['priority']+"','"+req.body['initiative']+"','"+req.body['gpo']+"') RETURNING id";
    var query_add_employee_ref="";
    client.query(query_add_allocation, function(err, result) {
        if(err) {
            console.log(err);
        }
        else {
            id =result.rows[0].id;
            query_add_employee_ref = "INSERT INTO emp_allocation_ref(existing_resource_allocation_id,emp_id,percent_allocation) VALUES("+id+","+req.body['empid']+","+req.body['percent']+")";
            client.query(query_add_employee_ref, function(err, result) {
            if(err) {
                console.log(err);
            }
            else {
                client.end();
                res.end(JSON.stringify({"status":"success","empid":req.body['empid']}));
                }
            });   
            }
        });   
});

////////////////////////////////////////////////////////////////////////////////////////////////////////

app.post("/update_employee", jsonParser, function(req, res) {
    setupResponse(res);

    var update_emp = "UPDATE employees SET name = '"+req.body['name']+"',country = '"+req.body['country']+"',region = '"+req.body['region']+"',function = '"+req.body['function']+"', grade = '"+req.body['grade']+"',title = '"+req.body['title']+"',is_active = '"+req.body['is_active']+"' WHERE empid = "+req.body['empid'];
    client.query(update_emp, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            client.end();
            console.log("successful updated")
        }

        res.end(JSON.stringify({"status":"success", "updateIndex":req.body['updateIndex']}));
    });   
});

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

app.post("/update_aptitude", jsonParser, function(req, res) {
    setupResponse(res);
    var val = "";
    if (req.body.length > 5){
        for(i=5;i<req.body.length;i++){
            if (!req.body[i]['name'].startsWith("i")) {
                val = val + req.body[i]['name'] + " = '"+req.body[i]['value']+"', "
            }
        }
        var update_apt = "UPDATE aptitude SET " + val.substring(0, val.length - 2) +" WHERE empid = " + req.body[0]["value"];
        client.query(update_apt, function(err, result) {
            if(err) {
                console.log(err)
            }
            else {
                client.end();
                console.log("successful updated aptitude")
            }
            res.end(JSON.stringify({"status":"success"}));
        });
    }
    else{
        res.end(JSON.stringify({"status":"success"}));
    }
});

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

app.post("/update_aptitude_unchecked", jsonParser, function(req, res) {
    setupResponse(res);
    if (req.body[0] != undefined){
        var query_apt_unchecked = "";
        for(i=1;i<req.body.length;i++){
            if (!req.body[i].startsWith("i")) {
                query_apt_unchecked = query_apt_unchecked + req.body[i] + " = null, "
            }
        }
        var update_unchecked = "UPDATE aptitude SET " + query_apt_unchecked.substring(0, query_apt_unchecked.length - 2) +" WHERE empid = " + req.body[0];
        client.query(update_unchecked, function(err, result) {
            if(err) {
                console.log(err)
            }
            else {
                client.end();
                console.log("successful updated aptitude")
            }
            res.end(JSON.stringify({"status":"success"}));
        });   
    }
    else{
        res.end(JSON.stringify({"status":"success"}));
    }
});

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

app.post("/update_interest", jsonParser, function(req, res) {
    setupResponse(res);
    var val = "";
    if (req.body.length > 5){
        for(i=5;i<req.body.length;i++){
            if (req.body[i]['name'].startsWith("i")) {
                val = val + req.body[i]['name'].substring(1) + " = '"+req.body[i]['value']+"', "
            }
        }

        var update_int = "UPDATE interest SET " + val.substring(0, val.length - 2) +" WHERE empid = " + req.body[0]["value"];
        client.query(update_int, function(err, result) {
            if(err) {
                console.log(err)
            }
            else {
                client.end();
                console.log("successful updated interest")
            }
            res.end(JSON.stringify({"status":"success"}));
        });
    }
    else{
        res.end(JSON.stringify({"status":"success"}));
    }
});

/////////////////////////////////////////////////////////////////////////////////////////////////////

app.post("/update_interest_unchecked", jsonParser, function(req, res) {
    setupResponse(res);
    if (req.body[0] != undefined){
        var query_int_unchecked = "";
        for(i=1;i<req.body.length;i++){
            if (req.body[i].startsWith("i")) {
                query_int_unchecked = query_int_unchecked + req.body[i].substring(1) + " = null, "
            }
        }
        var in_update_unchecked = "UPDATE interest SET " + query_int_unchecked.substring(0, query_int_unchecked.length - 2) +" WHERE empid = " + req.body[0];
        client.query(in_update_unchecked, function(err, result) {
            if(err) {
                console.log(err)
            }
            else {
                client.end();
                console.log("successful updated interest")
            }
            res.end(JSON.stringify({"status":"success"}));
        });   
    }
    else{
        res.end(JSON.stringify({"status":"success"}));
    }
});

////////////////////////////////////////////////////////////////////////////////////////////////////////////////

app.get("/trendAnalysis", function(req, res) {
    setupResponse(res);
    var request_trend;
    query_common_skills = "SELECT * FROM request";
    client.query(query_common_skills, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            for (i=0; i<result.rows.length; i++){
                request_trend = result.rows;
            }
            client.end();
            res.end(JSON.stringify({"status":"success", "request_trend":request_trend}));
        }
    });
});

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

app.post("/delete_request", jsonParser, function(req, res) {
    setupResponse(res);
    var query_del_req = "DELETE FROM request WHERE id = "+ req.body['id'];
    client.query(query_del_req, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            var query_del_req_skill = "DELETE FROM skills WHERE id = "+ req.body['id'];
            client.query(query_del_req, function(err, result) {
            if(err) {
                console.log(err)
            }
            else {
                client.end();
                res.end(JSON.stringify({"status":"success"}));
                console.log("successfully deleted");
            }
        });
        }
    });

});
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

app.post("/trendAnalysisPdf", jsonParser, function(req, res) {
    setupResponse(res);
    common_skills(res,req.body['req_query']);
});

function common_skills(resp,req_query){
    common_skills_list = [];
    query_common_skills = "SELECT skills_name,count(skills_name) as scount FROM skills WHERE id IN ( "+ req_query +" ) GROUP BY skills_name HAVING count(skills_name) IN (SELECT count(skills_name) as scount FROM skills WHERE id IN ( "+ req_query +" ) GROUP BY skills_name ORDER BY scount DESC LIMIT 5) ORDER BY scount DESC LIMIT 5";
    client.query(query_common_skills, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            for (i=0; i<result.rows.length; i++){
                common_skills_list[i] = result.rows[i];
            }
            request_by_volume(resp,req_query);
        }
    });
}

function request_by_volume(resp,req_query){
    requester_list = [];
    query_request_by_volume = "SELECT name,count(name) as scount FROM request WHERE id IN ( "+ req_query +" ) GROUP BY name HAVING count(name) IN (SELECT count(name) as scount FROM request WHERE id IN ( "+ req_query +" ) GROUP BY name ORDER BY scount DESC LIMIT 5) ORDER BY scount DESC LIMIT 5";
    client.query(query_request_by_volume, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            for (i=0; i<result.rows.length; i++){
                requester_list[i] = result.rows[i];
            }
            region_by_volume(resp,req_query);
        }
    });   
}

function region_by_volume(resp,req_query){
    region_list = [];
    query_region_by_volume = "SELECT region,count(name) as scount FROM request WHERE id IN ( "+ req_query +" ) GROUP BY region HAVING count(region) IN (SELECT count(region) as scount FROM request WHERE id IN ( "+ req_query +" ) GROUP BY region ORDER BY scount DESC LIMIT 5) ORDER BY scount DESC LIMIT 5";
    client.query(query_region_by_volume, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            for (i=0; i<result.rows.length; i++){
                region_list[i] = result.rows[i];
            }
            total_bandwidth(resp,req_query);
        }
    });   
}

function total_bandwidth(resp,req_query){
    query_total_bandwidth = "SELECT SUM(allocation) from request WHERE id IN ( "+ req_query +" )";
    client.query(query_total_bandwidth, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            for (i=0; i<result.rows.length; i++){
                total_bandwidth1 = result.rows[i].sum;
            }
            average_bandwidth(resp,req_query);
        }
    });   
}

function average_bandwidth(resp,req_query){
    query_average_bandwidth = "SELECT AVG(allocation) from request WHERE id IN ( "+ req_query +" )";
    client.query(query_average_bandwidth, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            for (i=0; i<result.rows.length; i++){
                average_bandwidth1 = result.rows[i].avg;
            }
            get_Column_Names(resp,req_query);
        }
    });   
}

function get_Column_Names(resp,req_query) {
    var request_column_names;
    query_common_skills = "SELECT column_name FROM information_schema.columns WHERE table_name = 'aptitude'";
    client.query(query_common_skills, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            request_column_names = result.rows;
            get_trend_skill_count(resp,request_column_names)
        }
    });
}

function get_trend_skill_count(resp,request_column_names){
    var column_query = "";
    var trend_skills;
    architecture_service_solution = [];
    architecture_service_solution_count = [];
    field_skills = [];
    field_skills_count = [];
    exec_accel = [];
    exec_accel_count = [];
    transformation = [];
    transformation_count = [];
    shared_service = [];
    shared_service_count = [];
    for(i = 1; i < request_column_names.length-1;i++){
        column_query = column_query + "SELECT '"+ request_column_names[i]['column_name'] + "' as column_name , count("+ request_column_names[i]['column_name'] +") as count FROM aptitude WHERE " + request_column_names[i]['column_name'] + " IN (\'Advanced\' , \'Expert\') UNION ALL ";
    }
    column_query = column_query.substring(0, column_query.length - 10)
    column_query = column_query+" ORDER By count desc"
    // console.log(column_query);
    client.query(column_query, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            trend_skills = result.rows;
            client.end();
        }
        for(index = 0; index<trend_skills.length; index++){
            if (trend_skills[index]["column_name"].startsWith("as_")) {
                architecture_service_solution[architecture_service_solution.length]=trend_skills[index]["column_name"]
                architecture_service_solution_count[architecture_service_solution_count.length]=trend_skills[index]["count"]
            }else if (trend_skills[index]["column_name"].startsWith("fs_")) {
                field_skills[field_skills.length]=trend_skills[index]["column_name"]
                field_skills_count[field_skills_count.length]=trend_skills[index]["count"]
            }else if (trend_skills[index]["column_name"].startsWith("es_")) {
                exec_accel[exec_accel.length]=trend_skills[index]["column_name"]
                exec_accel_count[exec_accel_count.length]=trend_skills[index]["count"]
            }else if (trend_skills[index]["column_name"].startsWith("ts_")) {
                transformation[transformation.length]=trend_skills[index]["column_name"]
                transformation_count[transformation_count.length]=trend_skills[index]["count"]
            }else if (trend_skills[index]["column_name"].startsWith("os_")) {
                shared_service[shared_service.length]=trend_skills[index]["column_name"]
                shared_service_count[shared_service_count.length]=trend_skills[index]["count"]
            }
        }

        if (architecture_service_solution.length >5) {      
            architecture_service_solution.length = 5;  
            architecture_service_solution_count.length = 5;  
        }

        if (field_skills.length >5) {      
            field_skills.length = 5;  
            field_skills_count.length = 5;  
        }

        if (exec_accel.length >5) {      
            exec_accel.length = 5;  
            exec_accel_count.length = 5;  
        }

        if (transformation.length >5) {      
            transformation.length = 5;  
            transformation_count.length = 5;  
        }                

        if (shared_service.length >5) {      
            shared_service.length = 5;  
            shared_service_count.length = 5;  
        }

        var filename = makeTrendAnalysisPDF();
        resp.end(JSON.stringify({"status":"success", "fileId":filename.toString()}));
    });
}

app.get("/downloadAnalysis/:fileId", function(req, res) {
    var fs = require("fs");
    fs.readFile(__dirname + '/' + ADMIN_PDF_DIR_NAME +req.params.fileId+'.pdf' , function (err,data){
        res.contentType("application/pdf");
        res.send(data);
        res.end(JSON.stringify({"status":"pdf_success"}));
    });
});

var CISCO_BLUE = '#049FD9';

function adminDrawHorizontalLine(start, end, y, stroke, color) {
    doc.lineWidth(stroke);
    doc.lineCap('round')
        .moveTo(start, y)
        .lineTo(end, y)
        .strokeColor(color)
        .stroke();
}

function adminDrawVerticalLine(start, end, x, stroke, color) {
    doc.lineWidth(stroke);
    doc.lineCap('round')
        .moveTo(x, start)
        .lineTo(x, end)
        .strokeColor(color)
        .stroke();
}

function adminH1(text, y) {
    doc.fontSize(20)
        .fillColor(CISCO_BLUE)
        .text(text,40,y);
}

function adminInsertFormattedText(text, x, y, fontSize, fontColor) {
    doc.fontSize(fontSize)
        .fillColor(fontColor)
        .text(text,x,y);
}

function adminInsertNormalText(text, x, y) {
    adminInsertFormattedText(text, x, y, 10, '#020202');
}

function adminTableInsertNormalText(text, x, y, color) {
    adminInsertFormattedText(text, x, y, 12, color);
}

function adminTableInsertSkillText(text, x, y) {
    adminInsertFormattedText(text, x, y, 7, '#020202');
}

function adminInsertHeading(text, y) {
    adminInsertFormattedText(text, 40, y, 12, '#020202');
    adminDrawHorizontalLine(40, 650, y+12, 1.5, '#020202');
}

 function adminDrawPageFooter(page_number, total_page) {
    adminDrawHorizontalLine(40, 650, 810, 2.5, CISCO_BLUE);
    var footer_text = "\u00A9 2017 Cisco and/or its affiliates. All rights reserved. This document is Cisco Public.";
    adminInsertFormattedText(footer_text, 40, 820, 6, '#090909');
    var page_text = "page " + page_number + " of " + total_page;
    adminInsertFormattedText(page_text, 580, 820, 6, '#090909');
}

function adminAddLogo(){
    var data = 'data:image/jpeg;base64,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';
    doc.image(data, 40,20,{width: 50});
}

function admin_DrawPageHeader() {
    adminDrawHorizontalLine(40, 650, 60, 2.5, CISCO_BLUE);
}

function adminGetColorCode(skill_name) {
    var red = 0;
    var green = 0;
    var blue = 0;

    if (skill_name.substring(0,2) == "as"){
        red = 255;
        green = 165;
        blue = 0;   
    }
    else if(skill_name.substring(0,2) == "fs"){
        red = 0;
        green = 128;
        blue = 0;
    }
    else if(skill_name.substring(0,1) == "p"){
        red = 128;
        green = 0;
        blue = 128;
    }
    else if(skill_name.substring(0,2) == "es"){
        red = 0;
        green = 0;
        blue = 255;                
    }
    else if(skill_name.substring(0,2) == "ts"){
        red = 128;
        green = 0;
        blue = 0;
    }
    else if(skill_name.substring(0,2) == "os"){
        red = 47;
        green = 169;
        blue = 252;                
    }

    return {'red': red, 'green': green, 'blue': blue};
}

function insertTopSkills() {
    var rgbHex = require('rgb-hex');
    var y_axis = 130;
    var offset = 15;
    var skill_name;
    for (var i = 0; i < common_skills_list.length; i++) {
        var y_pos = y_axis + (offset * i);
        var color_code = adminGetColorCode(common_skills_list[i].skills_name);
        if (common_skills_list[i].skills_name.startsWith("p_")){
            skill_name = common_skills_list[i].skills_name.substring(2).toUpperCase().replace(/_/g, ' ');
        }
        else{
            skill_name = common_skills_list[i].skills_name.substring(3).toUpperCase().replace(/_/g, ' ');
        }
        doc.circle(45, y_pos+3, 4).fill('#'+rgbHex(color_code.red,
                                                 color_code.green,
                                                 color_code.blue));
        adminInsertNormalText(skill_name, 55, y_pos);
        adminInsertNormalText(common_skills_list[i].scount, 300, y_pos);
    }
}

function insertTopRequestors() {
    var y_axis = 240;
    var offset = 15;
    for (var i = 0; i < requester_list.length; i++) {
        var y_pos = y_axis + (offset * i);
        adminInsertNormalText(requester_list[i].name, 55, y_pos);
        adminInsertNormalText(requester_list[i].scount, 300, y_pos);
    }
}

function insertTopRegions() {
    var y_axis = 350;
    var offset = 15;
    for (var i = 0; i < region_list.length; i++) {
        var y_pos = y_axis + (offset * i);
        adminInsertNormalText(region_list[i].region, 55, y_pos);
        adminInsertNormalText(region_list[i].scount, 300, y_pos);
    }
}

function makeTrendAnalysisPDF() {
    var PDFDocument = require("pdfkit");
    var fs = require("fs");
    const uuidV4 = require('uuid/v4');
    var filename = uuidV4();

    var months = ["January", "February", "March", "April", "May", "June",
                  "July", "August", "September", "October", "November", "December"];
    doc = new PDFDocument({
        layout: 'landscape',
        size: [900, 700] // a smaller document for small badge printers
    });

    doc.pipe(fs.createWriteStream(ADMIN_PDF_DIR_NAME+filename+'.pdf'));

    adminAddLogo();
    admin_DrawPageHeader();
    var title='Trend Analysis Report';
    adminH1(title, 70);

    /* Date */
    var d = new Date();
    var date_string = d.getDate() + ' ' + months[d.getMonth()] + ', ' + d.getFullYear();
    adminInsertFormattedText(date_string, 410, 75, 14, CISCO_BLUE);

    /* Top Skills */
    var skills_text = 'What are our most commonly requested skills?';
    adminInsertHeading(skills_text, 110);
    insertTopSkills();

    /* Top Requestors */
    var requestor_text = 'Who is making the requests, by volume?';
    adminInsertHeading(requestor_text, 220);
    insertTopRequestors();

    /* Top Regions */
    var region_text = 'What Regions are the requests for, by volume?';
    adminInsertHeading(region_text, 330);
    insertTopRegions();

    /* Bandwidth */
    var bandwidth_text = 'Cumulatively, how much bandwidth has been requested?';
    adminInsertHeading(bandwidth_text, 440);
    var bandwidth_value = total_bandwidth1 + '% bandwidth';
    adminInsertNormalText(bandwidth_value, 55, 460);

    /* Average Bandwidth */
    var bandwidth_text = 'On average how much bandwidth allocation has been requested?';
    adminInsertHeading(bandwidth_text, 490);
    var bandwidth_value = average_bandwidth1.substring(0,6) + '% bandwidth per request';
    adminInsertNormalText(bandwidth_value, 55, 510);

    doc.rect(30, 550, 630, 230).stroke();
    
    ///////////////////Column 1//////////////////////////////

    var col1_heading_text = "SME Supply"
    adminInsertNormalText(col1_heading_text, 35, 580);
    adminDrawHorizontalLine(30, 660, 630, 1, "black");
    var col1_heading_part1_text = "Most Skills"
    adminInsertNormalText(col1_heading_part1_text, 35, 680);
    var col1_heading_part2_text = "Available by "
    adminInsertNormalText(col1_heading_part2_text, 35, 690);
    var col1_heading_part3_text = "Volume (Expert"
    adminInsertNormalText(col1_heading_part3_text, 35, 700);
    var col1_heading_part4_text = " + Advanced)"
    adminInsertNormalText(col1_heading_part4_text, 35, 710);

    adminDrawVerticalLine(550, 780,110,1,"black")

    ///////////////////Column 2//////////////////////////////

    var col2_heading_part1_text = 'Architecture /';
    adminTableInsertNormalText(col2_heading_part1_text, 115, 570, '#'+rgbHex(225,165,0));

    var col2_heading_part2_text = 'Services /';
    adminTableInsertNormalText(col2_heading_part2_text, 115, 580,'#'+rgbHex(225,165,0));

    var col2_heading_part3_text = 'Solutions';
    adminTableInsertNormalText(col2_heading_part3_text, 115, 590,'#'+rgbHex(225,165,0));

    var col2_skill1_text = architecture_service_solution[0].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(0, 2).join(' ')+" - "+architecture_service_solution_count[0];
    adminTableInsertSkillText(col2_skill1_text,113, 650);
    var col2_skill1_text_1 = architecture_service_solution[0].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(2).join(' ')
    adminTableInsertSkillText(col2_skill1_text_1,113, 658);

    var col2_skill2_text = architecture_service_solution[1].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(0, 2).join(' ')+" - "+architecture_service_solution_count[1];
    adminTableInsertSkillText(col2_skill2_text,113, 670);
    var col2_skill2_text_1 = architecture_service_solution[1].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(2).join(' ');
    adminTableInsertSkillText(col2_skill2_text_1,113, 678);

    var col2_skill3_text = architecture_service_solution[2].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(0, 2).join(' ')+" - "+architecture_service_solution_count[2];
    adminTableInsertSkillText(col2_skill3_text,113, 690);
    var col2_skill3_text_1 = architecture_service_solution[2].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(2).join(' ');
    adminTableInsertSkillText(col2_skill3_text_1,113, 698);

    var col2_skill4_text = architecture_service_solution[3].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(0, 2).join(' ')+" - "+architecture_service_solution_count[3];
    adminTableInsertSkillText(col2_skill4_text,113, 710);
    var col2_skill4_text_1 = architecture_service_solution[3].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(2).join(' ');
    adminTableInsertSkillText(col2_skill4_text_1,113, 718);

    var col2_skill5_text = architecture_service_solution[4].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(0, 2).join(' ')+" - "+architecture_service_solution_count[4];
    adminTableInsertSkillText(col2_skill5_text,113, 730);
    var col2_skill5_text_1 = architecture_service_solution[4].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(2).join(' ');
    adminTableInsertSkillText(col2_skill5_text_1,113, 738);    

    adminDrawVerticalLine(550, 780, 219, 1, "black")

    ///////////////////Column 3//////////////////////////////


    var col3_heading_part1_text = 'Field Skills &';
    adminTableInsertNormalText(col3_heading_part1_text, 225, 570,'#'+rgbHex(0,128,0));

    var col3_heading_part2_text = 'Partner';
    adminTableInsertNormalText(col3_heading_part2_text, 225, 580,'#'+rgbHex(0,128,0));

    var col3_heading_part3_text = 'Program';
    adminTableInsertNormalText(col3_heading_part3_text, 225, 590,'#'+rgbHex(0,128,0));

    var col3_skill1_text = field_skills[0].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(0, 2).join(' ')+" - "+field_skills_count[0]
    adminTableInsertSkillText(col3_skill1_text,222, 650)
    var col3_skill1_text_1 = field_skills[0].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(2).join(' ')
    adminTableInsertSkillText(col3_skill1_text_1,222, 658)

    var col3_skill2_text = field_skills[1].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(0, 2).join(' ')+" - "+field_skills_count[1]
    adminTableInsertSkillText(col3_skill2_text,222, 670)
    var col3_skill2_text_1 = field_skills[1].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(2).join(' ')
    adminTableInsertSkillText(col3_skill2_text_1,222, 678)


    var col3_skill3_text = field_skills[2].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(0, 2).join(' ')+" - "+field_skills_count[2]
    adminTableInsertSkillText(col3_skill3_text,222, 690)
    var col3_skill3_text_1 = field_skills[2].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(2).join(' ')
    adminTableInsertSkillText(col3_skill3_text_1,222, 698)

    var col3_skill4_text = field_skills[3].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(0, 2).join(' ')+" - "+field_skills_count[3]
    adminTableInsertSkillText(col3_skill4_text,222, 710)
    var col3_skill4_text_1 = field_skills[3].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(2).join(' ')
    adminTableInsertSkillText(col3_skill4_text_1,222, 718)    

    var col2_skill5_text = field_skills[4].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(0, 2).join(' ')+" - "+field_skills_count[4]
    adminTableInsertSkillText(col2_skill5_text,222, 730)
    var col2_skill5_text_1 = field_skills[4].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(2).join(' ')
    adminTableInsertSkillText(col2_skill5_text_1,222, 738)

    adminDrawVerticalLine(550, 780, 328, 1, "black")

    ///////////////////Column 4//////////////////////////////
    
    var col4_heading_part1_text = 'Exec & Accel';
    adminTableInsertNormalText(col4_heading_part1_text, 335, 570,'#'+rgbHex(0,0,255));

    var col4_skill1_text = exec_accel[0].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(0, 2).join(' ')+" - "+exec_accel_count[0]
    adminTableInsertSkillText(col4_skill1_text,331, 650)
    var col4_skill1_text_1 = exec_accel[0].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(2).join(' ')
    adminTableInsertSkillText(col4_skill1_text_1,331, 658)    

    var col4_skill2_text = exec_accel[1].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(0, 2).join(' ')+" - "+exec_accel_count[1]
    adminTableInsertSkillText(col4_skill2_text,331, 670)
    var col4_skill2_text_1 = exec_accel[1].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(2).join(' ')
    adminTableInsertSkillText(col4_skill2_text_1,331, 678)    

    var col4_skill3_text = exec_accel[2].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(0, 2).join(' ')+" - "+exec_accel_count[2]
    adminTableInsertSkillText(col4_skill3_text,331, 690)
    var col4_skill3_text_1 = exec_accel[2].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(2).join(' ')
    adminTableInsertSkillText(col4_skill3_text_1,331, 698)    

    var col4_skill4_text = exec_accel[3].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(0, 2).join(' ')+" - "+exec_accel_count[3]
    adminTableInsertSkillText(col4_skill4_text,331, 710)
    var col4_skill4_text_1 = exec_accel[3].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(2).join(' ')
    adminTableInsertSkillText(col4_skill4_text_1,331, 718)    

    var col4_skill5_text = exec_accel[4].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(0, 2).join(' ')+" - "+exec_accel_count[4]
    adminTableInsertSkillText(col4_skill5_text,331, 730)
    var col4_skill5_text_1 = exec_accel[4].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(2).join(' ')
    adminTableInsertSkillText(col4_skill5_text_1,331, 738)


    adminDrawVerticalLine(550, 780, 443, 1, "black")

    ///////////////////Column 5//////////////////////////////

    var col5_heading_part1_text = 'Transformation';
    adminTableInsertNormalText(col5_heading_part1_text, 445, 570,'#'+rgbHex(128,0,0));

    var col5_skill1_text = transformation[0].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(0, 2).join(' ')+" - "+transformation_count[0]
    adminTableInsertSkillText(col5_skill1_text,445, 650)
    var col5_skill1_text_1 = transformation[0].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(2).join(' ')
    adminTableInsertSkillText(col5_skill1_text_1,445, 658)    

    var col5_skill2_text = transformation[1].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(0, 2).join(' ')+" - "+transformation_count[1]
    adminTableInsertSkillText(col5_skill2_text,445, 670)
    var col5_skill2_text_1 = transformation[1].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(2).join(' ')
    adminTableInsertSkillText(col5_skill2_text_1,445, 678)

    var col5_skill3_text = transformation[2].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(0, 2).join(' ')+" - "+transformation_count[2]
    adminTableInsertSkillText(col5_skill3_text,445, 690)
    var col5_skill3_text_1 = transformation[2].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(2).join(' ')
    adminTableInsertSkillText(col5_skill3_text_1,445, 698)

    var col5_skill4_text = transformation[3].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(0, 2).join(' ')+" - "+transformation_count[3]
    adminTableInsertSkillText(col5_skill4_text,445, 710)
    var col5_skill4_text_1 = transformation[3].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(2).join(' ')
    adminTableInsertSkillText(col5_skill4_text_1,445, 718)

    var col5_skill5_text = transformation[4].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(0, 2).join(' ')+" - "+transformation_count[4]
    adminTableInsertSkillText(col5_skill5_text,445, 730)
    var col5_skill5_text_1 = transformation[4].substring(3).toUpperCase().replace(/_/g, ' ').split(' ').slice(2).join(' ')
    adminTableInsertSkillText(col5_skill5_text_1,445, 738)

    adminDrawVerticalLine(550, 780, 548, 1, "black")

    ///////////////////Column 6//////////////////////////////

    var col6_heading_part1_text = 'Shared';
    adminTableInsertNormalText(col6_heading_part1_text, 550, 570,'#'+rgbHex(47,169,252));

    var col6_heading_part2_text = 'Services';
    adminTableInsertNormalText(col6_heading_part2_text, 550, 580,'#'+rgbHex(47,169,252));

    var col6_skill1_text = shared_service[0].substring(3).toUpperCase().replace(/_/g, ' ')+" - "+shared_service_count[0]
    adminTableInsertSkillText(col6_skill1_text,550, 650)

    var col6_skill2_text = shared_service[1].substring(3).toUpperCase().replace(/_/g, ' ')+" - "+shared_service_count[1]
    adminTableInsertSkillText(col6_skill2_text,550, 670)

    var col6_skill3_text = shared_service[2].substring(3).toUpperCase().replace(/_/g, ' ')+" - "+shared_service_count[2]
    adminTableInsertSkillText(col6_skill3_text,550, 690)

    var col6_skill4_text = shared_service[3].substring(3).toUpperCase().replace(/_/g, ' ')+" - "+shared_service_count[3]
    adminTableInsertSkillText(col6_skill4_text,550, 710)

    var col6_skill5_text = shared_service[4].substring(3).toUpperCase().replace(/_/g, ' ')+" - "+shared_service_count[4]
    adminTableInsertSkillText(col6_skill5_text,550, 730)

    adminDrawPageFooter(1, 1);

    console.log("make Pdf") 

    doc.save();
    doc.end();
    return filename;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////REQUEST FORM////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
app.post("/post_assets", function(req, res) {
    res.writeHead(200, {'Content-Type': 'application/json'});
    var pg = require("pg");
    var doc;
    global.filename = uuidV4();
    aptitude_skill1=[];
    aptitude_skill2=[];
    aptitude_skill3=[];
    aptitude_skill4=[];
    aptitude_skill5=[];
    aptitude_skill6=[];
    interest_skill1 = [];
    interest_skill2 = [];
    interest_skill3 = [];
    interest_skill4 = [];
    interest_skill5 = [];
    interest_skill6 = [];
    emp_info =[];
    emp_allocation_total=[];

    client = new pg.Client(conString);
    client.connect();
    client.query("CREATE TABLE IF NOT EXISTS employees(empid serial primary key,name varchar(50) ,country varchar(50), region varchar(50), function varchar(50),grade varchar(50),title varchar(50), image text, is_active boolean)"); 
    client.query("CREATE TABLE IF NOT EXISTS aptitude(empid int references employees(empid),as_data_center varchar(50),as_cloud varchar(50),as_enterprise_networking varchar(50),as_dna varchar(50),as_collaboration varchar(50),as_digital_experience varchar(50),as_security varchar(50),as_service_provider varchar(50),as_software varchar(50),as_digital_transformation varchar(50),as_services varchar(50),as_technical_support varchar(50),as_professional_services varchar(50),as_managed_services varchar(50),as_solutions varchar(50),as_strategic_partners varchar(50),fs_customer_facing varchar(50),fs_partner_facing varchar(50),fs_system_engineer varchar(50),fs_sales_experience varchar(50),fs_sales_mentoring varchar(50),fs_demand_generation varchar(50),fs_solution_selling varchar(50),fs_vertical_selling varchar(50),p_partner_program varchar(50),es_event_planning varchar(50),es_content_creation varchar(50),es_planning_logistics varchar(50),es_interlocking varchar(50),es_securing_funding varchar(50),es_orchestrating_events varchar(50),es_polling_market_research varchar(50),es_reporting_analysis varchar(50),es_designing_executing_pilots varchar(50),es_presentation_skills varchar(50),es_executive_presence varchar(50),es_communication_skills varchar(50),es_building_fostering_relationships varchar(50),es_buying_models varchar(50),ts_driving_best_practices varchar(50),ts_innovative_thinking varchar(50),ts_designing_process_improvements varchar(50),ts_incubating_new_ideas varchar(50),ts_lightHouse_accounts varchar(50),ts_evolving_gtm_approach varchar(50),os_strategy_development varchar(50),os_annual_planning varchar(50),os_ops_review_qbr_development varchar(50),os_reporting_analysis varchar(50),os_budget_management varchar(50),os_project_management varchar(50),os_powerpoint varchar(50),os_website_development varchar(50),os_social_media varchar(50),os_business_intelligence varchar(50),os_macroeconomics varchar(50),os_data_analytics_industry_knowledge varchar(50),os_digital_capabilities_platform varchar(50),os_knowledge_learning_platforms varchar(50),os_designing_reports_dashboards varchar(50),os_coordinating_it_teams varchar(50),os_application_development varchar(50))");
    client.query("CREATE TABLE IF NOT EXISTS interest(empid int references employees(empid),as_data_center varchar(50),as_cloud varchar(50),as_enterprise_networking varchar(50),as_dna varchar(50),as_collaboration varchar(50),as_digital_experience varchar(50),as_security varchar(50),as_service_provider varchar(50),as_software varchar(50),as_digital_transformation varchar(50),as_services varchar(50),as_technical_support varchar(50),as_professional_services varchar(50),as_managed_services varchar(50),as_solutions varchar(50),as_strategic_partners varchar(50),fs_customer_facing varchar(50),fs_partner_facing varchar(50),fs_system_engineer varchar(50),fs_sales_experience varchar(50),fs_sales_mentoring varchar(50),fs_demand_generation varchar(50),fs_solution_selling varchar(50),fs_vertical_selling varchar(50),p_partner_program varchar(50),es_event_planning varchar(50),es_content_creation varchar(50),es_planning_logistics varchar(50),es_interlocking varchar(50),es_securing_funding varchar(50),es_orchestrating_events varchar(50),es_polling_market_research varchar(50),es_reporting_analysis varchar(50),es_designing_executing_pilots varchar(50),es_presentation_skills varchar(50),es_executive_presence varchar(50),es_communication_skills varchar(50),es_building_fostering_relationships varchar(50),es_buying_models varchar(50),ts_driving_best_practices varchar(50),ts_innovative_thinking varchar(50),ts_designing_process_improvements varchar(50),ts_incubating_new_ideas varchar(50),ts_lightHouse_accounts varchar(50),ts_evolving_gtm_approach varchar(50),os_strategy_development varchar(50),os_annual_planning varchar(50),os_ops_review_qbr_development varchar(50),os_reporting_analysis varchar(50),os_budget_management varchar(50),os_project_management varchar(50),os_powerpoint varchar(50),os_website_development varchar(50),os_social_media varchar(50),os_business_intelligence varchar(50),os_macroeconomics varchar(50),os_data_analytics_industry_knowledge varchar(50),os_digital_capabilities_platform varchar(50),os_knowledge_learning_platforms varchar(50),os_designing_reports_dashboards varchar(50),os_coordinating_it_teams varchar(50),os_application_development varchar(50))");
    generateQuery(req.body,res);
});

function generateQuery(req_body,res){
    var values=[];
    var values_name=[];
    var requestValues=[];
    req_body=req_body["data"]

    for (i = 0; i < req_body.length; i++){
        values[i] = req_body[i]['value'];
        values_name[i] = req_body[i]['name'];
    }
    for (j=0; j<13; j++) {
        requestValues[j]=values[j];
    }
    requestValues[13] = formatted;
    

    if(requestValues[5] == 'ANY'){
        emp_aptitude_query = "SELECT employees.empid , employees.name FROM employees, aptitude WHERE employees.empid = aptitude.empid AND employees.is_active = true AND employees.function != '"+requestValues[1]+"'"; 
        emp_interest_query = "SELECT employees.empid , employees.name FROM employees, interest WHERE employees.empid = interest.empid AND employees.is_active = true AND employees.function != '"+requestValues[1]+"'";
    }
    else{
        emp_aptitude_query = "SELECT employees.empid , employees.name FROM employees, aptitude WHERE employees.empid = aptitude.empid AND region = '"+requestValues[5]+"' AND employees.is_active = true AND employees.function != '"+requestValues[1]+"'"; 
        emp_interest_query = "SELECT employees.empid , employees.name FROM employees, interest WHERE employees.empid = interest.empid AND region = '"+requestValues[5]+"' AND employees.is_active = true AND employees.function != '"+requestValues[1]+"'";      
    }
    emp_querries = "";
    var query_result = "";
    var request_skills = [];
    for (i = 22; i< req_body.length-3; i++){
        if (req_body[i]['value'] == 'Advanced' || req_body[i]['value'] == 'Expert'){

            emp_querries = emp_querries + emp_aptitude_query  + " AND " + "aptitude." +req_body[i]['name'] + " IN " + "(\'Advanced\' , \'Expert\') union all ";
        }
        emp_querries = emp_querries + emp_interest_query + " AND " + "interest." + req_body[i]['name'] + " IN " + "(\'High\' , \'Medium\') union all "; 
        request_skills[i-22] = req_body[i]['name'];
    }

    get_top_emp = "WITH emp AS (" + emp_querries.substring(0, emp_querries.length - 10) + ") Select empid,name, count(empid) as ids_count From emp WHERE name != '" + req_body[0]['value'] + "' GROUP BY empid , name ORDER BY COUNT(empid) DESC LIMIT 6";

    var query = client.query(get_top_emp);
    query.on("row", function (row, result) {
        result.addRow(row);
    });
    query.on("end", function (result) {
        query_result = result.rows;
        console.log(query_result);
        getImages(0,0,request_skills,query_result,values,res);
    });
}


function getImages(index,image_count,request_skills,query_result,values,res){
    if (typeof query_result[image_count] != 'undefined'){
        var query_get_images = "SELECT images FROM employees WHERE empid = "+query_result[image_count]["empid"];
        client.query(query_get_images, function(err, result) {
            if(err) {
                console.log(err)
            }
            else {
                images[image_count]=result.rows[0];
                index++;
                if (index<6) {
                    image_count++;
                    console.log(image_count);
                    getImages(index,image_count,request_skills,query_result,values,res);
                }else{
                    emp_skill_count1(0,0,request_skills,query_result,values,res);
                }
            }
        });
    }else{
        emp_skill_count1(0,0,request_skills,query_result,values,res);
    }
}


function emp_skill_count1(index,app_count1,request_skills,query_result,values,res){
    if (typeof query_result[0] != 'undefined'){
        emp_query1 = "SELECT * FROM aptitude WHERE empid = " + query_result[0]['empid'];
        var result_query1 = "";
        client.query(emp_query1, function(err, result) {
            if(err) {
                console.log(err)
            }
            else {
                result_query1 = result.rows;
                var int_query1 = "SELECT * FROM interest WHERE empid = " + query_result[0]['empid'];
                var result_int_query1 = "";
                client.query(int_query1, function(err, result) {
                    if(err) {
                        console.log(err)
                    }
                    else {
                        result_int_query1 = result.rows;
                        if (typeof result_query1[0] !== 'undefined'){
                            aptitude_skill1.push(result_query1[0][request_skills[index]]);
                            interest_skill1.push(result_int_query1[0][request_skills[index]]);
                            app_count1 = app_count1 +1;
                        };
                        index++;
                        if (index<request_skills.length) {
                            emp_skill_count1(index,app_count1,request_skills,query_result,values,res)
                        }else{
                            emp_skill_count2(0,0,request_skills,query_result,values,res,interest_skill1);
                        }

                    }                

                });        
            }
        });     
    }
    else{
        emp_skill_count2(0,0,request_skills,query_result,values,res,interest_skill1);
    }
}

function emp_skill_count2(index,app_count2,request_skills,query_result,values,res,interest_skill1){

    if (typeof query_result[1] != 'undefined'){
        emp_query2 = "SELECT * FROM aptitude WHERE empid = " + query_result[1]['empid'];
        var result_query2 = "";
        client.query(emp_query2, function(err, result) {
            if(err) {
                console.log(err)
            }
            else {
                result_query2 = result.rows;
                var int_query2 = "SELECT * FROM interest WHERE empid = " + query_result[1]['empid'];
                var result_int_query2 = "";
                client.query(int_query2, function(err, result) {
                    if(err) {
                        console.log(err)
                    }
                    else {
                        result_int_query2 = result.rows;
                        if (typeof result_query2[0] !== 'undefined'){
                            aptitude_skill2.push(result_query2[0][request_skills[index]]);
                            interest_skill2.push(result_int_query2[0][request_skills[index]]);
                            app_count2 = app_count2 +1;
                        }
                        index++;
                        if (index<request_skills.length) {
                            emp_skill_count2(index,app_count2,request_skills,query_result,values,res,interest_skill1);
                        }else{
                            get_total_allocation(0,0,request_skills,query_result,values,res,interest_skill1,interest_skill2);
                        }

                    }                

                });        
            }
        });     
    }
    else{
        get_total_allocation(0,0,request_skills,query_result,values,res,interest_skill1,interest_skill2);
    }
}

function emp_skill_count3(index,app_count3,request_skills,query_result,values,res,interest_skill1,interest_skill2){

    if (typeof query_result[2] != 'undefined'){
        emp_query3 = "SELECT * FROM aptitude WHERE empid = " + query_result[2]['empid'];
        var result_query3 = "";
        client.query(emp_query3, function(err, result) {
            if(err) {
                console.log(err)
            }
            else {
                result_query3 = result.rows;
                var int_query3 = "SELECT * FROM interest WHERE empid = " + query_result[2]['empid'];
                var result_int_query3 = "";
                client.query(int_query3, function(err, result) {
                    if(err) {
                        console.log(err)
                    }
                    else {
                        result_int_query3 = result.rows;
                        if (typeof result_query3[0] !== 'undefined'){
                            aptitude_skill3.push(result_query3[0][request_skills[index]]);
                            interest_skill3.push(result_int_query3[0][request_skills[index]]);
                            app_count3 = app_count3 +1;
                        }
                        index++;
                        if (index<request_skills.length) {
                            emp_skill_count3(index,app_count3,request_skills,query_result,values,res,interest_skill1,interest_skill2)
                        }else{
                            emp_skill_count4(0,0,request_skills,query_result,values,res,interest_skill1,interest_skill2,interest_skill3);
                        }

                    }                

                });        
            }
        });     
    }
    else{
        emp_skill_count4(0,0,request_skills,query_result,values,res,interest_skill1,interest_skill2,interest_skill3);
    }
}
function emp_skill_count4(index,app_count4,request_skills,query_result,values,res,interest_skill1,interest_skill2,interest_skill3){

    if (typeof query_result[3] != 'undefined'){
        emp_query4 = "SELECT * FROM aptitude WHERE empid = " + query_result[3]['empid'];
        var result_query4 = "";
        client.query(emp_query4, function(err, result) {
            if(err) {
                console.log(err)
            }
            else {
                result_query4 = result.rows;
                var int_query4 = "SELECT * FROM interest WHERE empid = " + query_result[3]['empid'];
                var result_int_query4 = "";
                client.query(int_query4, function(err, result) {
                    if(err) {
                        console.log(err)
                    }
                    else {
                        result_int_query4 = result.rows;
                        if (typeof result_query4[0] !== 'undefined'){
                            aptitude_skill4.push(result_query4[0][request_skills[index]]);
                            interest_skill4.push(result_int_query4[0][request_skills[index]]);
                            app_count4 = app_count4 +1;
                        }
                        index++;
                        if (index<request_skills.length) {
                            emp_skill_count4(index,app_count4,request_skills,query_result,values,res,interest_skill1,interest_skill2,interest_skill3);
                        }else{
                            emp_skill_count5(0,0,request_skills,query_result,values,res,interest_skill1,interest_skill2,interest_skill3,interest_skill4);
                        }

                    }                

                });        
            }
        });     
    }
    else{
        emp_skill_count5(0,0,request_skills,query_result,values,res,interest_skill1,interest_skill2,interest_skill3,interest_skill4);
    }
}

function emp_skill_count5(index,app_count5,request_skills,query_result,values,res,interest_skill1,interest_skill2,interest_skill3,interest_skill4){

    if (typeof query_result[4] != 'undefined'){
        emp_query5 = "SELECT * FROM aptitude WHERE empid = " + query_result[4]['empid'];
        var result_query5 = "";
        client.query(emp_query5, function(err, result) {
            if(err) {
                console.log(err)
            }
            else {
                result_query5 = result.rows;
                var int_query5 = "SELECT * FROM interest WHERE empid = " + query_result[4]['empid'];
                var result_int_query5 = "";
                client.query(int_query5, function(err, result) {
                    if(err) {
                        console.log(err)
                    }
                    else {
                        result_int_query5 = result.rows;
                        if (typeof result_query5[0] !== 'undefined'){
                            aptitude_skill5.push(result_query5[0][request_skills[index]]);
                            interest_skill5.push(result_int_query5[0][request_skills[index]]);
                            app_count5 = app_count5 +1;
                        }
                        index++;
                        if (index<request_skills.length) {
                            emp_skill_count5(index,app_count5,request_skills,query_result,values,res,interest_skill1,interest_skill2,interest_skill3,interest_skill4);
                        }else{
                            emp_skill_count6(0,0,request_skills,query_result,values,res,interest_skill1,interest_skill2,interest_skill3,interest_skill4,interest_skill5);
                        }

                    }                

                });        
            }
        });     
    }
    else{
        emp_skill_count6(0,0,request_skills,query_result,values,res,interest_skill1,interest_skill2,interest_skill3,interest_skill4,interest_skill5);
    }
}

function emp_skill_count6(index,app_count6,request_skills,query_result,values,res,interest_skill1,interest_skill2,interest_skill3,interest_skill4,interest_skill5){

    if (typeof query_result[5] != 'undefined'){
        emp_query6 = "SELECT * FROM aptitude WHERE empid = " + query_result[5]['empid'];
        var result_query6 = "";
        client.query(emp_query6, function(err, result) {
            if(err) {
                console.log(err)
            }
            else {
                result_query6 = result.rows;
                var int_query6 = "SELECT * FROM interest WHERE empid = " + query_result[5]['empid'];
                var result_int_query6 = "";
                client.query(int_query6, function(err, result) {
                    if(err) {
                        console.log(err)
                    }
                    else {
                        result_int_query6 = result.rows;
                        if (typeof result_query6[0] !== 'undefined'){
                            aptitude_skill6.push(result_query6[0][request_skills[index]]);
                            interest_skill6.push(result_int_query6[0][request_skills[index]]);
                            app_count6 = app_count6 +1;
                        }
                        index++;
                        if (index<request_skills.length) {
                            emp_skill_count6(index,app_count6,request_skills,query_result,values,res,interest_skill1,interest_skill2,interest_skill3,interest_skill4,interest_skill5);
                        }else{
                            client.end();
                            makeReportPDF(request_skills,query_result,values,res,interest_skill1,interest_skill2,interest_skill3,interest_skill4,interest_skill5,interest_skill6);
                        }

                    }                

                });        
            }
        });     
    }
    else{
        client.end();
        makeReportPDF(request_skills,query_result,values,res,interest_skill1,interest_skill2,interest_skill3,interest_skill4,interest_skill5,interest_skill6);
    }
}


function get_total_allocation(index,allocation_count,request_skills,query_result,values,res,interest_skill1,interest_skill2){
    if (typeof query_result[allocation_count] != 'undefined'){
        total_query = "SELECT SUM(percent_allocation) FROM emp_allocation_ref WHERE emp_id = " + query_result[allocation_count]['empid'];
        var query = client.query(total_query);
        query.on("row", function (row, result) {
            result.addRow(row);
        });
        query.on("end", function (result) {
            emp_allocation_total[allocation_count] = result.rows[0]['sum'];
            index++;
            if (index<6) {
                allocation_count++;
                get_total_allocation(index,allocation_count,request_skills,query_result,values,res,interest_skill1,interest_skill2)
            }else{
               get_initiatives_info(0,0,request_skills,query_result,values,res,interest_skill1,interest_skill2);
            }
        });
    }else{
        get_initiatives_info(0,0,request_skills,query_result,values,res,interest_skill1,interest_skill2);
    }
}

function get_initiatives_info(index,initiative_count,request_skills,query_result,values,res,interest_skill1,interest_skill2){
    if (typeof query_result[index] != 'undefined'){
        ini_query = "SELECT existing_resource_allocation.initiative , emp_allocation_ref.percent_allocation FROM emp_allocation_ref , existing_resource_allocation WHERE emp_allocation_ref.emp_id =" +query_result[initiative_count]['empid']+ "AND emp_allocation_ref.existing_resource_allocation_id = id"
        var query = client.query(ini_query);
        query.on("row", function (row, result) {
            result.addRow(row);
        });
        query.on("end", function (result) {
            emp_info[initiative_count] = result.rows;
            index++
            if (index < 6) {
                initiative_count++;
                get_initiatives_info(index,initiative_count,request_skills,query_result,values,res,interest_skill1,interest_skill2);
            }else{
                emp_skill_count3(0,0,request_skills,query_result,values,res,interest_skill1,interest_skill2);
            }
        });
    }else {
        emp_skill_count3(0,0,request_skills,query_result,values,res,interest_skill1,interest_skill2);
    }
}





    // ********* PDF Generation Code *************
    // *******************************************
    
function drawVerticalLine(y, stroke) {
    doc.lineWidth(stroke);
    doc.lineCap('round')
        .moveTo(40, y)
        .lineTo(720, y)
        .strokeColor('#049FD9')
        .stroke()
}

function drawVerticalLineSmall(x,y, stroke) {
    doc.lineWidth(stroke);
    doc.lineCap('round')
        .moveTo(x, y)
        .lineTo(655, y)
        .strokeColor('#049FD9')
        .stroke()
}

function drawVerticalLineLimit(x,y, stroke,length) {
    doc.lineWidth(stroke);
    doc.lineCap('round')
        .moveTo(x, y)
        .lineTo(length, y)
        .strokeColor('#049FD9')
        .stroke()
}

function drawPageHeader() {
    drawVerticalLine(60, 2.5);
}

function drawPageFooter(page_number,total_page) {
    drawVerticalLine(pdf_page_height-90, 2.5);
    doc.fillColor('#090909');
    doc.fontSize(6);
    doc.text("\u00A9 2017 Cisco and/or its affiliates. All rights reserved. This document is Cisco Public.",40,pdf_page_height-80);
    doc.text("page " + page_number + " of "+ total_page,520,pdf_page_height-80);
}

function h1(text,y) {
    doc.fontSize(20)
        .fillColor('#049FD9')
        .text(text,40,y)
}

function h2(text,x, y) {
    doc.fontSize(14)
        .fillColor('black')
        .text(text,x,y)
}

function h3(text,x, y) {
    doc.fontSize(7)
        .fillColor('black')
        .text(text,x,y)
}

function h5(text,x, y) {
    doc.fontSize(7)
        .fillColor('black')
        .text(text,x,y)
        .stroke(0.5)
        .moveDown(0.5)
}
function h5_bold(text,x, y) {
    doc.fontSize(7)
        .fillColor('green')
        .text(text,x,y)
        .stroke(0.5)
        .moveDown(0.5)
}

function h4(text,x, y) {
    doc.fontSize(8)
        .fillColor('white')
        .text(text,x,y)
}

function insertNormalText(text,x,y, fontSize, lineWidth) {
    doc.fontSize(fontSize)
        .fillColor('#020202')
        .text(text,x,y)
}

function addLogo(){
     var data = 'data:image/jpeg;base64,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';
     doc.image(data, 40,20,{width: 50});
}

function addProfilePic(i,j,index){
    var data;
    if (images[index]['images']) {
        data = images[index]['images'];
    }
    else{
        data = 'data:image/png;base64,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';
    }
    doc.image(data, i,j,{width: 50});
}

function insertRequestedSkills(request_skills){
    var x_axis = 0;
    var y = 0;
    var col2=true;
    var col3=true;

    for (i=0;i<request_skills.length;i++){
        var skill = "-" + request_skills[i];
        x_axis = 40
        if (i >= 4 && i < 8){
            x_axis = 220;
            if (col2){
                y = 0;
                col2 = false;
            }
        }
        else if (i >= 8){
            x_axis = 400;
            if (col3){
                y = 0;
                col3 = false;
            }
        }
        if (request_skills[i].substring(0,2) == "as"){
            r = 255;
            g = 165;
            b = 0;   
        }
        else if(request_skills[i].substring(0,2) == "fs"){
            r = 0;
            g = 128;
            b = 0;
        }
        else if(request_skills[i].substring(0,1) == "p"){
            r = 128;
            g = 0;
            b = 128;
        }
        else if(request_skills[i].substring(0,2) == "es"){
            r = 0;
            g = 0;
            b = 255;                
        }
        else if(request_skills[i].substring(0,2) == "ts"){
            r = 128;
            g = 0;
            b = 0;
        }
        else if(request_skills[i].substring(0,2) == "os"){
            r = 47;
            g = 169;
            b = 252;                
        }
        else{
            r = 0;
            g = 0;
            b = 0;                
        }

        doc.rect(x_axis, 152+y-10, 160, 13)
            .fill('#'+rgbHex(r,g,b))
        h4(skill.substring(3).toUpperCase().replace(/_/g, ' '),x_axis, 145+y);
        y = y + 20;
    }
}

var save_result=[];

function employeeSection(heading, y, index, skillSet, request_skills,query_result,values) {
    var alloc_y = 0;
    var skill_y = 0;
    var offset = y;
    h2(heading,40, y);
    drawVerticalLine(y+15, 1);
    var emp_name = query_result[index]['name'];
    insertNormalText(emp_name, 40, y+25, 12, 500);
    var risk_head = 'RISK ANALYSIS';
    h2(risk_head,410, y+25);
    drawVerticalLineSmall(410,y+40,0.3);
    insertNormalText("Requested Skills",155,y+35,9, 500);
    drawVerticalLineLimit(140,y+44,0.3,280);
    insertNormalText("Aptitude",295,y+35,9, 500);
    drawVerticalLineLimit(290,y+44,0.3,340);
    insertNormalText("Interest",350,y+35,9, 500);
    drawVerticalLineLimit(345,y+44,0.3,390);
    var risk_text = 'You requested a '+values[8] +'% Bandwidth commitment. ' + emp_name +' is currently ';
    if (emp_allocation_total[index] == null) {
        risk_text += 'not allocated on any initiative.';
    }
    else {
        risk_text += emp_allocation_total[index] +'% allocated on the following Initiatives:';
    }
    insertNormalText(risk_text, 410, y+45,8,500);
    if (emp_info.length>0) {
        for(i=0; i<emp_info[index].length;i++){
            var alloc = emp_info[index][i]['initiative'] + ' : ' + emp_info[index][i]['percent_allocation']+'%';
            insertNormalText(alloc,410,y+80+alloc_y,8,500)
            alloc_y = alloc_y+10;
            offset = offset + 10;
        }
        offset = offset + 180;
    }else {
        offset=offset+100;
    }
    var total = request_skills.length * 2;
    var score = (query_result[index]['ids_count']/total)*100;
    if (score.toString().substring(0,3) == '100'){
        len_char = 3;
    }
    else{
        len_char = 2;
    }
    h2(score.toString().substring(0,len_char) + " %", 50, y+45);
    addProfilePic(50,y+65,index)
    //console.log("index - "+request_skills);
    for (i=0;i<request_skills.length;i++){
        var skill1 = "-" + request_skills[i];
        if (request_skills[i].substring(0,2) == "as"){
            r = 255;
            g = 165;
            b = 0;   
        }
        else if(request_skills[i].substring(0,2) == "fs"){
            r = 0;
            g = 128;
            b = 0;
        }
        else if(request_skills[i].substring(0,1) == "p"){
            r = 128;
            g = 0;
            b = 128;
        }
        else if(request_skills[i].substring(0,2) == "es"){
            r = 0;
            g = 0;
            b = 255;                
        }
        else if(request_skills[i].substring(0,2) == "ts"){
            r = 128;
            g = 0;
            b = 0;
        }
        else if(request_skills[i].substring(0,2) == "os"){
            r = 47;
            g = 169;
            b = 252;                
        }
        else{
            r = 0;
            g = 0;
            b = 0;                
        }
        
        doc.circle(150 - 5, y+skill_y+50, 4)
            .fill('#'+rgbHex(r,g,b));

        if (index==0) {

            h5(skill1.substring(3).toUpperCase().replace(/_/g, ' '),150, y+skill_y+47);
            h5(aptitude_skill1[i],300, y+skill_y+47);
            h5(skillSet[i],350, y+skill_y+47);
            skill_y = skill_y + 10;
            
        } else if (index==1) {

            h5(skill1.substring(3).toUpperCase().replace(/_/g, ' '),150, y+skill_y+47);
            h5(aptitude_skill2[i],300, y+skill_y+47);
            h5(skillSet[i],350, y+skill_y+47);            
            skill_y = skill_y + 10;

        } else if (index==2){
            h5(skill1.substring(3).toUpperCase().replace(/_/g, ' '),150, y+skill_y+47);
            h5(aptitude_skill3[i],300, y+skill_y+47);
            h5(skillSet[i],350, y+skill_y+47);
            skill_y = skill_y + 10;

        } else if (index==3){
            h5(skill1.substring(3).toUpperCase().replace(/_/g, ' '),150, y+skill_y+47);
            h5(aptitude_skill4[i],300, y+skill_y+47);
            h5(skillSet[i],350, y+skill_y+47);            
            skill_y = skill_y + 10;

        } else if (index==4){
            h5(skill1.substring(3).toUpperCase().replace(/_/g, ' '),150, y+skill_y+47);
            h5(aptitude_skill5[i],300, y+skill_y+47);
            h5(skillSet[i],350, y+skill_y+47);            
            skill_y = skill_y + 10;
        }

        else{
            h5(skill1.substring(3).toUpperCase().replace(/_/g, ' '),150, y+skill_y+47);
            h5(aptitude_skill6[i],300, y+skill_y+47);
            h5(skillSet[i],350, y+skill_y+47);            
            skill_y = skill_y + 10;                    
        }
    }
    return offset;
}


function calculatePageHeight(y,query_result){
    page_height = y;
    for(emp=0; emp<3;emp++){
        if (typeof query_result[emp] != 'undefined'){
            if (emp_info.length>0) {
                for(i=0; i<emp_info[emp].length;i++){
                    page_height = page_height + 10;
                }
                page_height = page_height + 220;
            }
            else{
                page_height=page_height+100;
            }
        }
    }
    return page_height;
}

function calculatePage2Height(y,query_result){
    page2_height = y;
    for(emp=3; emp<6;emp++){
        if (typeof query_result[emp] != 'undefined'){
            if (emp_info.length>0) {
                for(i=0; i<emp_info[emp].length;i++){
                    page2_height = page2_height + 10;
                }
                page2_height = page2_height + 200;
            }
            else{
                page2_height=page2_height+100;
            }
        }
    }
    return page2_height;
}


function makeReportPDF(request_skills,query_result,values,res,interest_skill1,interest_skill2,interest_skill3,interest_skill4,interest_skill5,interest_skill6) {
    /* Add Title */
    save_result.push(request_skills);
    save_result.push(query_result);
    save_result.push(values);
    save_result.push(interest_skill1);
    save_result.push(interest_skill2);
    save_result.push(interest_skill3);
    save_result.push(interest_skill4);
    save_result.push(interest_skill5);
    save_result.push(interest_skill6);
    save_result.push(aptitude_skill1);
    save_result.push(aptitude_skill2);
    save_result.push(aptitude_skill3);
    save_result.push(aptitude_skill4);
    save_result.push(aptitude_skill5);
    save_result.push(aptitude_skill6);
    save_result.push(emp_info);


    console.log("make page");
    if (typeof query_result[0] == 'undefined'){
        var page_height = calculatePageHeight(500,query_result);
        var page2_height = 0;
    }
    else{
        var page_height = calculatePageHeight(230,query_result);       
        var page2_height = calculatePage2Height(230,query_result);
    }
    if (page2_height > page_height){
        //console.log("page2height " + page2_height);
        pdf_page_height = page2_height;
    }
    else{
        //console.log("page1height "+ page_height);
        pdf_page_height = page_height;
    }
    console.log(pdf_page_height);
    doc = new PDFDocument({
        layout: 'landscape',
        size: [pdf_page_height, 700] // a smaller document for small badge printers
    });
    doc.pipe(fs.createWriteStream(PDF_DIR_NAME+filename+'.pdf'));
    addLogo();
    drawPageHeader();

////////////////////////Header legends////////////////////////////////
    doc.circle(190, 25, 5)
        .fill('#'+rgbHex(225,165,0));
    insertNormalText("Architecture/Services/Solutions Skills", 200,21, 10, 350);

    doc.circle(390, 25, 5)
        .fill('#'+rgbHex(0,128,0));
    insertNormalText("Field Skills", 400,21, 10, 350);

    doc.circle(510, 25, 5)
        .fill('#'+rgbHex(128,0,128));
    insertNormalText("Partner Program Skills", 520,21, 10, 350);

    doc.circle(190, 40, 5)
        .fill('#'+rgbHex(0,0,255));
    insertNormalText("Execution & Acceleration Skills", 200,36, 10, 350);

    doc.circle(390, 40, 5)
        .fill('#'+rgbHex(128,0,0));
    insertNormalText("Transformation Skills", 400,36, 10, 350);

    doc.circle(510, 40, 5)
        .fill('#'+rgbHex(47,169,252));
    insertNormalText("Shared Services Skills", 520,36, 10, 350);

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    var title='Your Request Summary';
    h1(title, 70);
    drawVerticalLine(100, 1);

    /* Description */
    var description = 'You requested a resource with Advanced/Expert proficiency AND/OR High/Medium Interest in the following skills.';
    insertNormalText(description, 40,110, 12, 500);
    insertRequestedSkills(request_skills);
    var offset;

    if (typeof query_result[3] != 'undefined') {
        drawPageFooter(1,2);
    }else{
        drawPageFooter(1,1);
    }

    if (typeof query_result[0] != 'undefined'){
        offset = employeeSection('PRIMARY CANDIDATE RECOMMENDATION', 230, 0, interest_skill1,request_skills,query_result,values);
    }

    if (typeof query_result[1] != 'undefined'){
        console.log("2nd CANDIDATE");
        offset = employeeSection('ALTERNATE CANDIDATE RECOMMENDATION', offset, 1, interest_skill2,request_skills,query_result,values);
    }

    if (typeof query_result[2] != 'undefined'){
        console.log("3rd CANDIDATE");
        offset = employeeSection('2ND ALTERNATE CANDIDATE RECOMMENDATION', offset, 2, interest_skill3,request_skills,query_result,values);
    }

    if (typeof query_result[3] != 'undefined'){
        doc.addPage();
        drawPageFooter(2,2);
        addLogo();
        drawPageHeader();
        console.log("4th CANDIDATE");
        offset = employeeSection('3RD ALTERNATE CANDIDATE RECOMMENDATION', 100, 3, interest_skill4,request_skills,query_result,values);
    }

    if (typeof query_result[4] != 'undefined'){
        console.log("5th CANDIDATE");
        offset = employeeSection('4TH ALTERNATE CANDIDATE RECOMMENDATION', offset, 4, interest_skill5,request_skills,query_result,values);
    }

    if (typeof query_result[5] != 'undefined'){
        console.log("6th CANDIDATE");
        offset = employeeSection('5TH ALTERNATE CANDIDATE RECOMMENDATION', offset, 5, interest_skill6,request_skills,query_result,values);
        drawPageFooter(2,2);
    }

    doc.save();
    doc.end();
    console.log(filename)
    res.end(JSON.stringify({"status":"success", "fileId":filename.toString()}));
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
app.get("/download/:fileId", function(req, res) {
    fs.readFile(__dirname + '/'+ PDF_DIR_NAME +req.params.fileId+'.pdf' , function (err,data){
        res.contentType("application/pdf");
        res.send(data);
        res.end(JSON.stringify({"status":"pdf_success"}));
    });
});
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
app.post("/saveForm", function(req, res) {
    console.log("in saveForm");
    res.writeHead(200, {'Content-Type': 'application/json'});
    var pg = require("pg");
    client = new pg.Client(conString);
    client.connect();
    var values=[];
    values_name=[];
    requestValues=[];
    var skills=[];

    for (i = 0; i < req.body["data"].length; i++){
        values[i] = req.body["data"][i]['value'];
        values_name[i] = req.body["data"][i]['name'];
    }
    for (j=0; j<13; j++) {
        requestValues[j]=values[j];
    }
    requestValues[13] = formatted;

    var skills_index=0;
    for (k=22; k<(values_name.length-3); k++){
        if (values_name!='') {
            skills[skills_index] = values_name[k];
            skills_index++;
        }
    }
    console.log("saveForm")
    var query_create_request = "CREATE TABLE IF NOT EXISTS request(id serial primary key, name varchar(100), function varchar(250), resource_type text, grade varchar(100), job_title varchar(100), region varchar(100), start_date date, end_date date,allocation integer, initiative varchar(250), description text,training varchar(50), metrics varchar(50),requestDate date )";
    client.query(query_create_request, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            var query_create_skill = "CREATE TABLE IF NOT EXISTS skills(id integer, skills_name varchar(250))";
            client.query(query_create_skill, function(err, result) {
                if(err) {
                    console.log(err)
                }
                else {
                    addRequester(requestValues,skills,res);
                }
            });
        }   
    });    
});

function addRequester(requestValues,skills,res){
    var request_id;
    var query_request_insert = "INSERT INTO request(name,function,resource_type,grade,job_title,region,start_date,end_date,allocation,initiative,description,training,metrics,requestDate) values($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14) RETURNING id";
    client.query(query_request_insert, requestValues, function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            request_id = result.rows[0].id;
            add_skills(skills,0,request_id,res);
        }
    });
}

function add_skills(skills,index,request_id,res){
    var query_add_skills = "INSERT INTO skills(id,skills_name) values($1, $2)";
    client.query(query_add_skills, [request_id, skills[index]], function(err, result) {
        if(err) {
            console.log(err)
        }
        else {
            console.log("Sucess");
            index++;
            if (index < skills.length){
                add_skills(skills,index,request_id,res);
            }else{
                client.end();
                res.end(JSON.stringify({"status":"success"}));
                // generateQuery(req_body,res);         
            }
        }
    });
}
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