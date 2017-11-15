  var SERVER_URI = "http://192.168.0.124:8090";
  var empId;
  var updatedAnalyticsIds = [];
  var updatedAnalyticsExp = [];
  var updatedAnalyticsLvl = [];
  var updatedAnalyticsCer = [];
  var updatedAnalyticsInt = [];
  var updatedTransformationIds = [];
  var updatedTransformationExp = [];
  var updatedTransformationLvl = [];
  var updatedTransformationCer = [];
  var updatedTransformationInt = [];
  var humanElementId = [];
  var humanElementValue = [];
  if ((JSON.parse(localStorage.getItem('obj')) == null || JSON.parse(localStorage.getItem('obj')).empId == 0) && window.location.href != SERVER_URI+"/index" && window.location.href != SERVER_URI+"/admin_capability") {
    window.open(SERVER_URI + '/index','_self');
  }

  function showCommunityAnalytics() {
    var user = document.getElementById("user").value
    var email = document.getElementById("email").value
    if (user != "") {
      if (email != ""){
        addEmployeeAnalytics();
      }
      else{
        jQuery.notify("Enter Email first", "error");  
      }
    }
    else{
      jQuery.notify("Enter user name first", "error"); 
    }
  }

  function showCommunityTransformation() {
    var user = document.getElementById("user").value
    var email = document.getElementById("email").value
    if (user != "") {
      if (email != ""){
        addEmployeeTransformation();
      }
      else{
        jQuery.notify("Enter Email first", "error");  
      }      
    }
    else{
      jQuery.notify("Enter user name first", "error"); 
    }
  }

  function addEmployeeAnalytics(){
    var empName  = document.getElementById("user").value;
    var email = document.getElementById("email").value
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
          empName ,email , community
        }
      }
      $.ajax(settings).done(function (response) {      
          if(response.status == 'employee_exist'){
            var exist_id = response.empId.id;
            swal({
              title: "Employee Exist",
              text: "Do you want to update skills information?",
              type: 'warning',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: 'Yes, Update'
            }).then(function () {
              var settings = {
                "async": true,
                "crossDomain": true,
                "url": SERVER_URI+"/del_skills",
                "method": "POST",
                "headers": {
                  "content-type": "application/x-www-form-urlencoded",
                  "cache-control": "no-cache",
                },
                "data": {
                  exist_id
                }
              }
              $.ajax(settings).done(function (response) {      
                  setEmpId({"empId": exist_id}, 1);
                  window.open(SERVER_URI + '/analytics','_self');
              });
            })
          }
          else{
            setEmpId(response,1);
            window.open(SERVER_URI + '/analytics','_self');
          }
      });
    })
  }

  function addEmployeeTransformation(){
    var empName  = document.getElementById("user").value;
    var email = document.getElementById("email").value
    var community = 2;
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
          empName ,email , community
        }
      }
      $.ajax(settings).done(function (response) {      
          if(response.status == 'employee_exist'){
            var exist_id = response.empId.id;
            swal({
              title: "Employee Exist",
              text: "Do you want to update skills information?",
              type: 'warning',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: 'Yes, Update'
            }).then(function () {
              var settings = {
                "async": true,
                "crossDomain": true,
                "url": SERVER_URI+"/del_skills",
                "method": "POST",
                "headers": {
                  "content-type": "application/x-www-form-urlencoded",
                  "cache-control": "no-cache",
                },
                "data": {
                  exist_id
                }
              }
              $.ajax(settings).done(function (response) {      
                  setEmpId({"empId": exist_id}, 2);
                  window.open(SERVER_URI + '/transformation','_self');
              });
            })
          }
          else{
            setEmpId(response,2);
            window.open(SERVER_URI + '/transformation','_self');
          }
      });
    })
  }

  function setEmpId(response, community_id){
    empId = response.empId;
    var obj = {"empId": empId, "community_id": community_id}
    localStorage.setItem('obj',JSON.stringify(obj));
  }

  function addAnalyticsEmpSkill(){

    var myRows = $('table#surveyTable').find('tr');
    var len = myRows.length;
    for (var i = 0; i < len; i++) {
      if($(myRows[i]).find('td').find("Select")[0] == undefined){
        console.log("undefined");
      }
      else{
        var id = '[id="'+$(myRows[i]).attr('id')+'"]';
        jQuery(id).find('font')[0].color = 'black';
        var rowValue = $(myRows[i]).find('td');
        jQuery(rowValue.find("Select")[0]).notify()  
      }
    }
    var obj = localStorage.getItem('obj');
    var objResult = JSON.parse(obj);
    empId = objResult.empId;
    isEmpty = false;
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
        if (rowValue.find("Select")[0].value == 'PROJECT EXPERIENCE'){
          experience[index] = 1;
        }
        else if (rowValue.find("Select")[0].value == 'GENERAL EDUCATION'){
          experience[index] = 2; 
        }
        else if (rowValue.find("Select")[0].value == 'N/A'){
          experience[index] = 3; 
        }

/////////////////////////Level///////////////////////////////////////////

        if(rowValue.find("Select")[1].value == '1 - INTRODUCTORY'){
          level[index] = 1;  
        }
        else if(rowValue.find("Select")[1].value == '2 - BASIC'){
          level[index] = 2;  
        }
        else if(rowValue.find("Select")[1].value == '3 - PROFICIENT'){
          level[index] = 3;  
        }
        else if(rowValue.find("Select")[1].value == '4 - ADVANCED'){
          level[index] = 4;  
        }
        else if(rowValue.find("Select")[1].value == '5 - MASTERY'){
          level[index] = 5;  
        }
        else{
          level[index] = 'null';
        }

/////////////////////////Restriction check///////////////////////////////////////////        
        if (rowValue.find("Select")[0].value != 'N/A' && rowValue.find("Select")[1].value == ''){
          var id = '[id="'+$(myRows[i]).attr('id')+'"]';
          jQuery(id).find('font')[0].color = 'red';
          jQuery(rowValue.find("Select")[0]).notify("Experience without Level???",{clickToHide: true,autoHide: false,className: 'error',elementPosition: 'left'});
          isEmpty = true;
        }
        if (rowValue.find("Select")[0].value == 'N/A' && rowValue.find("Select")[1].value != ''){
          var id = '[id="'+$(myRows[i]).attr('id')+'"]';
          jQuery(id).find('font')[0].color = 'red';
          jQuery(rowValue.find("Select")[0]).notify("Level without Experience???",{clickToHide: true,autoHide: false,className: 'error',elementPosition: 'left'});
          isEmpty = true;
        }
        if (rowValue.find("Select")[1].value == '' &&  rowValue.find("Select")[2].value == 'YES'){
          var id = '[id="'+$(myRows[i]).attr('id')+'"]';
          jQuery(id).find('font')[0].color = 'red';
          jQuery(rowValue.find("Select")[0]).notify("Certification without Level???",{clickToHide: true,autoHide: false,className: 'error',elementPosition: 'left'});
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

        if(rowValue.find("Select")[3].value == '0 - AVOID'){
          learning_interest[index] = 0;  
        }
        else if(rowValue.find("Select")[3].value == '1 - DEVELOP'){
          learning_interest[index] = 1;  
        }
        else if(rowValue.find("Select")[3].value == '2 - ENGAGE'){
          learning_interest[index] = 2;  
        }
        else if(rowValue.find("Select")[3].value == '3 - ACCELERATE'){
          learning_interest[index] = 3;  
        }

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
    var myRows = $('table#surveyTable').find('tr');
    var len = myRows.length;
    for (var i = 0; i < len; i++) {
      if($(myRows[i]).find('td').find("Select")[0] == undefined){
        console.log("undefined");
      }
      else{
        var id = '[id="'+$(myRows[i]).attr('id')+'"]';
        jQuery(id).find('font')[0].color = 'black';
        var rowValue = $(myRows[i]).find('td');
        jQuery(rowValue.find("Select")[0]).notify()  
      }
    }
    isEmpty = false;
    var obj = localStorage.getItem('obj');
    var objResult = JSON.parse(obj);
    empId = objResult.empId;
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
        else if($(myRows[i]).attr('id').split("_")[0] == 'pm'){
          core_competency[index] = 'PROGRAM MANAGEMENT';
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'prm'){
          core_competency[index] = 'PRODUCT MANAGEMENT';
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
        else if ($(myRows[i]).attr('id').split("_")[2] == 'fe'){
          category[index] = 'Functional Experience';
        }
        else if ($(myRows[i]).attr('id').split("_")[2] == 'ive'){
          category[index] = 'Industry Vertical Experience';
        }
        else if ($(myRows[i]).attr('id').split("_")[2] == 'edu'){
          category[index] = 'Education';
        }
        else if ($(myRows[i]).attr('id').split("_")[2] == 'general'){
          category[index] = 'General (PROGRAM MANAGEMENT)';
        }
        else if ($(myRows[i]).attr('id').split("_")[2] == 'ee'){
          category[index] = 'Execution Experience ';
        }
        else if ($(myRows[i]).attr('id').split("_")[2] == 'pms'){
          category[index] = 'Project Management Suites';
        }
        else if ($(myRows[i]).attr('id').split("_")[2] == 'cert'){
          category[index] = 'Certifications (PROGRAM MANAGEMENT)';
        }
        else if ($(myRows[i]).attr('id').split("_")[2] == 'gt'){
          category[index] = 'General Tools';
        }
        else if ($(myRows[i]).attr('id').split("_")[2] == 'c'){
          category[index] = 'Certifications (PRODUCT MANAGEMENT)';
        }
        else if ($(myRows[i]).attr('id').split("_")[2] == 'gud'){
          category[index] = 'General / UX Design';
        }
        else if ($(myRows[i]).attr('id').split("_")[2] == 'se'){
          category[index] = 'Strategy & Execution';
        }
        else if ($(myRows[i]).attr('id').split("_")[2] == 'mt'){
          category[index] = 'MarTech';
        }
        else if ($(myRows[i]).attr('id').split("_")[2] == 'ec'){
          category[index] = 'e-Commerce';
        }
        else if ($(myRows[i]).attr('id').split("_")[2] == 'crm'){
          category[index] = 'CRM';
        }
        else if ($(myRows[i]).attr('id').split("_")[2] == 'erp'){
          category[index] = 'ERP';
        }
        else if ($(myRows[i]).attr('id').split("_")[2] == 'cloud'){
          category[index] = 'Cloud';
        }
        else if ($(myRows[i]).attr('id').split("_")[2] == 'mb'){
          category[index] = 'Mobile';
        }
        else if ($(myRows[i]).attr('id').split("_")[2] == 'gen'){
          category[index] = 'General (DIGITAL ENABLEMENT)';
        }
        else if ($(myRows[i]).attr('id').split("_")[2] == 'deo'){
          category[index] = 'DIGITAL ENGAGEMENT & OPERATIONS';
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
        if (rowValue.find("Select")[0].value == 'PROJECT EXPERIENCE'){
          experience[index] = 1;
        }
        else if (rowValue.find("Select")[0].value == 'GENERAL EDUCATION'){
          experience[index] = 2; 
        }
        else if (rowValue.find("Select")[0].value == 'N/A'){
          experience[index] = 3; 
        }
/////////////////////////Level///////////////////////////////////////////

        if(rowValue.find("Select")[1].value == '1 - INTRODUCTORY'){
          level[index] = 1;  
        }
        else if(rowValue.find("Select")[1].value == '2 - BASIC'){
          level[index] = 2;  
        }
        else if(rowValue.find("Select")[1].value == '3 - PROFICIENT'){
          level[index] = 3;  
        }
        else if(rowValue.find("Select")[1].value == '4 - ADVANCED'){
          level[index] = 4;  
        }
        else if(rowValue.find("Select")[1].value == '5 - MASTERY'){
          level[index] = 5;  
        }
        else{
          level[index] = 'null';  
        }

/////////////////////////Restriction check///////////////////////////////////////////        
        if (rowValue.find("Select")[0].value != 'N/A' && rowValue.find("Select")[1].value == ''){
          var id = '[id="'+$(myRows[i]).attr('id')+'"]';
          jQuery(id).find('font')[0].color = 'red';
          jQuery(rowValue.find("Select")[0]).notify("Experience without Level???",{clickToHide: true,autoHide: false,className: 'error',elementPosition: 'left'});
          isEmpty = true;
        }
        if (rowValue.find("Select")[0].value == 'N/A' && rowValue.find("Select")[1].value != ''){
          var id = '[id="'+$(myRows[i]).attr('id')+'"]';
          jQuery(id).find('font')[0].color = 'red';
          jQuery(rowValue.find("Select")[0]).notify("Level without Experience???",{clickToHide: true,autoHide: false,className: 'error',elementPosition: 'left'});
          isEmpty = true;
        }
        if (rowValue.find("Select")[1].value == '' &&  rowValue.find("Select")[2].value == 'YES'){
          var id = '[id="'+$(myRows[i]).attr('id')+'"]';
          jQuery(id).find('font')[0].color = 'red';
          jQuery(rowValue.find("Select")[0]).notify("Certification without Level???",{clickToHide: true,autoHide: false,className: 'error',elementPosition: 'left'});
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
        if(rowValue.find("Select")[3].value == '0 - AVOID'){
          learning_interest[index] = 0;  
        }
        else if(rowValue.find("Select")[3].value == '1 - DEVELOP'){
          learning_interest[index] = 1;  
        }
        else if(rowValue.find("Select")[3].value == '2 - ENGAGE'){
          learning_interest[index] = 2;  
        }
        else if(rowValue.find("Select")[3].value == '3 - ACCELERATE'){
          learning_interest[index] = 3;  
        }
//////////////////index increasing for values in array////////////////////
        index = index + 1;
      }
    }
//////////////////////post request//////////////////////////////
  if (isEmpty) {
    jQuery.notify("Correctly Fill the highlighted fields", "error");
  }else{
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
        });
        swal(
          'Saved!',
          'Request has been saved.',
          'success'
        )
      })
    }
  }
