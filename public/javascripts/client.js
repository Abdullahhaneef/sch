  var SERVER_URI = "http://localhost:3000";
  var empId;


  function showCommunityAnalytics() {
    var user = document.getElementById("user").value
    if (user != "") {
       addEmployeeAnalytics();
      //window.open(SERVER_URI + '/analytics','_self');
    }else{
      jQuery.notify("Enter user name first", "error"); 
    }
  }

  function showCommunityTransformation() {
    var user = document.getElementById("user").value
    if (user != "") {
          addEmployeeTransformation();
          // window.open(SERVER_URI + '/transformation','_self');
    }else{
      jQuery.notify("Enter user name first", "error"); 
    }
  }  

  function addEmployeeAnalytics(){
    var empName  = document.getElementById("user").value;
    var community = 1;

      swal({
      title: empName,
      text: "Check spelling of your name and proceed",
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, Save'
      }).then(function () {
        var settings = {
          "async": true,
          "crossDomain": true,
          "url": SERVER_URI+"/addEmployee",
          "method": "POST",
          "headers": {
            "content-type": "application/x-www-form-urlencoded",
            "cache-control": "no-cache",
          },
          "data": {
            empName , community
          }
        }
        $.ajax(settings).done(function (response) {      
            setEmpId(response);
            window.open(SERVER_URI + '/analytics','_self');
        });
        swal(
          'Saved!',
          'Employee created.',
          'success'
        )
      })
    }

  function addEmployeeTransformation(){
    var empName  = document.getElementById("user").value;
    var community = 2;
    var settings = {
      "async": true,
      "crossDomain": true,
      "url": SERVER_URI+"/addEmployee",
      "method": "POST",
      "headers": {
        "content-type": "application/x-www-form-urlencoded",
        "cache-control": "no-cache",
      },
      "data": {
        empName , community
      }
    }
    $.ajax(settings).done(function (response) {      
        setEmpId(response);
        window.open(SERVER_URI + '/transformation','_self');
    }); 
  }

  function setEmpId(response){
    empId = response.empId;
    localStorage.setItem("empId",empId);
  }

  function addAnalyticsEmpSkill(){
    isEmpty = false;
    empId = localStorage.getItem("empId");
    var core_competency=[];
    var tool_capability = [];
    var category = [];
    var skill = [];
    var experience = [];
    var level =[];
    var certification = [];
    var learning_interest = [];
    var index = 0;
    var myRows = $('table#surveyTable').find('tr');
    var len = myRows.length;
    for (var i = 0; i < len; i++) {
      if($(myRows[i]).find('td').find("Select")[0] == undefined){
        console.log("undefined");
      }
      else{
/////////////////////////////////////////////////////////

//////////////////values from tag id/////////////////////////

////////////////////////////////////////////////////////        
//////////////////// Core competency/////////////////////
        if ($(myRows[i]).attr('id').split("_")[0] == 'cc'){
          core_competency[index] = 'CORE CONSULTING'; 
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'dv'){
          core_competency[index] = 'DATA VISUALIZATION';
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'di'){
          core_competency[index] = 'DATA INTEGRATION';          
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'aa'){
          core_competency[index] = 'ADVANCED ANALYTICS';
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'saias'){
          core_competency[index] = 'SOLUTION ARCHITECTURE, INFRASTRUCTURE, AND SECURITY';
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'dmwa'){
          core_competency[index] = 'DIGITAL MARKETING & WEB ANALYTICS';          
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'p'){
          core_competency[index] = 'PROGRAMMING';
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'acc'){
          core_competency[index] = 'ADOBE CREATIVE CLOUD';
        }
///////////////////tool or capacity/////////////////////////////

        if ($(myRows[i]).attr('id').split("_")[1] == 'tool'){
          tool_capability[index] = 1;
        }
        else if($(myRows[i]).attr('id').split("_")[1] == 'cp'){
          tool_capability[index] = 2;
        }
///////////////////////category////////////////////////////////
        if ($(myRows[i]).attr('id').split("_")[2] == 'pms'){
          category[index] = 'Project Management Suites';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'pm'){
          category[index] = 'Project Management';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'ccfl'){
          category[index] = 'Core Consulting, Finance, Leadership';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'fe'){
          category[index] = 'Functional Experience';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'ive'){
          category[index] = 'Industry Vertical Experience';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'edu'){
          category[index] = 'Education';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'dvt'){
          category[index] = 'Data Visualization tools';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'oordt'){
          category[index] = 'OLAP & Operational Reporting, Dashboarding tools';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'dv'){
          category[index] = 'Data Visualization';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'dit'){
          category[index] = 'Data Integration tools';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'dwp'){
          category[index] = 'Data Warehousing platforms';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'dmt'){
          category[index] = 'Data Modeling tools';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'nst'){
          category[index] = 'NoSQL tools';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'bdt'){
          category[index] = 'Big Data tools';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'iot'){
          category[index] = 'IoT tools';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'od'){
          category[index] = 'OLTP Databases';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'di'){
          category[index] = 'Data Integration';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'aa'){
          category[index] = 'Advanced Analytics';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'st'){
          category[index] = 'Statistics';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'ci'){
          category[index] = 'Cloud Infrastructure';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'dasa'){
          category[index] = 'Database Admin, Server Admin';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'wa'){
          category[index] = 'Web Analytics';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'rts'){
          category[index] = 'Real-time Stats';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'aca'){
          category[index] = 'Advanced Customer Analytics';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'dmp'){
          category[index] = 'Data Management Platforms';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'pl'){
          category[index] = 'Programming Languages';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'acc'){
          category[index] = 'Adobe Creative Cloud';
        }

        skill[index] = $(myRows[i]).attr('id').split("_")[3]

/////////////////////////////////////////////////////////////////////

////////////////////values from form////////////////////////////////

//////////////////////////////////////////////////////////////////
        var rowValue = $(myRows[i]).find('td');

////////////////////Experience////////////////////////////////////////        
        if (rowValue.find("Select")[0].value == 'Project Experience'){
          experience[index] = 1;
        }
        else if (rowValue.find("Select")[0].value == 'General Education'){
          experience[index] = 2; 
        }
        else if (rowValue.find("Select")[0].value == 'N/A'){
          experience[index] = 3; 
        }

/////////////////////////Level///////////////////////////////////////////

        level[index] = rowValue.find("Select")[1].value;
        if(rowValue.find("Select")[1].value == '1 - Introductory'){
          level[index] = 1;  
        }
        else if(rowValue.find("Select")[1].value == '2 - Basic'){
          level[index] = 2;  
        }
        else if(rowValue.find("Select")[1].value == '3 - Proficient'){
          level[index] = 3;  
        }
        else if(rowValue.find("Select")[1].value == '4 - Advanced'){
          level[index] = 4;  
        }
        else if(rowValue.find("Select")[1].value == '5 - Mastery'){
          level[index] = 5;  
        }
        else{
          level[index] = null;  
        }

/////////////////////////Restriction check///////////////////////////////////////////        
        if (rowValue.find("Select")[0].value != 'N/A' && rowValue.find("Select")[1].value == ''){
          var id = "#" +  $(myRows[i]).attr('id');
          jQuery(id).find('font')[0].color = 'red';
          jQuery(rowValue.find("Select")[1]).notify("Error");
          isEmpty = true;
        }
/////////////////////////Certification//////////////////////////////////////

        if (rowValue.find("Select")[2].value == 'YES'){
          certification[index] = 1;
        }
        else if (rowValue.find("Select")[2].value == 'NO'){
          certification[index] = 2; 
        }

/////////////////////////Learning Interest//////////////////////////////////////

        learning_interest[index] = rowValue.find("Select")[3].value;

//////////////////index increasing for values in array////////////////////

        index = index + 1;
      }
    }

//////////////////////post request//////////////////////////////
    
    if (isEmpty) {
      jQuery.notify("Correctly Fill the highlighted fields", "error");
    }
    else{
      swal({
      title: 'Are you sure?',
      text: "Check the values, you won't be able to revert this.",
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, save'
      }).then(function () {
        var settings = {
          "async": true,
          "crossDomain": true,
          "url": SERVER_URI+"/addAnalyticsEmpSkill",
          "method": "POST",
          "headers": {
            "content-type": "application/x-www-form-urlencoded",
            "cache-control": "no-cache",
          },
          "data": {
            empId, core_competency, tool_capability, category, skill, experience, level, certification, learning_interest
          }
        }
        $.ajax(settings).done(function (response) {
            window.open(SERVER_URI + '/human_resources','_self');   
            jQuery.notify("Employee Added Successfully.", "success");
        });
        swal(
          'Saved!',
          'Request has been saved.',
          'success'
        )
      })
    }
  }
