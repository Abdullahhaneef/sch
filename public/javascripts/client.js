  var SERVER_URI = "http://localhost:3000";

  function showCommunityAnalytics() {
    window.open(SERVER_URI + '/analytics','_blank');
  }

  function showCommunityTransformation() {
    window.open(SERVER_URI + '/transformation','_blank');
  }



  function addEmpSkill(){

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

//////////////////values from id/////////////////////////

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
        if ($(myRows[i]).attr('id').split("_")[2] == 'rts'){
          category[index] = 22;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'aca'){
          category[index] = 23;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'dmp'){
          category[index] = 24;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'pl'){
          category[index] = 25;
        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'acc'){
          category[index] = 26;
        }

        skill[index] = $(myRows[i]).attr('id').split("_")[3]

/////////////////////////////////////////////////////////////////////

////////////////////values from form////////////////////////////////

//////////////////////////////////////////////////////////////////
        var rowValue = $(myRows[i]).find('td');
        experience[index] = rowValue.find("Select")[0].value;
        level[index] = rowValue.find("Select")[1].value;
        certification[index] = rowValue.find("Select")[2].value;
        learning_interest[index] = rowValue.find("Select")[3].value;        

//////////////////index increasing for values in array////////////////////
        index = index + 1;
      }
    }
    console.log('cc' + core_competency);
    console.log('t_c' + tool_capability);
    console.log('cat' + category);
    console.log('sk' + skill);
    console.log('exp' + experience);
    console.log('le' + level);
    console.log('cert' + certification);
    console.log('li' + learning_interest);

/*    var settings = {
      "async": true,
      "crossDomain": true,
      "url": SERVER_URI+"/add_employee",
      "method": "POST",
      "headers": {
        "content-type": "application/x-www-form-urlencoded",
        "cache-control": "no-cache",
      },
      "data": {
        data
      }
    }
    $.ajax(settings).done(function (response) {      
        jQuery('#requestFormDiv').hide();
        jQuery('#adminCapabilityButton').hide();
        jQuery('#requestFormButton').hide();
        jQuery('#adminCapabilityDiv').show();
        jQuery('#mainPage').hide();
        jQuery('#aptitude').hide();
        jQuery('#interest').hide();
        jQuery('#interestAdd').hide();
        jQuery('#addEmp').show();
        jQuery('#addEmplyeeBtn').show();
        emp_table.destroy(false);
        getEmployee();
        document.getElementById("employeeForm").reset();
        $('input[type="radio"]').attr('checked', false); 
        jQuery.notify("Employee Added Successfully.", "success");
    });
    window.scrollTo(0,0);*/
  }
