  var SERVER_URI = "http://localhost:3000";
  var empId;


  function showCommunityAnalytics() {
    var user = document.getElementById("user").value
    if (user != "") {
       addEmployeeAnalytics();
    }else{
      jQuery.notify("Enter user name first", "error"); 
    }
  }

  function showCommunityTransformation() {
    var user = document.getElementById("user").value
    if (user != "") {
          addEmployeeTransformation();
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
            setEmpId(response,1);
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
            setEmpId(response, 2);
            window.open(SERVER_URI + '/transformation','_self');
        });
        swal(
          'Saved!',
          'Employee created.',
          'success'
        )
      })
    }

  function setEmpId(response, community_id){
    empId = response.empId;
    var obj = {"empId": empId, "community_id": community_id}
    localStorage.setItem('obj',JSON.stringify(obj));
  }

  function addAnalyticsEmpSkill(){
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
          level[index] = 'null';
        }

/////////////////////////Restriction check///////////////////////////////////////////        
        if (rowValue.find("Select")[0].value != 'N/A' && rowValue.find("Select")[1].value == ''){
          var id = '[id="'+$(myRows[i]).attr('id');+'"]';
          jQuery(id).find('font')[0].color = 'red';
          jQuery(rowValue.find("Select")[1]).notify("Experience without Level???");
          isEmpty = true;
        }
        if (rowValue.find("Select")[0].value == 'N/A' && rowValue.find("Select")[1].value != ''){
          var id = '[id="'+$(myRows[i]).attr('id');+'"]';
          jQuery(id).find('font')[0].color = 'red';
          jQuery(rowValue.find("Select")[1]).notify("Level without Experience???");
          isEmpty = true;
        }
        if (rowValue.find("Select")[1].value == '' &&  rowValue.find("Select")[2].value == 'YES'){
          var id = '[id="'+$(myRows[i]).attr('id');+'"]';
          jQuery(id).find('font')[0].color = 'red';
          jQuery(rowValue.find("Select")[2]).notify("Certification without Level???");
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

        if(rowValue.find("Select")[3].value == '0 - Avoid'){
          learning_interest[index] = 0;  
        }
        else if(rowValue.find("Select")[3].value == '1 - Develop'){
          learning_interest[index] = 1;  
        }
        else if(rowValue.find("Select")[3].value == '2 - Engage'){
          learning_interest[index] = 2;  
        }
        else if(rowValue.find("Select")[3].value == '3 - Accelerate'){
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
          level[index] = 'null';  
        }

/////////////////////////Restriction check///////////////////////////////////////////        
        if (rowValue.find("Select")[0].value != 'N/A' && rowValue.find("Select")[1].value == ''){
          var id = '[id="'+$(myRows[i]).attr('id');+'"]';
          jQuery(id).find('font')[0].color = 'red';
          jQuery(rowValue.find("Select")[1]).notify("Error");
          isEmpty = true;
        }
        if (rowValue.find("Select")[0].value == 'N/A' && rowValue.find("Select")[1].value != ''){
          var id = '[id="'+$(myRows[i]).attr('id');+'"]';
          jQuery(id).find('font')[0].color = 'red';
          jQuery(rowValue.find("Select")[1]).notify("Level without Experience???");
          isEmpty = true;
        }
        if (rowValue.find("Select")[1].value == '' &&  rowValue.find("Select")[2].value == 'YES'){
          var id = '[id="'+$(myRows[i]).attr('id');+'"]';
          jQuery(id).find('font')[0].color = 'red';
          jQuery(rowValue.find("Select")[2]).notify("Certification without Level???");
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
        if(rowValue.find("Select")[3].value == '0 - Avoid'){
          learning_interest[index] = 0;  
        }
        else if(rowValue.find("Select")[3].value == '1 - Develop'){
          learning_interest[index] = 1;  
        }
        else if(rowValue.find("Select")[3].value == '2 - Engage'){
          learning_interest[index] = 2;  
        }
        else if(rowValue.find("Select")[3].value == '3 - Accelerate'){
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
      window.open(SERVER_URI,'_self');
    });
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
  console.log("abc2");
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
                            <td> '+response['employees'][i]["community"]+' </td>\
                            <td> <input name="is_active" type="checkbox" '+is_active+' > </td>\
                            <td> <span id = "updateRecord" title="Update this record" class="btn btn-link" style="cursor:pointer" onclick="updateEmployee('+parseInt(response["employees"][i]["id"])+',jQuery(this).parent().parent())">Update</span> </td>\
                            <td> <span title="Update this record" class="btn btn-link" style="cursor:pointer" onclick="showSkills('+parseInt(response["employees"][i]["id"])+',jQuery(this).parent().parent())">Update Skills</span> </td>\
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
  console.log(empId);
  var obj = {
              "empId":empId,
              "name" : jQuery(emp).children().find("input")[0].value, 
              "is_active":jQuery(emp).children().find("input")[1].checked
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
  //var obj = {"empId":empId};
  console.log(empId);
  setEmpId({"empId":empId},1);
  jQuery('#add_button').hide();
  jQuery('#update_button').show();
  var analyticsWindow = window.open(SERVER_URI + '/analytics_update','_self');
  $(document).ready(function(){
  alert('Done');
  });
/*  analyticsWindow.addEventListener('load', analyticsWindow.load, true); 
  function load(){
    console.log("in function");
    jQuery('#add_button').hide();
    jQuery('#update_button').show();
    var obj = localStorage.getItem('obj');
    var objResult = JSON.parse(obj);
    empId = objResult.empId;
    console.log("empId : " +empId);
  };*/
}