//////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////Transformation Form///////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////

function addTransformationEmpSkill(){
    isEmpty = false;
    empId = localStorage.getItem("empId");
    var core_competency=[];
    var tool_capability = [];
    var category = [];
    var skill = [];
    var experience = [];
    var level =[];
    var certification = [];
    var learning_interest = [];
    var index = 0;
    var myRows = $('table#transformationTable').find('tr');
    var len = myRows.length;
    for (var i = 0; i < len; i++) {
      if($(myRows[i]).find('td').find("Select")[0] == undefined){
        console.log("undefined");
      }
      else{
/////////////////////////////////////////////////////////

//////////////////values from tag id/////////////////////////

////////////////////////////////////////////////////////        
//////////////////// Core competency/////////////////////
        if ($(myRows[i]).attr('id').split("_")[0] == 'cc'){
          core_competency[index] = 'CORE CONSULTING'; 
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'pm'){
          core_competency[index] = 'PROGRAM MANAGEMENT';
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'prm'){
          core_competency[index] = 'PRODUCT MANAGEMENT ';
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'de'){
          core_competency[index] = 'DIGITAL ENABLEMENT';          
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'deo'){
          core_competency[index] = 'DIGITAL ENGAGEMENT & OPERATIONS';          
        }
///////////////////tool or capability/////////////////////////////

        if ($(myRows[i]).attr('id').split("_")[1] == 'tool'){
          tool_capability[index] = 1;
        }
        else if($(myRows[i]).attr('id').split("_")[1] == 'cp'){
          tool_capability[index] = 2;
        }
        else if($(myRows[i]).attr('id').split("_")[1] == 'sk'){
          tool_capability[index] = 3;
        }
        else if($(myRows[i]).attr('id').split("_")[1] == 'p'){
          tool_capability[index] = 4;
        }
///////////////////////category////////////////////////////////
        if ($(myRows[i]).attr('id').split("_")[2] == 'ccfl'){
          category[index] = 'Core Consulting, Finance, Leadership';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'fe'){
          category[index] = 'Functional Experience';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'ive'){
          category[index] = 'Industry Vertical Experience';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'edu'){
          category[index] = 'Education';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'general'){
          category[index] = 'General (PROGRAM MANAGEMENT)';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'ee'){
          category[index] = 'Execution Experience ';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'pms'){
          category[index] = 'Project Management Suites';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'cert'){
          category[index] = 'Certifications (PROGRAM MANAGEMENT)';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'gt'){
          category[index] = 'General Tools';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'c'){
          category[index] = 'Certifications (PRODUCT MANAGEMENT)';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'gud'){
          category[index] = 'General / UX Design';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'se'){
          category[index] = 'Strategy & Execution';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'mt'){
          category[index] = 'MarTech';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'ec'){
          category[index] = 'e-Commerce';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'crm'){
          category[index] = 'CRM';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'erp'){
          category[index] = 'ERP';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'cloud'){
          category[index] = 'Cloud';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'mobile'){
          category[index] = 'Mobile';
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'gen'){
          category[index] = 'General (DIGITAL ENABLEMENT)';
        }
/////////////////////////////skill///////////////////////////////////////////        
        if ($(myRows[i]).attr('id').split("_")[3] == 'other1' || $(myRows[i]).attr('id').split("_")[3] == 'other2' || $(myRows[i]).attr('id').split("_")[3] == 'other3'){
          skill[index] = $(myRows[i]).find('td').find("input")[0].value;
        }
        else{
          skill[index] = $(myRows[i]).attr('id').split("_")[3]
        }
/////////////////////////////////////////////////////////////////////

////////////////////values from form////////////////////////////////

//////////////////////////////////////////////////////////////////
        var rowValue = $(myRows[i]).find('td');

////////////////////Experience////////////////////////////////////////        
        if (rowValue.find("Select")[0].value == 'Project Experience'){
          experience[index] = 1;
        }
        else if (rowValue.find("Select")[0].value == 'General Education'){
          experience[index] = 2; 
        }
        else if (rowValue.find("Select")[0].value == 'N/A'){
          experience[index] = 3; 
        }else if (rowValue.find("Select")[0].value == ''){
          isEmpty = true 
        }

/////////////////////////Level///////////////////////////////////////////

        if(rowValue.find("Select")[1].value == '0 - No Experience'){
          level[index] = 6;  
        }
        else if(rowValue.find("Select")[1].value == '1 - Competent'){
          level[index] = 7;  
        }
        else if(rowValue.find("Select")[1].value == '2 - Proficient'){
          level[index] = 8;  
        }
        else if(rowValue.find("Select")[1].value == '3 - Advanced'){
          level[index] = 9;  
        }
        else if(rowValue.find("Select")[1].value == '4 - Mastery'){
          level[index] = 10;  
        }else if (rowValue.find("Select")[1].value == ''){
          isEmpty = true 
        }

/////////////////////////Certification//////////////////////////////////////

        if (rowValue.find("Select")[2].value == 'YES'){
          certification[index] = 1;
        }
        else if (rowValue.find("Select")[2].value == 'NO'){
          certification[index] = 2; 
        }else if (rowValue.find("Select")[2].value == ''){
          isEmpty = true 
        }

/////////////////////////Learning Interest//////////////////////////////////////

        learning_interest[index] = rowValue.find("Select")[3].value;
        if (rowValue.find("Select")[3].value == ''){
          isEmpty = true 
        }
//////////////////index increasing for values in array////////////////////

        index = index + 1;
      }
    }

//////////////////////post request//////////////////////////////
  if (isEmpty) {
    jQuery.notify("Fill the empty field", "error");
  }else{
    var settings = {
        "async": true,
        "crossDomain": true,
        "url": SERVER_URI+"/addTransformationEmpSkill",
        "method": "POST",
        "headers": {
          "content-type": "application/x-www-form-urlencoded",
          "cache-control": "no-cache",
        },
        "data": {
          empId, core_competency, tool_capability, category, skill, experience, level, certification, learning_interest
        }
      }
      $.ajax(settings).done(function (response) {
          window.open(SERVER_URI + '/human_resources','_self');   
          jQuery.notify("Employee Added Successfully.", "success");
      });
    }
  }

////////////////////////////////////////////////////////////////////////

////////////////////////////Human Element Survey////////////////////////////

///////////////////////////////////////////////////////////////////////////
function addHumanElement(){
  var name=[];
  var value=[];
  empId = localStorage.getItem("empId");
  var len = document.getElementById('mainPage').children[1].length
    for (var i = 0; i< len - 1; i++) {
      name[i] =  document.getElementById('mainPage').children[1][i].id;
      value[i] =  document.getElementById('mainPage').children[1][i].value;
    }
    for (var j = 0; j < 3; j++) {
      value[j] = value[j]/100;
    }
  //////////////////////post request//////////////////////////////

  var settings = {
    "async": true,
    "crossDomain": true,
    "url": SERVER_URI+"/addHumanElement",
    "method": "POST",
    "headers": {
      "content-type": "application/x-www-form-urlencoded",
      "cache-control": "no-cache",
    },
    "data": {
      empId, name , value
    }
  }
  $.ajax(settings).done(function (response) {
      window.open(SERVER_URI,'_self');   
      jQuery.notify("Employee Added Successfully.", "success");
  });
}