////////////////////////////////////////////////////////////////////////

////////////////////////////Human Element Survey////////////////////////////

///////////////////////////////////////////////////////////////////////////
function addHumanElement(){
    var obj = localStorage.getItem('obj');
    var objResult = JSON.parse(obj);
    empId = objResult.empId;
    var community_id = objResult.community_id;
    var name=[];
    var value=[];
    var len = document.getElementById('mainPage').children[1].length
      for (var i = 0; i< len - 1; i++) {
        name[i] =  document.getElementById('mainPage').children[1][i].id;
        value[i] =  document.getElementById('mainPage').children[1][i].value;
      }
      for (var j = 0; j < 3; j++) {
        value[j] = value[j]/100;
      }
    //////////////////////post request//////////////////////////////
    swal({
    title: 'Are you sure?',
    text: "Check the values, you won't be able to revert this. Once Successfully saved it would redirect to login page.",
    type: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Yes, save'
    }).then(function () {
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
        empId, name , value, community_id
      }
    }
    $.ajax(settings).done(function (response) {
      setEmpId({"empId":0},0)
      window.open(SERVER_URI + '/logout','_self');
    });
    swal(
      'Saved!',
      'Request has been saved.',
      'success'
      )
    })
}

//////////////////////////////////////////////////////////////////////////////////
///////////////////////////////Admin Capability///////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

