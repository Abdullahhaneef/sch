  var SERVER_URI = "http://localhost:3000";
  var empId;

  function showCommunityAnalytics() {
    var user = document.getElementById("user").value
    if (user != "") {
       addEmployee();
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

  function addEmployee(){
    empName  = document.getElementById("user").value;
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
        empName
      }
    }
    $.ajax(settings).done(function (response) {      
        setEmpId(response);
        window.open(SERVER_URI + '/analytics','_self');
    }); 
  }

  function addEmployeeTransformation(){
    empName  = document.getElementById("user").value;
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
        empName
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

  function addEmpSkill(){
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
          core_competency[index] = 1; 
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'dv'){
          core_competency[index] = 2;
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'di'){
          core_competency[index] = 3;          
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'aa'){
          core_competency[index] = 4;          
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'saias'){
          core_competency[index] = 5;          
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'dmwa'){
          core_competency[index] = 6;          
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'p'){
          core_competency[index] = 7;         
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'acc'){
          core_competency[index] = 8;          
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
          category[index] = 1;          
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'pm'){
          category[index] = 2;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'ccfl'){
          category[index] = 3;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'fe'){
          category[index] = 4;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'ive'){
          category[index] = 5;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'edu'){
          category[index] = 6;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'dvt'){
          category[index] = 7;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'oordt'){
          category[index] = 8;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'dv'){
          category[index] = 9;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'dit'){
          category[index] = 10;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'dwp'){
          category[index] = 11;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'dmt'){
          category[index] = 12;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'nst'){
          category[index] = 13;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'bdt'){
          category[index] = 14;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'iot'){
          category[index] = 15;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'od'){
          category[index] = 16;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'di'){
          category[index] = 17;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'aa'){
          category[index] = 18;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'st'){
          category[index] = 19;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'ci'){
          category[index] = 20;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'dasa'){
          category[index] = 21;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'wa'){
          category[index] = 22;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'rts'){
          category[index] = 23;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'aca'){
          category[index] = 24;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'dmp'){
          category[index] = 25;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'pl'){
          category[index] = 26;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'acc'){
          category[index] = 27;
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

/////////////////////////Certification//////////////////////////////////////

        if (rowValue.find("Select")[2].value == 'YES'){
          certification[index] = 1;
        }
        else if (rowValue.find("Select")[2].value == 'NO'){
          certification[index] = 2; 
        }

/////////////////////////Learning Interest//////////////////////////////////////

        if (rowValue.find("Select")[3].value == 'YES'){
          learning_interest[index] = 1;
        }
        else if (rowValue.find("Select")[3].value == 'NO'){
          learning_interest[index] = 2; 
        }

//////////////////index increasing for values in array////////////////////

        index = index + 1;
      }
    }

//////////////////////post request//////////////////////////////

    var settings = {
      "async": true,
      "crossDomain": true,
      "url": SERVER_URI+"/addEmpSkill",
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

//////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////Transformation Form///////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////

function addTransformationEmpSkill(){
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
          core_competency[index] = 1; 
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'pm'){
          core_competency[index] = 2;
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'prm'){
          core_competency[index] = 3;          
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'de'){
          core_competency[index] = 4;          
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'deo'){
          core_competency[index] = 5;          
        }
///////////////////tool or capability/////////////////////////////

        if ($(myRows[i]).attr('id').split("_")[1] == 'tool'){
          tool_capability[index] = 1;
        }
        else if($(myRows[i]).attr('id').split("_")[1] == 'sk'){
          tool_capability[index] = 2;
        }
        else if($(myRows[i]).attr('id').split("_")[1] == 'cp'){
          tool_capability[index] = 3;
        }
        else if($(myRows[i]).attr('id').split("_")[1] == 'p'){
          tool_capability[index] = 4;
        }
///////////////////////category////////////////////////////////
        if ($(myRows[i]).attr('id').split("_")[2] == 'ccfl'){
          category[index] = 1;          
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'fe'){
          category[index] = 2;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'ive'){
          category[index] = 3;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'edu'){
          category[index] = 4;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'general'){
          category[index] = 5;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'ee'){
          category[index] = 6;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'pms'){
          category[index] = 7;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'cert'){
          category[index] = 8;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'gt'){
          category[index] = 9;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'c'){
          category[index] = 10;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'gud'){
          category[index] = 11;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'se'){
          category[index] = 12;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'mt'){
          category[index] = 13;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'ec'){
          category[index] = 14;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'crm'){
          category[index] = 15;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'erp'){
          category[index] = 16;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'cloud'){
          category[index] = 17;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'mobile'){
          category[index] = 18;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'gen'){
          category[index] = 19;
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
        if (rowValue.find("Select")[1].value == '0 - No Experience'){
          level[index] = 1;
        }
        else if (rowValue.find("Select")[1].value == '1 - Competent'){
          level[index] = 2; 
        }
        else if (rowValue.find("Select")[1].value == '2 - Proficient'){
          level[index] = 3; 
        }
        else if (rowValue.find("Select")[1].value == '3 - Advanced'){
          level[index] = 4; 
        }
        else if (rowValue.find("Select")[1].value == '4 - Mastery'){
          level[index] = 5; 
        }

/////////////////////////Certification//////////////////////////////////////

        if (rowValue.find("Select")[2].value == 'YES'){
          certification[index] = 1;
        }
        else if (rowValue.find("Select")[2].value == 'NO'){
          certification[index] = 2; 
        }

/////////////////////////Learning Interest//////////////////////////////////////

        if (rowValue.find("Select")[3].value == '0 - Avoid'){
          learning_interest[index] = 1;
        }
        else if (rowValue.find("Select")[3].value == '1 - Develop'){
          learning_interest[index] = 2; 
        }
        else if (rowValue.find("Select")[3].value == '2 - Engage'){
          learning_interest[index] = 3; 
        }
        else if (rowValue.find("Select")[3].value == '3 - Accelerate'){
          learning_interest[index] = 4; 
        }
//////////////////index increasing for values in array////////////////////

        index = index + 1;
      }
    }

//////////////////////post request//////////////////////////////

  console.log("finished");
  // console.log(core_competency)
  // console.log(tool_capability)
  // console.log(category)
  // console.log(skill)
  // console.log(experience)
  console.log(level)
  // console.log(certification)
  console.log(learning_interest)

    // var settings = {
    //   "async": true,
    //   "crossDomain": true,
    //   "url": SERVER_URI+"/addEmpSkill",
    //   "method": "POST",
    //   "headers": {
    //     "content-type": "application/x-www-form-urlencoded",
    //     "cache-control": "no-cache",
    //   },
    //   "data": {
    //     empId, core_competency, tool_capability, category, skill, experience, level, certification, learning_interest
    //   }
    // }
    // $.ajax(settings).done(function (response) {
    //     window.open(SERVER_URI + '/human_resources','_self');   
    //     jQuery.notify("Employee Added Successfully.", "success");
    // });
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