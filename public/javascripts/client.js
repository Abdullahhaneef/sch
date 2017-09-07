  //var http = new XMLHttpRequest();
  var SERVER_URI = "http://localhost:3000";

  function showCommunityAnalytics() {
    window.open(SERVER_URI + '/analytics','_blank');
  }

  function showCommunityTransformation() {
    window.open(SERVER_URI + '/transformation','_blank');
  }



  function addEmpSkill(){

    var myRows = $('table#surveyTable').find('tr');
    var len = myRows.length;
    for (var i = 0; i < 4; i++) {
      if($(myRows[i]).find('td').find("Select")[0] == undefined){
        console.log("undefined");
      }
      else{
        console.log("not undefined");
        console.log($(myRows[i]).attr('id'));
        console.log($(myRows[i]).attr('id').split("_")[0]);
        
//////////////////// Core competency/////////////////////
        if ($(myRows[i]).attr('id').split("_")[0] == 'cc'){

        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'dv'){

        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'dv'){
          
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'di'){
          
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'aa'){
          
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'saias'){
          
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'dmwa'){
          
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'p'){
          
        }
        else if($(myRows[i]).attr('id').split("_")[0] == 'acc'){
          
        }
///////////////////tool or capacity/////////////////////////////

        if ($(myRows[i]).attr('id').split("_")[1] == 'tool'){

        }
        else if($(myRows[i]).attr('id').split("_")[1] == 'cp'){

        }
///////////////////////category////////////////////////////////
        if ($(myRows[i]).attr('id').split("_")[2] == 'pms'){

        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'pm'){

        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'ccfl'){

        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'fe'){

        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'ive'){

        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'edu'){

        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'dvt'){

        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'oordt'){

        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'dv'){

        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'dit'){

        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'dwp'){

        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'dmt'){

        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'nst'){

        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'bdt'){

        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'iot'){

        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'od'){

        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'di'){

        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'aa'){

        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'st'){

        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'ci'){

        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'dasa'){

        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'rts'){

        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'aca'){

        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'dmp'){

        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'pl'){

        }
        if ($(myRows[i]).attr('id').split("_")[2] == 'acc'){

        }

/////////////////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////////////
        var rowValue = $(myRows[i]).find('td');
        for (var j = 0; j < 4 ; j++ ){
          console.log(rowValue.find("Select")[j].value);
        }
      }
    }
    

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