///////////////////////////Get Employees//////////////////////////////////////////

function getEmployees(){
  var settings = {
    "async": true,
    "crossDomain": true,
    "url": SERVER_URI+"/get_employees",
    "method": "GET",
    "headers": {
      "cache-control": "no-cache"
    }
  }
  $.ajax(settings).done(function (response) {
    renderEmployees(response);
  });
}

function renderEmployees(response){
  var is_active;
  jQuery("#employees_table_body").empty();
  if (response['employees']){
    for (i=0; i < response['employees'].length;i++){
      if (response["employees"][i]["is_active"]){
        is_active = "checked";
      }
      else{
        is_active = "";
      }
      jQuery("#employees_table_body").append('<tr>\
                            <td> '+response['employees'][i]["id"]+' </td>\
                            <td> <input name="name" type="Text" value = "'+response["employees"][i]["name"]+'"></td>\
                            <td> <input name="email" type="Text" value = "'+response["employees"][i]["email"]+'"></td>\
                            <td> '+response['employees'][i]["community"]+' </td>\
                            <td> <input name="is_active" type="checkbox" '+is_active+' > </td>\
                            <td> <span id = "updateRecord" title="Update this record" class="btn btn-link" style="cursor:pointer" onclick="updateEmployee('+parseInt(response["employees"][i]["id"])+',jQuery(this).parent().parent())">Update</span> </td>\
                            <td> <span title="Update this record" class="btn btn-link" style="cursor:pointer" onclick="showSkills('+parseInt(response["employees"][i]["id"])+',jQuery(this).parent().parent())">Update Skills</span> </td>\
                            <td> <span title="Update this record" class="btn btn-link" style="cursor:pointer" onclick="showHumanElement('+parseInt(response["employees"][i]["id"])+',jQuery(this).parent().parent())">Update Human Elements</span> </td>\
                            <td> <span title="delete this record" class="glyphicon glyphicon-trash text-danger" style="cursor:pointer" onclick="delEmployee('+parseInt(response['employees'][i]["id"])+')"></span> </td>\
                        </tr>');
    }
    emp_table = jQuery('#employees_table').DataTable({
          "lengthChange": false,
          "ordering": false,
          "searching": false,
          "autoWidth": false,
          "pageLength": 25,
          "retrieve": true
    });
  }
}

