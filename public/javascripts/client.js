  //var http = new XMLHttpRequest();
  var empid;
  var list_emp = [];
  var uncheckedAptitude =[];
  var uncheckedInterest =[];
  var SERVER_URI = "https://huresys.com:8090";

  function showRequestForm(){
    jQuery('#requestFormDiv').show();
    jQuery('#adminCapabilityButton').hide();
    jQuery('#requestFormButton').hide();
    jQuery('#adminCapabilityDiv').hide();
    jQuery('#mainPage').hide();
    $('input[type="radio"]').click(function (event) {
    if ($(this).attr('checked')) {
      $(this).removeAttr('checked');
      $(this).prop('checked',false);
    } else {
      if ($('input:radio:checked').length<13) {
        $(this).attr('checked', 'checked');
      }else {
        $(this).removeAttr('checked');
        $(this).prop('checked',false);
        alert("More than 12 skills cannot be selected.")
      }
    }   
    });
  }

  function showAdminCapability(){
    jQuery('#requestFormDiv').hide();
    jQuery('#adminCapabilityButton').hide();
    jQuery('#requestFormButton').hide();
    jQuery('#adminCapabilityDiv').show();
    jQuery('#mainPage').hide();
    jQuery('#aptitude').hide();
    jQuery('#addEmp').show();
    getEmployee();
  }

  function doneAllocation(){
    jQuery('#existingAllocation').hide();
    jQuery('#addEmp').show();
    jQuery('#heading').show();
    window.scrollTo(0,0);
  }

  function submitRequest() {
    $('#submitButton').prop('disabled', true);
    jQuery('#saveFormButton').show();
    var data = jQuery('#requestForm').serializeArray();
    var settings = {
      "async": true,
      "crossDomain": true,
      "url": SERVER_URI+"/post_assets",
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
      window.open(SERVER_URI + '/download/'+response.fileId,'_blank'); 
      $('#submitButton').prop('disabled', false);
    });
  }

  function saveRequestForm(){
    jQuery('#saveFormButton').hide();
    var data = jQuery('#requestForm').serializeArray();
    var settings = {
      "async": true,
      "crossDomain": true,
      "url": SERVER_URI+"/saveForm",
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
      console.log(response);  
      alert("Request Form saved.");
    });   
  }

  function loadMainPage(){
    window.location.reload(); 
  }


  function trendAnalysis(){
    var common_skill = "";
    var common_requestor = "";
    var common_type = "";
    var common_location = "";
    var x = document.getElementById('trendAnalysisTable');
    if (x.style.display === 'none') {
          x.style.display = 'block';
          getTrendAnalysis();
    } 
    else {
        x.style.display = 'none';
    }

    jQuery("#check_all").change(function(){
        if (jQuery("#check_all").prop('checked')) {
            jQuery('#trend_table_body').find("input:checkbox").prop('checked',true);
        } else {
            jQuery('#trend_table_body').find("input:checkbox").prop('checked',false);
        }       
    });
  }

  function getTrendAnalysis(){
    var settings = {
      "async": true,
      "crossDomain": true,
      "url": SERVER_URI+"/trendAnalysis",
      "method": "GET",
      "headers": {
        "cache-control": "no-cache"
      }
    }
    $.ajax(settings).done(function (response) {
      renderTrendAnalysis(response);
    });
  }

  function renderTrendAnalysis(response){
      jQuery("#trend_table_body").empty();
      if (response['request_trend']){
        for (i=0; i < response['request_trend'].length;i++){
          emp_val =  response['request_trend'][i];
          jQuery("#trend_table_body").append('<tr>\
                                <td> <input type="checkbox" > </td>\
                                <td> '+response['request_trend'][i]["id"]+' </td>\
                                <td> '+response['request_trend'][i]["name"]+'</td>\
                                <td> '+response['request_trend'][i]["job_title"]+' </td>\
                                <td> '+response['request_trend'][i]["region"]+' </td>\
                                <td> '+response['request_trend'][i]["allocation"]+' </td>\
                                <td> '+response['request_trend'][i]["initiative"]+' </td>\
                                <td> '+response['request_trend'][i]["requestdate"]+' </td>\
                                <td> <span title="delete this record" class="glyphicon glyphicon-trash text-danger" style="cursor:pointer" onclick="delRequest('+parseInt(response['request_trend'][i]["id"])+')"></span> </td>\
                            </tr>');

        }
        jQuery('#trend_table').DataTable({
              "lengthChange": false,
              "ordering": false,
              "searching": false,
              "autoWidth": false,
              "pageLength": 25,
              "retrieve": true
        });
      }
  }

  function delRequest(id){
    var obj = {"id" : id};
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
        "url": SERVER_URI+"/delete_request",
        "method": "POST",
        "headers": {
          "content-type": "application/json",
          "cache-control": "no-cache"
        },
        "processData": false,
        "data": JSON.stringify(obj)
      }
      $.ajax(settings).done(function (response) {
        getTrendAnalysis();
      });
      swal(
        'Deleted!',
        'Request has been deleted.',
        'success'
      )
    })
  }

  function trendAnalysisPdf(){
    var req_query = "";
    jQuery('#trend_table_body').find("input:checkbox:checked").parent().parent().find("td:eq(1)").each(function(index) {
      req_query =req_query + jQuery(this).html() + ",";
    });

    if (req_query != "") {
      var obj = {"req_query":req_query.substring(0, req_query.length - 1)};
      var settings = {
        "async": true,
        "crossDomain": true,
        "url": SERVER_URI+"/trendAnalysisPdf",
        "method": "POST",
        "headers": {
          "content-type": "application/json",
          "cache-control": "no-cache"
        },
        "processData": false,
        "data": JSON.stringify(obj)
      }
      $.ajax(settings).done(function (response) {
        window.open(SERVER_URI+'/downloadAnalysis/'+response.fileId,'_blank');
      });

           
    }
    else {
      jQuery.notify('No requests selected', 'error');
    }
  }

  function updateAptitudeUnchecked(){
    var settings = {
      "async": true,
      "crossDomain": true,
      "url": SERVER_URI+"/update_aptitude_unchecked",
      "method": "POST",
      "headers": {
        "content-type": "application/json",
        "cache-control": "no-cache"
      },
      "processData": false,
      "data":JSON.stringify(uncheckedAptitude)
    }
    $.ajax(settings).done(function (response) {  
      updateAptitude();
    });
  } 


  function updateAptitude(){
    var settings = {
      "async": true,
      "crossDomain": true,
      "url": SERVER_URI+"/update_aptitude",
      "method": "POST",
      "headers": {
        "content-type": "application/json",
        "cache-control": "no-cache"
      },
      "processData": false,
      "data": JSON.stringify(jQuery('#employeeForm').serializeArray())
    }
    $.ajax(settings).done(function (response) {
        jQuery('#requestFormDiv').hide();
        jQuery('#adminCapabilityButton').hide();
        jQuery('#requestFormButton').hide();
        jQuery('#adminCapabilityDiv').show();
        jQuery('#mainPage').hide();
        jQuery('#aptitude').hide();
        jQuery('#aptitudeUpdate').hide();        
        jQuery('#interest').hide();
        jQuery('#addEmp').show();
        jQuery('#addEmplyeeBtn').show();
        jQuery('#emp_name').val('');
        jQuery('#heading').show();
        window.scrollTo(0,0);
        document.getElementById("employeeForm").reset();
        $('input[type="radio"]').attr('checked', false);
        jQuery.notify("Updated Aptitude Successfully", 'success');
      });
    window.scrollTo(0,0);
  }



  function updateInterestUnchecked(){
    var settings = {
      "async": true,
      "crossDomain": true,
      "url": SERVER_URI+"/update_interest_unchecked",
      "method": "POST",
      "headers": {
        "content-type": "application/json",
        "cache-control": "no-cache"
      },
      "processData": false,
      "data":JSON.stringify(uncheckedInterest)
    }
    $.ajax(settings).done(function (response) {
      updateInterest();
    });
  } 


  function updateInterest(){
    var settings = {
      "async": true,
      "crossDomain": true,
      "url": SERVER_URI+"/update_interest",
      "method": "POST",
      "headers": {
        "content-type": "application/json",
        "cache-control": "no-cache"
      },
      "processData": false,
      "data": JSON.stringify(jQuery('#employeeForm').serializeArray())
    }
    $.ajax(settings).done(function (response) {
        jQuery('#requestFormDiv').hide();
        jQuery('#adminCapabilityButton').hide();
        jQuery('#requestFormButton').hide();
        jQuery('#adminCapabilityDiv').show();
        jQuery('#mainPage').hide();
        jQuery('#aptitude').hide();
        jQuery('#addEmp').show();
        jQuery('#addEmplyeeBtn').show();
        jQuery('#interest').hide();
        jQuery('#interestUpdate').hide();        
        jQuery('#emp_name').val('');
        jQuery('#heading').show();
        document.getElementById("employeeForm").reset();
        $('input[type="radio"]').attr('checked', false);         
        window.scrollTo(0,0);
        jQuery.notify("Updated Interest Successfully", 'success');
    });
    window.scrollTo(0,0);
  }

  function showInterestUpdate(emp){ 
      $('input[type="radio"]').attr('checked', false);
      uncheckedInterest =[];
      var index = 1;
      var obj = {"empid" : list_emp[emp]["empid"]};
      var settings = {
        "async": true,
        "crossDomain": true,
        "url": SERVER_URI+"/show_interest",
        "method": "POST",
        "headers": {
          "content-type": "application/json",
          "cache-control": "no-cache"
        },
        "processData": false,
        "data": JSON.stringify(obj)
      }
      $.ajax(settings).done(function (response) {
        for (var key in response['interest'][0]) {
          if (response['interest'][0].hasOwnProperty(key)) {
            if (key != "empid"){
              jQuery("#employeeForm input[name=i"+key+"][value=" + response['interest'][0][key] + "]").prop('checked', true);
            }
          }
        }
        jQuery('#emp_name').val(response['interest'][0]["empid"]);
      });

      jQuery('#aptitude').hide();
      jQuery('#addEmp').hide();
      jQuery('#interestAdd').hide();
      jQuery('#aptitudeAdd').hide();
      jQuery('#aptitudeUpdate').hide();
      jQuery('#interestUpdate').show();
      jQuery('#interest').show();
      jQuery('#heading').hide();
      jQuery('#existingAllocation').hide();
      jQuery('#addEmplyeeBtn').hide();

    $('input[type="radio"]').off("click").on("click",function (event) {
      if ($(this).attr('checked')) {
        $(this).removeAttr('checked');
        $(this).prop('checked',false);
        uncheckedInterest[0] = list_emp[emp]["empid"];
        if(!uncheckedInterest.includes($(this).attr('name'))){
          uncheckedInterest[index] = $(this).attr('name');
          index = index + 1;
        }
      } 

      else {
          $(this).attr('checked', 'checked');
      } 
    });
    window.scrollTo(0,0);
  }

  function showAptitudeUpdate(emp){
    $('input[type="radio"]').attr('checked', false);
    var obj = {"empid" : list_emp[emp]["empid"]};
    uncheckedAptitude =[];
    var index=1;
    var settings = {
      "async": true,
      "crossDomain": true,
      "url": SERVER_URI+"/show_aptitude",
      "method": "POST",
      "headers": {
        "content-type": "application/json",
        "cache-control": "no-cache"
      },
      "processData": false,
      "data": JSON.stringify(obj)
    }
    $.ajax(settings).done(function (response) {
      for (var key in response['aptitude'][0]) {
        if (response['aptitude'][0].hasOwnProperty(key)) {
          if (key != "empid"){
            jQuery("#employeeForm input[name="+key+"][value=" + response['aptitude'][0][key] + "]").prop('checked', true);
            }
          }
        }
        jQuery('#emp_name').val(response['aptitude'][0]["empid"]);
      });

      jQuery('#aptitude').show();
      jQuery('#addEmp').hide();
      jQuery('#aptitudeAdd').hide();
      jQuery('#interestAdd').hide();
      jQuery('#aptitudeUpdate').show();
      jQuery('#interestUpdate').hide();
      jQuery('#interest').hide();
      jQuery('#heading').hide();
      jQuery('#existingAllocation').hide();
      jQuery('#addEmplyeeBtn').hide();

      $('input[type="radio"]').off("click").on("click",function (event) {
      if ($(this).attr('checked')) {
        $(this).removeAttr('checked');
        $(this).prop('checked',false);
        uncheckedAptitude[0] = list_emp[emp]["empid"];
        if(!uncheckedAptitude.includes($(this).attr('name'))){
          uncheckedAptitude[index] = $(this).attr('name');
          index = index + 1;
        }
      } 

      else {
          $(this).attr('checked', 'checked');
      }
    });
      window.scrollTo(0,0);
  }

  function showExistingAllocationUpdate(empid){
      jQuery('#aptitude').hide();
      jQuery('#addEmp').hide();
      jQuery('#aptitudeAdd').hide();
      jQuery('#aptitudeUpdate').hide();
      jQuery('#interestUpdate').hide();
      jQuery('#interest').hide();
      jQuery('#heading').hide();
      jQuery('#addEmplyeeBtn').hide();
      jQuery('#existingAllocation').show();

      var obj = {"empid" : empid};
      var settings = {
        "async": true,
        "crossDomain": true,
        "url": SERVER_URI+"/get_allocation",
        "method": "POST",
        "headers": {
          "content-type": "application/json",
          "cache-control": "no-cache"
        },
        "processData": false,
        "data": JSON.stringify(obj)
      }
      $.ajax(settings).done(function (response) {
        jQuery("#allocation_table_body").empty();
        if (response['allocation']){

        jQuery("#allocation_table_body").append('<tr>\
                                  <td>  </td>\
                                  <td> <input type="Text"> </td>\
                                  <td> <input type="Text"> </td>\
                                  <td> <input type="Text"> </td>\
                                  <td> <input type="Text"> </td>\
                                  <td> <input type="Text"> </td>\
                                  <td> <span title="Add this record" class="btn btn-link" style="cursor:pointer" onclick="addAllocationRecord('+empid+',jQuery(this).parent().parent())">Add</span> </td>\
                              </tr>');

        for (i=0; i < response['allocation'].length;i++){

          emp_val =  response['allocation'][i];
          jQuery("#allocation_table_body").append('<tr>\
                                <td> '+response['allocation'][i]["emp_id"]+' </td>\
                                <td> <input type="Text" value = "'+response['allocation'][i]["department"]+'"></td>\
                                <td> <input type="Text" value = "'+response['allocation'][i]["priority"]+'"> </td>\
                                <td> <input type="Text" value = "'+response['allocation'][i]["initiative"]+'"> </td>\
                                <td> <input type="Text" value = "'+response['allocation'][i]["alignment_to_gpo"]+'"> </td>\
                                <td> <input type="Text" value = "'+response['allocation'][i]["percent_allocation"]+'"> </td>\
                                <td> <span title="delete this record" class="glyphicon glyphicon-trash text-danger" style="cursor:pointer" onclick="delAllocationRecord('+parseInt(response["allocation"][i]["id"])+','+empid+')"></span> </td>\
                                <td> <span title="Update this record" class="btn btn-link" style="cursor:pointer" onclick="updateAllocationRecord('+parseInt(response["allocation"][i]["id"])+','+empid+',jQuery(this).parent().parent())">Update</span> </td>\
                            </tr>');

      }
        }
        else{
        jQuery("#allocation_table_body").append('<tr>\
                          <td>  </td>\
                          <td> <input type="Text"> </td>\
                          <td> <input type="Text"> </td>\
                          <td> <input type="Text"> </td>\
                          <td> <input type="Text"> </td>\
                          <td> <input type="Text"> </td>\
                          <td> <span title="Add this record" class="btn btn-link" style="cursor:pointer" onclick="addAllocationRecord('+empid+',jQuery(this).parent().parent())">Add</span> </td>\
                      </tr>');
        }
        window.scrollTo(0,0);
      });
  }

  function addAllocationRecord(id, record){
    var obj = { 
                "empid": id, 
                "department": jQuery(record).children().find("input")[0].value,
                "priority":jQuery(record).children().find("input")[1].value,
                "initiative":jQuery(record).children().find("input")[2].value,
                "gpo":jQuery(record).children().find("input")[3].value,
                "percent":jQuery(record).children().find("input")[4].value
              };

    var settings = {
      "async": true,
      "crossDomain": true,
      "url": SERVER_URI+"/addAllocationRecord",
      "method": "POST",
      "headers": {
        "content-type": "application/json",
        "cache-control": "no-cache"
      },
      "processData": false,
      "data": JSON.stringify(obj)
    }
    $.ajax(settings).done(function (response) {
      showExistingAllocationUpdate(response['empid']);
      jQuery.notify("Added allocation for Empid : " + id, "success");
    });  
  }

  function delAllocationRecord(id, empid) {
    var obj = {"id" : id, "empid": empid};
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
          "url": SERVER_URI+"/deleteAllocation_employee",
          "method": "POST",
          "headers": {
            "content-type": "application/json",
            "cache-control": "no-cache"
          },
          "processData": false,
          "data": JSON.stringify(obj)
        }
        $.ajax(settings).done(function (response) {
          showExistingAllocationUpdate(response['empid']);
        });
        swal(
          'Deleted!',
          'Allocation has been deleted.',
          'success'
        )
    })
  }

  function updateAllocationRecord(id,empid, record){
    var obj = {
                "empid":empid,
                "id": id, 
                "department": jQuery(record).children().find("input")[0].value,
                "priority":jQuery(record).children().find("input")[1].value,
                "initiative":jQuery(record).children().find("input")[2].value,
                "gpo":jQuery(record).children().find("input")[3].value,
                "percent":jQuery(record).children().find("input")[4].value
              };

    var settings = {
      "async": true,
      "crossDomain": true,
      "url": SERVER_URI+"/updateAllocation_employee",
      "method": "POST",
      "headers": {
        "content-type": "application/json",
        "cache-control": "no-cache"
      },
      "processData": false,
      "data": JSON.stringify(obj)
    }
    $.ajax(settings).done(function (response) {
        showExistingAllocationUpdate(response['empid']); 
        jQuery.notify("Updated Allocation", "success");
    });
  }


  function addEmployee() {
    var new_emp_name = jQuery('#emp_name').val();
    var employee_exists = false;
    $.each(list_emp, function( index, employee ) {
        if (employee.name == new_emp_name) {
            employee_exists = true;
            return false;
        }
    });
    // add new employees only if employee with same name does not exist
    if (!employee_exists) {
        upload();
        showAptitude();
    }
    else {
        jQuery('#addEmplyeeBtn').notify('Employee with same name already exists.', 'error');
    }
  }
  var emp_table;
  function getEmployee(){

    var settings = {
      "async": true,
      "crossDomain": true,
      "url": SERVER_URI+"/get_employee",
      "method": "GET",
      "headers": {
        "cache-control": "no-cache",
      }
    }

    $.ajax(settings).done(function (response) {
      var res = response;
      var emp_val;
      var is_active;
      jQuery("#table_body").empty();
      if (response['employees']){
      list_emp = response['employees'];
      for (i=0; i < response['employees'].length;i++){
        emp_val =  response["employees"][i];
        if (response["employees"][i]["is_active"]){
          is_active = "checked";
        }
        else{
          is_active = "";
        }
        jQuery("#table_body").append('<tr>\
                              <td> '+response["employees"][i]["empid"]+' </td>\
                              <td> <input name="fullname" type="Text" value = "'+response["employees"][i]["name"]+'"></td>\
                              <td> <input name="country" type="Text" value = "'+response["employees"][i]["country"]+'"> </td>\
                              <td> <input name="region" type="Text" value = "'+response["employees"][i]["region"]+'"> </td>\
                              <td> <input name="function" type="Text" value = "'+response["employees"][i]["function"]+'"> </td>\
                              <td> <input name="grade" type="Text" value = "'+response["employees"][i]["grade"]+'"> </td>\
                              <td> <input name="title" type="Text" value = "'+response["employees"][i]["title"]+'"> </td>\
                              <td> <input name="is_active" type="checkbox" '+is_active+' > </td>\
                              <td> <span title="delete this record" class="glyphicon glyphicon-trash text-danger" style="cursor:pointer" onclick="delRecord('+parseInt(response["employees"][i]["empid"])+')"></span> </td>\
                              <td> <span id = "updateRecord'+i+'" title="Update this record" class="btn btn-link" style="cursor:pointer" onclick="updateRecord('+parseInt(response["employees"][i]["empid"])+',jQuery(this).parent().parent(),'+parseInt(i)+')">Update</span> </td>\
                              <td> <span title="Update this record" class="btn btn-link" style="cursor:pointer" onclick="showAptitudeUpdate('+parseInt(i)+')">Update Aptitude</span> </td>\
                              <td> <span title="Update this record" class="btn btn-link" style="cursor:pointer" onclick="showInterestUpdate('+parseInt(i)+')">Update Interest</span> </td>\
                              <td> <span title="Update this record" class="btn btn-link" style="cursor:pointer" onclick="showExistingAllocationUpdate('+parseInt(list_emp[i]["empid"])+')">Update Existing Allocation</span> </td>\
                          </tr>');

      }
     }
      //Enable Add Employee button
      jQuery('#addEmplyeeBtn').prop('disabled', false);
      emp_table = jQuery('#employee_table').DataTable({
        "lengthChange": false,
        "ordering": false,
        "searching": false,
        "autoWidth": false,
        "pageLength": 25,
        "retrieve": true
      });
      jQuery( "#employee_table" ).removeClass( "dataTable" );   
    });
  }

  function delRecord(empid) {
    var obj = {"empid" : empid};
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
            getEmployee();
        });
        swal(
          'Deleted!',
          'Employee has been deleted.',
          'success'
        )
    })
  }

  function updateRecord(empid,emp,updateIndex){
    jQuery(jQuery('#updateRecord'+updateIndex)).notify("Updating","success");
    var obj = {
                "empid":empid,
                "name" : jQuery(emp).children().find("input")[0].value, 
                "country":jQuery(emp).children().find("input")[1].value,
                "region":jQuery(emp).children().find("input")[2].value, 
                "function":jQuery(emp).children().find("input")[3].value, 
                "grade":jQuery(emp).children().find("input")[4].value,
                "title": jQuery(emp).children().find("input")[5].value, 
                "is_active":jQuery(emp).children().find("input")[6].checked,
                "updateIndex" : updateIndex
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
        jQuery(jQuery('#updateRecord'+response['updateIndex'])).notify("Successfully Updated Employee","success");
    });
  }

  function showAptitude(){
/*      jQuery('#aptitude').show();
      jQuery('#addEmp').hide();*/
      window.scrollTo(0,0);
      jQuery('#aptitude').show();
      jQuery('#addEmp').hide();
      jQuery('#addEmplyeeBtn').hide();
      jQuery('#aptitudeAdd').show();
      $('input[type="radio"]').off("click").on("click",function (event) {
        if ($(this).attr('checked')) {
          $(this).removeAttr('checked');
          $(this).prop('checked',false);
        }
        else {
            $(this).attr('checked', 'checked');
        } 
      });
  }

  function addAptitude(){
      jQuery('#aptitude').hide();
      jQuery('#interest').show();
      jQuery('#interestAdd').show();
      jQuery('#aptitudeAdd').hide();
      window.scrollTo(0,0);
      }

  function addInterest(){
    var data = jQuery('#employeeForm').serializeArray();
    var settings = {
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
    window.scrollTo(0,0);
  }


  function upload() {
    var photo = document.getElementById("photo");
    var file = photo.files[0];
    var reader  = new FileReader();
    reader.addEventListener("load", function () {

      var data = reader.result
      jQuery('#image').val(data);
    }, false);
    if (file) {
      reader.readAsDataURL(file);
    }
  }