/////////////////////////////////Delete Employee//////////////////////////////////////
function delEmployee(empId){
  var obj = {"empId" : empId};
  swal({
    title: 'Are you sure?',
    text: "You won't be able to revert this!",
    type: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Yes, delete it!'
  }).then(function () {
      var settings = {
        "async": true,
        "crossDomain": true,
        "url": SERVER_URI+"/delete_employee",
        "method": "POST",
        "headers": {
          "content-type": "application/json",
          "cache-control": "no-cache"
        },
        "processData": false,
        "data": JSON.stringify(obj)
      }
      $.ajax(settings).done(function (response) {
          emp_table.destroy(false);     
          getEmployees();
      });
      swal(
        'Deleted!',
        'Employee has been deleted.',
        'success'
      )
  })
}

///////////////////////////////Update Employee//////////////////////////////////////////////
function updateEmployee(empId,emp){
  var obj = {
              "empId":empId,
              "name" : jQuery(emp).children().find("input")[0].value, 
              "email" : jQuery(emp).children().find("input")[1].value,
              "is_active":jQuery(emp).children().find("input")[2].checked
            }
  var settings = {
    "async": true,
    "crossDomain": true,
    "url": SERVER_URI+"/update_employee",
    "method": "POST",
    "headers": {
      "content-type": "application/json",
      "cache-control": "no-cache"
    },
    "processData": false,
    "data": JSON.stringify(obj)
  }
  $.ajax(settings).done(function (response) {
    jQuery.notify("Successfully Updated Employee","success");
  });
}

//////////////////////////////Show skills Update////////////////////////////////////////////////

function showSkills(empId,emp){
  if(jQuery(emp).children()[3].innerText == 'ANALYTICS'){
    setEmpId({"empId":empId},1);
    jQuery('#add_button').hide();
    jQuery('#update_button').show();
    window.open(SERVER_URI + '/analytics_update','_self');    
  }
  else if(jQuery(emp).children()[3].innerText == 'TRANSFORMATION'){
    setEmpId({"empId":empId},2);
    jQuery('#add_button').hide();
    jQuery('#update_button').show();
    window.open(SERVER_URI + '/transformation_update','_self');    
  }
}

function check(){
  var updatedRowId;
  if($(location).attr("href") == SERVER_URI+'/analytics_update'){
    $( document ).ready(function() {
      $('[class="select form-control"]').change(function() {
        updatedRowId = $(this).parent().parent().parent().attr('id')
        var skill = updatedRowId.split("_")[3]
        if (updatedAnalyticsIds.indexOf(skill) > -1) {
          var index = updatedAnalyticsIds.indexOf(skill);
          updatedAnalyticsExp[index] = $('[id="'+updatedRowId+'"]').find('td').find('Select')[0].value
          updatedAnalyticsLvl[index] = $('[id="'+updatedRowId+'"]').find('Select')[1].value
          updatedAnalyticsCer[index] = $('[id="'+updatedRowId+'"]').find('Select')[2].value
          updatedAnalyticsInt[index] = $('[id="'+updatedRowId+'"]').find('Select')[3].value           
        }else{
          updatedAnalyticsIds[updatedAnalyticsIds.length] = $(this).parent().parent().parent().attr('id').split("_")[3]
          updatedAnalyticsExp[updatedAnalyticsExp.length] = $('[id="'+updatedRowId+'"]').find('td').find('Select')[0].value
          updatedAnalyticsLvl[updatedAnalyticsLvl.length] = $('[id="'+updatedRowId+'"]').find('Select')[1].value
          updatedAnalyticsCer[updatedAnalyticsCer.length] = $('[id="'+updatedRowId+'"]').find('Select')[2].value
          updatedAnalyticsInt[updatedAnalyticsInt.length] = $('[id="'+updatedRowId+'"]').find('Select')[3].value          
        }
      });
    });
    jQuery('#analytics_add_button').hide();
    jQuery('#analytics_update_button').show();
    var obj = localStorage.getItem('obj');
    var objResult = JSON.parse(obj);
    empId = objResult.empId;
    getSkills(empId,"analytics");
  }
  else if($(location).attr("href") == SERVER_URI+'/transformation_update'){
    $( document ).ready(function() {
      $('[class="select form-control"]').change(function() {
        updatedRowId = $(this).parent().parent().parent().attr('id');
        var skill = updatedRowId.split("_")[3];
        if (updatedTransformationIds.indexOf(skill) > -1) {
          var index = updatedTransformationIds.indexOf(skill);
          updatedTransformationExp[index] = $('[id="'+updatedRowId+'"]').find('td').find('Select')[0].value
          updatedTransformationLvl[index] = $('[id="'+updatedRowId+'"]').find('td').find('Select')[1].value
          updatedTransformationCer[index] = $('[id="'+updatedRowId+'"]').find('td').find('Select')[2].value
          updatedTransformationInt[index] = $('[id="'+updatedRowId+'"]').find('td').find('Select')[3].value          
        }else {
          updatedTransformationIds[updatedTransformationIds.length] = $(this).parent().parent().parent().attr('id').split("_")[3]
          updatedTransformationExp[updatedTransformationExp.length] = $('[id="'+updatedRowId+'"]').find('td').find('Select')[0].value
          updatedTransformationLvl[updatedTransformationLvl.length] = $('[id="'+updatedRowId+'"]').find('td').find('Select')[1].value
          updatedTransformationCer[updatedTransformationCer.length] = $('[id="'+updatedRowId+'"]').find('td').find('Select')[2].value
          updatedTransformationInt[updatedTransformationInt.length] = $('[id="'+updatedRowId+'"]').find('td').find('Select')[3].value 
        }
      });
    });    
    jQuery('#transformation_add_button').hide();
    jQuery('#transformation_update_button').show();
    var obj = localStorage.getItem('obj');
    var objResult = JSON.parse(obj);
    empId = objResult.empId;
    getSkills(empId,"transformation");
  }else if($(location).attr("href") == SERVER_URI+'/human_element_update'){
    $( document ).ready(function() {
      $('.form-control').change(function() {
        var id = $(this).attr('id')
        var dim = $(this).attr('id')
        if (id.split("_")[1] != undefined) {
          dim = id.split("_")[1]
        }
        if (humanElementId.indexOf(dim) > -1){
          var index  = humanElementId.indexOf(dim)
          humanElementValue[index] = document.getElementById(id).value
        }else{
          humanElementId[humanElementId.length] = dim
          humanElementValue[humanElementValue.length] = document.getElementById(id).value
        }
      });
    });
    jQuery('#human_add_button').hide();
    jQuery('#human_update_button').show();
    var obj = localStorage.getItem('obj');
    var objResult = JSON.parse(obj);
    empId = objResult.empId;
    getHumanElementData(empId);    
  }
}

function getSkills(empId,form){
  var obj = {"empId":empId};
  var settings = {
    "async": true,
    "crossDomain": true,
    "url": SERVER_URI+"/get_skills",
    "method": "POST",
    "headers": {
      "content-type": "application/json",
      "cache-control": "no-cache"
    },
    "processData": false,
    "data": JSON.stringify(obj)
  }
  $.ajax(settings).done(function (response) {
    if(response.skills){
      var index = 0;
      var myRows = $('table#surveyTable').find('tr');
      var len = myRows.length;
      for (var i = 0; i < len; i++) {
        if($(myRows[i]).find('td').find("Select")[0] == undefined){
          console.log("undefined");
        }
        else{
          if(response['skills'][index]['level'] == null){
            $(myRows[i]).find('td').find("Select")[1].value = '';
          }
          else{
            $(myRows[i]).find('td').find("Select")[1].value = response['skills'][index]['level'];
          }
          $(myRows[i]).find('td').find("Select")[0].value = response['skills'][index]['experience'];
          $(myRows[i]).find('td').find("Select")[2].value = response['skills'][index]['certification'];
          $(myRows[i]).find('td').find("Select")[3].value = response['skills'][index]['learning_interest'];
          index = index + 1;
        }
      }
      if (form == "transformation") {
        if (response['skills'][30]['skill'] != ''){
         $($($('table#surveyTable').find('tr')[36]).find('td')[0]).find('input')[0].value = response['skills'][30]['skill']
        }else if (response['skills'][31]['skill']['skill'] != ''){
         $($($('table#surveyTable').find('tr')[37]).find('td')[0]).find('input')[0].value = response['skills'][31]['skill']
        } else if (response['skills'][32]['skill'] != ''){
         $($($('table#surveyTable').find('tr')[38]).find('td')[0]).find('input')[0].value = response['skills'][32]['skill']
        }else if (response['skills'][49]['skill'] != ''){
         $($($('table#surveyTable').find('tr')[61]).find('td')[0]).find('input')[0].value = response['skills'][49]['skill']
        }else if (response['skills'][55]['skill'] != ''){
         $($($('table#surveyTable').find('tr')[69]).find('td')[0]).find('input')[0].value = response['skills'][55]['skill'] 
        }else if (response['skills'][56]['skill'] != ''){
         $($($('table#surveyTable').find('tr')[70]).find('td')[0]).find('input')[0].value = response['skills'][56]['skill']
        }else if (response['skills'][61]['skill'] != ''){
         $($($('table#surveyTable').find('tr')[79]).find('td')[0]).find('input')[0].value = response['skills'][61]['skill'] 
        }else if (response['skills'][68]['skill'] != ''){
         $($($('table#surveyTable').find('tr')[87]).find('td')[0]).find('input')[0].value = response['skills'][68]['skill'] 
        }else if (response['skills'][69]['skill'] != ''){
         $($($('table#surveyTable').find('tr')[88]).find('td')[0]).find('input')[0].value = response['skills'][69]['skill'] 
        }else if (response['skills'][94]['skill'] != ''){
         $($($('table#surveyTable').find('tr')[120]).find('td')[0]).find('input')[0].value = response['skills'][94]['skill'] 
        }else if (response['skills'][95]['skill'] != ''){
         $($($('table#surveyTable').find('tr')[121]).find('td')[0]).find('input')[0].value = response['skills'][95]['skill'] 
        }else if (response['skills'][96]['skill'] != ''){
         $($($('table#surveyTable').find('tr')[122]).find('td')[0]).find('input')[0].value = response['skills'][96]['skill'] 
        }else if (response['skills'][101]['skill'] != ''){
         $($($('table#surveyTable').find('tr')[128]).find('td')[0]).find('input')[0].value = response['skills'][101]['skill'] 
        }else if (response['skills'][102]['skill'] != ''){
         $($($('table#surveyTable').find('tr')[129]).find('td')[0]).find('input')[0].value = response['skills'][102]['skill'] 
        }else if (response['skills'][103]['skill'] != ''){
         $($($('table#surveyTable').find('tr')[130]).find('td')[0]).find('input')[0].value = response['skills'][103]['skill'] 
        }
      }
    }
    else{
      if(form == 'analytics'){
        jQuery('#analytics_update_button').hide();
        jQuery('#analytics_add_button').show();
      }
      else if(form == 'transformation'){
        jQuery('#transformation_update_button').hide();
        jQuery('#transformation_add_button').show();
      }
    }
  });
}

function getHumanElementData(empId) {
  var obj = {"empId":empId};
  var settings = {
    "async": true,
    "crossDomain": true,
    "url": SERVER_URI+"/get_human_elements",
    "method": "POST",
    "headers": {
      "content-type": "application/json",
      "cache-control": "no-cache"
    },
    "processData": false,
    "data": JSON.stringify(obj)
  }
  $.ajax(settings).done(function (response) {
    console.log(response.human_element);
    if (response.human_element){
      var len = document.getElementById('mainPage').children[1].length
      for (var index = 0; index< len - 2; index++) {
        if ((document.getElementById('mainPage').children[1][index].id).startsWith("habit")) {
          $('[id="'+(document.getElementById('mainPage').children[1][index].id)+'"]').slider('setValue',response['human_element'][index]['value']);  
        }else{
          if (response['human_element'][index].category == 'My Motivations' && response['human_element'][index].value == 1){
            document.getElementById('mainPage').children[1][index].value = response['human_element'][index]['value'] + 'st';
          }
          else if (response['human_element'][index].category == 'My Motivations' && response['human_element'][index].value == 2){
            document.getElementById('mainPage').children[1][index].value = response['human_element'][index]['value'] + 'nd'; 
          }
          else if (response['human_element'][index].category == 'My Motivations' && response['human_element'][index].value == 3){
            document.getElementById('mainPage').children[1][index].value = response['human_element'][index]['value'] + 'rd'; 
          }
          else if (response['human_element'][index].category == 'My Motivations'){
            document.getElementById('mainPage').children[1][index].value = response['human_element'][index]['value'] + 'th'; 
          }
          else{
            document.getElementById('mainPage').children[1][index].value = response['human_element'][index]['value']  
          }
        }
      }
    }
    else{
      jQuery('#human_update_button').hide();
      jQuery('#human_add_button').show();
    }
  });  
}

function updateTransformationEmpSkill(){
    if (updatedTransformationIds.length == 0) {
    window.open(SERVER_URI + '/admin_capability','_self');
  }else{
    var obj = localStorage.getItem('obj');
    var objResult = JSON.parse(obj);
    empId = objResult.empId;
    convertTransformationNameIntoId();
    var settings = {
      "async": true,
      "crossDomain": true,
      "url": SERVER_URI+"/update_transformation_skills",
      "method": "POST",
      "headers": {
        "content-type": "application/x-www-form-urlencoded",
        "cache-control": "no-cache"
      },
      "data": {
        empId ,updatedTransformationIds, updatedTransformationExp, updatedTransformationLvl, updatedTransformationCer, updatedTransformationInt
      }
    }
    $.ajax(settings).done(function (response) {
      jQuery.notify("Successfully Updated Employee","success");
      setEmpId({"empId":0},0);
      window.open(SERVER_URI + '/admin_capability','_self');
    });
  }
}

function updateAnalyticsEmpSkill(){
  if (updatedAnalyticsIds.length == 0) {
    window.open(SERVER_URI + '/admin_capability','_self');
  }else{
    var obj = localStorage.getItem('obj');
    var objResult = JSON.parse(obj);
    empId = objResult.empId;
    convertAnalyticsNameIntoId();
    var settings = {
      "async": true,
      "crossDomain": true,
      "url": SERVER_URI+"/update_analytics_skills",
      "method": "POST",
      "headers": {
        "content-type": "application/x-www-form-urlencoded",
        "cache-control": "no-cache"
      },
      "data": {
        empId ,updatedAnalyticsIds, updatedAnalyticsExp, updatedAnalyticsLvl, updatedAnalyticsCer, updatedAnalyticsInt
      }
    }
    $.ajax(settings).done(function (response) {
      jQuery.notify("Successfully Updated Employee","success");
      setEmpId({"empId":0},0);
      window.open(SERVER_URI + '/admin_capability','_self');
    });
  }
}

function convertAnalyticsNameIntoId(){
  for(var index=0; index<updatedAnalyticsIds.length; index++){
////////////////////Experience////////////////////////////////////////        
    if (updatedAnalyticsExp[index] == 'PROJECT EXPERIENCE'){
      updatedAnalyticsExp[index] = 1;
    }
    else if (updatedAnalyticsExp[index] == 'GENERAL EDUCATION'){
      updatedAnalyticsExp[index] = 2; 
    }
    else if (updatedAnalyticsExp[index] == 'N/A'){
      updatedAnalyticsExp[index] = 3; 
    }
/////////////////////////Level///////////////////////////////////////////
    if(updatedAnalyticsLvl[index] == '1 - INTRODUCTORY'){
      updatedAnalyticsLvl[index] = 1;  
    }
    else if(updatedAnalyticsLvl[index] == '2 - BASIC'){
      updatedAnalyticsLvl[index] = 2;  
    }
    else if(updatedAnalyticsLvl[index] == '3 - PROFICIENT'){
      updatedAnalyticsLvl[index] = 3;  
    }
    else if(updatedAnalyticsLvl[index] == '4 - ADVANCED'){
      updatedAnalyticsLvl[index] = 4;  
    }
    else if(updatedAnalyticsLvl[index] == '5 - MASTERY'){
      updatedAnalyticsLvl[index] = 5;  
    }
    else if(updatedAnalyticsLvl[index] == ""){
      updatedAnalyticsLvl[index] = 'null';  
    }
/////////////////////////Certification//////////////////////////////////////
    if (updatedAnalyticsCer[index] == 'YES'){
      updatedAnalyticsCer[index] = 1;
    }
    else if (updatedAnalyticsCer[index] == 'NO'){
      updatedAnalyticsCer[index] = 2; 
    }
/////////////////////////Learning Interest//////////////////////////////////////
    if(updatedAnalyticsInt[index] == '0 - AVOID'){
      updatedAnalyticsInt[index] = 0;  
    }
    else if(updatedAnalyticsInt[index] == '1 - DEVELOP'){
      updatedAnalyticsInt[index] = 1;  
    }
    else if(updatedAnalyticsInt[index] == '2 - ENGAGE'){
      updatedAnalyticsInt[index] = 2;  
    }
    else if(updatedAnalyticsInt[index] == '3 - ACCELERATE'){
      updatedAnalyticsExp[index] = 3;  
    }    
  }
}

function convertTransformationNameIntoId(){
  for(var index=0; index<updatedTransformationIds.length; index++){
////////////////////Experience////////////////////////////////////////        
    if (updatedTransformationExp[index] == 'PROJECT EXPERIENCE'){
      updatedTransformationExp[index] = 1;
    }
    else if (updatedTransformationExp[index] == 'GENERAL EDUCATION'){
      updatedTransformationExp[index] = 2; 
    }
    else if (updatedTransformationExp[index] == 'N/A'){
      updatedTransformationExp[index] = 3; 
    }
/////////////////////////Level///////////////////////////////////////////

    if(updatedTransformationLvl[index] == '1 - INTRODUCTORY'){
      updatedTransformationLvl[index] = 1;  
    }
    else if(updatedTransformationLvl[index] == '2 - BASIC'){
      updatedTransformationLvl[index] = 2;  
    }
    else if(updatedTransformationLvl[index] == '3 - PROFICIENT'){
      updatedTransformationLvl[index] = 3;  
    }
    else if(updatedTransformationLvl[index] == '4 - ADVANCED'){
      updatedTransformationLvl[index] = 4;  
    }
    else if(updatedTransformationLvl[index] == '5 - MASTERY'){
      updatedTransformationLvl[index] = 5;  
    }
    else if(updatedTransformationLvl[index] == ""){
      updatedTransformationLvl[index] = 'null';  
    }
/////////////////////////Certification//////////////////////////////////////
    if (updatedTransformationCer[index] == 'YES'){
      updatedTransformationCer[index] = 1;
    }
    else if (updatedTransformationCer[index] == 'NO'){
      updatedTransformationCer[index] = 2; 
    }
/////////////////////////Learning Interest//////////////////////////////////////
    if(updatedTransformationInt[index] == '0 - AVOID'){
      updatedTransformationInt[index] = 0;  
    }
    else if(updatedTransformationInt[index] == '1 - DEVELOP'){
      updatedTransformationInt[index] = 1;  
    }
    else if(updatedTransformationInt[index] == '2 - ENGAGE'){
      updatedTransformationInt[index] = 2;  
    }
    else if(updatedTransformationInt[index] == '3 - ACCELERATE'){
      updatedTransformationInt[index] = 3;  
    }    
  }
}

/////////////////////////update Human Element Form///////////////////////////////////////////
function showHumanElement(empId,emp) {
  setEmpId({"empId":empId},1);
  window.open(SERVER_URI + '/human_element_update','_self');
}

function updateHumanElement() {
  if (humanElementId.length == 0) {
    window.open(SERVER_URI + '/admin_capability','_self');
  }else{
    var obj = localStorage.getItem('obj');
    var objResult = JSON.parse(obj);
    empId = objResult.empId;
    var settings = {
      "async": true,
      "crossDomain": true,
      "url": SERVER_URI+"/update_human_element",
      "method": "POST",
      "headers": {
        "content-type": "application/x-www-form-urlencoded",
        "cache-control": "no-cache"
      },
      "data": {
        empId ,humanElementId, humanElementValue
      }
    }
    $.ajax(settings).done(function (response) {
      jQuery.notify("Successfully Updated Employee","success");
      setEmpId({"empId":0},0)
      window.open(SERVER_URI + '/admin_capability','_self');
    });
  }
}