var SERVER_URI = "http://localhost:8090";
var month_check;

$("#dob").on("change", function() {
    this.setAttribute(
        "data-date",
        moment(this.value, "MM/DD/YYYY")
        .format( this.getAttribute("data-date-format") )
    )
}).trigger("change")

///////////////////////////Get Class//////////////////////////////////////////
function getClass(){
  var settings = {
    "async": true,
    "crossDomain": true,
    "url": SERVER_URI+"/get_class",
    "method": "GET",
    "headers": {
      "cache-control": "no-cache"
    }
  }
  $.ajax(settings).done(function (response) {
    $.each(response.employees, function (index, name) {
        $('#classes').append('<option value="' + name.name + '">' +
            name.name + '</option>');
    });
    getStd();
  });
}

function getClassInfo(){
  var settings = {
    "async": true,
    "crossDomain": true,
    "url": SERVER_URI+"/get_class",
    "method": "GET",
    "headers": {
      "cache-control": "no-cache"
    }
  }
  $.ajax(settings).done(function (response) {
    renderClass(response)
  });  
}

function renderClass(response){
  jQuery("#class_table_body").empty();
  console.log(response);
  if (response['employees']){
    for (i=0; i < response['employees'].length;i++){
      jQuery("#class_table_body").append('<tr>\
                            <td> <input name="admission_fees" value = "'+response["employees"][i]["code"]+'"> </td>\
                            <td> <input name="admission_fees" value = "'+response["employees"][i]["name"]+'"> </td>\
                            <td> <span id = "updateRecord" title="Update this record" class="btn btn-link" style="cursor:pointer" onclick="updateClass('+parseInt(response["employees"][i]["id"])+',jQuery(this).parent().parent())">Update</span> </td>\
                            <td> <span title="delete this record" class="glyphicon glyphicon-trash text-danger" style="cursor:pointer" onclick="delClass('+parseInt(response['employees'][i]["id"])+')"></span> </td>\
                        </tr>');
    }
    class_table = jQuery('#class_table').DataTable({
          "lengthChange": true,
          "ordering": true,
          "searching": false,
          "autoWidth": true,
          "retrieve": true,
          "bPaginate": false
    });
  }
}

function updateClass(stdId,std){
  var obj = {
            "stdId":stdId,
            "code":jQuery(std).children().find("input")[0].value,
            "name":jQuery(std).children().find("input")[1].value
            };
  var settings = {
    "async": true,
    "crossDomain": true,
    "url": SERVER_URI+"/update_class",
    "method": "POST",
    "headers": {
      "content-type": "application/json",
      "cache-control": "no-cache"
    },
    "processData": false,
    "data": JSON.stringify(obj)
  };
  $.ajax(settings).done(function (response) {
    jQuery.notify("User Updated","success");
  });
}


function getClassUpdate(){
  var settings = {
    "async": true,
    "crossDomain": true,
    "url": SERVER_URI+"/get_class",
    "method": "GET",
    "headers": {
      "cache-control": "no-cache"
    }
  }
  $.ajax(settings).done(function (response) {
    $.each(response.employees, function (index, name) {
        $('#classes').append('<option value="' + name.name + '">' +
            name.name + '</option>');
    });
  });
}

function getStd(){
  var settings = {
    "async": true,
    "crossDomain": true,
    "url": SERVER_URI+"/get_student",
    "method": "GET",
    "headers": {
      "cache-control": "no-cache"
    }
  }
  $.ajax(settings).done(function (response) {
    renderStd(response); 
  });
}

function renderStd(response){
  var is_active;
  jQuery("#std_table_body").empty();
  if (response['students']){
    for (i=0; i < response['students'].length;i++){
      jQuery("#std_table_body").append('<tr>\
                            <td> '+response['students'][i]["gr_num"]+' </td>\
                            <td> '+response["students"][i]["name"]+' </td>\
                            <td> '+response["students"][i]["f_name"]+' </td>\
                            <td> '+response["students"][i]["telephone_home"]+' </td>\
                            <td> '+response["students"][i]["dob"]+' </td>\
                            <td> <span id = "updateRecord" title="Update this record" class="btn btn-link" style="cursor:pointer" onclick="updateStudent('+parseInt(response['students'][i]["id"])+')">Update</span> </td>\
                            <td> <span title="delete this record" class="glyphicon glyphicon-trash text-danger" style="cursor:pointer" onclick="delStudent('+parseInt(response['students'][i]["id"])+')"></span> </td>\
                        </tr>');
    }
    emp_table = jQuery('#student_table').DataTable({
          "lengthChange": true,
          "ordering": true,
          "searching": false,
          "autoWidth": true,
          "retrieve": true,
          "bPaginate": false
    });
  }
}

function updateStudent(stdId){
  localStorage.setItem('stdId',stdId);
  setTimeout(function(){window.open(SERVER_URI + '/update_std','_self') }, 500);
}

function updateStudentInfo(){

  var settings = {
    "async": true,
    "crossDomain": true,
    "url": SERVER_URI+"/get_class",
    "method": "GET",
    "headers": {
      "cache-control": "no-cache"
    }
  }
  $.ajax(settings).done(function (response) {
    $.each(response.employees, function (index, name) {
        $('#classes').append('<option value="' + name.name + '">' +
            name.name + '</option>');
    });

    var data={};
    data['stdId'] = localStorage.getItem('stdId');
    var settings = {
      "async": true,
      "crossDomain": true,
      "url": SERVER_URI+"/get_student_id",
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
      std = response.student[0];
      jQuery("#gr_num")[0].value = std.gr_num;
      jQuery("#full_name")[0].value = std.name;
      jQuery("#gender")[0].value = std.gender;
      jQuery("#dob")[0].value = std.dob;
      jQuery("#age")[0].value = std.age;
      jQuery("#pob")[0].value = std.place_of_birth;
      jQuery("#nationality")[0].value = std.nationality;
      jQuery("#religion")[0].value = std.religion;
      jQuery("#classes")[0].value = std.class_id;
      jQuery("#f_name")[0].value = std.f_name;
      jQuery("#address")[0].value = std.address;
      jQuery("#f_profession")[0].value = std.f_profession;
      jQuery("#m_profession")[0].value = std.m_profession;
      jQuery("#t_home")[0].value = std.telephone_home;
      jQuery("#t_office")[0].value = std.telephone_office;
      jQuery("#previous_info")[0].value = std.old_details;
      jQuery("#participation")[0].value = std.participation;
      jQuery("#awards")[0].value = std.awards;
      jQuery("#health")[0].value = std.health;
      jQuery("#sibling")[0].value = std.sibling;
    });

  });

}

function updateSetStudent(){
  var isEmpty = false;
  //var values = $("#stdForm").serialize();
  var data = {};
  data['stdId'] = localStorage.getItem('stdId');
  $('#stdForm').find('input, textarea, select').each(function(i, field) {
      data[field.name] = field.value;
  });
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
        "url": SERVER_URI+"/updateSetStudent",
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
          window.open(SERVER_URI + '/add_std','_self');
      });
      swal(
        'Saved!',
        'Request has been saved.',
        'success'
      )
    })
  }
}

function searchStudent(){
  var data = {};
  $('.search-row').find('input, textarea, select').each(function(i, field) {
    if(field.name == "classes" && field.value == "all"){

    }
    else if(field.name == "classes" && field.value != "all"){
      data["class_id"] = field.value;
    }
    else if(field.name != "classes" && field.value != ""){
      data[field.name] = field.value;
    }
    else if(field.name != "classes" && field.value == ""){
      
    } 
  });  
  if(Object.keys(data).length == 0){
    data["nothing"] = "nothing";
  }
  var settings = {
    "async": true,
    "crossDomain": true,
    "url": SERVER_URI+"/searchStd",
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
     renderStd(response);
  });
}

function getHistory(){
  var settings = {
    "async": true,
    "crossDomain": true,
    "url": SERVER_URI+"/get_class",
    "method": "GET",
    "headers": {
      "cache-control": "no-cache"
    }
  }
  $.ajax(settings).done(function (response) {
    $.each(response.employees, function (index, name) {
        $('#classes').append('<option value="' + name.name + '">' +
            name.name + '</option>');
    });
  });

}

function renderHistoy(response){
  var is_active;
  jQuery("#history_table_body").empty();
  if (response['students']){
    for (i=0; i < response['students'].length;i++){
/*      if (response["students"][i]["is_active"]){
        is_active = "checked";
      }
      else{
        is_active = "";
      }*/
      var total = +response['students'][i]["security_fees"] + +response['students'][i]["annual_fees"] + +response['students'][i]["monthly_fees"] + +response['students'][i]["misc_fees"] + +response['students'][i]["transport_fees"] + +response['students'][i]["arrears"] + +response['students'][i]["current_penalty"];
      jQuery("#history_table_body").append('<tr>\
                            <td> '+response['students'][i]["gr_num"]+' </td>\
                            <td> '+response["students"][i]["name"]+'</td>\
                            <td> '+response["students"][i]["class_id"]+'</td>\
                            <td> '+response["students"][i]["security_fees"]+'</td>\
                            <td> '+response["students"][i]["annual_fees"]+'</td>\
                            <td> '+response["students"][i]["monthly_fees"]+'</td>\
                            <td> '+response["students"][i]["misc_fees"]+'</td>\
                            <td> '+response["students"][i]["transport_fees"]+'</td>\
                            <td> '+response["students"][i]["arrears"]+'</td>\
                            <td> '+response["students"][i]["current_penalty"]+'</td>\
                            <td> '+total+'</td>\
                            <td> '+response["students"][i]["month"]+'</td>\
                            <td> '+response["students"][i]["issue_date"]+'</td>\
                            <td> '+response["students"][i]["due_date"]+'</td>\
                            <td> '+response["students"][i]["receive_date"]+'</td>\
                        </tr>');
    }
    emp_table = jQuery('#history_table').DataTable({
          "lengthChange": true,
          "ordering": true,
          "searching": false,
          "autoWidth": true,
          "retrieve": true,
          "bPaginate": false
    });
  }
}

function searchStudentHistory(){
  console.log("in search history")
  var data = {};
  $('.history-search').find('input, textarea, select').each(function(i, field) {
    if(field.name == "classes" && field.value == "all"){

    }
    else if(field.name == "classes" && field.value != "all"){
      data["class_id"] = field.value;
    }
    else if(field.name != "classes" && field.value != ""){
      data[field.name] = field.value;
    }
    else if(field.name != "classes" && field.value == ""){
      jQuery.notify("Please fill all the fields","error");
    } 
  });
  var settings = {
    "async": true,
    "crossDomain": true,
    "url": SERVER_URI+"/searchHistory",
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
     renderHistoy(response);
  });  
}

function getFees(){
  var settings = {
    "async": true,
    "crossDomain": true,
    "url": SERVER_URI+"/get_class",
    "method": "GET",
    "headers": {
      "cache-control": "no-cache"
    }
  }
  $.ajax(settings).done(function (response) {
    $.each(response.employees, function (index, name) {
        $('#classes').append('<option value="' + name.name + '">' +
            name.name + '</option>');
    });
    getFeesInfo();
  });
}

function getFeesInfo(){
  var settings = {
    "async": true,
    "crossDomain": true,
    "url": SERVER_URI+"/get_student",
    "method": "GET",
    "headers": {
      "cache-control": "no-cache"
    }
  }
  $.ajax(settings).done(function (response) {
    renderFees(response); 
  });
}

function _calculateAge(birthday) { // birthday is a date
    var ageDifMs = Date.now() - birthday.getTime();
    var ageDate = new Date(ageDifMs); // miliseconds from epoch
    return Math.abs(ageDate.getUTCFullYear() - 1970);
}

function calcAge(dateString) {
  var birthday = +new Date(dateString);
  return ~~((Date.now() - birthday) / (31557600000));
}

function getAge(){
  console.log("in get age");
  date_of_birth = jQuery('#dob')[0].value;
  console.log(date_of_birth);
  age = calcAge(date_of_birth);
  console.log(age);
  jQuery('#age')[0].value = age;
}

function renderFees(response){
  var is_active;
  jQuery("#fees_table_body").empty();
  if (response['students']){
    jQuery("#month")[0].value = response["students"][0]["month"];
    jQuery("#issue")[0].value = response["students"][0]["issue_date"];
    jQuery("#due")[0].value = response["students"][0]["due_date"];
    month_check = jQuery('#month')[0].value;
    for (i=0; i < response['students'].length;i++){
/*      if (response["students"][i]["is_active"]){
        is_active = "checked";
      }
      else{
        is_active = "";
      }*/
      feesTotal = response["students"][i]["annual_fees"] + response["students"][i]["monthly_fees"] + response["students"][i]["misc_fees"]+response["students"][i]["transport_fees"]+response["students"][i]["arrears"]+response["students"][i]["current_penalty"]+response["students"][i]["transport_arears"];
      jQuery("#fees_table_body").append('<tr>\
                            <td> '+response['students'][i]["gr_num"]+' </td>\
                            <td> '+response["students"][i]["name"]+'</td>\
                            <td> '+response["students"][i]["f_name"]+'</td>\
                            <td> '+response["students"][i]["class_id"]+'</td>\
                            <td> <input name="admission_fees" type="number" value = "'+response["students"][i]["admission_fees"]+'"></td>\
                            <td> <input name="security_fees" type="number" value = "'+response["students"][i]["security_fees"]+'"></td>\
                            <td> <input name="annual_fees" type="number" value = "'+response["students"][i]["annual_fees"]+'"></td>\
                            <td> <input name="monthly_fees" type="number" value = "'+response["students"][i]["monthly_fees"]+'"></td>\
                            <td> <input name="misc_fees" type="number" value = "'+response["students"][i]["misc_fees"]+'"></td>\
                            <td> <input name="transport_fees" type="number" value = "'+response["students"][i]["transport_fees"]+'"></td>\
                            <td> <input name="arrears" type="number" value = "'+response["students"][i]["arrears"]+'"></td>\
                            <td> <input name="transport_arrears" type="number" value = "'+response["students"][i]["transport_arears"]+'"></td>\
                            <td> <input name="current_penalty" type="number" value = "'+response["students"][i]["current_penalty"]+'"></td>\
                            <td> '+feesTotal+'</td>\
                            <td> <input name="receive_date" type="Date" style="width: 100px" value = "'+response["students"][i]["receive_date"]+'" min="'+month_check+'-01" max="'+month_check+'-31"></td>\
                            <td> <i id = "updateRecord" title="Update this record" class="fa fa-floppy-o" style="cursor:pointer" onclick="updateStudentFee('+parseInt(response["students"][i]["id"])+',jQuery(this).parent().parent())"></i> </td>\
                            <td> <i id = "printAdmission" title="Print this record" class="fa fa-print" style="cursor:pointer" onclick="printAdmTraChallan(1,'+parseInt(response["students"][i]["id"])+',jQuery(this).parent().parent())"></i> </td>\
                            <td> <i id = "printMonthly" title="Print this record" class="fa fa-print" style="cursor:pointer" onclick="printChallan('+parseInt(response["students"][i]["id"])+',jQuery(this).parent().parent())"></i> </td>\
                            <td> <i id = "printAdmission" title="Print this record" class="fa fa-print" style="cursor:pointer" onclick="printAdmTraChallan(2,'+parseInt(response["students"][i]["id"])+',jQuery(this).parent().parent())"></i> </td>\
                            </tr>');
    }
    emp_table = jQuery('#fees_table').DataTable({
          "lengthChange": false,
          "ordering": false,
          "searching": false,
          "autoWidth": false,
          "retrieve": true,
          "bPaginate": false
    });
    //$('#receive_date').attr('min', month_check + "-01");
    //$('#receive_date').attr('max', month_check + "-31");
  }
}
function month_changed(){
  jQuery('#issue')[0].value = jQuery('#month')[0].value + "-01";
  jQuery('#due')[0].value = jQuery('#month')[0].value + "-10";  
}
function changeMonth(){
  month = jQuery('#month')[0].value;
  if (month <= month_check){
    jQuery("#month").notify("Month selected is same or old.","error");
  }
  else{
    issue_date = jQuery('#issue')[0].value;
    due_date = jQuery('#due')[0].value;
    if (month == "" || issue_date == "" || due_date == ""){
      jQuery.notify("Please fill all Three fields","error");
    }
    else{
      var obj = {
                "month":month,
                "issue_date":issue_date,
                "due_date":due_date
              };

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
            "url": SERVER_URI+"/change_month",
            "method": "POST",
            "headers": {
              "content-type": "application/json",
              "cache-control": "no-cache"
            },
            "processData": false,
            "data": JSON.stringify(obj)
          };
          $.ajax(settings).done(function (response) {
            jQuery.notify("User Updated","success");
            getFeesInfo();
          });  
          swal(
            'Saved!',
            'Request has been saved.',
            'success'
          )
        })
    }
  }
}

function searchStudentFees(){
  var data = {};
  $('.fee-search').find('input, textarea, select').each(function(i, field) {
    if(field.name == "classes" && field.value == "all"){

    }
    else if(field.name == "classes" && field.value != "all"){
      data["class_id"] = field.value;
    }
    else if(field.name != "classes" && field.value != ""){
      data[field.name] = field.value;
    }
    else if(field.name != "classes" && field.value == ""){
      
    } 
  });  
  if(Object.keys(data).length == 0){
    data["nothing"] = "nothing";
  }
  var settings = {
    "async": true,
    "crossDomain": true,
    "url": SERVER_URI+"/searchStd",
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
     renderFees(response);
  });
}

function updateStudentFee(stdId,std){
  var obj = {
            "stdId":stdId,
            "admission_fees":jQuery(std).children().find("input")[0].value,
            "security_fees":jQuery(std).children().find("input")[1].value,
            "annual_fees":jQuery(std).children().find("input")[2].value,
            "monthly_fees":jQuery(std).children().find("input")[3].value,
            "misc_fees":jQuery(std).children().find("input")[4].value,
            "transport_fees":jQuery(std).children().find("input")[5].value,
            "arrears":jQuery(std).children().find("input")[6].value,
            "transport_arrears":jQuery(std).children().find("input")[7].value,
            "current_penalty":jQuery(std).children().find("input")[8].value,
            "receive_date":jQuery(std).children().find("input")[9].value
          };
  var settings = {
    "async": true,
    "crossDomain": true,
    "url": SERVER_URI+"/update_student_fee",
    "method": "POST",
    "headers": {
      "content-type": "application/json",
      "cache-control": "no-cache"
    },
    "processData": false,
    "data": JSON.stringify(obj)
  };
  $.ajax(settings).done(function (response) {
    jQuery.notify("User Updated","success");
  });
}

function updateAllFees(std){
  var obj = {
            "security_fees":jQuery(std).children().find("input")[0].value,
            "annual_fees":jQuery(std).children().find("input")[1].value,
            "monthly_fees":jQuery(std).children().find("input")[2].value,
            "misc_fees":jQuery(std).children().find("input")[3].value,
          };

  var settings = {
    "async": true,
    "crossDomain": true,
    "url": SERVER_URI+"/update_all_fees",
    "method": "POST",
    "headers": {
      "content-type": "application/json",
      "cache-control": "no-cache"
    },
    "processData": false,
    "data": JSON.stringify(obj)
  };
  $.ajax(settings).done(function (response) {
    jQuery.notify("User Updated","success");
  });

}

function std_info_print(){
    printJS({printable:'form-field',type: 'html',targetStyles: ['*']})
}
function print_std(){
    printJS({printable:'student_table',type: 'html',targetStyles: ['*']})
}
function fees_print(){
    printJS({printable:'fees_table',type: 'html',targetStyles: ['*']})
}
function print_history(){
    printJS({printable:'history_table',type: 'html',targetStyles: ['*']})
}
function printAdmTraChallan(cat,stdId,emp){
  $(".print_pdf_show").empty();
  var obj = {
              "stdId":stdId,
              "gr_num": jQuery(emp).children()[0].innerText,
              "name" : jQuery(emp).children()[1].innerText, 
              "f_name" : jQuery(emp).children()[2].innerText, 
              "class_id" : jQuery(emp).children()[3].innerText,
              "admission_fees":jQuery(emp).children().find("input")[0].value,
              "security_fees":jQuery(emp).children().find("input")[1].value,
              "annual_fees":jQuery(emp).children().find("input")[2].value,
              "monthly_fees":jQuery(emp).children().find("input")[3].value,
              "misc_fees":jQuery(emp).children().find("input")[4].value,
              "transport_fees":jQuery(emp).children().find("input")[5].value,
              "arrears":jQuery(emp).children().find("input")[6].value,
              "transport_arrears":jQuery(emp).children().find("input")[7].value,
              "current_penalty":jQuery(emp).children().find("input")[8].value,
              "month":jQuery('#month')[0].value,
              "issue":jQuery('#issue')[0].value,
              "due":jQuery('#due')[0].value
            };

  if (cat == 1){
    var adm_total = +obj["admission_fees"];
    var sec_total = +obj["security_fees"]
    var tra_total = 0;
    var trans_arears = 0;
    var grand_total = adm_total + sec_total;
  }
  else {
    var adm_total = 0;
    var tra_total = +obj["transport_fees"];
    var grand_total = +obj["transport_fees"] + +obj["transport_arrears"];
    var trans_arears = +obj["transport_arrears"];
  }
    var html =''
    html = '\
    <div class="container-fluid" id="printSect">\
        <div class="row">\
            <div class="col-sm-6">\
                <div class="row">\
                    <div class="col-sm-12">\
                        <div class="invoice-title">\
                            <h6 class="pull-right">STUDENT COPY</h6>\
                        </div>\
                        <div class="row">\
                            <div class="col-sm-4">\
                             <img src="data:image/jpeg;base64,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" class="img-responsive logo-s" width="100px">\
                         </div>\
                         <div class="col-sm-8 text-right">\
                            <address>\
                                <h3 style="text-align:center;margin-bottom: 0px;font-weight:600;">U N ACADEMY</h3>\
                                <h4 style="text-align:center;margin-top: 0px;margin-bottom: 0px;font-weight:600;"> For Kids </h4>\
                                <p style="text-align:center;">625/B, Unit 2 Latifabad Hyderabad</p>\
                            </address>\
                        </div>\
                    </div>\
                </div>\
            </div>\
            <div class="row">\
                <div class="col-sm-12">\
                    <div class="panel panel-default">\
                        <div class="panel-body">\
                            <div class="table-responsive">\
                              <table class="challan-no">\
                                <tbody>\
                                    <tr>\
                                        <th><span>Challan No</span></th>\
                                        <td><span>'+obj["month"].replace("-","")+'</span></td>\
                                    </tr>\
                                </tbody>\
                            </table>\
                            <table class="enrol">\
                                <tbody>\
                                    <tr>\
                                        <th><span>Enrol No</span></th>\
                                        <td><span>'+obj["gr_num"]+'</span></td>\
                                    </tr>\
                                </tbody>\
                            </table>\
                            <div class="clearfix"></div>\
                            <table class="table table-condensed mt-3">\
                                <tbody>\
                                    <tr>\
                                        <td>Name of Student</td>\
                                        <td>'+obj["name"]+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>Father Name </td>\
                                        <td>'+obj["f_name"]+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>Class</td>\
                                        <td>'+obj["class_id"]+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>For the Month of</td>\
                                        <td>'+obj["month"]+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td><span class="">Issue Date: </span> '+obj["issue"]+'</td>\
                                        <td><span class="">Due Date: </span> '+obj["due"]+'</td>\
                                    </tr>\
                                </tbody>\
                            </table>\
                            <hr>\
                            <div class="clearfix"></div>\
                            <table class="table table-condensed ">\
                                <thead>\
                                    <tr>\
                                        <td width="10%"><strong>S#</strong></td>\
                                        <td width="60%" ><strong>Description</strong></td>\
                                        <td width="30%" class="text-right"><strong>Amount</strong></td>\
                                    </tr>\
                                </thead>\
                                <tbody>\
                                    <tr>\
                                        <td>1</td>\
                                        <td>Admission Fee</td>\
                                        <td class="text-right">'+adm_total+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>2</td>\
                                        <td>Security</td>\
                                        <td class="text-right">'+sec_total+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>3</td>\
                                        <td>Annual Charges</td>\
                                        <td class="text-right">0</td>\
                                    </tr>\
                                    <tr>\
                                        <td>5</td>\
                                        <td>Tuition Fees</td>\
                                        <td class="text-right">0</td>\
                                    </tr>\
                                    <tr>\
                                        <td>6</td>\
                                        <td>Miscellaneous</td>\
                                        <td class="text-right">0</td>\
                                    </tr>\
                                    <tr>\
                                        <td>7</td>\
                                        <td>Transport Fees</td>\
                                        <td class="text-right">'+tra_total+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>8</td>\
                                        <td>Arrears </td>\
                                        <td class="text-right">'+trans_arears+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>9</td>\
                                        <td>Current Penalty</td>\
                                        <td class="text-right">0</td>\
                                    </tr>\
                                    <tr>\
                                        <td class="thick-line"></td>\
                                        <td class="thick-line text-right"><strong>Grand Total</strong></td>\
                                        <td class="thick-line text-right">'+grand_total+'</td>\
                                    </tr>\
                                </tbody>\
                            </table>\
                            <h3 class="text-center"><strong>INSTRUCTIONS</strong></h3>\
                            <ol>\
                                <li>Last date for submission of fee is 10th of each month.</li>\
                                <li>Late Fee will be charged @ 10/- per day.</li>\
                                <li>Penalty will be charged by U N ACADEMY through next month fee challan.</li>\
                            </ol> \
                            <div class="mt-5">\
                                <div class="col-sm-4 dated">\
                                    <h5 class="ml-5"><strong>Date</strong></h5>\
                                </div>\
                                <div class="col-sm-2">\
                                </div>\
                                <div class="col-md-6 text-right sign ">\
                                    <h6 class="signature"><strong>Signature of Receiver</strong></h6>\
                                </div>\
                            </div> \
                        </div>\
                    </div>\
                </div>\
            </div>\
        </div>\
    </div>\
    <div class="col-sm-6">\
        <div class="row">\
            <div class="col-sm-12">\
                <div class="invoice-title">\
                    <h6 class="pull-right">OFFICE COPY</h6>\
                </div>\
                <div class="row">\
                    <div class="col-sm-4">\
                     <img src="data:image/jpeg;base64,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" class="img-responsive logo-s" width="100px">\
                 </div>\
                 <div class="col-sm-8 text-right">\
                    <address>\
                        <h3 style="text-align:center;margin-bottom: 0px;font-weight:600;">U N ACADEMY</h3>\
                        <h4 style="text-align:center;margin-top: 0px;margin-bottom: 0px;font-weight:600;"> For Kids </h4>\
                        <p style="text-align:center;line-height: 1;">625/B, Unit 2 Latifabad Hyderabad</p>\
                    </address>\
                </div>\
            </div>\
        </div>\
    </div>\
    <div class="row">\
        <div class="col-sm-12">\
            <div class="panel panel-default">\
                <div class="panel-body">\
                    <div class="table-responsive">\
                      <table class="challan-no">\
                        <tbody>\
                            <tr>\
                                <th><span>Challan No</span></th>\
                                <td><span>'+obj["month"].replace("-","")+'</span></td>\
                            </tr>\
                        </tbody>\
                    </table>\
                    <table class="enrol">\
                        <tbody>\
                            <tr>\
                                <th><span>Enrol No</span></th>\
                                <td><span>'+obj["gr_num"]+'</span></td>\
                            </tr>\
                        </tbody>\
                    </table>\
                    <div class="clearfix"></div>\
                    <table class="table table-condensed mt-3">\
                        <tbody>\
                            <tr>\
                                <td>Name of Student</td>\
                                <td>'+obj["name"]+'</td>\
                            </tr>\
                            <tr>\
                                <td>Father Name </td>\
                                <td>'+obj["f_name"]+'</td>\
                            </tr>\
                            <tr>\
                                <td>Class</td>\
                                <td>'+obj["class_id"]+'</td>\
                            </tr>\
                            <tr>\
                                <td>For the Month of</td>\
                                <td>'+obj["month"]+'</td>\
                            </tr>\
                            <tr>\
                                <td><span class="">Issue Date: </span> '+obj["issue"]+'</td>\
                                <td><span class="">Due Date: </span> '+obj["due"]+'</td>\
                            </tr>\
                        </tbody>\
                    </table>\
                    <hr>\
                    <div class="clearfix"></div>\
                    <table class="table table-condensed ">\
                        <thead>\
                            <tr>\
                                <td width="10%"><strong>S#</strong></td>\
                                <td width="60%" ><strong>Description</strong></td>\
                                <td width="30%" class="text-right"><strong>Amount</strong></td>\
                            </tr>\
                        </thead>\
                        <tbody>\
                            <tr>\
                                <td>1</td>\
                                <td>Admission Fee</td>\
                                <td class="text-right">'+adm_total+'</td>\
                            </tr>\
                            <tr>\
                                <td>2</td>\
                                <td>Security</td>\
                                <td class="text-right">'+sec_total+'</td>\
                            </tr>\
                            <tr>\
                                <td>3</td>\
                                <td>Annual Charges</td>\
                                <td class="text-right">0</td>\
                            </tr>\
                            <tr>\
                                <td>5</td>\
                                <td>Tuition Fees</td>\
                                <td class="text-right">0</td>\
                            </tr>\
                            <tr>\
                                <td>6</td>\
                                <td>Miscellaneous</td>\
                                <td class="text-right">0</td>\
                            </tr>\
                            <tr>\
                                <td>7</td>\
                                <td>Transport Fees</td>\
                                <td class="text-right">'+tra_total+'</td>\
                            </tr>\
                            <tr>\
                                <td>8</td>\
                                <td>Arrears </td>\
                                <td class="text-right">'+trans_arears+'</td>\
                            </tr>\
                            <tr>\
                                <td>9</td>\
                                <td>Current Penalty</td>\
                                <td class="text-right">0</td>\
                            </tr>\
                            <tr>\
                                <td class="thick-line"></td>\
                                <td class="thick-line text-right"><strong>Grand Total</strong></td>\
                                <td class="thick-line text-right">'+grand_total+'</td>\
                            </tr>\
                        </tbody>\
                    </table>\
                    <h3 class="text-center"><strong>INSTRUCTIONS</strong></h3>\
                    <ol>\
                        <li>Last date for submission of fee is 10th of each month.</li>\
                        <li>Late Fee will be charged @ 10/- per day.</li>\
                        <li>Penalty will be charged by U N ACADEMY through next month fee challan.</li>\
                    </ol> \
                    <div class="mt-5">\
                        <div class="col-sm-4 dated">\
                            <h5 class="ml-5"><strong>Date</strong></h5>\
                        </div>\
                        <div class="col-sm-2">\
                        </div>\
                        <div class="col-md-6 text-right sign ">\
                            <h6 class="signature"><strong>Signature of Receiver</strong></h6>\
                        </div>\
                    </div> \
                </div>\
            </div>\
        </div>\
    </div>\
</div>\
</div>\
</div>\
</div>'

    $(".print_pdf_show").append(html);

    printJS({printable:'printSect',type: 'html',scanStyles:false,style:'\
@media print { body {\
    box-sizing: border-box;\
    margin: 0 auto;\
    padding: 5px;\
    width: 21cm;\
    height: 29.7cm; \
    background: #FFF;\
    font-size: 12px;\
    box-shadow: 0 0 1in -0.25in rgba(0, 0, 0, 0.5);\
}\
address{\
    font-style: normal;\
}\
address h2{\
    margin-top: 0;\
}\
address h3{\
    margin-top: 0;\
}\
.mt-2{\
    margin-top: 20px;\
}\
.mt-3{\
    margin-top: 30px;\
}\
\
.mt-5{\
    margin-top: 25mm;\
}\
.logo-s{\
    margin-top: 10px;\
}\
table.challan-no{\
    float: left;\
    width: 49%;\
}\
table.enrol{\
    float: right;\
    width: 49%;\
}\
table.enrol th, table.challan-no th {\
    width: 60%;\
    background: #EEE;\
    border-color: #BBB;\
    border-radius: 0.25em;\
    border-style: solid;\
    border-width: 1px;\
    padding: 0.5em;\
    position: relative;\
    text-align: left;\
}\
table.enrol td, table.challan-no td {\
    width: 30%;\
    border-color: #DDD;\
    border-radius: 0.25em;\
    border-style: solid;\
    border-width: 1px;\
    padding: 0.5em;\
    position: relative;\
    text-align: left;\
}\
.table > tbody > tr > .no-line {\
    border-top: none;\
}\
.table > thead > tr > .no-line {\
    border-bottom: none;\
}\
.table > tbody > tr > .thick-line {\
    border-top: 2px solid;\
    border-bottom: 2px solid;\
}\
.dated, .sign{\
    border-top: 2px solid;\
    margin-top: 60px;\
}\
   .col-sm-1, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-md-6, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-sm-10, .col-sm-11, .col-sm-12 {\
        float: left;\
   }\
   .col-sm-12 {\
        width: 100%;\
        display: block;\
        padding: 15px;\
   }\
   .col-sm-11 {\
        width: 91.66666667%;\
   }\
   .col-sm-10 {\
        width: 83.33333333%;\
   }\
   .col-sm-9 {\
        width: 75%;\
   }\
   .col-sm-8 {\
        width: 66.66666667%;\
   }\
   .col-sm-7 {\
        width: 58.33333333%;\
   }\
   .col-sm-6 {\
        width: 48%;\
        margin: 1%;\
   }\
   .col-md-6{\
      width: 50%;\
   }\
   .col-sm-5 {\
        width: 41.66666667%;\
   }\
   .col-sm-4 {\
        width: 33.33333333%;\
   }\
   .col-sm-3 {\
        width: 25%;\
   }\
   .col-sm-2 {\
        width: 16.66666667%;\
   }\
   .col-sm-1 {\
        width: 8.33333333%;\
   }\
body {\
    padding: 5px;\
    width: 21cm;\
    height: 24.7cm;  /*29.7cm; */\
    background: #FFF;\
    font-size: 12px;\
    box-shadow: none;\
}\
@page {\
     size: 8.2in 11in;\
     margin: 15mm 15mm 15mm 15mm;\
 }\
 .table {\
margin-top: 10mm;\
}\
}\
}}'});
}



function printChallan(stdId,emp){

  $(".print_pdf_show").empty();
  var obj = {
              "stdId":stdId,
              "gr_num": jQuery(emp).children()[0].innerText,
              "name" : jQuery(emp).children()[1].innerText, 
              "f_name" : jQuery(emp).children()[2].innerText, 
              "class_id" : jQuery(emp).children()[3].innerText,
              "admission_fees":jQuery(emp).children().find("input")[0].value,
              "security_fees":jQuery(emp).children().find("input")[1].value,
              "annual_fees":jQuery(emp).children().find("input")[2].value,
              "monthly_fees":jQuery(emp).children().find("input")[3].value,
              "misc_fees":jQuery(emp).children().find("input")[4].value,
              "transport_fees":jQuery(emp).children().find("input")[5].value,
              "arrears":jQuery(emp).children().find("input")[6].value,
              "transport_arrears":jQuery(emp).children().find("input")[7].value,
              "current_penalty":jQuery(emp).children().find("input")[8].value,
              "month":jQuery('#month')[0].value,
              "issue":jQuery('#issue')[0].value,
              "due":jQuery('#due')[0].value
            };
  var total = +obj["annual_fees"] + +obj["monthly_fees"] + +obj["misc_fees"] + +obj["arrears"] + +obj["current_penalty"];

    var html =''
    html = '\
    <div class="container-fluid" id="printSect">\
        <div class="row">\
            <div class="col-sm-6">\
                <div class="row">\
                    <div class="col-sm-12">\
                        <div class="invoice-title">\
                            <h6 class="pull-right">STUDENT COPY</h6>\
                        </div>\
                        <div class="row">\
                            <div class="col-sm-4">\
                             <img src="data:image/jpeg;base64,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" class="img-responsive logo-s" width="100px">\
                         </div>\
                         <div class="col-sm-8 text-right">\
                            <address>\
                                <h3 style="text-align:center;margin-bottom: 0px;font-weight:600;">U N ACADEMY</h3>\
                                <h4 style="text-align:center;margin-top: 0px;margin-bottom: 0px;font-weight:600;"> For Kids </h4>\
                                <p style="text-align:center;line-height: 1;">625/B, Unit 2 Latifabad Hyderabad</p>\
                            </address>\
                        </div>\
                    </div>\
                </div>\
            </div>\
            <div class="row">\
                <div class="col-sm-12">\
                    <div class="panel panel-default">\
                        <div class="panel-body">\
                            <div class="table-responsive">\
                              <table class="challan-no">\
                                <tbody>\
                                    <tr>\
                                        <th><span>Challan No</span></th>\
                                        <td><span>'+obj["month"].replace("-","")+'</span></td>\
                                    </tr>\
                                </tbody>\
                            </table>\
                            <table class="enrol">\
                                <tbody>\
                                    <tr>\
                                        <th><span>Enrol No</span></th>\
                                        <td><span>'+obj["gr_num"]+'</span></td>\
                                    </tr>\
                                </tbody>\
                            </table>\
                            <div class="clearfix"></div>\
                            <table class="table table-condensed mt-3">\
                                <tbody>\
                                    <tr>\
                                        <td>Name of Student</td>\
                                        <td>'+obj["name"]+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>Father Name </td>\
                                        <td>'+obj["f_name"]+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>Class</td>\
                                        <td>'+obj["class_id"]+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>For the Month of</td>\
                                        <td>'+obj["month"]+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td><span class="">Issue Date: </span> '+obj["issue"]+'</td>\
                                        <td><span class="">Due Date: </span> '+obj["due"]+'</td>\
                                    </tr>\
                                </tbody>\
                            </table>\
                            <hr>\
                            <div class="clearfix"></div>\
                            <table class="table table-condensed ">\
                                <thead>\
                                    <tr>\
                                        <td width="10%"><strong>S#</strong></td>\
                                        <td width="60%" ><strong>Description</strong></td>\
                                        <td width="30%" class="text-right"><strong>Amount</strong></td>\
                                    </tr>\
                                </thead>\
                                <tbody>\
                                    <tr>\
                                        <td>1</td>\
                                        <td>Admission Fee</td>\
                                        <td class="text-right">0</td>\
                                    </tr>\
                                    <tr>\
                                        <td>2</td>\
                                        <td>Security</td>\
                                        <td class="text-right">0</td>\
                                    </tr>\
                                    <tr>\
                                        <td>3</td>\
                                        <td>Annual Charges</td>\
                                        <td class="text-right">'+obj["annual_fees"]+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>5</td>\
                                        <td>Tuition Fees</td>\
                                        <td class="text-right">'+obj["monthly_fees"]+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>6</td>\
                                        <td>Miscellaneous</td>\
                                        <td class="text-right">'+obj["misc_fees"]+'</td>\
                                    </tr>\
                                        <td>7</td>\
                                        <td>Transport Fees</td>\
                                        <td class="text-right">0</td>\
                                    <tr>\
                                    </tr>\
                                    <tr>\
                                        <td>8</td>\
                                        <td>Arrears </td>\
                                        <td class="text-right">'+obj["arrears"]+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>9</td>\
                                        <td>Current Penalty</td>\
                                        <td class="text-right">'+obj["current_penalty"]+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td class="thick-line"></td>\
                                        <td class="thick-line text-right"><strong>Grand Total</strong></td>\
                                        <td class="thick-line text-right">'+total+'</td>\
                                    </tr>\
                                </tbody>\
                            </table>\
                            <h3 class="text-center"><strong>INSTRUCTIONS</strong></h3>\
                            <ol>\
                                <li>Last date for submission of fee is 10th of each month.</li>\
                                <li>Late Fee will be charged @ 10/- per day.</li>\
                                <li>Penalty will be charged by U N ACADEMY through next month fee challan.</li>\
                            </ol> \
                            <div class="mt-5">\
                                <div class="col-sm-4 dated">\
                                    <h5 class="ml-5"><strong>Date</strong></h5>\
                                </div>\
                                <div class="col-sm-2">\
                                </div>\
                                <div class="col-md-6 text-right sign ">\
                                    <h6 class="signature"><strong>Signature of Receiver</strong></h6>\
                                </div>\
                            </div> \
                        </div>\
                    </div>\
                </div>\
            </div>\
        </div>\
    </div>\
    <div class="col-sm-6">\
        <div class="row">\
            <div class="col-sm-12">\
                <div class="invoice-title">\
                    <h6 class="pull-right">OFFICE COPY</h6>\
                </div>\
                <div class="row">\
                    <div class="col-sm-4">\
                     <img src="data:image/jpeg;base64,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" class="img-responsive logo-s" width="100px">\
                 </div>\
                 <div class="col-sm-8 text-right">\
                    <address>\
                        <h3 style="text-align:center;margin-bottom: 0px;font-weight:600;">U N ACADEMY</h3>\
                        <h4 style="text-align:center;margin-top: 0px;margin-bottom: 0px;font-weight:600;"> For Kids </h4>\
                        <p style="text-align:center;line-height: 1;">625/B, Unit 2 Latifabad Hyderabad</p>\
                    </address>\
                </div>\
            </div>\
        </div>\
    </div>\
    <div class="row">\
        <div class="col-sm-12">\
            <div class="panel panel-default">\
                <div class="panel-body">\
                    <div class="table-responsive">\
                      <table class="challan-no">\
                        <tbody>\
                            <tr>\
                                <th><span>Challan No</span></th>\
                                <td><span>'+obj["month"].replace("-","")+'</span></td>\
                            </tr>\
                        </tbody>\
                    </table>\
                    <table class="enrol">\
                        <tbody>\
                            <tr>\
                                <th><span>Enrol No</span></th>\
                                <td><span>'+obj["gr_num"]+'</span></td>\
                            </tr>\
                        </tbody>\
                    </table>\
                    <div class="clearfix"></div>\
                    <table class="table table-condensed mt-3">\
                        <tbody>\
                            <tr>\
                                <td>Name of Student</td>\
                                <td>'+obj["name"]+'</td>\
                            </tr>\
                            <tr>\
                                <td>Father Name </td>\
                                <td>'+obj["f_name"]+'</td>\
                            </tr>\
                            <tr>\
                                <td>Class</td>\
                                <td>'+obj["class_id"]+'</td>\
                            </tr>\
                            <tr>\
                                <td>For the Month of</td>\
                                <td>'+obj["month"]+'</td>\
                            </tr>\
                            <tr>\
                                <td><span class="">Issue Date: </span> '+obj["issue"]+'</td>\
                                <td><span class="">Due Date: </span> '+obj["due"]+'</td>\
                            </tr>\
                        </tbody>\
                    </table>\
                    <hr>\
                    <div class="clearfix"></div>\
                    <table class="table table-condensed ">\
                        <thead>\
                            <tr>\
                                <td width="10%"><strong>S#</strong></td>\
                                <td width="60%" ><strong>Description</strong></td>\
                                <td width="30%" class="text-right"><strong>Amount</strong></td>\
                            </tr>\
                        </thead>\
                        <tbody>\
                            <tr>\
                                <td>1</td>\
                                <td>Admission Fee</td>\
                                <td class="text-right">0</td>\
                            </tr>\
                            <tr>\
                                <td>2</td>\
                                <td>Security</td>\
                                <td class="text-right">0</td>\
                            </tr>\
                            <tr>\
                                <td>3</td>\
                                <td>Annual Charges</td>\
                                <td class="text-right">'+obj["annual_fees"]+'</td>\
                            </tr>\
                            <tr>\
                                <td>5</td>\
                                <td>Tuition Fees</td>\
                                <td class="text-right">'+obj["monthly_fees"]+'</td>\
                            </tr>\
                            <tr>\
                                <td>6</td>\
                                <td>Miscellaneous</td>\
                                <td class="text-right">'+obj["misc_fees"]+'</td>\
                            </tr>\
                            <tr>\
                                <td>7</td>\
                                <td>Transport Fees</td>\
                                <td class="text-right">0</td>\
                            </tr>\
                            <tr>\
                                <td>8</td>\
                                <td>Arrears </td>\
                                <td class="text-right">'+obj["arrears"]+'</td>\
                            </tr>\
                            <tr>\
                                <td>9</td>\
                                <td>Current Penalty</td>\
                                <td class="text-right">'+obj["current_penalty"]+'</td>\
                            </tr>\
                            <tr>\
                                <td class="thick-line"></td>\
                                <td class="thick-line text-right"><strong>Grand Total</strong></td>\
                                <td class="thick-line text-right">'+total+'</td>\
                            </tr>\
                        </tbody>\
                    </table>\
                    <h3 class="text-center"><strong>INSTRUCTIONS</strong></h3>\
                    <ol>\
                        <li>Last date for submission of fee is 10th of each month.</li>\
                        <li>Late Fee will be charged @ 10/- per day.</li>\
                        <li>Penalty will be charged by U N ACADEMY through next month fee challan.</li>\
                    </ol> \
                    <div class="mt-5">\
                        <div class="col-sm-4 dated">\
                            <h5 class="ml-5"><strong>Date</strong></h5>\
                        </div>\
                        <div class="col-sm-2">\
                        </div>\
                        <div class="col-md-6 text-right sign ">\
                            <h6 class="signature"><strong>Signature of Receiver</strong></h6>\
                        </div>\
                    </div> \
                </div>\
            </div>\
        </div>\
    </div>\
</div>\
</div>\
</div>\
</div>'

    $(".print_pdf_show").append(html);

    printJS({printable:'printSect',type: 'html',scanStyles:false,style:'\
@media print { body {\
    box-sizing: border-box;\
    margin: 0 auto;\
    padding: 5px;\
    width: 21cm;\
    height: 29.7cm; \
    background: #FFF;\
    font-size: 12px;\
    box-shadow: 0 0 1in -0.25in rgba(0, 0, 0, 0.5);\
}\
address{\
    font-style: normal;\
}\
address h2{\
    margin-top: 0;\
}\
address h3{\
    margin-top: 0;\
}\
.mt-2{\
    margin-top: 20px;\
}\
.mt-3{\
    margin-top: 30px;\
}\
\
.mt-5{\
    margin-top: 25mm;\
}\
.logo-s{\
    margin-top: 10px;\
}\
table.challan-no{\
    float: left;\
    width: 49%;\
}\
table.enrol{\
    float: right;\
    width: 49%;\
}\
table.enrol th, table.challan-no th {\
    width: 60%;\
    background: #EEE;\
    border-color: #BBB;\
    border-radius: 0.25em;\
    border-style: solid;\
    border-width: 1px;\
    padding: 0.5em;\
    position: relative;\
    text-align: left;\
}\
table.enrol td, table.challan-no td {\
    width: 30%;\
    border-color: #DDD;\
    border-radius: 0.25em;\
    border-style: solid;\
    border-width: 1px;\
    padding: 0.5em;\
    position: relative;\
    text-align: left;\
}\
.table > tbody > tr > .no-line {\
    border-top: none;\
}\
.table > thead > tr > .no-line {\
    border-bottom: none;\
}\
.table > tbody > tr > .thick-line {\
    border-top: 2px solid;\
    border-bottom: 2px solid;\
}\
.dated, .sign{\
    border-top: 2px solid;\
    margin-top: 60px;\
}\
   .col-sm-1, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-md-6, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-sm-10, .col-sm-11, .col-sm-12 {\
        float: left;\
   }\
   .col-sm-12 {\
        width: 100%;\
        display: block;\
        padding: 15px;\
   }\
   .col-sm-11 {\
        width: 91.66666667%;\
   }\
   .col-sm-10 {\
        width: 83.33333333%;\
   }\
   .col-sm-9 {\
        width: 75%;\
   }\
   .col-sm-8 {\
        width: 66.66666667%;\
   }\
   .col-sm-7 {\
        width: 58.33333333%;\
   }\
   .col-sm-6 {\
        width: 48%;\
        margin: 1%;\
   }\
   .col-md-6{\
      width: 50%;\
   }\
   .col-sm-5 {\
        width: 41.66666667%;\
   }\
   .col-sm-4 {\
        width: 33.33333333%;\
   }\
   .col-sm-3 {\
        width: 25%;\
   }\
   .col-sm-2 {\
        width: 16.66666667%;\
   }\
   .col-sm-1 {\
        width: 8.33333333%;\
   }\
body {\
    padding: 5px;\
    width: 21cm;\
    height: 24.7cm;  /*29.7cm; */\
    background: #FFF;\
    font-size: 12px;\
    box-shadow: none;\
}\
@page {\
     size: 8.2in 11in;\
     margin: 15mm 15mm 15mm 15mm;\
 }\
 .table {\
margin-top: 10mm;\
}\
}\
}}'});
}


function batchPrintAdmTraChallan(cat){
  $(".print_pdf_show").empty();

  jQuery("#fees_table_body tr").each(function(i,row){
    var obj={};
    var adm_total = 0;
    var tra_total = 0;
    var trans_arears = 0;
    var sec_total = 0;
    console.log(jQuery(row).children().find("td")[0]);
    obj = {
            "gr_num": jQuery(row).children()[0].innerText,
            "name" : jQuery(row).children()[1].innerText, 
            "f_name" : jQuery(row).children()[2].innerText, 
            "class_id" : jQuery(row).children()[3].innerText,
            "admission_fees":jQuery(row).children().find("input")[0].value,
            "security_fees":jQuery(row).children().find("input")[1].value,
            "annual_fees":jQuery(row).children().find("input")[2].value,
            "monthly_fees":jQuery(row).children().find("input")[3].value,
            "misc_fees":jQuery(row).children().find("input")[4].value,
            "transport_fees":jQuery(row).children().find("input")[5].value,
            "arrears":jQuery(row).children().find("input")[6].value,
            "transport_arrears":jQuery(row).children().find("input")[7].value,
            "current_penalty":jQuery(row).children().find("input")[8].value,
            "month":jQuery('#month')[0].value,
            "issue":jQuery('#issue')[0].value,
            "due":jQuery('#due')[0].value
    };
    if (cat == "admission"){
      adm_total = obj["admission_fees"];
      trans_arears = 0;
      tra_total = 0;
      sec_total = obj['security_fees'];
    }
    else{
      tra_total = obj["transport_fees"];
      trans_arears = obj["transport_arrears"];
      sec_total = 0;
      adm_total = 0;
    }
    var grand_total = +adm_total + +tra_total + +trans_arears + +sec_total;
    var html =''
    html = '\
    <div class="container-fluid" id="printSect">\
        <div class="row">\
            <div class="col-sm-6">\
                <div class="row">\
                    <div class="col-sm-12">\
                        <div class="invoice-title">\
                            <h6 class="pull-right">STUDENT COPY</h6>\
                        </div>\
                        <div class="row">\
                            <div class="col-sm-4">\
                             <img src="data:image/jpeg;base64,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" class="img-responsive logo-s" width="100px">\
                         </div>\
                         <div class="col-sm-8 text-right">\
                            <address>\
                                <h3 style="text-align:center;margin-bottom: 0px;font-weight:600;">U N ACADEMY</h3>\
                                <h4 style="text-align:center;margin-top: 0px;margin-bottom: 0px;font-weight:600;"> For Kids </h4>\
                                <p style="text-align:center;line-height: 1;">625/B, Unit 2 Latifabad Hyderabad</p>\
                            </address>\
                        </div>\
                    </div>\
                </div>\
            </div>\
            <div class="row">\
                <div class="col-sm-12">\
                    <div class="panel panel-default">\
                        <div class="panel-body">\
                            <div class="table-responsive">\
                              <table class="challan-no">\
                                <tbody>\
                                    <tr>\
                                        <th><span>Challan No</span></th>\
                                        <td><span>'+obj["month"].replace("-","")+'</span></td>\
                                    </tr>\
                                </tbody>\
                            </table>\
                            <table class="enrol">\
                                <tbody>\
                                    <tr>\
                                        <th><span>Enrol No</span></th>\
                                        <td><span>'+obj["gr_num"]+'</span></td>\
                                    </tr>\
                                </tbody>\
                            </table>\
                            <div class="clearfix"></div>\
                            <table class="table table-condensed mt-3">\
                                <tbody>\
                                    <tr>\
                                        <td>Name of Student</td>\
                                        <td>'+obj["name"]+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>Father Name </td>\
                                        <td>'+obj["f_name"]+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>Class</td>\
                                        <td>'+obj["class_id"]+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>For the Month of</td>\
                                        <td>'+obj["month"]+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td><span class="">Issue Date: </span> '+obj["issue"]+'</td>\
                                        <td><span class="">Due Date: </span> '+obj["due"]+'</td>\
                                    </tr>\
                                </tbody>\
                            </table>\
                            <hr>\
                            <div class="clearfix"></div>\
                            <table class="table table-condensed ">\
                                <thead>\
                                    <tr>\
                                        <td width="10%"><strong>S#</strong></td>\
                                        <td width="60%" ><strong>Description</strong></td>\
                                        <td width="30%" class="text-right"><strong>Amount</strong></td>\
                                    </tr>\
                                </thead>\
                                <tbody>\
                                    <tr>\
                                        <td>1</td>\
                                        <td>Admission Fee</td>\
                                        <td class="text-right">'+adm_total+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>2</td>\
                                        <td>Security</td>\
                                        <td class="text-right">'+sec_total+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>3</td>\
                                        <td>Annual Charges</td>\
                                        <td class="text-right">0</td>\
                                    </tr>\
                                    <tr>\
                                        <td>5</td>\
                                        <td>Tuition Fees</td>\
                                        <td class="text-right">0</td>\
                                    </tr>\
                                    <tr>\
                                        <td>6</td>\
                                        <td>Miscellaneous</td>\
                                        <td class="text-right">0</td>\
                                    </tr>\
                                    <tr>\
                                        <td>7</td>\
                                        <td>Transport Fees</td>\
                                        <td class="text-right">'+tra_total+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>8</td>\
                                        <td>Arrears </td>\
                                        <td class="text-right">'+trans_arears+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>9</td>\
                                        <td>Current Penalty</td>\
                                        <td class="text-right">0</td>\
                                    </tr>\
                                    <tr>\
                                        <td class="thick-line"></td>\
                                        <td class="thick-line text-right"><strong>Grand Total</strong></td>\
                                        <td class="thick-line text-right">'+grand_total+'</td>\
                                    </tr>\
                                </tbody>\
                            </table>\
                            <h3 class="text-center"><strong>INSTRUCTIONS</strong></h3>\
                            <ol>\
                                <li>Last date for submission of fee is 10th of each month.</li>\
                                <li>Late Fee will be charged @ 10/- per day.</li>\
                                <li>Penalty will be charged by U N ACADEMY through next month fee challan.</li>\
                            </ol> \
                            <div class="mt-5">\
                                <div class="col-sm-4 dated">\
                                    <h5 class="ml-5"><strong>Date</strong></h5>\
                                </div>\
                                <div class="col-sm-2">\
                                </div>\
                                <div class="col-md-6 text-right sign ">\
                                    <h6 class="signature"><strong>Signature of Receiver</strong></h6>\
                                </div>\
                            </div> \
                        </div>\
                    </div>\
                </div>\
            </div>\
        </div>\
    </div>\
    <div class="col-sm-6">\
        <div class="row">\
            <div class="col-sm-12">\
                <div class="invoice-title">\
                    <h6 class="pull-right">OFFICE COPY</h6>\
                </div>\
                <div class="row">\
                    <div class="col-sm-4">\
                     <img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAIBAQIBAQICAgICAgICAwUDAwMDAwYEBAMFBwYHBwcGBwcICQsJCAgKCAcHCg0KCgsMDAwMBwkODw0MDgsMDAz/2wBDAQICAgMDAwYDAwYMCAcIDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAz/wAARCADuAQ0DASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD9/KKKKACiiigAooooAKKKKACiiqmva9ZeF9EvNS1K6t7HT9Pge6urmeQRxW8SKWd3Y8KqqCSTwAKN9EDaSuy3XE/Hb9pDwB+zD4QTX/iJ4y8N+C9HlmFvFdaxfx2qXEpUsI495Bdyqsdq5bCk4wDX5Rf8FKv+DnM6TrVx4L/ZltV16+gaa21LxVe6Q9xBAQFCPYRbiZSGLZeaLZlBhJFYMPx4/aJ+InxP+N/xD1Txj8Sn8UaprGqyefd6jqenzQqzAKBgbFRFACgKoUAYAFfqXDvhjicY4zzKoqEZbRdud/8Abrat6vbsePiM4pp8lK1+l9vl1f4H7fftD/8AB2R8JPAV1qFh8PvAfi/xxeWrtFDeXksOl6bclXK71fMspQqNwzEpIIBCnOPMdA/4K2/tdftgeD73xlDqnw0/ZZ+EcMgMPi/xHZGX7Uj5/d2zXaMl7KAjsqxJGG243dK+IP2Af2TNI8PfCwfFbxn4U1bxp4l8RaumifCjwYscq2vi3VFKh5r3hStjC08DBjLGHKyBiyjB739oqx8D6N8YNa8UftjeN9e8e/E7yEg0/wCG3w+lRbfwxtXKWd7MAIIY1URRlbV3kGGZmkbk/YS4ZyHDz+qYCl7SSvzSf7yTtp7kNIu20pvljF6e81p4NfMatSVo1H20772srK9u/Tt19u1v/g5X8R+GvgnceDvhx/wnXxc+J2oeZFJ4y8RabaabHbjoGs9LsUdGCjJUynduJLF1AQc7+y949/4Ki/Hq6jms/GXjjwjoUs6xzav4w0KysLWyhI3STP59mX2RpliwXHGBzxXzHp//AAVw+Lnw30pdN+C3hXw/8EdHYiMWfhrQmv7i8yeDLdXizTSMSR0KjAAx65P7Rvi/xx+y7oniDwz4s1y+174ofEO0lTxrfStcXP8Awj1hIEK6dFIQIhcyO1wt0Y90YQxIj5MoHpw4Yo0f9loYalF1HvP35a6c0orljBLsnKN9vPjqYiq3BSs5bWum1rum01tvpe6teWlv2Y07/gqhffCL4wyaf4u/aN/ZX17wjpqWNlIYtcabWryWO3jS7uWSzjMULSyiSQREERk7AxAydGb/AIOaP2Y1+Omn+DYdQ8VXWm3q/P4nj0xRpNm25lxJukE+MKG3LE3Dr74/msinKq0e7cUwAq8Hb2zn2p5TYWgb5nPzLgdBXT/xB7LakU61SXNa3upRV+9lfXzb1fQ9yliMRTbXNe7vrd/LXp6JH9nPwz+K3hn4z+ErfXvCWv6R4k0a6AMV5p10lxC2QGxuUnDYYEqcEZGRXQV/Kd8GP2jvH3/BOv4S2Xijw3qLaV8R/iDDFNoszhLh9F0IAiS78lw0LPdOZIkEisyJbythS6E/pT/wS7/4OedF+ID2vg/9oZrPw/qcnkWumeKdPsWFjeN8wc3yKT5Dk+Xho0MX3y3lADP5VnnhnmGFjUxGCftqUG1dL3nZ2bUdbpPS6d79LanVg88p1k3JWjdrmTTjotXvor3XXa+x+xFFQ2N/DqdolxbzRzwyDKSRtuVh7EVNX5se4mmroKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKa77Nvys2Tjjt70AYfxQ+KXh34K+AdT8U+LNY0/w/4d0aLzr3UL6ZYYLZCwUFmY45ZlAHUkgDJIFfi9/wVW/4L6fAv4/6b4f0nwz4Z8XfE7S9NmnnutI1K8m0Pw3qLZAha+gMRmu1UoJUjPlAEckliq+af8HAv/BRP4hftdftHSfAHwHpnjKHwfodxHDcaTHp8i3firURmRH8pEErQqHXy48srlVlxnbt8Jsv2W/hX+wFfaDd/Gq1i+LPxT1a2S4sPhhoVy4tdPlZVCW+r3QYSR3G5yRbRxPuaIAkq9ftnCfBWCw+Hp43M3KVeprTpwfvW7tqyT16yil3vofJ5jmMMQuSDvB9FbXXd9eVb6Wdlpd2R0nwl/at/az/AGvtLk8Lfs7fDmy8AeF45g7QfD3RBodmgk+TEt7JIEzkNyzhs7j249y8aQftYfsF/Bm//sv4meLvjF8VNeum0PXNIsdRl8RR+AYnhhuY2eDLyLeSJtKyHEaRy52sZUes34u/t7eNv+CfXwas4bi50e3+LHi7T3m8N/D3QtPhsNI+DNlcJ5kT3UCJi81ALJblI7mLKYlJbDYl8w+CXw0+Kngn/gmX8T/iW0niab4g/G7xLbeFodZv9Yeyu7eygMdzcX0t1cum4SGBrbc0gJ3kZOMV79Re0jGs6FKnQc4qMWuZ1HKTveTalaOrb2ly6Nxs5eHWlGFK+kde+iXm73S6X2XbXSr+zh8cviv/AME6fD1x8dviN4i8WeJtavtQvPCmj+F9S8QT6jY3d0kUX2k6sySyi3MSXH7u2k8uXzAxwqr830f+yp/wWj0f9qS7uvBOi/B/UvgzqV4RPf8AivwClvdw2YZz5t3eLJbxrBbhmMjSSSNtwWLE814b+wRo/wAK/AP/AAlX7OPxc8baJ8Sv+FxXllcaND4euXutL8O6ygkMbSag21Y7idvJgY26yk4VWJUgV8q/tVfGXxR8M/Hnjb4W6Noln8K/DOlarNp134c0UGO4uDCXi23l4VW5vgcuw89imJPlRVwB3rIsLmmKq0atL96mpKpbkh7OyUbQT96zurONm9XK0kOnTlZwpbyu76xSWidlbd23W/8ANY/TDxj8e/irD8K9U0P4E/tMeH/2jvilr919k+y2usWmm3ulWMeJWlsbGWQm4m+Qq8yzcI5CxEgsPhvx5/wVA/bC/Z38ZTaT4u8XePtH1qFiz2niKxeEtg4JQOF3L7jINfIGjeIr7wjfW+p6fdXdjdWJJiubQmG4jJ/uspBHXsa+nPhJ/wAFLNZkhtvD/wAcvDdj8fvA8UbxJbeI5MazpisBlrXVNrXURGFO3cQduPlyTXuUeFZYCM5qhTxEZPmkpQhGotLe7a0Gnsovl9bs7J4ZxVlZx83K/wAtXZen3G/P/wAFsfiR41SGDx94D+DfxQt45BK8Pijwil2zN03F94J44z1wa6zwj8Qv2ff2kPCd544+JX7Ol18KfA/hqaO2Gs+AtbEFvr2oGRCNMjsp4W3sYpHlkMcmVjiySuRnT8K/8EjPDP7U/giT4z/CHxHq0/wtVri71HwreabM/i6xSA/vbSySPfHeOPurIXjXLIW74+Qv2g/2iLj4165Da2Wk2fhHwVoIeLQvDGmytJZaMhYljlsGW4diWkmf53OBwqoi54fL8qx0/Y5VzUnF/vHFuDj/AHHG61ff4Ule+18Y4eE1GNFNW6tu61s0tXd6W1ul5n05+0X+x74V/bG8c6p41+DPx88L+Pta1a92aZ4H8Qv/AMI5rlmjuPI0+zW8kWKWOGNlRAmxAI9qAkYr5P8Ajp8AfHP7OvjSbQPiB4V8ReFNZhPMOoWxVZuAd0b4KSDkHcjMOetcjbyXNpcQ3cUxEkRDxyRjEiHqCD1BHsa+nfgx/wAFPdc0fwzp/g74yeF9N+PHw1s7eSCy0XxKwjvdOd8fvrbUwj3URVdyqoYqqthQuBXvRw2ZZbS5aLVanGy5WlGdulpK0HbRJPl9b6HVTpVKUVCDTS76aeqXz2fY+pf+Ddj/AIKs+Mvgp8fNE+CPiC+j1T4W64Ly4EupXZWTwo0dvJcvLG8j7Etf3TGSPAC72kBzuV/6CPCXizTPHnhXTdc0TULPVtG1q0ivrC+tJRNb3lvKgeOWN1yGRlYMGHBBBr+bvw1+wN4X+K37NnxK+MX7N+p+MNajmtW8MWHg2+sAviTTp5JrRrx4ZIpWFzELJ5RlBuKzPnBUivYv+Dc3/grncfAj4k2vwD+I2sapqHhnxfqMVr4Wvr+6HleG7vY6fZSHywhnYQIiKwWOTov7xiPx3jnhilmcsRm+VrllS0qU2uWXNq5O3kmldaPllbW1/RyvMWpOnJWjfS71Xe61sr6fjtqfvlRRmivxE+mCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK+Kv8AgtJ8ZviVH8J9B+C/wX0+a9+I3xm+12M90Yf9F0LQY0SHUL6ecnFuqG7t0EmCw81ig3ha+1c1/O1/wWw/4LS3/wC0F4/8V/Dn4c6GPA+mWOtXuieIfEtpqG6+8aWdq8lvDGXRUK2RDTObdy6v5iHjB3fZcD5DiszzKKw9NSUGnJtXiuicl116ddtFdrzM0qWpezjvL126/wDB9TifFv8AwUsf/gn38Orr4WfAHxpqXijxC9ysniH4garbx3KNKI0V7XSYZlKpbKUUGWRGZ2LlTjYw73wr/wAFA/i5+y/+y3/wuP4ueJU1z4heOLMt8KtGfRbARrGQFuNXvPLgUrGqyoYFL5kZGym3DD5B/wCCeX7K3h/9oH4nXesfEPU5PDPwi8CWb6x4u1pidkMQYJBZxsQQZriZ40VB8xBfaGKgVx/7Xv7UutftgfHPU/FesQfYbGULY6NpUf8AqNC02It9lsouAAkasegUFizbRuIr+hZcO4DEYr6hGCk961RpObcvhhe2il9pJJRhpZcx8pHCwTjRhtF3vtZ36W21V9LerZ23xU/4Kr/tCfGa+87V/iVqzPMrSu1hb2+nMzMOR/o8acdhk8e1ejf8Fj77Vfh944+F/wAG7/XtU1qX4b+DLT+1jeTm6f8Ate8eS8uWLsAW+WaIL1wgUZyDXgv7EXw2b4u/tjfCrw2bWS8tdS8W6bBdxhQwFsLmPziy9CoQEtnjGat/t6ftAw/tW/tf/ED4gWcjzWfiTWJJLKQBgq2sSLBBjP8A0yiQY4x6V6sMrwkM4pUcLRjBUoOTUUlrK0YpWXbm+bNPq9P60pxir2bb6va13v5nkemzXGm3DXltJLDdWsitA6Nho2VgQ6nsQec+1fXf7bQ039qf9k/wH+0Fp0yTeNGnTwb8TSXJln1CGEJp97sPA861tm3smF3KoAzuNfMnwv8AhB4q+M2tNpfhHw/rniTVipke10uze7kWPuxCA4UAHLHAABJIxX2j/wAE2PC3hD9mnxj4w8B/Hjx14b8J+FvjXoB8K3ej2l/Fq19BcySoLe6m+z+dDYy2+9yrXWCnmE4AD4riPGUsMoYyg06tL7KfvSjLScbLXVO9u8V5hiq0I1I6++nstW09Hfy1Tbei3dj4PtbRYrlY4Y5n85wixxqZGkc9AB1JPoK90b9nLw5+y9NJefGC43+JfsaX+m+BLBzcXN65YiNdSnRvLtYTyWjjk+0lVZcREq1dN+0F8TNf/Yd8ceLvhT4V8HH4Ya1oN8YdR8QSXS3HjC4U7WXbqUGxIbeSMxMIoI1+Unc7bmz8xtds87STM00zEu8j8tIxOSWPUknkk+tdtF1cxhGpH93Rkrxs1zOL21WkE12vLfbqctat8V4R/wDJnt1+z2e77NHo2uftUeONU+J+h+LbHVF8P6l4Xjt7fw9b6anl2mhQW4RYILeNi3yIsaA7yzORl2ckk/S9pf8AhP8A4LB6g8N0bXwf+1VqEgFreLGlj4c8cRQovySqN/2e/EKsEICRP5Kgnc/HxAJmZSrYZW+6MY20+OYIF3SeWyEMDj5hg5yO+R+la4zJKNSEfqv7upTXuy7L+V2avFvVrrurPU0+qwS/drla7ffr31vv3fdmr4z8C6r8PvG2teHdasn03XdAv5LHULOTBa0uIXKSRtgkZVlIOCRxwTUXhDwtqfjLxhZaVo9q2oa3r1zDp9jbJj/SJ5WCRxjdgZZmUc469q+xdP8AHFv/AMFbPhFa+H/El8sP7Rnw70sW3hOaOMtN8SrJEDtaXcjZ3XsKxSNGxkBma4ZQhOTXmvhnwjrn7CPgfUvFHinSLXTfiN4kiudE8N6NqibNX8NxlWFzq72+RNZ3Mcixx2rSbGJkllUMEBPHh88k4+yqRUcSnbkvu2m1NbXjZ35raWs7SRP1ppWt7+it3b6+n42Ri/tE+MYfgR8UPD/g/wCHXibUWtfhehjtdWs7oo13qsv769uUZQmdrsLdTgZitUznkn2y28beC/8AgrjFcWviO203wX+1DdMtroOqWEX9n6H4+kAj/dX/AN9YL87JVjdPJjkkljVuNoX4fZVXywq7UiJ2gjbx6e1SQXbW0kh3eXHI4dto+ZSDnOeuRW1bh+nKnTdOXJVgtKi3u9XzbKUW/ii912epNLBKFNRi/etrLq3q236tt/Nrqf1Cf8EQv2v9T+OX7N9x8MfHVrJpPxf+BIh8MeKtOdTlYkMsdjPu3OrmSCEB2VjukR2wFZM/a1fhD/wQa/4KyeFx8fNF8J/FiTT9L8VTaYnhvQPG0kUj3PiOOW4hWLTtRk5LyKwjMM7sFRVdWBL7j+71fynxxktXLc1qU6lPk5ndfyu+7i+sW9V1SaTWh9NlNec6PJUtzR007dNOn/A3buFFFFfInqBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQB4l/wUh/aHP7KP7CfxS8fxxxzXXh/QZ2s45HKrJcy4ggUlSDgyyIOCD6HNfy+Xfx9+FPjbRbqTxB8F1stYuiZG1Dw94ovLUR5B3hba48+LliDxjp15r94P+Dn74gS+EP+CV+saXEzL/wlfiHS9Ocg/wAMc/2r+dsK/C3/AIJofs4x/tJ/tg+D9M1WH7R4W0Gb/hI/FDGTYsOlWciPcknrhhtTC85cYx1r+gPC/L8Nh8kxGbYi+jbupSjpFJL4Wr+83o77o+TziNOpWlUlf3FbRtdLvZ9br0sfSn7XL/Cf9kP9izw3+zneR/Ezwv4r8XSWnj/xjLbWVhfXH7xZFtNNu1eeDaYlWKXYoABCtjc5I+O7fRPhBdOrzeLfisoXIITwppo3e+f7Q/pWf+1D8etW/ac/aB8XePNc8r+0PFGoNdlYxiOOPaqRovJ4VFUDJPArgc7BgZC5zX6pkeQ1cNhl7WtNVJ+9OzXxPzcW9Nld7WPPpYWXIrzkrry7ej17vq9T9Df+COus/BnwD+0P4u8XaTb/ABC1q/8Ahx8P9a8T+brFtY2cbCIQxtsWGSUpJ+/wrl8AEtjIAr5r8V/tO/DPS7izf4d/Afwz4S+xgGNtZ1m78SOX53MUm2QEHPR4mH6Y9M/4JmaT/Yn7MX7WnjSRpFGj/DltBRlP8d/IzKMembTr2x718eD5JAu7twa87LcnoVc2xc60pzcHTjdylqlFSs0movV7NW8jGnhYSlOjUbaTT+Jp666uNrrsne2p6p4h/bU+Kmt2s1nZ+L7jw3pdxA1rNp3hqCDQ7GaJgVMbQWaRRsCpKncDkcdK8tjdF3NtVmPQlPmRuzD1qMLxwKVnOD83Ir7Cjg6NFP2UVG/ZHpU6NOmrU0lfsrXfmfY/7c+n6n+1p+x38P8A9p6byZ9V89fh346IBae51W3EktreuQMESWXkRszYIZYx827I+OimHYN2r67/AOCSq2/xq+KXib9nvxBfSQ+EfjVo72UDbgosNXtD9ss7rd1GPJkjIH3hKAR6fKHivw5eeDvEd/o2px/Y9Q0+7ls7iM/MySRuUdTjoQykV4eRyeFrV8sn/wAu2pQ/69yvbySUlKK7WXdGOH9xujr3TfVfnp1v3Wrdylt+cbRzmmoqyyM0mNqjmn3flwBTuZnYhUwcfN2r33T/AIF+GP2XdKn1T4w2aal4slsUm0T4epcyx3DvLu8u71SWLaILZQrEQRyi4djFlUQlj7GOx9LD+5L3pvaK3b/Ky6t6Lq0aVMRGm1F/E9kt3be3+e2qJf2U9CX9n+HQvjl4luG0X/hH78Xng3R2DQ33ii/gCvFOmQNlhFIUaSYZWTy2hUEsxX1f9un7P/wUG+BNn+0p4Xs2Pj3THttF+K2mW+64FpOIXW11dQoKx280dswcYRUfaoDZZj8j/FL4p+Ifi/41uvEXiS9F9fTKqFkjWKOGJM7IIo1AWOJASqooAA4r0r9g/wDajg/Zc+Osd5qQhuPBfjayk8N+NLKWJ5FudEu2QXWzYQyyqgLKykEEYHXFfPYzLMVGMc0v/tMOi0Th1ppdf5k9+dLokjk9lXt7WXxb8qbst9Ol992tdtNLeJj5idx3HPJxjNKrBX+7v9q9j/b1/ZCuv2Kv2kNY8Etef2ppMIj1DRdS3hv7U06dd8E2QFBbBKNgAbo2xxgnx2MySbpJFCxktnbwQMcYr6XB42niaEMRSu4zSkna+jXX8n10Z3wnGUVOPU9S/Yn8OP42/a++GemosP2d/FenT3EcrBY0giuY5pizHAVREjktxgAnI61/WL+yV+0fpX7XX7OXhP4kaLBJa6b4qszcxwvIJGhZXaN0LDg7XRhn26DpX8mv7M/xL0D4T/8ACfX2rXBTUL7wZqOjaCqIzSSXt2Eg8wkcLshac5Y9cYBNf0Mf8G0/jf8A4S3/AIJL+C7PzDI3hvVNU0s5GNv+lyTgf98zivw3xiwbrUYY2ztTcYLtqpSlbv8AZV/Kxpldaax0oNWi0kv7z3Vn5K/3+R970UUV/Px9UFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAH5V/8AB2i9yP2H/Aqqp+xnxcrSOfuiUWs/lj6lTKR/umvyv/Yc8b3n7PP7A/7Sfju3ENvfeJrDTvh3p8rp80q6k1y92sbgghhBbs2BxlVJyQBX7Xf8HHes2Xhf/gnNNq2q+DdF8b6NY+I9OXULDUWkh2Qyu0PmQzxESQSh3RRIpyAxGCCQfyp/aB8MfDC8/wCCUHwMg0P+0vhLpXxQ8Yap4h+z6kj61avPYNLYZlvBsmWCLzX2fu5GxK+QSuT++cE5hGfD9HL6lN8s61m1rs1Uasrv4YvpsfF5vVksTKPK+W6blv0XupL3r7a2tZvW+h+dokZoFDYPpjvQXyOhr3VP+Cf/AIo17UY7fwj4s+FvxGuJozJFbeFvFUF1eScE7RbuEm3Adgma4jXf2U/ip4b3/bPhj8RrVY+WeTw1e7B2+95W39a/bqOdYGcU1Wjr3kk/mnZ3+RjDMsNJcymrebt+dj6K/YVEkP8AwTG/bDaNdzTW/hxH/wBlN2p5P8q+OHIkud3JXb1x35r7o/4JxfDLxVqv7HH7XPhK78NeIrVtQ8F22swxz6TOrzyWTXBESAqMu3nngcnGcHFfKmn/ALMXxO163abT/h38QbqHON0Xhy9ZFPpuEWM/SvFy3MMPTxuN55xXvwau9/3cLdtLp7X0MaeMoqvKTmrNKzutbX216XscEAVHQnntzSeXuRzu+YAbR1ya9pT9gn4kaXNb/wDCVDQfhna3aiSGXxnrMWi+Yp7iOTMxxxnEZ5OOtQ+NPgV8NfhBc6eniL4tWvii5my80PgTSjqkUGCPke5uZbZckHgorgHOQMYPrTzzCX5abc3/AHU5L1urr72bPMsPz+zjLml2Sbf4X/4HU8o0rXp/Betafqtpdy2d1p86XEM6MVeKRG3KQRzwwHSvvL/gpF+xtb+O/jF4P+Ni3eg/Dv4d/HTRLHxdql3rN1HH/Y17dZe+ggtSVuL14tyPthjJcyryN26vnX4gftL/AA98MyJb/CP4Z2Ph+No1WTV/FNxH4m1OfDFjiG5hNnBztG6KHfhfv8kV7L4R13V/27P+CXXxVHjDVtX8XeOvgbrNt4n0i+1K6e4ng0rUTHb3dvCN2Vij+yCVhjYmExjJr5vOKmNVejj6cVSjf2cm7OVp2ina7V1Llabuld3VtDOcqkn7WUeXpd6vVrVpO1rX3bd3eytr49N8d/CP7N9rqml/C7SYNY1y6V7NvHms2qG8jAcbJ9LtSp/s9iowXd5ZeQVaI5U+EyXUl/I8008rXEpJeaZjJI5PJy3Ukn1ppyFIXc3IOT6UeXx1/KvrcLgaVGXPFNuSV23dy9X+isl0SR1UcPCnqtW92936/wCS07ISSJjCSZmZFIBy33s+1KSsAVVVW3YPmMPu+1SafZNqF/bwwwyXFxJIqxQxqWaRieAAOSScAAda/b7/AIJK/wDBD/wd8AfhO3xm/aCtdH1fULvSxrMGjazaldP8JW6h5WluRIdkkwjCMd6BYsOOSN1eJxVxNg8jwnt8ReUpaRitZN/PZbXfS/dnRG8pci337JLq35I+UPgb/wAE4P2hv+ChnwW+F2j+JvBen+BfBPgMXmnx/EDxDm31SSxd3nWGS3mkWWe3ieQrCQqooLANwRVC1/Y5+Avgjxg3hb4Waf8AEL9sTx5DIbeefQi+keFdImDbUW4ljikLqSGYyLcpEVXG9eTX2drnj/xn/wAFwvFOraraeKvEXwf/AGOfCe6PUL6WQWN54zuISpkYvkCO2UseTIygxAspcgR8d4b8V6p+1H8MfEnh79mUaF+y7+y74Slm07xX8RroJBe+JhCoRpo5Mb3XYEPmtcLIwl+dwSUP5TT4ixsnOFaSpRu5OnG6pw5+k5r35Tb2hBrXeyZ5dfls4QbSfqr2bvZbxi7eq1tZqSWn4F+If7MvwA/ZVufDP7Svw7+AGi/Ei+nuLCPwt4M0+DWdZiiI2wRtcW4nkiu9p/1jSj5iDuBNekaL/wAEhfiJ+yfp8Pib9k346eNPDOnzBNYj8DeJHkl0zVZnUK/nDdFsJTYMyQmQGMAuONvyV4a8V+CfDdlrUn7N/gPwX4f0LwXKV1X46/FfN1DdXcTlRc6WbhZ4xMzq8iLGNxGzManAqX9jr/goT8VvAHiPxP4r8O6x8TPjdrN+Bp9/408dTnw/4H0ezSWJyYkZ5IhISGVWLQsPOx5eWO7z8TgcbadTCVWlJ3lGrZxd7WTi7qC3tebm9pK9kZRzClGDVZP3VbR6q2t9+Vv1fRWW7f3B4N/4Lf8AxY/Zo8W2+jftZ/ATUvh7pdw6SN4z8MpPqWg2sDHZvkMfnDh+SFlLhWX93nG77h/Zs/bY+Ev7YOhDUPhn8QvC/jGHYJHhsL1TdW6k4Blt2xLHyD99F6V5t8Fv2oPhD+3b8L/En9h6p4e8beEbXUH8PaotwkVxYXcoVCYwr5SRG8xMZBDZGM8V4L8fv+CF3wq8WavL4u+Ed9rPwF8fbxNbaz4SuZ7a2Eij5Q1pHKkQUMA2IvLJOeTmvzqp/ZuIn7PF03hqnVxu4X7uMrzj8m12R9TTqYmC9ph5qpB7JvVLZ2el1u7u71stEfopRX5a2n7Rn7b3/BMnStnxC8P2f7VXgeOUY1bQkkt/EVsjYADQxW58wKwPVXJ38yADA+kv2J/+C2fwJ/bZni0qx16bwH4zmvRp8Xhbxg0GmardTELgQJ5jCXLEqFU78qcoOM8uK4bxdOk8RQtVpLeUHzJf4lvH5pLs2dWHzSlUl7Ofuy7P9NtO10m+x9cUUiOsi7lIZfUGlrwD0gooooAKKKKACiiigAooooAKKKKAPmT/AILK/COH40f8EwPjVpcvmeZp/hm41y3aPG9JrDF6hGQepgwR3BI4JyPwn/4KIQ/2d/wSN/YSts5juNJ8U6g5PXdLqFvIfx/eGv6a9V0u113S7ixvbeG7s7yJoJ4JkDxzRsCrIyngqQSCDwQa/Dn/AIOOP2E9Q+DX7OnwE8O+BdF1bX/CfgE+Jg/2SFZZtKtLm5t7lC8SHf5MS5jMwXYu1N2wuoP6v4ZZ3CnjMPl1aVo+1c1d6XdKcH6NvlXnc8PMqMo1fb6cnLZ+vNG34XPxyuZUuxwzbV6A9/c1Pb69qFi6tBqWp27QjCGK8lj2j22sMVUYvswy/dPH0pWPHFf1DWo060bVoqXk0n+D7bHmyipKzR91f8ETvjB4w8XfH/x/4D/4SfXJf+E6+GevaNp8cuoSNtu/JSWB0LMdrgxMA3YO3rx8Q6r4u1bXW+0XOsateNIoAM97K+714Leld5+xz8VYfgb+1V8OfGN1cNa2PhnxNp2o3sm9lAto7hGl3bRnbsDZAByM8V0//BST9nWH9k/9tX4jeB7ONo9J0zUxPpWB8v2S4jjuIVB77UlCE+qGvk8PgcLQzupD2cUqkIyjZL4oNxf4OK+RzU6cI1eS2+q00WuttOr1Z4dhQ7MGYFuWySSfzoRVWTcqhW/vCnIMigdHIzuwea+wjBKx1hNIqN++3yccZ9a+jv8Agll8RtP8N/tcab4X8QapJpvgf4qaZfeBPEjR4Di11CCSGM7iCF2XBgfd1GzuMg/OCSLDaNcTfMFOMGv0n/4Jjf8ABvn4q/aw02z8ZfGBtY+HXgMlJrXThEkWra5GULq679wt48lcmRCzDcAq8NXyvGGZ4DC5ZVWY1FH2kXa2sr9LdW09fkZ1Fzfu18Tvb/hvLS727s+A/F3wq1DRvitrnhXR7W68RXWl6rcaVbNp0ZuvtCxTNEHGzO5SVHzDjmvpLwt/wQi/aq8VaTFqMPwpvIbG4j8yI3OsadbS4/2kknDLnsCAa/UbUP29vgb+wky/Cv8AZN+F8HxZ+IUbRafd2HhOxZY3aIeWst7qMcDLMVdtpbcwUs+WTmtz4eaT+2b8bfFOg+OfjF4z8C/s4+D9J1OKW58N2jrdz3SBtiRTTC5MWJmYAZkPO35M4FfnGL8RM3UI1KVOFCNnZ1m3KVtmqcWmr6aO+mzZlzuK5U+dqyfLZWfe70t58tlrdn5y/wDBKn9gfV/g/wD8FhPBfgr4yWEPhfW/Dcb+JLDS7mbzG1aWKCWW2aGSLdG4R4vMPzYPksvUFa/Vr/gqb+yJ8Vv29Nc+Hfw10WbT9F+Dd7fm/wDHOpi+8q/uIYnjAtIl2tzIryspCkF0XcUCgP1P/BT3/gn5bftzfCm2vNDvLjw/8UfAbPqvgvxFasI7iwuxtk8neCGWOUxquVI2NtfDbdp5b/glR/wUQuv2ltJ1H4V/Ey1bwz8d/hcp0/xFpVy2H1NYn8r7bGckSBsRmQozLulDA7XWvgM24kxea+z4hpWdShHlnBq/I3e1WKfS8tN+WSV21Y9H6soTeFrN2m009FdK2j7K93fu/OKfzj8dYNN/4KDfHib9mnwM1v4P/ZP+DdnHP481CyRrJ7y6iBuEsopHBzGJGhckqpLRzMWbEe7xL45/tS+Ff2q/B+m+K/EEb+G/2RPhRfDQvBfgWwMkWqfE2+t41WGMLzIIEJg3l2XEbcHzS239Rv27P2CtA/bU+BmreA5da1bwLYeJNXt9V1+50GGKK41zylVNk5KnzMrHCNzZI8iIchQtflp8ZV8UfCr4wW/jXxn4HXw78TfDMp8C/s+/Cxp0mt7SONhEmq3BVnjPledG6TBo1eWHO4KqsvocM4/D4qKdG6qQ0Ub+9zO3NU5nvOWvNO1qcE7atHj5rRq0YqM7W0tZWVt7RTbslbd7WTadkcx8RvDuoeMfEfgG3+Knhn/hYXxU1O2U/C74H6AXs9D8B2jMrQHVXVkYIYxbOVaXfgP5rDPy+eeJfBOtftneMr20kuJvjX8YtCDTamy3a6P8PPB2jQhE8lTH9n8yeKR+TGVjIf8A5asrM/Y/DXwjJ42b4gaQ3jK68OabCran8efjFPdtLc6hK2TL4e04g/PHuMseEaUTPEjY2BI5Mv4qT2PxG+FWgR6l4V1/wT8Nri6hHw6+CXhy6lj8RePXU7DrV8yxPIY38ucee1uWcRhEIGJT9hhZOi1yO0otWaXw6X0V1bmvflunZKdWa2fj05PlUk+663to1bqku11zbtpXPOtM0TQtZs1n0WTUPjV4m+H5WeTUIpD4X8AaJHGwcFmxbzXDb0JBPkFgiAA9K+6v2Cv+C53xK8b6svge/wDDTfGPxnq2u2kFj/wimnPaabomnu5S4WS5mKB2iynllgVIDF5jwxxR+xD4K+Cngzw38X/20vE2i+E9J02MzeFfg3oECW+kQLjLW32NDI93KGliL+UAV2gyyOudvpnwmtf2lP8AgofokfhP4K+C7P8AZC/Z6gVptK8SDTmt9T1q0MmwfZ7aNoWh3qzyjCqDwfNORu8TOMZgcdRkqsFKEX/Ek7QjLqouKTm+6pqKdkm3ozqwODrYacfYvkb+zFdNd1ZRtrdJJNP3mpK7f3R+0t+3J8JP2NLC3k+JHjXSPC32gebDBIk1xczrkgMsMSvIVyCM7cZHWvzg/bA/bF/Z5/4Ky6nL4X8C/s+/ET4ufEK4jew0nWI7QaJAnO4FrwTBlXgsPNQhQTkDJr7Q/ZZ/4IC/AP8AZ71bUNa8UaXefGrxNqjK0uqfEFYdZMRAH+rjkTYORncwZh0DV9q6TpNroGl21jY2tvZWVnEsFvbwRiOKCNQFVEVQAqgAAADAAr86wuYZXlc1UwKqVKsdFPm9nH/wGK52ums1dbo+ung8VioOOJair3sldr533WtpK1tND8Sf2P8A9lD/AIKU/sg21honw60m18O+BbS8E0HhrxN4j0fWbOCNpN7xGYfv1Q5O7yijcnHODX7Efs93nxEv/hbYyfFOw8H6b4yZn+1weGLu4utOVc/JtedEfdt+8CCAejEc121FcOdcQVMzkp1aVOMu8I8rfq7u/q9TuwuAhh37kpW2s3df8P5u7CiiivBO4KKKKACiiigAooooAKKKKACvzJ/4OYPg38QpPgb4F+MXw51DWre++FN5drqtvpzOp+wXaRNJPKFO2SGN7aNXjkVkZZjuGAQf02rO8W+E9P8AHXhfUdF1a1S+0vVrd7S8t3JCXETqVdDgg7WUkEdwTXq5Hmjy7HU8YoqXK9U0mmno1Z3WzOTHYb29CVL7r7XTur+R/JH/AMJJ8L/j9a6fZ+ILOH4V+NGi8ibXNN0/f4d1KQu5Es1nCAbIhSqloFkQlAfLTLNXLfGn9lLxp8DZXkvbe31jQWnMFt4g0V/t+j6kw5xDcoNhJUBtpIcAglR0r3r/AILH/wDBMXUP+CaH7Ss2laWLq++G2uRrd+GdRuJVknRWB8y2mIA/eRujgHGCmw5ySB84/BT9oLxn+zx4vtfEngnX7vQdStmEgaELJDc4zxLE4Mci8kFXUgg9K/r/ACqt9YwsMXlNTmpyV4wlfTy578yttqpW2StofIRoTpytQlonZxetn5O7asumq2tZanFgKWaPy9xIwxH3B6jPr7V9fftvJe/tS/sd/CP9oS4vFm1SKL/hW/ieIJvne+szPPbXUjZ5MtoYwScHKdxg15ZL+074R+I19dT/ABC+Gfh+a+1NzLd674T8zRtTkkYks5i3vZFjnPFuoyB6nP1n+wDqX7OXxS0vxd+z3beO/ijoei/G+zSC3stf0yzkFrrcM0M9tcx3MJKLxBsKvGobIGeRjhz7HVaEaWNqUZKVGV5Ws04vSSUo6vR8yUlG7SMamInzx54OLjrfRq1tVe/pe9rb3sj83yST8ykDr0qZFR4/lj3EDvxXut3+wwdM8e+IvDFz8ZvhDb654X1KfSb2yv59S0947mKRo3TdPZomFZSCd+Bjmsvxn+w/4g8HeFdW1xvFXwv1ax0aFppjpvjCyuJH2qWxGiuGdyAcKBuPpX0FHPMHUipQlpLa99fwZ1yxVKKvJ26a3X5pH6Wf8EPv+CI1jqvh6y+M3xo0WxurO6jnOieENd0ttsADhVv7lJsK2dsmyN42Xa6SZztA9T+PH7S3ir/gqz4y8WeD/h146/4VD+zN8NrmfSviF49uZIYYfEO2QZgsrhThYgsX3hMm+O8Uuu0qj/Q3wu1Dw1/wUC/4JAaHJ481q+0Hwz4k8KrHrGpWV39jltvssvlyS+YQwHz27EhgwOcEHJFfnvD4i+H/AO0h8K/+Eq8XLqXw5/YW+C866T4d8LWSOmqfETUI5N6llJaVxJmLc7uhG/AdT5ki/wA7LF4nNM0xONzG/tqU/ZpcvNGnZtJQjtOo3dJNK1ueT0SHWrtUqcIrSpFN62butmrXSXRXu3e2t2vTPgX8cdS1SC9+Ff7BPwdtPD+m6Y40rV/jDr9oi2tw0TMjXJfy5DcZbdIrMzHaTiFRgDy348z/AAZ+Fnj61vP2lf2l/iF+034muUF3J4a8B3BbS7aRSQi5hu1jjK7SxCeUclTgfxQ/tL/tB3fxE+EPhz/hcOseIPgb+zTqlqE+HHw58HWsMnibxFZxxqkDTktIkcbQvyZ5FBaQEI336z73UPiH+x78P7q98P2vwt/Y1+H2tyIgt9XtbnW/HGtRHG6UjbeS4LLwAIgAvQLg17OHwM6bc4WU56NpqU3fdOtyzm5d40YWi7py0aPIq14ySpSWl00ul1bbvrva/Mm20pKx+2H7NnxhPx9+A3hzxtL4d1jwm/iTTor1tI1aJobuxLoD5cgIBJGeuOetfGf/AAV6/wCCeHijxDqNn+0N8BbpfC3xl8Bo+pak2niVZ/FdnDErLbukeRcSL5KKIpEKyoxRiQFFc7/wQr/aa+GV1oHj3wz4I1j4t+KNAn1j+2b7xh44gt4YbvU5xHDJbwlWLLnZE4R8tmQ9MgH9IILlZV3R7mXAA4GSO5r8xrSxGQ5rKVJXitLNe7KL3jJPo10fk7XPr8LKGPwqhW0nHfupd7aaP5dUfN3/AATO/wCCj3hn/gpN8Bv+Eo0uzOgeINIuTZa3oUtwsstjLgFXRsKzwurAq5UZIZcZU1H/AMFIv2J7j9qv4Uz3fhBfD/h/4raXBJZaD4rvIXNzottcMiXvkOnzCR7bzFU/wswKlW+YfEn/AAVH/Zi8Yf8ABKj9pc/tdfAq30u18Oy7LLxjoEhZog1wxjaby+B9nkYQAhWLJMVcLs3bf0e/ZJ/au8I/tu/AvS/HvgfUft2l6kojmjkQxzWNyqqz28i9nQsAcZB4IJBBPVmWDjgpUs9yd/uJPRPV05aXpz7prRP7SvcmnJV4PB4xe96rX8N1urpXWu90vxG+IOo+Efh7pX/CPaxpOqXfwT+B2pHQtF0A2UltcfF/xod3nXFypLExefHKZA7S+TDJCgTM20fV/wAO9ET/AIJ+xaX8YPjRptv8Yv2x/iNKLXw34ZtZzFdaBZTK0cdvBbqG8iJY45A88VuMPK0K8M7v7n/wU78E/Bz9mL4l6X+1F8WtY17XdQ8D2z6f4M8LyKv2E62Qs8LQLEiv5rm2+Z5XKDqcBUUdL/wSP/4J8eKNG8Taj+0l+0FatfftCeNg8UKSlEi8MaZsSKOCOCMeXHM8afOwLEIQuVZpt/1GNz7D4jLliakeWna0o3s6knq4J2T5W7yqzW/uwWljx8HltSninT662e6Svvu9Xo7efS0Rn7Hf/BIjXPE/xTtfjJ+1V4gtviz8S7V4rrw9pUm/+x/BvVyscAYQySBmUZ8varRBgXbDj77ggS1gSONFjjjUKiKMKoHAAHYCnUV+a5jmmIxtT2ld7aJJWjFdoxWiX5vV3ep9dh8LToR5YL59X6sKKKK886AooooAKKKKACiiigAooooAKKKKACiiigAooooA8q/bL/Y38Dft2fAjVfh94+09rrR9S2vHcQ7Vu9PnU5SeB2Vgki8jOCCCQQQSK/l6/wCCjn/BNn4if8E3fjEfDfjC0lm0G/mnOgeIEjWOz121jlKCRcMwjl27GeAsXj8xc5VlZv62q89/aV/ZW+H/AO198NLzwn8RPCukeKNHuo2RUvIcy2rNj54ZVxJE+VU7o2U8DmvveCeOcRkVV05rnoS+KPVPvHVa91s152Z5uMwPtP3lK3Np6P187bfd6fxxGNXl2BsRlQyt60+CddOvI2LSK0LB45UYhkI5BBHQg85r9G/+Cln/AAblfFL9koap4n8AyD4jfD9LqWSGOwtZTrGl25VpAs0CqwaONVZPNV+dqllQtgfnEVWeLPnIFxw6gSA/Qd6/qbJs9wWa4dYjAyUl+Kf8rT2t5u3meJZ35ZJp9V2/r7ux9oftcaVD+37+zhp/7QvhHTbeDxR4HtYNB+KtpbLH5nnLsFtrkigKzLdlpUY/PsMABb5WNfGUcSuys8PmZOdyr09K9f8A2Kf2qrr9lr4r29/dw3GteCNaQ6T4x8NeZ5dt4i0yRHilikTIWSRVldoy33ZApyOa6P8Abu/ZJtfgZqeifEDwbd/2h8Gviir6n4PvYyWfT4iQz6ZdYZ1F1bMXhK72LCIsSrbkTgy+rHL6yy6r/Dd3Sk7tW3dNptrmjry94W6pnNTtSfsunT/Lp8j9kP8Ag2v8V/8AC0f+CX7aDqkdrfW/hzxJqWjyW86CaN4n8u6AdG4KkXJGOnH1r5L/AG2J/G3h39sfTZ/E3hrQY/iB4Pv5fD/wO+FWmNbXGi2FgjuF16+UM0UaJGySIH8g7rPLBUgNa3/BqT8a7qH4l/FD4dTTTGxuNNj8RQQmXKRyxyxQSsB33LLCCf8AYA9K93/4OAfgrb+DfDcnxG0Xw/4X8OW/iCx/4R/xl4yEwbXDY5bbY2Vu6hGkuFkkhaRXVmWQI5EYJH4jiqawfGGIwlSOlZ3i29nLXv1d1Kycnsu5WYU5TwXtI3vBtP0bvpZXtqtE9rpO7Pinw/4ytfhr428Vat4T8WaT4j8eaxGIfiJ8dfFLLJp3heRkfzrLw+rlJJrhF4iaJ5JJVtQYIwhUrR+Hvw+uro6n4p8F+HYNQ0fUrh4Zfjv8cZYNl3CqAN9gtbkqfMEiMikNcyYVxheQlHwz4V/4QvTfB0PiPwDb/ELW9Us2f4cfB61lYr4OQsrprGvIiqWkdDFJtmDrcRSku8UaIi72l6Z4g/aK+Klz4bv9G1D9rb4i2McUMVvo7/Z/hv4JmfLI6G1KLIBGuGUxQRl5JATIy5b6upywU5weiV23bVLz92KirW95xpraMamrfzrpuorJO8l03S0t5O2ybfKmlZPVmLp/h7w34q8W6dr3hdfj1+2Anh+cTT6zrN1N4f8ACGgXI+aNXNwkjCMMA+DPCAqrnuR+0n/BP79tPR/2pvhnZ6dqOqeEl+KPh/ToJvFOi+HtTTUbXSnkZ1hAljd423LHkqsjlCdrHoT8r/BP/gh146+JttZr+0V8XJdX8Ns6tc/DjwfGdJ8MSQp80UTLB5CkI2OFiUjb985zX0lpPgj9lv8A4JCeBrzUrO28B/CyHUISjyzXYGpaqiZfy1aV2nn55CAkA4wBxX5vxNmOAzCmsJh261WL91xTsr6tK6irdfdprXrY+myvCVcJ+9mlCFtU9++m33WVnfdWPpLX/D1j4n0K40/VLO31GwvEKTwXEAlhmVhgqysCCPYivxX8beG/Fv8Awbp/t16br3hk614o/Z3+KF0X1G2MbCPTh5jL5O5S3+kW8ciujsqmdNyDkMy/S0n/AAXK8d/tNQtY/s3/ALOPxL8dQ3kxtbXxXqVs0GiQSKMuXMSyKQOBhpU+8M4PBo/ED/gkH+15/wAFA9AuNH/aE+O3gzwv4WJjkt9I8J6Qt8SwcPh90VttKkLgmSXofU5nh3BzyqU6Od1IQw9Rcs4Sbc2t7xjBScZJ/C5cq7vquzGVo4mSWFg3JW961krPa7s77taW87NkP7LWlr/wW7/4KNXXxW1rT76T4AfAOZE8BmS0kht/EuqO0TyTyiZRu8trfcyBQVDQBjyd36yV43+wJ+xtpX7Av7LHhv4XaPqk+uWvh8zyNqE9slvNeSTTPNI7qnGd0hAyTgADOAK9kr5TPswpYnEezwt1Qp+7TT/l7vzk9X5s9TLcK6VPmqfHLV3tf52069NLt2srIKKKK8M9AKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK+QP25/+CHPwA/b28QXHiLxL4dvdB8ZXESxNr2g3jWs8iqSR5kR3QSE5OXaMuRgbuBX1/RXZgcwxODqqthZuEu6dv8Ah/mY1qEKqtNf5/J7r5H89/7Tv/Bqd8avBOqSyfDHXvC/jzRo4tyQ315/ZmpE7iBGAy+S5C4JZpIwcnivM/gv+zF8cP2I7jXvhj8cfgj4s1v4J+NJI4vEFtaRRXb6ZOh/danYXELsouIVZj8rFXGVIbgD+lyiv0GPipmtWg8NmEY1Yu2tuWatqrNaJpq9+W9zx8TkrnDlo1LPo5Lmt9zi7+bb876n89//AATa/Zi8W/8ABNr/AILQfDrw/qt1HqPhn4naTftomrwRtGmtabJaSSxs0TAPFKk0CB43UEFMjKlSfv3/AILY/s2L8RPhx4a+JOieEvEnjT4ifDi6LeFLK0vIo9NsbyeSMLeXsUrqHigdI5CVz/qxv/d7yMr/AIOSI5PhL8Jvgt8adJaS38Q/Df4g2kKXCsU8uzuophOCy4YBmiiHBwRkEHivpz9s/wDZwh/bO/Zu8SfDmfxJrnhOy8VW6wXN9o5Vbjyt6s8JLAgxyKDG6/xI7DvWWccQVcVi8Dnld8rknCb1d+SVne27cZK6SV+xy/U5ulXwl+Z6Wfdteq6WTV7a30ufjV+wV+xx4s/b88Y6zoXh3UptL8Jahco3xl+IsV1s1DxldyyySz6bpwMRSO2Xe6kLGiOI1ZyR5cbfsB4d0X4N/wDBLH9lSW2tYtN+Hnw18JkzzPLJLcbGllALs7F5ZpGdwBks3QDgDHk/xv8A2n/hr/wR+/Z28C/DTwrpV74s8TW1omj+FPBWkL5ur63KqEmWVI0Zl3yfO8pTLO7EBjkVwX7NH/BJnx5+2/8AGHTvjt+2VHA2sW0p/sf4VweXcaFo0KIqRmY+bMJBIQ0rwg8uQXYjMK55ti/7TvicZJ0cKr8i3nUtpovPo/hgrJX6zluGjhl7Kj71Xq+kdOu6bW2j2VlZWRz037d37RH/AAVT1y60n9krQLPwb8ObSZ9N1b4jeL4I43LFj+8sYd0hZfLXIDRM+ZF3iLrXtP7Ov/Bv18GPh/4usfHXxM/tr4yfFLzlv7/XfEN65t5rsMG3Lax7IjGCAAkokGBjpxX3FoGgWPhTRLXTdMs7XT9NsIlgtbW2hWGG2iUYWNEUBVVQAAAMACrlfP4jiKpCDw+WR9hT8n78v8c9G35JKPl1frUsrg5e0xHvy212S7Jdu/RvWyvYisbGHTLSO3toYre3hUJHHGgVEUcAADgAVLRRXzZ6aSSsgooooGFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAfHP/BfT4S/8Lh/4JSfFKzit1nvtLhs9WtcoW8t4LyF3YY5/wBV5oz2BPavDfEX/BVgfB3/AIJ3/A/UtJtbnxx8ZPiz4X0+28O+HrIiW6vdTaCGKWeYDLeWszEnCksRt+XJZf0d+JPgDT/ir8Ptb8M6tG02l6/YzWF0gOCY5EKNg+uDxX56f8ENf+CNmpfsdaP/AMLC+MtjFdfFq3ZtO0KJdT+2W/hvSxGVWOML8gldpZ9xBcBSgXaS+fssrxeXvKJU8fq6VTnjDrPnja1+kU4Jya6Pu0eFjMPipYvmotKLilezune8nfzVkvw8vSv+CZX/AATD1D4P+Kbr45/G7Um8c/tB+MofPu7y8Akh8KxyKP8AQ7VfuKypiMyIq4VfLTCbi/25RRXzeZZlXx1d4iu9dklokloopbJJaJHq4fDwoQ5If8O+7CiiiuE6AooooAKKKKACiiigAooooAKKKKACiiigAooooA8z/aN/bI+F37ItvpMvxM8b6F4Lj15pl09tSmMYuzEEMgXg/d8xM/7wrn/gN/wUd+Bn7UHxA/4RX4ffE7wt4s8RfZZLwWFhcF5TDGVDvjAGAXX86/N7/g7+t0b4Q/Ayby4zNHr2pKrMOQptoiQPqVX8q+Yv+DUGyjv/APgpj4jlmjUva/D3UpYiP4WOoaYmf++XYfjX6Zl/BWDr8LVM+nOaqR5vdVuW6kkul+uup5EsZX+tOjG3Kmls72sm9b+btof0T3FxHaW8k0rLHHGpd2Y4CgckmvMP2c/21/hR+11catF8M/Hnh/xpJoKxPqC6bMZPsglLiPdwMbvLf/vk16bfosljMrLuVkYEeoxX4z/8Gh6xQx/tFQrDAs0d7obF4+6t/aQVTxxjaeP9qvk8vymlXyvF4+bfNRdOyVrPnk076X6aWOutWnGvCnG1pXv8vn/mfs7Xkv7RX7eHwe/ZJ13T9M+JXxC8O+DL7VoDc2cOpTmNriMMVLLwRjII/CvWq/FP/g7w8P2d3e/Aq6EMP9oXEmpWRmY/dQta7A3ou4sc/Wq4UyijmmZ08DiJOMZXu1urJvs+xGZYmdCl7SFt0nfXR6d11/A/SDwh/wAFdf2Z/H3ifTdF0f41eBL/AFTWLqOysreO/wDmuJpGCpGuRjczEAfWvffFPijT/BPhjUta1a7hsNK0i1lvb26lO2O2hjQvJIx7KqqSfYV/GNYX2qfDbxxDPaSNp+seHb5Z4mQASWl3by5H0ZXT9K/rQ+C/xct/2uP+CbGh+MJpYrj/AITr4frdXu1lkCTzWJFxGdvG5JTIjDjBUggEYr6zjvgOjkXsKmHqOcKjabdtHo9LJLVHJhcwqVFLms9Lxtf8dX3Wx2H7Ov7X/wAMf2ttO1K7+GvjbQvGdvo8iRXz6bP5gtXcFkD8DBYAkeuDXpFfkX/waGQqP2Wfi1L5cKyHxZBEzIc7lWzjxz/wI/nX66V8fxNldLLczq4Ki24was3vqk9bep3YDESrUVUnvdrTybXn2CvJ/wBoj9uv4P8A7Jet6dpvxJ+IXhvwbfatA1zZwalceW1xGrbSy8Hjdx+Br1iv54/+DrP4zN4z/b70HwnbzW91p3gnwlbC5gJG62vbiaeZySuWGYGtjtPYg4wcnv4J4chneZrBVZOMLSk2t0kvR9bdAx2InSp80LXv1/pH7ZfAn/gox8DP2nPHC+GfAPxR8I+KfEDwtcLp9leBrh41GWZVIBOBycdBXtVfym/8EP8A41W/wE/4KsfB3W7iOT7Lqesnw5LGrBDINSjexjY542pLPFIfaM1/VbfXken2U1xNJHDDAjSO7ttVFAySSegA7118ecJxyHHww1GTlCcVJN2vu01ol27dScDiZ1Yt1bXT6JrS3m31v1PGvjl/wUb+BH7NPjmTwx48+LHgjwx4ihjSabTLzU0F3bo67kaSMZZAykEbgMggjgiuOf8A4LN/ssR/e+OXgFfrfEf+y1/LF8Wfil4g+P8A8StW8YeMNYv/ABD4i8SXJmv7u8m865mJwEUseiooRFAwFVAAAABX6bWP/Bo58ZrmOOW6+I/wtjmwCVUX7qDjnnyhnHTOB06V9xjPDbI8so0v7YxjpzmvK11bmSXK3pdHmvMsS2+VaeUZSt62f42R+7HwX+N/hH9or4d2Pi3wP4g03xR4b1JpFttQsJfMhmMbtG4B9QykH6Vl/tC/tR/D39k/wlZ698SPF2j+DdHv7wWFvealN5UUs5R5BGDj7xWNz9FNeJ/8Ec/2LvGv7AH7HMfwy8cX/h7VL7SdbvbmzutGnlkt5raZxIpxJFGytuZ8rhsHOGIxXwV/wdv/ALTdvD4Y+GvwZhtVnvL25Pi26fhmRFW4tYVC/eGWaY56HbjnBr89yjh6hmOe/wBm4eblScn7ysnyq7vqrbeXyO+eLqQwyqSVpbbPv23213+Z+kPwt/4Km/s7/Gz4iaT4S8J/F7wXrviTXpDDp+n2t5umu3ClyqggZO1Scd8V79X8eP7E3xoi/Zs/bF+GHj6bzPsXhDxJp+qXnkEeZJaxzKZ41J4y8W9ecD5q/sF0bV7fX9Itb6zmjuLS9hSeCWNgyyo6hlYEcEEEHI4r0uPuDaWQV6ccPNzhNPV23VrrRLuhYHGTqycalr6NWuv1fl1/S/zprP8AwWI/Zf8AD2q3Nje/G7wHb3lnK0M0T33zRupIKnjsQarj/gs7+yuVz/wvT4f4/wCv/wD+tX81/wDwUv0W00X/AIKDfG2ytYo7e1g8ZakY0jHC7p2YgD6seK94tv8AggX8ST+wEv7QS+KvBv8AwjMnhRfF39lSJcrqH2Y24uNn3THv2Hg5xkcnHNfbYjwzyHDUKFbF4qcfbW5b8uraWlrd2eXHN67ipaaq+kZPS27tLT5n9EH7Pn7cXwf/AGrtSvLH4b/Ejwh4y1DT4ftNzZ6ZqMc1zBFuC+Y0Wd4TcQNxGMsPUZzPj3/wUR+CH7LnjhfDPxC+JnhXwjr0lsl4tjqNz5cxhcsFfGOhKMPwNfzAf8Exvjtr37PX7fnwp8Q6LrGoaXHJ4n03TtRS1mMP2+wnu4Unt5MYDoyZyrZGVB4IBH2x/wAHZtqo/wCChHgFlRTJcfD63Rj3wuo6gRx+JrhqeF1Cnn9LK51Zezqxcouy5rppWe63Or+0qvI0rcya6aWd+l/J9Wfrkv8AwWf/AGV2/wCa6eAP/A4/4V3HwA/4KE/BP9qnx1ceGfh38SvDHi/XrOzfUJrLTrgySx26uiNIRgfKGkjH/AhX87f/AAS5/wCCJfin/gqJ8M/FHinw5448M+F4fDOqrpT2+pWks807mJZfMHlkBUw4AznJVumOf0i/4JO/8EDPir/wTg/bV0v4iah4y8A+IvD/APZ15puoxWLXdveFJVUoVR4ij4dFJBdcYBya8/iDhLhrL6delDGS9vTvaLtq7XS0j19QpY7FSkvdur9ItaX1d7taan2jf/8ABYv9l3S9VuLG4+OHgGG6tZGilje/wUdSVYHjqCDXrX7P37Tvw/8A2q/CN3r3w58W6N4x0axvG0+4vNNm82KG4VEdoif7wWRDj0YV/IR8aJV1n4m+JNUt7NbfT5NWuTHhMKCXZguQMdPzr9hf+DQr4xrBY/GP4ez3bfPLYeI7G1LDapYSwXDAdckJbdOy/n6HFnhhhcsyeWZYarKTjytp2taTSurK+7+5MnA5pUrOLm1aVuj6rTq/TY/VP9oj9u74O/sl65p2mfEn4ieGPBuoatC1xaW2o3XlyzxqdpcKATtzxk98+hrlvhr/AMFWv2c/jF430/w34X+MHgzXNe1Z2js7G0uy81wyqWIUY5O1Sce1fg1/wcjfG24+L/8AwVR8Xad9qW607wBZWOhWYyGWAGCOaYYxwftE0oJPPHsAOf8A+DeGwhvf+Cwfwljmht5fKfVpFVgMArpN4ysOOoIGPfFFHwvwv+r39r1qsuf2Tqcqtb4XJLa+2j8w/tDESqcsbWvZaN6Xte6l1Wp++Gmf8Fk/2WNWYrF8ePhwpHabVUhz9N+K9q+CXx78GftI+BY/E/gPxLpPizw/NNJbpf6dOJoGkjba6hh3B/x6V/Mh/wAFyP2HP+GHP2//ABVptnHpCeHvGxfxdoVvYQmKPT7S6up1+zFdoVTFJHIoVcqE8vGMkD9C/wDg0s/awl1rwN8Q/grqBiX/AIR+RPE2inIDywzN5V2uOu1JBbkYB5mbJHAPn594f4TD5DHO8vqyqJ8rs0rJPR9Fs9DShj67qRhUtq7PRq2nq+tkfp1+0N+3V8H/ANk7X9N0v4kfEPwz4N1LVoGurO21K6Eck8SttLheTt3cZPGQfQ16F4C8d6P8UPBOk+JPD+oW+raHrtpFf2F7Acx3UEih0kU+jKQfxr8Nf+CxHgGb/gqX/wAF6PCHwG0W5tdNj8M6Pb6Pf3lyS0SAQy6rdSAxqWGYHSFQePNUAlQSR+6PhXwtpvgbwvpui6PY22m6To9rFZWVpbxiOG1giQJHGijhVVVAAHQAV8fnmS4fAYLCVFNutWhzyWloxb93p19eh1YXEVatWalblWi0fd9b66K70W6tdH5Cf8Hf3/JGPgd/2MGpf+kqV8y/8Gm3H/BSfxV/2TjUs/8Agz0qvpv/AIO/dv8AwpT4Hlmw3/CRagAPXNqlfNH/AAacwsv/AAUp8V/3R8N9SOT3/wCJnpP+NfqmStLw6xHrL/0qP+Rw/wDMdL1X/pKP6Hbj/USf7pr8X/8Ag0N/5CP7Sn/X3oH89Vr9oLj/AI95P901+L3/AAaGhhqX7Sm5cf6XoGD686rX5xkv/JO5l60P/S5HbiP97pf9vfkj9pK/GL/g7faMzfAMfxLqF+X47brUD+tfs7X4x/8AB23Gs118AVX/AFg1C/Lf7u61x+uafh3d5/Qt/e/9IkYZ7/uj9Y/mj8//APgur+yPH+x3/wAFFvF2n2SiPR/GBHivTUWRpPLiu5Zi6ksAciZJeOcDHJr9MP8Ag2v/AGt/+Fk/8E4PiR8NLxvMl+EMNzNABEFY2mofbLkDOfnImWc57B1HTGOP/wCDtv8AZnuNV8J/C34uWNqZLfRPtHhvV5gAWRZWSWzz3xuF0PTLr0zz8T/8ECf2pNO/Z7/ao8YaDrEk4tfih4Mv/DtmiEhft4CzQFu3zbJYx33SqB1wf1rE3z7ginUes6aT804Nxfo3H8H5nkVrYZyUXZQv6Ws7J6bJNP5LXQ/Qr/g0cVV/ZT+K3l8L/wAJfGcen+hRV+tVfkj/AMGipY/sp/Fjcu3/AIq+LA9vsUVfrdX5H4h2fEWKa/mX/pKPeyn/AHZesv8A0pkd3dx2FrJPNIsUMKGSR2OFRQMkk+gFfz6/sDfAPS/+C3n/AAUa/aU8e+IFuY/DXiTQL2OwZm8m4tJJmt7ey4GRuS1iZWzkZPev1o/4LQ/tKw/su/8ABNz4n6yc/b9c0e58O6aA5VvtV5BLFGRgZyuS3GPu9RX4D/8ABPr/AILX/FT/AIJsfDHVvB/w68N/DvUNP1rU21a4n1vR7u5uzMYo4ivmQ3UI8sLEpClTgljnmvqOA8hx9fJsZisvgnVny04XfLZXvNptpPomvM4sy9nWrqlPZb79dfv0Xpc+V/Dmu6h8L/H+n6pGm3UfC+pRXgGPuSwyhlH/AH0lf1yeBPjG37QX7AulePmijhk8ZeAo9bkiQYWF7jTxKyAZP3WYjGT06mv5IfiV8Qbz4t/EnXvFN/Dp8N54i1S61O9SyiMVqks0jSukaszFI1ZzhSzEDAyep/ow/wCCE/xxX49f8EU7XTftJudV8GWWseGrks5by9jTSW65PZbeaBR2AX8K+08XsBKrgsNj5L3ozUX6SV279k0l5vXY58HJqclLeUWvVpXX6n82unf8hSEf9N0/9CFf2sR/6tfpX8VOmxkaxar18yePJA6HcK/tWj/1a/SvK8cfiwa/6+f+2Hdlfxz+X6jq/DGWXTP+Ck//AAcz6pcL5ereCPhzZPAFl/dtJFZWRgO3Gdw/tG5Z1ORuQA+x/Zf9pj4sf8KG/Zx8feOAsUjeDvDmoa2qSZ2Oba2kmAOOcEpjjnmv5VP2Gv8Agor48/4J/fEfWPGXgnT/AAfqHibXbB7G+l8Q21xeyLE8qzMFKXETDLIh5znAr5jw5yXF4rD47E4JfvfZ8kNbazerT6NRXdN62Mc5/eSjRkuaPVNb3duunw8ya80eX/Hv4cH4QfHDxl4JZv8AkT9evdEB3BmAtp2i5I74T86/qa/4I3fGJvjp/wAEwPgtr0iqssPhyLR3xn5zYM9jvOSeW+z7j7senSv5c/2kPj9q/wC1L8cNc8fa7peg6brviS4N9qEWi2j2lnJKeWcIzyNuc5LEsckknkmv26/4NK/2itW+IX7NHxH+HeoS7rH4d6tbXWmREktbw6gbmR0Gf4fNhkbjuzHHPP6B4qZbXrcO0MVWX7ym483VJNcr12fvNIxy2bVaF09U1+t2/lb5n5B/8FRTt/4KN/G/B/5nLUP/AEc1fuxo/wC+/wCDaaUH/ln8EAw/8FAr8J/+CoCM/wDwUT+ORwu9fGeofLn/AKbtX7saKPI/4NrLkP8ALu+CGwHPXGkVPiCrZflSf88fyRjgf93kv7j/ACP51fggGPxl8H7WKt/bljhh1U/aU5r9K/8Ag7WCH9vz4elVPnR+AYGyP7p1C/H+Nfmt8EHjHxj8H4Y8a5Y9v+niOv0q/wCDtPL/ALfnw/jVlj8z4fwDd3/5CN+a+0zSN+JsvSV/cq/+2W/Gxzw/iT9If+5DA/4IPf8ABYf4Z/8ABM/4X+PtG+IOi+NtQuvFWqW19ZNoFhb3MaRxwsjeYZbiIq2TnABGB17V+rH/AAT9/wCC3/w3/wCCkn7R994A8A+G/GWnnS/Dlzr9ze65b29uMRXNpAIkWKaXOftO7JIxs96/JH/giB/wRe8C/wDBUf4Y+Ode8aeLvG3hu48K6nBp9tDoMlpGsqvEZC0nnQynOeOMCv1b/wCCbX/BCnwT/wAEx/2kdY+IHhDxz4u8QJrHh2fw/Jp+tw2zGMSXNrP5qywpH0NtjaU535yMc/kviD/qx9cxal7T635/BzWVrJeXfQ9TAvEWiop8l3/L3fne1/mfzxXvgRvE/hj4v36x5j8K3NtqMxz/AKuOW/S0OR7vcRivoX/g3k+Mtr8HP+CqPgmTVNUXSdJ1i01HTrtpP9XJ/oM7xhjg/wDLRFxjua9P/wCCNXwjs/2i9S/a88CSaUmp6lr3ge8axj8tXczRXcTwhd3cTiJgOOVHfmvzg8L+MLzwV4ssdW0yZrW+sWEkEi5+UkY7YPcjrX63K+ZwzDJ5SSStFeSnTstPJ3sfN5fGcaDcPelpJJ7JqMeVel1fur+h9MftYaTaftJfED9qj42aVqEd5oVv8QIrKzcBlN1b6lqF7PbSgEdoNPAPIx5g4Pbs/wDg3XTd/wAFivhOW+9jWdw9v7HvcfrXZ2f7Mq/CD/g3AuvHTTLJcfFH4hWM6RFR+4gsvttmnPu6ytj0b3rjf+Dc4eV/wWH+E/O7dFrA+n/Enva82tWhPh7MadPanGrTXl7OlGL++Sf3nrYWny1E2rNyT/JK3k0k7H6Xf8HUf7FrfFv9lbRfjFp21L/4VyG31Nd2Dc2F3NFEpAxyY5yhABHyyyE5wMfjX/wTl/ba1n/gn5+1f4c+JWkxrdQWkRsNVtCm77XYzMnnRgZHzfKGU5+8i1/Vh+018KdN+Ov7OnjrwZrC/wDEt8UaDe6ZcEIGaNZYHTeoP8S5DD3Ar+OnxrpH/CNeLNY06ORpIrG9ntlZhywSRkGfqBmvl/CjGwzLJq+UYz3owdrP+WetvlJPz18jbMKcY4hwjpzLm9Gnq126P1bZ+0n/AAa0fs3618Vfip8Tv2mPFV42oXl/Pc+HLSaRwZLi7laC6u5iMZG1TCinOD5kgxlc1+1VfN//AASO/Zs039lP/gnh8MfCumyfaPN0tdYurgqFa4nvCbl2bHceYEHsgr6Qr8Y4vzX+0M2q1o/Anyx8ox0X+fzPWyukoYeLj9rX79vuVkfmH/wdT/s+XnxM/YS0PxzarHJH8MtcjurpTu3CG8aO0LADjh3jzu6Akg9j+Qf/AASV/wCChy/8ExP2p7v4jz+HpvGGn6noN34fudOtrxLaVElntpxIrsrDIe2TggZBPNf1O/En4caH8YPh/rXhXxNptvrHh/xDZy6fqFlPny7mCRSroSCCMgnkEEHBBBANfDGof8Gyf7Jt3LMYfC/imximdnWGHxHclIQSSFXeWOBnjJJ4GSa+y4R40yrDZNVyTOacpU5NtcvnbzT0d3e5z4rA1XVdSi7N2fmmlbS+nReutz511H/g7x8J3FhItn8E/EzXEiMsfmeILZVDY4ziInH4Vpf8GjHgC8h+BHxm8bzQCK38ReIrPSYm3E73s4JJX46YH25RkdTkdq9sm/4NgP2UpmTOi+NFVf4R4ilG7jHJxnn2Nfb/AMB/gN4S/Zl+E2i+B/A+i2+geF/D9utrZWcLM+xVGMs7ku7nqXclmPJJNcWe59w9Tyypl+QUpxdZxc3J30g7xtdvW99icPg8R7aNSvNy5b2vbqmvspfj2R19fjH/AMHbtwsdx8AVVo1m+36iTk4bG60x+A+bmv2cr5p/bw/4JPfCP/go5r+g6l8TLfxFdXHhu2ktbBdP1R7SOJZG3OdoBBYkLk/7C+lfM8I5pQy7NaWNxN+WPNeyu9Ytd13OrMsNOvQ9lDuvw1IP+Cx/wMt/2i/+CYXxh0NolnntPDsuu2WELt59hi9jCY53MYNnHUORyDiv5VPA3jG88AeNtJ1zTzJDqmi3sV9bMGKtHJGwYc9uRX9ocVlHFYrb7d0KoI8Md2VxjnPWvgzxr/wbYfss+OfG2ta9ceHvFFtd65eS3ssdrr00cMLyyGRhGvO1ck4HOBwK+z8O+O8HktCrg8wUnTk1JWSetrO6bXRIwx2AlWldJWas/wCv6ei+Xhv/AAaOXLXX7KnxYZk8vHi+IbT1H+hQ/wD1q/WqvDf2Ff8Agnj8N/8AgnV4G1zw98NbXWLbT/EWojVLz+0L9ryRphEkQ2lsbVCoOB3Jr3Kvh+Ks1p5lmtbHUr8s2mr77Ja/cdeAoypUFTnvr+LbPxz/AODsP40ah4k0v4L/AAT8NzG61bxJrEms3dlEd0hYKLSz3AAthmuLjA6EoOpAx+g3we/4JYfAP4V/Cfw74Zl+EHwx1uTQ7CK0kv8AUPC9ldXN7IqAPNJJJGzsztliST1rk/2iv+CLfwQ/ai/afX4v+KrTxU3jZbmyulubLXJraJGtFjWEKi/dAESk7cEnJzk5r6yr0cw4ijHK8Jl+XznH2fNKf2bzk09LPW2yfa2hjQwsvbzq1le+3p6eiXzv3Z/PP/wdE/sa+Df2Yfjp8Ndc+H/hbw/4P0fxdot1bXOnaNYJZWrXNtOpaby4wEDMl0inAHEYruP+DTb4rpL8QPjP8Kr24ZrPxRoNvq1tB5+xI5IHeC4CAEHe63cRJXBxD7cfqv8At0f8EuPhL/wUV1Pw1dfE7T9c1CTwnHPHp62Wqy2aKJihcsqHDH92uCelcJ+zD/wQv+Af7Hvx00n4ieA9P8V6T4j0kSqjPrs00M6SLtZJEb7y9DjI5AzkcV9d/rzl2I4V/sbG88qyi0nZNXUnKOt77WTOaWBqxq81JK17/JvXpppf8j+XO/0vUPBniG40+6tpob3TrlhPHNGytDLG5UqykZGGXocda/cfTv8Ag728Gmyj+1fBLxXFPtUOsevWzqGxyASikjPQ4GR2FfY/7VH/AAQq/Z1/bB+L+r+O/FvhnWI/E2vbDqF1pusT2q3TJGsauYwSgbaigkAZIyckknzX/iGD/ZR/d/8AEj8ZfKct/wAVHN8/14/livYzbjjhXO6NH+16NRzgnpHRJu3Mk1JXTa3auZLA4uP8OXK+tuXW23xJnyT/AMFWf+C2+n/tm/8ABJOGbwzpGueB9S8ceMDoNxp0t4lxJd2FrG01wd6AZQs1qrLgf6wjJGc/bH/BK3/glH8NPhr+wF8PNN+JXwj+HuueOrqxkvtavNX8N211evJPPJKiO80Zf93E8ceDjGzoKr6//wAG4n7M3iPwVofh+60vxk2l+HPtRsIl8QyqYjcSJJKScZJJRRk9h7Aj7g8HeF7fwR4V0/R7OS7ltdNgS2ha6naeYoowNzsSzHA6k5r4bOuIsFDLoZfkjnTj7SU3fR9oq6k27K97mmAweJ9q6mMs373W+l/d0tvyrW1km2tdz8U/+Do79hvwT8GPhf8ACvxl8OfAfhDwXBbahfabq/8AYOjwact15qQNbmQQoqttMcoBbkeYa+ff+DX79oiH4Nf8FG7rQdT1I2Oj/ELQJtFSF5/LgudRSeGS3JU8NJ8s8aDr+/YDqQf3Y/bZ/YI+Hv8AwUB8CaX4b+I1vrF1pOj3v2+GKw1B7TdJtx85X7w74Pf8a+f/AIW/8G637Mvwd+J+h+MND0PxZb634b1W21qwkbxDcMsNxBKsqHGem5Rkd6+iyvjrL3wxPJcyc5Tlz2aSaV9Y6uSbtL8B1cFX9tKdKy1TXyS0t5tP7+5+A/8AwVC8mX/go78bXhZcSeMdSDOGyuVmYH8QQR7HNfblx/wcGfD8f8Enz8AYfhz4tfxLF8Ph4L/tE3tt9gM32IWrXWd5k25y+3ZnoMjrX6JePf8Ag2+/Zj+JfjfVvEOsaR4yutU1u9l1C9kbxJcHz5pXZ5GOecszEnn+uceX/g2F/ZRkhZV0HxjGWP3l8Rz7h+eR+nevbxnHXC2OwuGoY6FSTo8rVkl7yS7S1VzCnl+IhDlj2t01Xz7n4A/sJ/D2b4tftvfBnw7a27Tf2t4x0e3lVYjKoi+2xGV2UYyqxhmPI4U5I6j78/4O1zGf29vAP8U0fgCBiA3IB1G/AyPTg81+s37F3/BGj4A/sE/Eabxh8P8Awrex+KJLJtPXUdS1Oa+khhZlZhGrt5aMxRcsqhsAgEAsCz9tP/gjb8Ef2/fi3b+NviRp/iLUNdtNNi0iF7TWJbWKO2jeWRUCLx9+aRs9SWrmr+JmX1eIaOY8slSpwlFaJtyl1tfTZdehrHLpqLdtbr7knv8Ae/60X4of8EZ/+C0mh/8ABK/wB450PWPBGr+M5PF2pW9/DJY6jFarbCOJoypDgkk5zxX6Nfsd/wDByxo/7Z37UXgf4Y6D8H9Z0268Y3rW0l9d+IInWwjWNpGk8uOEmTCqxxlRxyQMkdof+DYT9k8iP/in/GAK4yR4jny/1+vtivUv2QP+CI3wD/Yd+LFj428A6Pr1v4i061ntILi91aS7VEmxvO1vl3cYBxwK8viTP+D8w9vi40ajxE1o22o81kldKW1l9/QingsbT92nUaXa0bK+r6X/ABPzX/4NbAtx/wAFBPjI3yvHJ4aufmByGB1G2r8vP2n/AIdw/Bv9pT4jeD0TcfCfinUtEQKOn2a7khAH/fH41/UN+xN/wSI+C/8AwT8+Jmq+Lvhvpmu2Os61pz6XdPeatLdRvC80cxwjcBt8S8jtkd64L47f8G+/7Nv7RXxr17x94j0LxI2veJr9tT1H7Lrk0EE87Nudgg+7ubJO0jqcYr1Mt8S8vw2eYnHtS9nVhBJWV+aC66+b11M6OU1aVFU1rZ97dIr9O58V/wDBRv4Tf8KT/wCDYb4J6G3yStNomqSqVKtHJex3N46EHncrXBU+4PSvin/g3Y+T/gsH8J8H7q6vk4650i8/xr+hv9sj9gb4d/t1fBLSfh746tNU/wCEX0bUbfUre20y9ayIkgjkijQlRzGFkYbfp0wK8Y/Z1/4IIfs8/stfHfw38RvCOmeKrXxJ4Vne4sWm1yWSHc8ckZ3pgbhtkPBPOBnPOeHK/EDAU8jxmBxKl7Ws6rVkmv3i6u629Dq+o1YuPKl7vL17JfPofYHixtvhbUicDFpKcnt8hr+Mv4vN/wAXL8UHBb/ibXmSOn+ufGK/s28UeHrfxd4a1HSbozLa6pbSWkxikMcgSRSjbWHKtgnBHINfA83/AAbI/srXccv2jRfGdxJcSPJLI/iKbfIz5LEkAdznjH5cV5PhzxfgMi+sPGqT50rcqT2vvdruVjsHVq4mNWGyTX3tP9D7A/Y94/ZP+Gn/AGK+nf8ApNHXo1Yfw0+H+n/Cj4faL4Z0r7QdN0GzjsbXz5PMk8uNQq7m7nAHNblfm+Imp1ZSjs23+J6GFpyp0YQlukl9yCiiisToCiiigArzvxz+138J/hh4putD8TfE/wCHfh3WrHb9o0/U/EdnaXVvuRXXfFJIGXcjKwyOQwPQivRK/BT/AIOW/wDggda6w/x4/bK/4WlcRzLb6Ze/8Il/wjoZSY47HTdv2z7SDzt8zPk8Z28/eqoRu7AftL4S/bD+Efj7xFa6PoPxS+HOtatfSeTbWVh4lsrm4uHwTtSNJCzNgE4AJ4r0av54f+CLv/Bvj4Y8H/Cj4J/tr+KPjoNB0HwyieP9S0a48NolvZwWckkjq94brhAsO4v5OcZ4zzX0Zef8HpfwDtvjNNoqfDn4lT+D47z7MviJPsvmSR5wZxaFw3l5yQC+/bg7Q3yDT2LekOgH7JY5rn5vi14VtviJD4Qk8TeH4/FlxAbqLRG1GEajJEASZFt93mFMKx3BccH0q14G8eaH8T/CGneIPDWsaX4g0HWIFubHUtNukurS9ib7skcsZKOp7FSRX44/EVFH/B6Z4CxgsfAsrHK4wf7Evx/Lv+FTCF736ID9oLy8h0+0luLiWOCCBDJJJIwVI1AyWJPAAHJJrI+H3xL8OfFrwzHrXhXxBonibR5naOO/0m+ivbWRlOGUSRsykg8EA8Gsb9pHVND0T9nbx9e+JtNl1jw3Z+HNQn1awiba99aLbSNNCpyuC8YZQdwwT1HWvyt/ZU/4LDfAL/gnv/wRZ0v4zfB/9n/xd4c+Gt58RJ/Ddz4Yi1x725s7uSBpHvXubh5SY28mKPDMMM6KO2ZjBtXSA/Yaivj/AP4KH/8ABYfwn/wT/k+B8M3hPxB42uvj1qi6boMelyxRrGGNqBI5Yktn7XFtVA2eeRxnzL/grH/wcdfCH/glX8VtP8AahomsfELxzJCt1qmmaLeW8aaDE6B4xcu7ZWWRWR0j2ZMbByVBTdXsZ2Ttv+m4H6G1h/EH4n+GvhLoS6p4q8RaH4Z0x5lt1u9Wv4rKBpWztQPIyruODgZycV5L/wAE5f8Agof8P/8Agp9+zJY/FL4dNqUOk3F5Ppt5p+pJFHf6Vdwkb4J1jeRFYo8cq4Y5jmjbjOB+fv8Awefuyf8ABMHwUV4P/Cx7H/0g1Cko+9yyA/XaGdLmFZI2WSORQyspyrA9CD6U6vzh+P8A/wAF6fCn7H/jLwX8EfBvws+J3x2+LFr4X07UNU0DwXpxupNJgeyilXzNoeQuY5In2rGVCSKSwJAPsv8AwSm/4LGfD3/gq74V8SN4b0bxF4L8W+Dbo2ut+GtfWNLy27CVNjEvHk7CWVGVwVKj5S1yw81Hmtp/mB9K/Ev4xeEfgxpNvf8AjDxV4b8J2N1N9nhudZ1KGwhmkwTsVpWUFsAnAOcA1xZ/b1+BgCn/AIXR8J8McD/irtP5/wDIvsfyrwH/AILW/wDBHCz/AOCxvwo8G+Grj4gXXw9l8HapNqUV3Fo66otyJIhG0bRmaLHQEEN+Ffgj+zR/wbwW/wC0P/wV5+MX7LLfFybSYvhPojawviZfDImbVCH09fLNr9qUR/8AH997zW/1XT5uJjGHLd7gf1YeC/G+i/Ejwxaa34d1jS9e0W/UtbX+nXSXVrcAMVJSSMlWAYEcE8gjtWpX45+Kf+CtHwZ/4Nj/AIFfD/8AZNuG8UfG7xp4IsJb7ULvSorTToLOO/vbu9WO4DTyNDcYmRlhIbMUkchYB1B+4v8AglD/AMFefhn/AMFdvhDrXiXwFb6xoeqeF7uKx1vQdYMAvrF5IhIkyiKR91vIfNSOVthdoJRsXbSdNpc3QD6M+IfxQ8M/CDw//a3izxFoPhfSmlWAXmrX8VjbmRs7U8yRlXccHAzk4NbkE8d1AkkbrJHIoZHU7lYHkEHuDX5I/wDB58cf8EpfCeen/CzNNz/4LtUr9PP2cZ2uf2efAcjrseTw7p7MuPuk20ZxStpcDtKK+K/+CvH/AAXI+F3/AASA0zw5a+LNN1nxd4u8WxS3Om6Do80CzR28bojT3LSODDE25xG2xvMeKRR91itz/gl//wAFuvhH/wAFQvgh4w8YaCNS8FzfDmFbnxVp+vPEh0iBklkW481GKvAUglO87SPLbKjjNeyna9gPsiivxmi/4PWvgI/xSXT2+F/xTj8JNL5f9sn7EboLt++bTzsY38Y87O35sZ+Svrj/AIKuf8F0PAP/AASf1D4QyeJPDOueMtC+LH2yeHUtDuoCtja2xsy0wVyBNuS8VlAZQdn3ucivYzuo21A+4aK/LrxT/wAHQ3gjwz/wT4sf2hJfg58SLfRdQ8dDwRBpt88FrLclrOe7W8ilOUki2Q7CByHJGSFyc74Af8HcX7Pnx+/bF0r4Y2/h/wAX+HvDuvXg07T/ABjrL2ttYmcr8hmi8wtDE75RXLE5ZCyqC21KjNuyX9fqB+q1FFFZAFFFFABRRRQAUUUUAFfEH/ByECf+CJfx7x/0CrLr/wBhOzr7fryr9tz9kPw5+3p+y14u+Efi6/1zS/DvjSCK3vbrR5oob6JY54px5bSxyICWiUHcjcE9Dgio2TTYH5Q/FeDVJP8AgyktV0lbj7UPB2lGTyfvfZx4htjcZ/2fJEm7/ZzXg4+M/wCwXP8A8G01j4XvJdCb4iQ6C/kaaEm/4SAeOTZXAS5fZ85txcNIQ7nyBAyKeSqV+537NH7FHgn9mP8AY30H4F2cN14r8B6Ho8ugvB4kWC9fVLSXzPNiuVWNIpFdZHVl8sKVOCDzn4C1X/gzs/ZP1T4t3HiZdU+LFrp1xqTagPDkGtWa6TEhk3/ZVzaG4EGPkA87eF/jzzXdhsRGHuttK99G199unfvoGp7H/wAGw1tdWn/BDX4GreLIsjRa06CTr5ba5qBjP0KFSPbFfGn7RXxO8N/B/wD4PIPBfiDxb4g0Xwvodn4GZJ9R1a9jsrSEvo18qhpZGVV3MQBkjJIHU1+2XhTwnpXgLwzYaLoemafoujaVAlrZWFjbpb2tnCgCpHHGgCoigABVAAA4r4H/AOCjn/Btv8Ef+Cnf7S118U/Hni34raPr95p9tpz22g6jYQWYjgUqhCzWcr7jk5Jcj0ArljKLm3LZ3/4AHuH7Sv7YHwn+N/7Jvxi0XwX8Tvh74w1r/hA9cnGn6P4itL65Ma2MwZvLikZtoyMnGBkV+V//AAR0/Y9vv26f+DVz4vfC3R1V9a8TeI9Sn0tJLgQK15avp93AjOQQqtLboDnqGIyM5H1/+x7/AMGtvwD/AGJ/iVrHinwr4z+MN/qGteG9T8LzJqmp6dLEltf27W8rqI7GMiRVYlSSVBAyrDivqn/gmt/wTj8Ff8Et/wBm/wD4Vf4B1bxTrWgnVbjVzceILi3nu/NmWNWXdBDCmweWuBszyeTxhxqRiu+q/r5gfjP+xn+0T4U/4K8ft2/8E3fBOm/2teQfs4+An1vxaWkEDWmrafDFHDyR+8DXem2UpC5zFdAfKwfb4L8aYvH+nf8ABw9+01H4Z+LHwh+Dfie6v9QjTVPibZRXGm3lk5gdYIjPaXUSSNCI2UsqEorKrfNtP7of8E1P+CJPwf8A+CWPxL+IHiv4e3nivVtV+IbRC4bX5bO4GkxRyTSeTaNDbRPHG5mG5WZtwhi7rk87/wAFNv8Ag3w+AP8AwVQ+JOmeMvGi+KPCXi2yhaC81bwlNZ2VzrabY0jF4ZraYTGJYwqNgMqnbkqFC9ksZTctL29d2r6/O/8AW4arU+Rf+DO74baP8P8A4ZfHRtB+Knhf4iWN9renmS10TTNSs4tMkVLlfNb7ba2+fPXaVEYO1YxuCk7R0v8Awehf8ovvBf8A2Uax/wDSDUK/Qn/gnn/wT5+Hv/BMr9mux+F3w1g1H+xLW8n1G5vdSkjl1DVLqZhunuJI441dwixxghBiOGNf4c1g/wDBTr/gmN4D/wCCrPwI0v4f/ELWPF2i6Lo+tRa9FN4dube3uXmjhmiCs08Ey7Ns7kgKDkDnGQeSpUUqrlJ6d/6/AOh+cn7YX/BKz9oDRP2zNB/aL/Y8+L3hvQfi5438A2C+IvC2sX1ol3cWdrZadaq1rFNDJHLbOba1EgnwEm2ESEOAn0L/AMEP/wDgr18Sf2w/jN8UPgN8f/Bek+Evjp8K2a61H+w4VXT7i1Q29u3msLiZTdCaTJaJvKZGXaF2893+2B/wb6fBb9rz4xeGfiL/AMJF8UPhn8QvDdjDp/8AwkvgXWoNK1LUkhgjghe4la3kJkSKJUDpsO3g5AUD0/8A4Jnf8EmfhL/wSq+HOraH8OrfVdU1LXr173VPEevtb3Wt3+4IFhkuIoYv3KbAVjChQzO3LMxNSqxdOz39PXz9APpqvxj/AOCav/K3B+2F6/8ACFyf+jtAr9nK+Y/gf/wSk+HvwC/4KMfEn9pvR9a8ZXXjr4o6W2k6rp95dWz6RbxFrNt0EawLKrZsouXlcfM/HIxzqVk0B+P/AOwj8QvhN8Jv+Dlf9p6//aavNN0fxd/ampjwdf8Aihgthbo0mUDM37tWbTTEIjJ8vl7lBDsgOt/wQBTwZ4t/4OIPj1rn7PtpfR/AmLRb3EkKvFZBpZ4DHtVjkRNOtyYVIBEYHAwQP0Z/4KX/APBu9+z/AP8ABUn4v2vj7xp/wl/hTxhHaR2V5qfhS6tbOTV448iM3Qmt5lkkRSEEmA+xI03FUUD1n/gmb/wSk+Ev/BKH4Vat4X+F9nqkz+ILxL3VtZ1mSG41XUmRAkaSTRxRgxR/OUjChVaWUgAuxPZUxKkpSTfvW0u7ddvvd+/5HSx8R/8AB59z/wAEpPCn/ZTNN/H/AIl2qV9q/s8f8FIP2fYf2fvAqz/HL4SwzL4f09Xjn8W2McqN9njBDK0isrA8EMoI7gVf/wCCnf8AwTJ8C/8ABV39nzTvhv8AELWPF2i6HpuuweIIp/Dtzb29008UNxCqs08Ey+WVuHJAUHIXkDIPwUf+DKr9l4t/yUH49hfQaxpP/wAra5Y8vLZgfJ//AAcJatq2v/8ABwj8D9U8J/ED4d+CLnVPAelXHhrxb4rhS+8OWrPcan5E0pMFxGUeQgJIY2jRpI3LIql1rf8ABIHwz4N+HP7ZH7a/jD4pfFb4a/Gq1s/hH4pPj7QPAmnX9nDr9qs1pJqE1tJ9ktLQxkRzQhoZF3PPvjzGfMr9XP2x/wDggD8B/wBuL9nD4WfDrxifFlt/wp/QrTw3oHiTTLu2g1w2VvDFCI55Wt3ikDCFWIMQUMzlAm41vf8ABP7/AIIffAr/AIJ0/Avx/wCAfCen654m0v4pWzWHim68TXUV1daxaGOaIWrmKKKMRBJ5hhUBPmEkk4x2QxKjT5bvbbX+tvw0A/m5/bO/a41b9oH/AIJYfD/Q9Isf2ePhv8KfDni+5TQPAHhubULzxjBLi5eS5u5rx55DBm4c7jKgcyxgKdgCfpd/wWw8Haf8Rfjv/wAElPD+sW632k63rFjp97buOJoJrjwzHIrezKxFe++F/wDgzt/ZV8MeBvFejnWvi1qVx4ntobaLVL3VdPkvNDEdzFOWtCtksau/leWzOjkxySKNpbNfUnxs/wCCNvw5+Puv/sv6nr/ij4hPffsnzWlx4XlivrQNrMls2nsraiWtm80s2mwljD5Od8mMZXaVMRBuLXRfjrt+Aj4x/wCD1LbF/wAEx/hyoUKo+J9kBjtjSdVrxD/g6F/Yt+F/7LVx+x7J4A8H6b4Zk07XP+EXha0Lj/iXwTw3EUTAsQxE1xO5dgXZpWJY5r9Yv+CoX/BLvwD/AMFZfgRovw9+ImseLtF0fQ9fi8RQT+Hbm3t7p547e4twjNPBMvllLlyQFByq/MACDR/4KSf8Enfh7/wVDm+HL+Pdc8baL/wrLVpNY0weH7u2gFxM/lZE/nW825R5K4C7Ty3J4xz08RKK5U3br/XUZ9QUUUVzgFFFFAH/2Q==" class="img-responsive logo-s" width="100px">\
                 </div>\
                 <div class="col-sm-8 text-right">\
                    <address>\
                        <h3 style="text-align:center;margin-bottom: 0px;font-weight:600;">U N ACADEMY</h3>\
                        <h4 style="text-align:center;margin-top: 0px;margin-bottom: 0px;font-weight:600;"> For Kids </h4>\
                        <p style="text-align:center;line-height: 1;">625/B, Unit 2 Latifabad Hyderabad</p>\
                    </address>\
                </div>\
            </div>\
        </div>\
    </div>\
    <div class="row">\
        <div class="col-sm-12">\
            <div class="panel panel-default">\
                <div class="panel-body">\
                    <div class="table-responsive">\
                      <table class="challan-no">\
                        <tbody>\
                            <tr>\
                                <th><span>Challan No</span></th>\
                                <td><span>'+obj["month"].replace("-","")+'</span></td>\
                            </tr>\
                        </tbody>\
                    </table>\
                    <table class="enrol">\
                        <tbody>\
                            <tr>\
                                <th><span>Enrol No</span></th>\
                                <td><span>'+obj["gr_num"]+'</span></td>\
                            </tr>\
                        </tbody>\
                    </table>\
                    <div class="clearfix"></div>\
                    <table class="table table-condensed mt-3">\
                        <tbody>\
                            <tr>\
                                <td>Name of Student</td>\
                                <td>'+obj["name"]+'</td>\
                            </tr>\
                            <tr>\
                                <td>Father Name </td>\
                                <td>'+obj["f_name"]+'</td>\
                            </tr>\
                            <tr>\
                                <td>Class</td>\
                                <td>'+obj["class_id"]+'</td>\
                            </tr>\
                            <tr>\
                                <td>For the Month of</td>\
                                <td>'+obj["month"]+'</td>\
                            </tr>\
                            <tr>\
                                <td><span class="">Issue Date: </span> '+obj["issue"]+'</td>\
                                <td><span class="">Due Date: </span> '+obj["due"]+'</td>\
                            </tr>\
                        </tbody>\
                    </table>\
                    <hr>\
                    <div class="clearfix"></div>\
                    <table class="table table-condensed ">\
                        <thead>\
                            <tr>\
                                <td width="10%"><strong>S#</strong></td>\
                                <td width="60%" ><strong>Description</strong></td>\
                                <td width="30%" class="text-right"><strong>Amount</strong></td>\
                            </tr>\
                        </thead>\
                        <tbody>\
                            <tr>\
                                <td>1</td>\
                                <td>Admission Fee</td>\
                                <td class="text-right">'+adm_total+'</td>\
                            </tr>\
                            <tr>\
                                <td>2</td>\
                                <td>Security</td>\
                                <td class="text-right">'+sec_total+'</td>\
                            </tr>\
                            <tr>\
                                <td>3</td>\
                                <td>Annual Charges</td>\
                                <td class="text-right">0</td>\
                            </tr>\
                            <tr>\
                                <td>5</td>\
                                <td>Tuition Fees</td>\
                                <td class="text-right">0</td>\
                            </tr>\
                            <tr>\
                                <td>6</td>\
                                <td>Miscellaneous</td>\
                                <td class="text-right">0</td>\
                            </tr>\
                            <tr>\
                                <td>7</td>\
                                <td>Transport Fees</td>\
                                <td class="text-right">'+tra_total+'</td>\
                            </tr>\
                            <tr>\
                                <td>8</td>\
                                <td>Arrears </td>\
                                <td class="text-right">'+trans_arears+'</td>\
                            </tr>\
                            <tr>\
                                <td>9</td>\
                                <td>Current Penalty</td>\
                                <td class="text-right">0</td>\
                            </tr>\
                            <tr>\
                                <td class="thick-line"></td>\
                                <td class="thick-line text-right"><strong>Grand Total</strong></td>\
                                <td class="thick-line text-right">'+grand_total+'</td>\
                            </tr>\
                        </tbody>\
                    </table>\
                    <h3 class="text-center"><strong>INSTRUCTIONS</strong></h3>\
                    <ol>\
                        <li>Last date for submission of fee is 10th of each month.</li>\
                        <li>Late Fee will be charged @ 10/- per day.</li>\
                        <li>Penalty will be charged by U N ACADEMY through next month fee challan.</li>\
                    </ol> \
                    <div class="mt-5">\
                        <div class="col-sm-4 dated">\
                            <h5 class="ml-5"><strong>Date</strong></h5>\
                        </div>\
                        <div class="col-sm-2">\
                        </div>\
                        <div class="col-md-6 text-right sign ">\
                            <h6 class="signature"><strong>Signature of Receiver</strong></h6>\
                        </div>\
                    </div> \
                </div>\
            </div>\
        </div>\
    </div>\
</div>\
</div>\
</div>\
</div>'
    
    $(".print_pdf_show").append(html);

  });

    printJS({printable:'printSection',type: 'html',scanStyles:false,style:'\
@media print { body {\
    box-sizing: border-box;\
    margin: 0 auto;\
    padding: 5px;\
    width: 21cm;\
    height: 29.7cm; \
    background: #FFF;\
    font-size: 12px;\
    box-shadow: 0 0 1in -0.25in rgba(0, 0, 0, 0.5);\
}\
address{\
    font-style: normal;\
}\
address h2{\
    margin-top: 0;\
}\
address h3{\
    margin-top: 0;\
}\
.mt-2{\
    margin-top: 20px;\
}\
.mt-3{\
    margin-top: 30px;\
}\
\
.mt-5{\
    margin-top: 45mm;\
}\
.logo-s{\
    margin-top: 10px;\
}\
table.challan-no{\
    float: left;\
    width: 49%;\
}\
table.enrol{\
    float: right;\
    width: 49%;\
}\
table.enrol th, table.challan-no th {\
    width: 60%;\
    background: #EEE;\
    border-color: #BBB;\
    border-radius: 0.25em;\
    border-style: solid;\
    border-width: 1px;\
    padding: 0.5em;\
    position: relative;\
    text-align: left;\
}\
table.enrol td, table.challan-no td {\
    width: 30%;\
    border-color: #DDD;\
    border-radius: 0.25em;\
    border-style: solid;\
    border-width: 1px;\
    padding: 0.5em;\
    position: relative;\
    text-align: left;\
}\
.table > tbody > tr > .no-line {\
    border-top: none;\
}\
.table > thead > tr > .no-line {\
    border-bottom: none;\
}\
.table > tbody > tr > .thick-line {\
    border-top: 2px solid;\
    border-bottom: 2px solid;\
}\
.dated, .sign{\
    border-top: 2px solid;\
    margin-top: 60px;\
}\
   .col-sm-1, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-md-6, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-sm-10, .col-sm-11, .col-sm-12 {\
        float: left;\
   }\
   .col-sm-12 {\
        width: 100%;\
        display: block;\
        padding: 15px;\
   }\
   .col-sm-11 {\
        width: 91.66666667%;\
   }\
   .col-sm-10 {\
        width: 83.33333333%;\
   }\
   .col-sm-9 {\
        width: 75%;\
   }\
   .col-sm-8 {\
        width: 66.66666667%;\
   }\
   .col-sm-7 {\
        width: 58.33333333%;\
   }\
   .col-sm-6 {\
        width: 48%;\
        margin: 1%;\
   }\
   .col-md-6{\
      width: 50%;\
   }\
   .col-sm-5 {\
        width: 41.66666667%;\
   }\
   .col-sm-4 {\
        width: 33.33333333%;\
   }\
   .col-sm-3 {\
        width: 25%;\
   }\
   .col-sm-2 {\
        width: 16.66666667%;\
   }\
   .col-sm-1 {\
        width: 8.33333333%;\
   }\
body {\
    padding: 5px;\
    width: 21cm;\
    height: 24.7cm; \
    background: #FFF;\
    font-size: 12px;\
    box-shadow: none;\
}\
@page {\
     size: 8.27in 11in;\
 }\
 .table {\
margin-top: 7mm;\
}\
}\
}}'});
}

function batchPrintChallan(){
  $(".print_pdf_show").empty();
  jQuery("#fees_table_body tr").each(function(i,row){
    var obj={};
    var total = 0;
    obj = {
            "gr_num": jQuery(row).children()[0].innerText,
            "name" : jQuery(row).children()[1].innerText, 
            "f_name" : jQuery(row).children()[2].innerText, 
            "class_id" : jQuery(row).children()[3].innerText,
            "admission_fees":jQuery(row).children().find("input")[0].value,
            "security_fees":jQuery(row).children().find("input")[1].value,
            "annual_fees":jQuery(row).children().find("input")[2].value,
            "monthly_fees":jQuery(row).children().find("input")[3].value,
            "misc_fees":jQuery(row).children().find("input")[4].value,
            "transport_fees":jQuery(row).children().find("input")[5].value,
            "arrears":jQuery(row).children().find("input")[6].value,
            "transport_arrears":jQuery(row).children().find("input")[7].value,
            "current_penalty":jQuery(row).children().find("input")[8].value,
            "month":jQuery('#month')[0].value,
            "issue":jQuery('#issue')[0].value,
            "due":jQuery('#due')[0].value
    };
    total = +obj["annual_fees"] + +obj["monthly_fees"] + +obj["misc_fees"] + +obj["arrears"] + +obj["current_penalty"];

    var html =''
    html = '\
    <div class="container-fluid" id="printSect">\
        <div class="row">\
            <div class="col-sm-6">\
                <div class="row">\
                    <div class="col-sm-12">\
                        <div class="invoice-title">\
                            <h6 class="pull-right">STUDENT COPY</h6>\
                        </div>\
                        <div class="row">\
                            <div class="col-sm-4">\
                             <img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAIBAQIBAQICAgICAgICAwUDAwMDAwYEBAMFBwYHBwcGBwcICQsJCAgKCAcHCg0KCgsMDAwMBwkODw0MDgsMDAz/2wBDAQICAgMDAwYDAwYMCAcIDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAz/wAARCADuAQ0DASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD9/KKKKACiiigAooooAKKKKACiiqmva9ZeF9EvNS1K6t7HT9Pge6urmeQRxW8SKWd3Y8KqqCSTwAKN9EDaSuy3XE/Hb9pDwB+zD4QTX/iJ4y8N+C9HlmFvFdaxfx2qXEpUsI495Bdyqsdq5bCk4wDX5Rf8FKv+DnM6TrVx4L/ZltV16+gaa21LxVe6Q9xBAQFCPYRbiZSGLZeaLZlBhJFYMPx4/aJ+InxP+N/xD1Txj8Sn8UaprGqyefd6jqenzQqzAKBgbFRFACgKoUAYAFfqXDvhjicY4zzKoqEZbRdud/8Abrat6vbsePiM4pp8lK1+l9vl1f4H7fftD/8AB2R8JPAV1qFh8PvAfi/xxeWrtFDeXksOl6bclXK71fMspQqNwzEpIIBCnOPMdA/4K2/tdftgeD73xlDqnw0/ZZ+EcMgMPi/xHZGX7Uj5/d2zXaMl7KAjsqxJGG243dK+IP2Af2TNI8PfCwfFbxn4U1bxp4l8RaumifCjwYscq2vi3VFKh5r3hStjC08DBjLGHKyBiyjB739oqx8D6N8YNa8UftjeN9e8e/E7yEg0/wCG3w+lRbfwxtXKWd7MAIIY1URRlbV3kGGZmkbk/YS4ZyHDz+qYCl7SSvzSf7yTtp7kNIu20pvljF6e81p4NfMatSVo1H20772srK9u/Tt19u1v/g5X8R+GvgnceDvhx/wnXxc+J2oeZFJ4y8RabaabHbjoGs9LsUdGCjJUynduJLF1AQc7+y949/4Ki/Hq6jms/GXjjwjoUs6xzav4w0KysLWyhI3STP59mX2RpliwXHGBzxXzHp//AAVw+Lnw30pdN+C3hXw/8EdHYiMWfhrQmv7i8yeDLdXizTSMSR0KjAAx65P7Rvi/xx+y7oniDwz4s1y+174ofEO0lTxrfStcXP8Awj1hIEK6dFIQIhcyO1wt0Y90YQxIj5MoHpw4Yo0f9loYalF1HvP35a6c0orljBLsnKN9vPjqYiq3BSs5bWum1rum01tvpe6teWlv2Y07/gqhffCL4wyaf4u/aN/ZX17wjpqWNlIYtcabWryWO3jS7uWSzjMULSyiSQREERk7AxAydGb/AIOaP2Y1+Omn+DYdQ8VXWm3q/P4nj0xRpNm25lxJukE+MKG3LE3Dr74/msinKq0e7cUwAq8Hb2zn2p5TYWgb5nPzLgdBXT/xB7LakU61SXNa3upRV+9lfXzb1fQ9yliMRTbXNe7vrd/LXp6JH9nPwz+K3hn4z+ErfXvCWv6R4k0a6AMV5p10lxC2QGxuUnDYYEqcEZGRXQV/Kd8GP2jvH3/BOv4S2Xijw3qLaV8R/iDDFNoszhLh9F0IAiS78lw0LPdOZIkEisyJbythS6E/pT/wS7/4OedF+ID2vg/9oZrPw/qcnkWumeKdPsWFjeN8wc3yKT5Dk+Xho0MX3y3lADP5VnnhnmGFjUxGCftqUG1dL3nZ2bUdbpPS6d79LanVg88p1k3JWjdrmTTjotXvor3XXa+x+xFFQ2N/DqdolxbzRzwyDKSRtuVh7EVNX5se4mmroKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKa77Nvys2Tjjt70AYfxQ+KXh34K+AdT8U+LNY0/w/4d0aLzr3UL6ZYYLZCwUFmY45ZlAHUkgDJIFfi9/wVW/4L6fAv4/6b4f0nwz4Z8XfE7S9NmnnutI1K8m0Pw3qLZAha+gMRmu1UoJUjPlAEckliq+af8HAv/BRP4hftdftHSfAHwHpnjKHwfodxHDcaTHp8i3firURmRH8pEErQqHXy48srlVlxnbt8Jsv2W/hX+wFfaDd/Gq1i+LPxT1a2S4sPhhoVy4tdPlZVCW+r3QYSR3G5yRbRxPuaIAkq9ftnCfBWCw+Hp43M3KVeprTpwfvW7tqyT16yil3vofJ5jmMMQuSDvB9FbXXd9eVb6Wdlpd2R0nwl/at/az/AGvtLk8Lfs7fDmy8AeF45g7QfD3RBodmgk+TEt7JIEzkNyzhs7j249y8aQftYfsF/Bm//sv4meLvjF8VNeum0PXNIsdRl8RR+AYnhhuY2eDLyLeSJtKyHEaRy52sZUes34u/t7eNv+CfXwas4bi50e3+LHi7T3m8N/D3QtPhsNI+DNlcJ5kT3UCJi81ALJblI7mLKYlJbDYl8w+CXw0+Kngn/gmX8T/iW0niab4g/G7xLbeFodZv9Yeyu7eygMdzcX0t1cum4SGBrbc0gJ3kZOMV79Re0jGs6FKnQc4qMWuZ1HKTveTalaOrb2ly6Nxs5eHWlGFK+kde+iXm73S6X2XbXSr+zh8cviv/AME6fD1x8dviN4i8WeJtavtQvPCmj+F9S8QT6jY3d0kUX2k6sySyi3MSXH7u2k8uXzAxwqr830f+yp/wWj0f9qS7uvBOi/B/UvgzqV4RPf8AivwClvdw2YZz5t3eLJbxrBbhmMjSSSNtwWLE814b+wRo/wAK/AP/AAlX7OPxc8baJ8Sv+FxXllcaND4euXutL8O6ygkMbSag21Y7idvJgY26yk4VWJUgV8q/tVfGXxR8M/Hnjb4W6Noln8K/DOlarNp134c0UGO4uDCXi23l4VW5vgcuw89imJPlRVwB3rIsLmmKq0atL96mpKpbkh7OyUbQT96zurONm9XK0kOnTlZwpbyu76xSWidlbd23W/8ANY/TDxj8e/irD8K9U0P4E/tMeH/2jvilr919k+y2usWmm3ulWMeJWlsbGWQm4m+Qq8yzcI5CxEgsPhvx5/wVA/bC/Z38ZTaT4u8XePtH1qFiz2niKxeEtg4JQOF3L7jINfIGjeIr7wjfW+p6fdXdjdWJJiubQmG4jJ/uspBHXsa+nPhJ/wAFLNZkhtvD/wAcvDdj8fvA8UbxJbeI5MazpisBlrXVNrXURGFO3cQduPlyTXuUeFZYCM5qhTxEZPmkpQhGotLe7a0Gnsovl9bs7J4ZxVlZx83K/wAtXZen3G/P/wAFsfiR41SGDx94D+DfxQt45BK8Pijwil2zN03F94J44z1wa6zwj8Qv2ff2kPCd544+JX7Ol18KfA/hqaO2Gs+AtbEFvr2oGRCNMjsp4W3sYpHlkMcmVjiySuRnT8K/8EjPDP7U/giT4z/CHxHq0/wtVri71HwreabM/i6xSA/vbSySPfHeOPurIXjXLIW74+Qv2g/2iLj4165Da2Wk2fhHwVoIeLQvDGmytJZaMhYljlsGW4diWkmf53OBwqoi54fL8qx0/Y5VzUnF/vHFuDj/AHHG61ff4Ule+18Y4eE1GNFNW6tu61s0tXd6W1ul5n05+0X+x74V/bG8c6p41+DPx88L+Pta1a92aZ4H8Qv/AMI5rlmjuPI0+zW8kWKWOGNlRAmxAI9qAkYr5P8Ajp8AfHP7OvjSbQPiB4V8ReFNZhPMOoWxVZuAd0b4KSDkHcjMOetcjbyXNpcQ3cUxEkRDxyRjEiHqCD1BHsa+nfgx/wAFPdc0fwzp/g74yeF9N+PHw1s7eSCy0XxKwjvdOd8fvrbUwj3URVdyqoYqqthQuBXvRw2ZZbS5aLVanGy5WlGdulpK0HbRJPl9b6HVTpVKUVCDTS76aeqXz2fY+pf+Ddj/AIKs+Mvgp8fNE+CPiC+j1T4W64Ly4EupXZWTwo0dvJcvLG8j7Etf3TGSPAC72kBzuV/6CPCXizTPHnhXTdc0TULPVtG1q0ivrC+tJRNb3lvKgeOWN1yGRlYMGHBBBr+bvw1+wN4X+K37NnxK+MX7N+p+MNajmtW8MWHg2+sAviTTp5JrRrx4ZIpWFzELJ5RlBuKzPnBUivYv+Dc3/grncfAj4k2vwD+I2sapqHhnxfqMVr4Wvr+6HleG7vY6fZSHywhnYQIiKwWOTov7xiPx3jnhilmcsRm+VrllS0qU2uWXNq5O3kmldaPllbW1/RyvMWpOnJWjfS71Xe61sr6fjtqfvlRRmivxE+mCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK+Kv8AgtJ8ZviVH8J9B+C/wX0+a9+I3xm+12M90Yf9F0LQY0SHUL6ecnFuqG7t0EmCw81ig3ha+1c1/O1/wWw/4LS3/wC0F4/8V/Dn4c6GPA+mWOtXuieIfEtpqG6+8aWdq8lvDGXRUK2RDTObdy6v5iHjB3fZcD5DiszzKKw9NSUGnJtXiuicl116ddtFdrzM0qWpezjvL126/wDB9TifFv8AwUsf/gn38Orr4WfAHxpqXijxC9ysniH4garbx3KNKI0V7XSYZlKpbKUUGWRGZ2LlTjYw73wr/wAFA/i5+y/+y3/wuP4ueJU1z4heOLMt8KtGfRbARrGQFuNXvPLgUrGqyoYFL5kZGym3DD5B/wCCeX7K3h/9oH4nXesfEPU5PDPwi8CWb6x4u1pidkMQYJBZxsQQZriZ40VB8xBfaGKgVx/7Xv7UutftgfHPU/FesQfYbGULY6NpUf8AqNC02It9lsouAAkasegUFizbRuIr+hZcO4DEYr6hGCk961RpObcvhhe2il9pJJRhpZcx8pHCwTjRhtF3vtZ36W21V9LerZ23xU/4Kr/tCfGa+87V/iVqzPMrSu1hb2+nMzMOR/o8acdhk8e1ejf8Fj77Vfh944+F/wAG7/XtU1qX4b+DLT+1jeTm6f8Ate8eS8uWLsAW+WaIL1wgUZyDXgv7EXw2b4u/tjfCrw2bWS8tdS8W6bBdxhQwFsLmPziy9CoQEtnjGat/t6ftAw/tW/tf/ED4gWcjzWfiTWJJLKQBgq2sSLBBjP8A0yiQY4x6V6sMrwkM4pUcLRjBUoOTUUlrK0YpWXbm+bNPq9P60pxir2bb6va13v5nkemzXGm3DXltJLDdWsitA6Nho2VgQ6nsQec+1fXf7bQ039qf9k/wH+0Fp0yTeNGnTwb8TSXJln1CGEJp97sPA861tm3smF3KoAzuNfMnwv8AhB4q+M2tNpfhHw/rniTVipke10uze7kWPuxCA4UAHLHAABJIxX2j/wAE2PC3hD9mnxj4w8B/Hjx14b8J+FvjXoB8K3ej2l/Fq19BcySoLe6m+z+dDYy2+9yrXWCnmE4AD4riPGUsMoYyg06tL7KfvSjLScbLXVO9u8V5hiq0I1I6++nstW09Hfy1Tbei3dj4PtbRYrlY4Y5n85wixxqZGkc9AB1JPoK90b9nLw5+y9NJefGC43+JfsaX+m+BLBzcXN65YiNdSnRvLtYTyWjjk+0lVZcREq1dN+0F8TNf/Yd8ceLvhT4V8HH4Ya1oN8YdR8QSXS3HjC4U7WXbqUGxIbeSMxMIoI1+Unc7bmz8xtds87STM00zEu8j8tIxOSWPUknkk+tdtF1cxhGpH93Rkrxs1zOL21WkE12vLfbqctat8V4R/wDJnt1+z2e77NHo2uftUeONU+J+h+LbHVF8P6l4Xjt7fw9b6anl2mhQW4RYILeNi3yIsaA7yzORl2ckk/S9pf8AhP8A4LB6g8N0bXwf+1VqEgFreLGlj4c8cRQovySqN/2e/EKsEICRP5Kgnc/HxAJmZSrYZW+6MY20+OYIF3SeWyEMDj5hg5yO+R+la4zJKNSEfqv7upTXuy7L+V2avFvVrrurPU0+qwS/drla7ffr31vv3fdmr4z8C6r8PvG2teHdasn03XdAv5LHULOTBa0uIXKSRtgkZVlIOCRxwTUXhDwtqfjLxhZaVo9q2oa3r1zDp9jbJj/SJ5WCRxjdgZZmUc469q+xdP8AHFv/AMFbPhFa+H/El8sP7Rnw70sW3hOaOMtN8SrJEDtaXcjZ3XsKxSNGxkBma4ZQhOTXmvhnwjrn7CPgfUvFHinSLXTfiN4kiudE8N6NqibNX8NxlWFzq72+RNZ3Mcixx2rSbGJkllUMEBPHh88k4+yqRUcSnbkvu2m1NbXjZ35raWs7SRP1ppWt7+it3b6+n42Ri/tE+MYfgR8UPD/g/wCHXibUWtfhehjtdWs7oo13qsv769uUZQmdrsLdTgZitUznkn2y28beC/8AgrjFcWviO203wX+1DdMtroOqWEX9n6H4+kAj/dX/AN9YL87JVjdPJjkkljVuNoX4fZVXywq7UiJ2gjbx6e1SQXbW0kh3eXHI4dto+ZSDnOeuRW1bh+nKnTdOXJVgtKi3u9XzbKUW/ii912epNLBKFNRi/etrLq3q236tt/Nrqf1Cf8EQv2v9T+OX7N9x8MfHVrJpPxf+BIh8MeKtOdTlYkMsdjPu3OrmSCEB2VjukR2wFZM/a1fhD/wQa/4KyeFx8fNF8J/FiTT9L8VTaYnhvQPG0kUj3PiOOW4hWLTtRk5LyKwjMM7sFRVdWBL7j+71fynxxktXLc1qU6lPk5ndfyu+7i+sW9V1SaTWh9NlNec6PJUtzR007dNOn/A3buFFFFfInqBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQB4l/wUh/aHP7KP7CfxS8fxxxzXXh/QZ2s45HKrJcy4ggUlSDgyyIOCD6HNfy+Xfx9+FPjbRbqTxB8F1stYuiZG1Dw94ovLUR5B3hba48+LliDxjp15r94P+Dn74gS+EP+CV+saXEzL/wlfiHS9Ocg/wAMc/2r+dsK/C3/AIJofs4x/tJ/tg+D9M1WH7R4W0Gb/hI/FDGTYsOlWciPcknrhhtTC85cYx1r+gPC/L8Nh8kxGbYi+jbupSjpFJL4Wr+83o77o+TziNOpWlUlf3FbRtdLvZ9br0sfSn7XL/Cf9kP9izw3+zneR/Ezwv4r8XSWnj/xjLbWVhfXH7xZFtNNu1eeDaYlWKXYoABCtjc5I+O7fRPhBdOrzeLfisoXIITwppo3e+f7Q/pWf+1D8etW/ac/aB8XePNc8r+0PFGoNdlYxiOOPaqRovJ4VFUDJPArgc7BgZC5zX6pkeQ1cNhl7WtNVJ+9OzXxPzcW9Nld7WPPpYWXIrzkrry7ej17vq9T9Df+COus/BnwD+0P4u8XaTb/ABC1q/8Ahx8P9a8T+brFtY2cbCIQxtsWGSUpJ+/wrl8AEtjIAr5r8V/tO/DPS7izf4d/Afwz4S+xgGNtZ1m78SOX53MUm2QEHPR4mH6Y9M/4JmaT/Yn7MX7WnjSRpFGj/DltBRlP8d/IzKMembTr2x718eD5JAu7twa87LcnoVc2xc60pzcHTjdylqlFSs0movV7NW8jGnhYSlOjUbaTT+Jp666uNrrsne2p6p4h/bU+Kmt2s1nZ+L7jw3pdxA1rNp3hqCDQ7GaJgVMbQWaRRsCpKncDkcdK8tjdF3NtVmPQlPmRuzD1qMLxwKVnOD83Ir7Cjg6NFP2UVG/ZHpU6NOmrU0lfsrXfmfY/7c+n6n+1p+x38P8A9p6byZ9V89fh346IBae51W3EktreuQMESWXkRszYIZYx827I+OimHYN2r67/AOCSq2/xq+KXib9nvxBfSQ+EfjVo72UDbgosNXtD9ss7rd1GPJkjIH3hKAR6fKHivw5eeDvEd/o2px/Y9Q0+7ls7iM/MySRuUdTjoQykV4eRyeFrV8sn/wAu2pQ/69yvbySUlKK7WXdGOH9xujr3TfVfnp1v3Wrdylt+cbRzmmoqyyM0mNqjmn3flwBTuZnYhUwcfN2r33T/AIF+GP2XdKn1T4w2aal4slsUm0T4epcyx3DvLu8u71SWLaILZQrEQRyi4djFlUQlj7GOx9LD+5L3pvaK3b/Ky6t6Lq0aVMRGm1F/E9kt3be3+e2qJf2U9CX9n+HQvjl4luG0X/hH78Xng3R2DQ33ii/gCvFOmQNlhFIUaSYZWTy2hUEsxX1f9un7P/wUG+BNn+0p4Xs2Pj3THttF+K2mW+64FpOIXW11dQoKx280dswcYRUfaoDZZj8j/FL4p+Ifi/41uvEXiS9F9fTKqFkjWKOGJM7IIo1AWOJASqooAA4r0r9g/wDajg/Zc+Osd5qQhuPBfjayk8N+NLKWJ5FudEu2QXWzYQyyqgLKykEEYHXFfPYzLMVGMc0v/tMOi0Th1ppdf5k9+dLokjk9lXt7WXxb8qbst9Ol992tdtNLeJj5idx3HPJxjNKrBX+7v9q9j/b1/ZCuv2Kv2kNY8Etef2ppMIj1DRdS3hv7U06dd8E2QFBbBKNgAbo2xxgnx2MySbpJFCxktnbwQMcYr6XB42niaEMRSu4zSkna+jXX8n10Z3wnGUVOPU9S/Yn8OP42/a++GemosP2d/FenT3EcrBY0giuY5pizHAVREjktxgAnI61/WL+yV+0fpX7XX7OXhP4kaLBJa6b4qszcxwvIJGhZXaN0LDg7XRhn26DpX8mv7M/xL0D4T/8ACfX2rXBTUL7wZqOjaCqIzSSXt2Eg8wkcLshac5Y9cYBNf0Mf8G0/jf8A4S3/AIJL+C7PzDI3hvVNU0s5GNv+lyTgf98zivw3xiwbrUYY2ztTcYLtqpSlbv8AZV/Kxpldaax0oNWi0kv7z3Vn5K/3+R970UUV/Px9UFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAH5V/8AB2i9yP2H/Aqqp+xnxcrSOfuiUWs/lj6lTKR/umvyv/Yc8b3n7PP7A/7Sfju3ENvfeJrDTvh3p8rp80q6k1y92sbgghhBbs2BxlVJyQBX7Xf8HHes2Xhf/gnNNq2q+DdF8b6NY+I9OXULDUWkh2Qyu0PmQzxESQSh3RRIpyAxGCCQfyp/aB8MfDC8/wCCUHwMg0P+0vhLpXxQ8Yap4h+z6kj61avPYNLYZlvBsmWCLzX2fu5GxK+QSuT++cE5hGfD9HL6lN8s61m1rs1Uasrv4YvpsfF5vVksTKPK+W6blv0XupL3r7a2tZvW+h+dokZoFDYPpjvQXyOhr3VP+Cf/AIo17UY7fwj4s+FvxGuJozJFbeFvFUF1eScE7RbuEm3Adgma4jXf2U/ip4b3/bPhj8RrVY+WeTw1e7B2+95W39a/bqOdYGcU1Wjr3kk/mnZ3+RjDMsNJcymrebt+dj6K/YVEkP8AwTG/bDaNdzTW/hxH/wBlN2p5P8q+OHIkud3JXb1x35r7o/4JxfDLxVqv7HH7XPhK78NeIrVtQ8F22swxz6TOrzyWTXBESAqMu3nngcnGcHFfKmn/ALMXxO163abT/h38QbqHON0Xhy9ZFPpuEWM/SvFy3MMPTxuN55xXvwau9/3cLdtLp7X0MaeMoqvKTmrNKzutbX216XscEAVHQnntzSeXuRzu+YAbR1ya9pT9gn4kaXNb/wDCVDQfhna3aiSGXxnrMWi+Yp7iOTMxxxnEZ5OOtQ+NPgV8NfhBc6eniL4tWvii5my80PgTSjqkUGCPke5uZbZckHgorgHOQMYPrTzzCX5abc3/AHU5L1urr72bPMsPz+zjLml2Sbf4X/4HU8o0rXp/Betafqtpdy2d1p86XEM6MVeKRG3KQRzwwHSvvL/gpF+xtb+O/jF4P+Ni3eg/Dv4d/HTRLHxdql3rN1HH/Y17dZe+ggtSVuL14tyPthjJcyryN26vnX4gftL/AA98MyJb/CP4Z2Ph+No1WTV/FNxH4m1OfDFjiG5hNnBztG6KHfhfv8kV7L4R13V/27P+CXXxVHjDVtX8XeOvgbrNt4n0i+1K6e4ng0rUTHb3dvCN2Vij+yCVhjYmExjJr5vOKmNVejj6cVSjf2cm7OVp2ina7V1Llabuld3VtDOcqkn7WUeXpd6vVrVpO1rX3bd3eytr49N8d/CP7N9rqml/C7SYNY1y6V7NvHms2qG8jAcbJ9LtSp/s9iowXd5ZeQVaI5U+EyXUl/I8008rXEpJeaZjJI5PJy3Ukn1ppyFIXc3IOT6UeXx1/KvrcLgaVGXPFNuSV23dy9X+isl0SR1UcPCnqtW92936/wCS07ISSJjCSZmZFIBy33s+1KSsAVVVW3YPmMPu+1SafZNqF/bwwwyXFxJIqxQxqWaRieAAOSScAAda/b7/AIJK/wDBD/wd8AfhO3xm/aCtdH1fULvSxrMGjazaldP8JW6h5WluRIdkkwjCMd6BYsOOSN1eJxVxNg8jwnt8ReUpaRitZN/PZbXfS/dnRG8pci337JLq35I+UPgb/wAE4P2hv+ChnwW+F2j+JvBen+BfBPgMXmnx/EDxDm31SSxd3nWGS3mkWWe3ieQrCQqooLANwRVC1/Y5+Avgjxg3hb4Waf8AEL9sTx5DIbeefQi+keFdImDbUW4ljikLqSGYyLcpEVXG9eTX2drnj/xn/wAFwvFOraraeKvEXwf/AGOfCe6PUL6WQWN54zuISpkYvkCO2UseTIygxAspcgR8d4b8V6p+1H8MfEnh79mUaF+y7+y74Slm07xX8RroJBe+JhCoRpo5Mb3XYEPmtcLIwl+dwSUP5TT4ixsnOFaSpRu5OnG6pw5+k5r35Tb2hBrXeyZ5dfls4QbSfqr2bvZbxi7eq1tZqSWn4F+If7MvwA/ZVufDP7Svw7+AGi/Ei+nuLCPwt4M0+DWdZiiI2wRtcW4nkiu9p/1jSj5iDuBNekaL/wAEhfiJ+yfp8Pib9k346eNPDOnzBNYj8DeJHkl0zVZnUK/nDdFsJTYMyQmQGMAuONvyV4a8V+CfDdlrUn7N/gPwX4f0LwXKV1X46/FfN1DdXcTlRc6WbhZ4xMzq8iLGNxGzManAqX9jr/goT8VvAHiPxP4r8O6x8TPjdrN+Bp9/408dTnw/4H0ezSWJyYkZ5IhISGVWLQsPOx5eWO7z8TgcbadTCVWlJ3lGrZxd7WTi7qC3tebm9pK9kZRzClGDVZP3VbR6q2t9+Vv1fRWW7f3B4N/4Lf8AxY/Zo8W2+jftZ/ATUvh7pdw6SN4z8MpPqWg2sDHZvkMfnDh+SFlLhWX93nG77h/Zs/bY+Ev7YOhDUPhn8QvC/jGHYJHhsL1TdW6k4Blt2xLHyD99F6V5t8Fv2oPhD+3b8L/En9h6p4e8beEbXUH8PaotwkVxYXcoVCYwr5SRG8xMZBDZGM8V4L8fv+CF3wq8WavL4u+Ed9rPwF8fbxNbaz4SuZ7a2Eij5Q1pHKkQUMA2IvLJOeTmvzqp/ZuIn7PF03hqnVxu4X7uMrzj8m12R9TTqYmC9ph5qpB7JvVLZ2el1u7u71stEfopRX5a2n7Rn7b3/BMnStnxC8P2f7VXgeOUY1bQkkt/EVsjYADQxW58wKwPVXJ38yADA+kv2J/+C2fwJ/bZni0qx16bwH4zmvRp8Xhbxg0GmardTELgQJ5jCXLEqFU78qcoOM8uK4bxdOk8RQtVpLeUHzJf4lvH5pLs2dWHzSlUl7Ofuy7P9NtO10m+x9cUUiOsi7lIZfUGlrwD0gooooAKKKKACiiigAooooAKKKKAPmT/AILK/COH40f8EwPjVpcvmeZp/hm41y3aPG9JrDF6hGQepgwR3BI4JyPwn/4KIQ/2d/wSN/YSts5juNJ8U6g5PXdLqFvIfx/eGv6a9V0u113S7ixvbeG7s7yJoJ4JkDxzRsCrIyngqQSCDwQa/Dn/AIOOP2E9Q+DX7OnwE8O+BdF1bX/CfgE+Jg/2SFZZtKtLm5t7lC8SHf5MS5jMwXYu1N2wuoP6v4ZZ3CnjMPl1aVo+1c1d6XdKcH6NvlXnc8PMqMo1fb6cnLZ+vNG34XPxyuZUuxwzbV6A9/c1Pb69qFi6tBqWp27QjCGK8lj2j22sMVUYvswy/dPH0pWPHFf1DWo060bVoqXk0n+D7bHmyipKzR91f8ETvjB4w8XfH/x/4D/4SfXJf+E6+GevaNp8cuoSNtu/JSWB0LMdrgxMA3YO3rx8Q6r4u1bXW+0XOsateNIoAM97K+714Leld5+xz8VYfgb+1V8OfGN1cNa2PhnxNp2o3sm9lAto7hGl3bRnbsDZAByM8V0//BST9nWH9k/9tX4jeB7ONo9J0zUxPpWB8v2S4jjuIVB77UlCE+qGvk8PgcLQzupD2cUqkIyjZL4oNxf4OK+RzU6cI1eS2+q00WuttOr1Z4dhQ7MGYFuWySSfzoRVWTcqhW/vCnIMigdHIzuwea+wjBKx1hNIqN++3yccZ9a+jv8Agll8RtP8N/tcab4X8QapJpvgf4qaZfeBPEjR4Di11CCSGM7iCF2XBgfd1GzuMg/OCSLDaNcTfMFOMGv0n/4Jjf8ABvn4q/aw02z8ZfGBtY+HXgMlJrXThEkWra5GULq679wt48lcmRCzDcAq8NXyvGGZ4DC5ZVWY1FH2kXa2sr9LdW09fkZ1Fzfu18Tvb/hvLS727s+A/F3wq1DRvitrnhXR7W68RXWl6rcaVbNp0ZuvtCxTNEHGzO5SVHzDjmvpLwt/wQi/aq8VaTFqMPwpvIbG4j8yI3OsadbS4/2kknDLnsCAa/UbUP29vgb+wky/Cv8AZN+F8HxZ+IUbRafd2HhOxZY3aIeWst7qMcDLMVdtpbcwUs+WTmtz4eaT+2b8bfFOg+OfjF4z8C/s4+D9J1OKW58N2jrdz3SBtiRTTC5MWJmYAZkPO35M4FfnGL8RM3UI1KVOFCNnZ1m3KVtmqcWmr6aO+mzZlzuK5U+dqyfLZWfe70t58tlrdn5y/wDBKn9gfV/g/wD8FhPBfgr4yWEPhfW/Dcb+JLDS7mbzG1aWKCWW2aGSLdG4R4vMPzYPksvUFa/Vr/gqb+yJ8Vv29Nc+Hfw10WbT9F+Dd7fm/wDHOpi+8q/uIYnjAtIl2tzIryspCkF0XcUCgP1P/BT3/gn5bftzfCm2vNDvLjw/8UfAbPqvgvxFasI7iwuxtk8neCGWOUxquVI2NtfDbdp5b/glR/wUQuv2ltJ1H4V/Ey1bwz8d/hcp0/xFpVy2H1NYn8r7bGckSBsRmQozLulDA7XWvgM24kxea+z4hpWdShHlnBq/I3e1WKfS8tN+WSV21Y9H6soTeFrN2m009FdK2j7K93fu/OKfzj8dYNN/4KDfHib9mnwM1v4P/ZP+DdnHP481CyRrJ7y6iBuEsopHBzGJGhckqpLRzMWbEe7xL45/tS+Ff2q/B+m+K/EEb+G/2RPhRfDQvBfgWwMkWqfE2+t41WGMLzIIEJg3l2XEbcHzS239Rv27P2CtA/bU+BmreA5da1bwLYeJNXt9V1+50GGKK41zylVNk5KnzMrHCNzZI8iIchQtflp8ZV8UfCr4wW/jXxn4HXw78TfDMp8C/s+/Cxp0mt7SONhEmq3BVnjPledG6TBo1eWHO4KqsvocM4/D4qKdG6qQ0Ub+9zO3NU5nvOWvNO1qcE7atHj5rRq0YqM7W0tZWVt7RTbslbd7WTadkcx8RvDuoeMfEfgG3+Knhn/hYXxU1O2U/C74H6AXs9D8B2jMrQHVXVkYIYxbOVaXfgP5rDPy+eeJfBOtftneMr20kuJvjX8YtCDTamy3a6P8PPB2jQhE8lTH9n8yeKR+TGVjIf8A5asrM/Y/DXwjJ42b4gaQ3jK68OabCran8efjFPdtLc6hK2TL4e04g/PHuMseEaUTPEjY2BI5Mv4qT2PxG+FWgR6l4V1/wT8Nri6hHw6+CXhy6lj8RePXU7DrV8yxPIY38ucee1uWcRhEIGJT9hhZOi1yO0otWaXw6X0V1bmvflunZKdWa2fj05PlUk+663to1bqku11zbtpXPOtM0TQtZs1n0WTUPjV4m+H5WeTUIpD4X8AaJHGwcFmxbzXDb0JBPkFgiAA9K+6v2Cv+C53xK8b6svge/wDDTfGPxnq2u2kFj/wimnPaabomnu5S4WS5mKB2iynllgVIDF5jwxxR+xD4K+Cngzw38X/20vE2i+E9J02MzeFfg3oECW+kQLjLW32NDI93KGliL+UAV2gyyOudvpnwmtf2lP8AgofokfhP4K+C7P8AZC/Z6gVptK8SDTmt9T1q0MmwfZ7aNoWh3qzyjCqDwfNORu8TOMZgcdRkqsFKEX/Ek7QjLqouKTm+6pqKdkm3ozqwODrYacfYvkb+zFdNd1ZRtrdJJNP3mpK7f3R+0t+3J8JP2NLC3k+JHjXSPC32gebDBIk1xczrkgMsMSvIVyCM7cZHWvzg/bA/bF/Z5/4Ky6nL4X8C/s+/ET4ufEK4jew0nWI7QaJAnO4FrwTBlXgsPNQhQTkDJr7Q/ZZ/4IC/AP8AZ71bUNa8UaXefGrxNqjK0uqfEFYdZMRAH+rjkTYORncwZh0DV9q6TpNroGl21jY2tvZWVnEsFvbwRiOKCNQFVEVQAqgAAADAAr86wuYZXlc1UwKqVKsdFPm9nH/wGK52ums1dbo+ung8VioOOJair3sldr533WtpK1tND8Sf2P8A9lD/AIKU/sg21honw60m18O+BbS8E0HhrxN4j0fWbOCNpN7xGYfv1Q5O7yijcnHODX7Efs93nxEv/hbYyfFOw8H6b4yZn+1weGLu4utOVc/JtedEfdt+8CCAejEc121FcOdcQVMzkp1aVOMu8I8rfq7u/q9TuwuAhh37kpW2s3df8P5u7CiiivBO4KKKKACiiigAooooAKKKKACvzJ/4OYPg38QpPgb4F+MXw51DWre++FN5drqtvpzOp+wXaRNJPKFO2SGN7aNXjkVkZZjuGAQf02rO8W+E9P8AHXhfUdF1a1S+0vVrd7S8t3JCXETqVdDgg7WUkEdwTXq5Hmjy7HU8YoqXK9U0mmno1Z3WzOTHYb29CVL7r7XTur+R/JH/AMJJ8L/j9a6fZ+ILOH4V+NGi8ibXNN0/f4d1KQu5Es1nCAbIhSqloFkQlAfLTLNXLfGn9lLxp8DZXkvbe31jQWnMFt4g0V/t+j6kw5xDcoNhJUBtpIcAglR0r3r/AILH/wDBMXUP+CaH7Ss2laWLq++G2uRrd+GdRuJVknRWB8y2mIA/eRujgHGCmw5ySB84/BT9oLxn+zx4vtfEngnX7vQdStmEgaELJDc4zxLE4Mci8kFXUgg9K/r/ACqt9YwsMXlNTmpyV4wlfTy578yttqpW2StofIRoTpytQlonZxetn5O7asumq2tZanFgKWaPy9xIwxH3B6jPr7V9fftvJe/tS/sd/CP9oS4vFm1SKL/hW/ieIJvne+szPPbXUjZ5MtoYwScHKdxg15ZL+074R+I19dT/ABC+Gfh+a+1NzLd674T8zRtTkkYks5i3vZFjnPFuoyB6nP1n+wDqX7OXxS0vxd+z3beO/ijoei/G+zSC3stf0yzkFrrcM0M9tcx3MJKLxBsKvGobIGeRjhz7HVaEaWNqUZKVGV5Ws04vSSUo6vR8yUlG7SMamInzx54OLjrfRq1tVe/pe9rb3sj83yST8ykDr0qZFR4/lj3EDvxXut3+wwdM8e+IvDFz8ZvhDb654X1KfSb2yv59S0947mKRo3TdPZomFZSCd+Bjmsvxn+w/4g8HeFdW1xvFXwv1ax0aFppjpvjCyuJH2qWxGiuGdyAcKBuPpX0FHPMHUipQlpLa99fwZ1yxVKKvJ26a3X5pH6Wf8EPv+CI1jqvh6y+M3xo0WxurO6jnOieENd0ttsADhVv7lJsK2dsmyN42Xa6SZztA9T+PH7S3ir/gqz4y8WeD/h146/4VD+zN8NrmfSviF49uZIYYfEO2QZgsrhThYgsX3hMm+O8Uuu0qj/Q3wu1Dw1/wUC/4JAaHJ481q+0Hwz4k8KrHrGpWV39jltvssvlyS+YQwHz27EhgwOcEHJFfnvD4i+H/AO0h8K/+Eq8XLqXw5/YW+C866T4d8LWSOmqfETUI5N6llJaVxJmLc7uhG/AdT5ki/wA7LF4nNM0xONzG/tqU/ZpcvNGnZtJQjtOo3dJNK1ueT0SHWrtUqcIrSpFN62butmrXSXRXu3e2t2vTPgX8cdS1SC9+Ff7BPwdtPD+m6Y40rV/jDr9oi2tw0TMjXJfy5DcZbdIrMzHaTiFRgDy348z/AAZ+Fnj61vP2lf2l/iF+034muUF3J4a8B3BbS7aRSQi5hu1jjK7SxCeUclTgfxQ/tL/tB3fxE+EPhz/hcOseIPgb+zTqlqE+HHw58HWsMnibxFZxxqkDTktIkcbQvyZ5FBaQEI336z73UPiH+x78P7q98P2vwt/Y1+H2tyIgt9XtbnW/HGtRHG6UjbeS4LLwAIgAvQLg17OHwM6bc4WU56NpqU3fdOtyzm5d40YWi7py0aPIq14ySpSWl00ul1bbvrva/Mm20pKx+2H7NnxhPx9+A3hzxtL4d1jwm/iTTor1tI1aJobuxLoD5cgIBJGeuOetfGf/AAV6/wCCeHijxDqNn+0N8BbpfC3xl8Bo+pak2niVZ/FdnDErLbukeRcSL5KKIpEKyoxRiQFFc7/wQr/aa+GV1oHj3wz4I1j4t+KNAn1j+2b7xh44gt4YbvU5xHDJbwlWLLnZE4R8tmQ9MgH9IILlZV3R7mXAA4GSO5r8xrSxGQ5rKVJXitLNe7KL3jJPo10fk7XPr8LKGPwqhW0nHfupd7aaP5dUfN3/AATO/wCCj3hn/gpN8Bv+Eo0uzOgeINIuTZa3oUtwsstjLgFXRsKzwurAq5UZIZcZU1H/AMFIv2J7j9qv4Uz3fhBfD/h/4raXBJZaD4rvIXNzottcMiXvkOnzCR7bzFU/wswKlW+YfEn/AAVH/Zi8Yf8ABKj9pc/tdfAq30u18Oy7LLxjoEhZog1wxjaby+B9nkYQAhWLJMVcLs3bf0e/ZJ/au8I/tu/AvS/HvgfUft2l6kojmjkQxzWNyqqz28i9nQsAcZB4IJBBPVmWDjgpUs9yd/uJPRPV05aXpz7prRP7SvcmnJV4PB4xe96rX8N1urpXWu90vxG+IOo+Efh7pX/CPaxpOqXfwT+B2pHQtF0A2UltcfF/xod3nXFypLExefHKZA7S+TDJCgTM20fV/wAO9ET/AIJ+xaX8YPjRptv8Yv2x/iNKLXw34ZtZzFdaBZTK0cdvBbqG8iJY45A88VuMPK0K8M7v7n/wU78E/Bz9mL4l6X+1F8WtY17XdQ8D2z6f4M8LyKv2E62Qs8LQLEiv5rm2+Z5XKDqcBUUdL/wSP/4J8eKNG8Taj+0l+0FatfftCeNg8UKSlEi8MaZsSKOCOCMeXHM8afOwLEIQuVZpt/1GNz7D4jLliakeWna0o3s6knq4J2T5W7yqzW/uwWljx8HltSninT662e6Svvu9Xo7efS0Rn7Hf/BIjXPE/xTtfjJ+1V4gtviz8S7V4rrw9pUm/+x/BvVyscAYQySBmUZ8varRBgXbDj77ggS1gSONFjjjUKiKMKoHAAHYCnUV+a5jmmIxtT2ld7aJJWjFdoxWiX5vV3ep9dh8LToR5YL59X6sKKKK886AooooAKKKKACiiigAooooAKKKKACiiigAooooA8q/bL/Y38Dft2fAjVfh94+09rrR9S2vHcQ7Vu9PnU5SeB2Vgki8jOCCCQQQSK/l6/wCCjn/BNn4if8E3fjEfDfjC0lm0G/mnOgeIEjWOz121jlKCRcMwjl27GeAsXj8xc5VlZv62q89/aV/ZW+H/AO198NLzwn8RPCukeKNHuo2RUvIcy2rNj54ZVxJE+VU7o2U8DmvveCeOcRkVV05rnoS+KPVPvHVa91s152Z5uMwPtP3lK3Np6P187bfd6fxxGNXl2BsRlQyt60+CddOvI2LSK0LB45UYhkI5BBHQg85r9G/+Cln/AAblfFL9koap4n8AyD4jfD9LqWSGOwtZTrGl25VpAs0CqwaONVZPNV+dqllQtgfnEVWeLPnIFxw6gSA/Qd6/qbJs9wWa4dYjAyUl+Kf8rT2t5u3meJZ35ZJp9V2/r7ux9oftcaVD+37+zhp/7QvhHTbeDxR4HtYNB+KtpbLH5nnLsFtrkigKzLdlpUY/PsMABb5WNfGUcSuys8PmZOdyr09K9f8A2Kf2qrr9lr4r29/dw3GteCNaQ6T4x8NeZ5dt4i0yRHilikTIWSRVldoy33ZApyOa6P8Abu/ZJtfgZqeifEDwbd/2h8Gviir6n4PvYyWfT4iQz6ZdYZ1F1bMXhK72LCIsSrbkTgy+rHL6yy6r/Dd3Sk7tW3dNptrmjry94W6pnNTtSfsunT/Lp8j9kP8Ag2v8V/8AC0f+CX7aDqkdrfW/hzxJqWjyW86CaN4n8u6AdG4KkXJGOnH1r5L/AG2J/G3h39sfTZ/E3hrQY/iB4Pv5fD/wO+FWmNbXGi2FgjuF16+UM0UaJGySIH8g7rPLBUgNa3/BqT8a7qH4l/FD4dTTTGxuNNj8RQQmXKRyxyxQSsB33LLCCf8AYA9K93/4OAfgrb+DfDcnxG0Xw/4X8OW/iCx/4R/xl4yEwbXDY5bbY2Vu6hGkuFkkhaRXVmWQI5EYJH4jiqawfGGIwlSOlZ3i29nLXv1d1Kycnsu5WYU5TwXtI3vBtP0bvpZXtqtE9rpO7Pinw/4ytfhr428Vat4T8WaT4j8eaxGIfiJ8dfFLLJp3heRkfzrLw+rlJJrhF4iaJ5JJVtQYIwhUrR+Hvw+uro6n4p8F+HYNQ0fUrh4Zfjv8cZYNl3CqAN9gtbkqfMEiMikNcyYVxheQlHwz4V/4QvTfB0PiPwDb/ELW9Us2f4cfB61lYr4OQsrprGvIiqWkdDFJtmDrcRSku8UaIi72l6Z4g/aK+Klz4bv9G1D9rb4i2McUMVvo7/Z/hv4JmfLI6G1KLIBGuGUxQRl5JATIy5b6upywU5weiV23bVLz92KirW95xpraMamrfzrpuorJO8l03S0t5O2ybfKmlZPVmLp/h7w34q8W6dr3hdfj1+2Anh+cTT6zrN1N4f8ACGgXI+aNXNwkjCMMA+DPCAqrnuR+0n/BP79tPR/2pvhnZ6dqOqeEl+KPh/ToJvFOi+HtTTUbXSnkZ1hAljd423LHkqsjlCdrHoT8r/BP/gh146+JttZr+0V8XJdX8Ns6tc/DjwfGdJ8MSQp80UTLB5CkI2OFiUjb985zX0lpPgj9lv8A4JCeBrzUrO28B/CyHUISjyzXYGpaqiZfy1aV2nn55CAkA4wBxX5vxNmOAzCmsJh261WL91xTsr6tK6irdfdprXrY+myvCVcJ+9mlCFtU9++m33WVnfdWPpLX/D1j4n0K40/VLO31GwvEKTwXEAlhmVhgqysCCPYivxX8beG/Fv8Awbp/t16br3hk614o/Z3+KF0X1G2MbCPTh5jL5O5S3+kW8ciujsqmdNyDkMy/S0n/AAXK8d/tNQtY/s3/ALOPxL8dQ3kxtbXxXqVs0GiQSKMuXMSyKQOBhpU+8M4PBo/ED/gkH+15/wAFA9AuNH/aE+O3gzwv4WJjkt9I8J6Qt8SwcPh90VttKkLgmSXofU5nh3BzyqU6Od1IQw9Rcs4Sbc2t7xjBScZJ/C5cq7vquzGVo4mSWFg3JW961krPa7s77taW87NkP7LWlr/wW7/4KNXXxW1rT76T4AfAOZE8BmS0kht/EuqO0TyTyiZRu8trfcyBQVDQBjyd36yV43+wJ+xtpX7Av7LHhv4XaPqk+uWvh8zyNqE9slvNeSTTPNI7qnGd0hAyTgADOAK9kr5TPswpYnEezwt1Qp+7TT/l7vzk9X5s9TLcK6VPmqfHLV3tf52069NLt2srIKKKK8M9AKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK+QP25/+CHPwA/b28QXHiLxL4dvdB8ZXESxNr2g3jWs8iqSR5kR3QSE5OXaMuRgbuBX1/RXZgcwxODqqthZuEu6dv8Ah/mY1qEKqtNf5/J7r5H89/7Tv/Bqd8avBOqSyfDHXvC/jzRo4tyQ315/ZmpE7iBGAy+S5C4JZpIwcnivM/gv+zF8cP2I7jXvhj8cfgj4s1v4J+NJI4vEFtaRRXb6ZOh/danYXELsouIVZj8rFXGVIbgD+lyiv0GPipmtWg8NmEY1Yu2tuWatqrNaJpq9+W9zx8TkrnDlo1LPo5Lmt9zi7+bb876n89//AATa/Zi8W/8ABNr/AILQfDrw/qt1HqPhn4naTftomrwRtGmtabJaSSxs0TAPFKk0CB43UEFMjKlSfv3/AILY/s2L8RPhx4a+JOieEvEnjT4ifDi6LeFLK0vIo9NsbyeSMLeXsUrqHigdI5CVz/qxv/d7yMr/AIOSI5PhL8Jvgt8adJaS38Q/Df4g2kKXCsU8uzuophOCy4YBmiiHBwRkEHivpz9s/wDZwh/bO/Zu8SfDmfxJrnhOy8VW6wXN9o5Vbjyt6s8JLAgxyKDG6/xI7DvWWccQVcVi8Dnld8rknCb1d+SVne27cZK6SV+xy/U5ulXwl+Z6Wfdteq6WTV7a30ufjV+wV+xx4s/b88Y6zoXh3UptL8Jahco3xl+IsV1s1DxldyyySz6bpwMRSO2Xe6kLGiOI1ZyR5cbfsB4d0X4N/wDBLH9lSW2tYtN+Hnw18JkzzPLJLcbGllALs7F5ZpGdwBks3QDgDHk/xv8A2n/hr/wR+/Z28C/DTwrpV74s8TW1omj+FPBWkL5ur63KqEmWVI0Zl3yfO8pTLO7EBjkVwX7NH/BJnx5+2/8AGHTvjt+2VHA2sW0p/sf4VweXcaFo0KIqRmY+bMJBIQ0rwg8uQXYjMK55ti/7TvicZJ0cKr8i3nUtpovPo/hgrJX6zluGjhl7Kj71Xq+kdOu6bW2j2VlZWRz037d37RH/AAVT1y60n9krQLPwb8ObSZ9N1b4jeL4I43LFj+8sYd0hZfLXIDRM+ZF3iLrXtP7Ov/Bv18GPh/4usfHXxM/tr4yfFLzlv7/XfEN65t5rsMG3Lax7IjGCAAkokGBjpxX3FoGgWPhTRLXTdMs7XT9NsIlgtbW2hWGG2iUYWNEUBVVQAAAMACrlfP4jiKpCDw+WR9hT8n78v8c9G35JKPl1frUsrg5e0xHvy212S7Jdu/RvWyvYisbGHTLSO3toYre3hUJHHGgVEUcAADgAVLRRXzZ6aSSsgooooGFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAfHP/BfT4S/8Lh/4JSfFKzit1nvtLhs9WtcoW8t4LyF3YY5/wBV5oz2BPavDfEX/BVgfB3/AIJ3/A/UtJtbnxx8ZPiz4X0+28O+HrIiW6vdTaCGKWeYDLeWszEnCksRt+XJZf0d+JPgDT/ir8Ptb8M6tG02l6/YzWF0gOCY5EKNg+uDxX56f8ENf+CNmpfsdaP/AMLC+MtjFdfFq3ZtO0KJdT+2W/hvSxGVWOML8gldpZ9xBcBSgXaS+fssrxeXvKJU8fq6VTnjDrPnja1+kU4Jya6Pu0eFjMPipYvmotKLilezune8nfzVkvw8vSv+CZX/AATD1D4P+Kbr45/G7Um8c/tB+MofPu7y8Akh8KxyKP8AQ7VfuKypiMyIq4VfLTCbi/25RRXzeZZlXx1d4iu9dklokloopbJJaJHq4fDwoQ5If8O+7CiiiuE6AooooAKKKKACiiigAooooAKKKKACiiigAooooA8z/aN/bI+F37ItvpMvxM8b6F4Lj15pl09tSmMYuzEEMgXg/d8xM/7wrn/gN/wUd+Bn7UHxA/4RX4ffE7wt4s8RfZZLwWFhcF5TDGVDvjAGAXX86/N7/g7+t0b4Q/Ayby4zNHr2pKrMOQptoiQPqVX8q+Yv+DUGyjv/APgpj4jlmjUva/D3UpYiP4WOoaYmf++XYfjX6Zl/BWDr8LVM+nOaqR5vdVuW6kkul+uup5EsZX+tOjG3Kmls72sm9b+btof0T3FxHaW8k0rLHHGpd2Y4CgckmvMP2c/21/hR+11catF8M/Hnh/xpJoKxPqC6bMZPsglLiPdwMbvLf/vk16bfosljMrLuVkYEeoxX4z/8Gh6xQx/tFQrDAs0d7obF4+6t/aQVTxxjaeP9qvk8vymlXyvF4+bfNRdOyVrPnk076X6aWOutWnGvCnG1pXv8vn/mfs7Xkv7RX7eHwe/ZJ13T9M+JXxC8O+DL7VoDc2cOpTmNriMMVLLwRjII/CvWq/FP/g7w8P2d3e/Aq6EMP9oXEmpWRmY/dQta7A3ou4sc/Wq4UyijmmZ08DiJOMZXu1urJvs+xGZYmdCl7SFt0nfXR6d11/A/SDwh/wAFdf2Z/H3ifTdF0f41eBL/AFTWLqOysreO/wDmuJpGCpGuRjczEAfWvffFPijT/BPhjUta1a7hsNK0i1lvb26lO2O2hjQvJIx7KqqSfYV/GNYX2qfDbxxDPaSNp+seHb5Z4mQASWl3by5H0ZXT9K/rQ+C/xct/2uP+CbGh+MJpYrj/AITr4frdXu1lkCTzWJFxGdvG5JTIjDjBUggEYr6zjvgOjkXsKmHqOcKjabdtHo9LJLVHJhcwqVFLms9Lxtf8dX3Wx2H7Ov7X/wAMf2ttO1K7+GvjbQvGdvo8iRXz6bP5gtXcFkD8DBYAkeuDXpFfkX/waGQqP2Wfi1L5cKyHxZBEzIc7lWzjxz/wI/nX66V8fxNldLLczq4Ki24was3vqk9bep3YDESrUVUnvdrTybXn2CvJ/wBoj9uv4P8A7Jet6dpvxJ+IXhvwbfatA1zZwalceW1xGrbSy8Hjdx+Br1iv54/+DrP4zN4z/b70HwnbzW91p3gnwlbC5gJG62vbiaeZySuWGYGtjtPYg4wcnv4J4chneZrBVZOMLSk2t0kvR9bdAx2InSp80LXv1/pH7ZfAn/gox8DP2nPHC+GfAPxR8I+KfEDwtcLp9leBrh41GWZVIBOBycdBXtVfym/8EP8A41W/wE/4KsfB3W7iOT7Lqesnw5LGrBDINSjexjY542pLPFIfaM1/VbfXken2U1xNJHDDAjSO7ttVFAySSegA7118ecJxyHHww1GTlCcVJN2vu01ol27dScDiZ1Yt1bXT6JrS3m31v1PGvjl/wUb+BH7NPjmTwx48+LHgjwx4ihjSabTLzU0F3bo67kaSMZZAykEbgMggjgiuOf8A4LN/ssR/e+OXgFfrfEf+y1/LF8Wfil4g+P8A8StW8YeMNYv/ABD4i8SXJmv7u8m865mJwEUseiooRFAwFVAAAABX6bWP/Bo58ZrmOOW6+I/wtjmwCVUX7qDjnnyhnHTOB06V9xjPDbI8so0v7YxjpzmvK11bmSXK3pdHmvMsS2+VaeUZSt62f42R+7HwX+N/hH9or4d2Pi3wP4g03xR4b1JpFttQsJfMhmMbtG4B9QykH6Vl/tC/tR/D39k/wlZ698SPF2j+DdHv7wWFvealN5UUs5R5BGDj7xWNz9FNeJ/8Ec/2LvGv7AH7HMfwy8cX/h7VL7SdbvbmzutGnlkt5raZxIpxJFGytuZ8rhsHOGIxXwV/wdv/ALTdvD4Y+GvwZhtVnvL25Pi26fhmRFW4tYVC/eGWaY56HbjnBr89yjh6hmOe/wBm4eblScn7ysnyq7vqrbeXyO+eLqQwyqSVpbbPv23213+Z+kPwt/4Km/s7/Gz4iaT4S8J/F7wXrviTXpDDp+n2t5umu3ClyqggZO1Scd8V79X8eP7E3xoi/Zs/bF+GHj6bzPsXhDxJp+qXnkEeZJaxzKZ41J4y8W9ecD5q/sF0bV7fX9Itb6zmjuLS9hSeCWNgyyo6hlYEcEEEHI4r0uPuDaWQV6ccPNzhNPV23VrrRLuhYHGTqycalr6NWuv1fl1/S/zprP8AwWI/Zf8AD2q3Nje/G7wHb3lnK0M0T33zRupIKnjsQarj/gs7+yuVz/wvT4f4/wCv/wD+tX81/wDwUv0W00X/AIKDfG2ytYo7e1g8ZakY0jHC7p2YgD6seK94tv8AggX8ST+wEv7QS+KvBv8AwjMnhRfF39lSJcrqH2Y24uNn3THv2Hg5xkcnHNfbYjwzyHDUKFbF4qcfbW5b8uraWlrd2eXHN67ipaaq+kZPS27tLT5n9EH7Pn7cXwf/AGrtSvLH4b/Ejwh4y1DT4ftNzZ6ZqMc1zBFuC+Y0Wd4TcQNxGMsPUZzPj3/wUR+CH7LnjhfDPxC+JnhXwjr0lsl4tjqNz5cxhcsFfGOhKMPwNfzAf8Exvjtr37PX7fnwp8Q6LrGoaXHJ4n03TtRS1mMP2+wnu4Unt5MYDoyZyrZGVB4IBH2x/wAHZtqo/wCChHgFlRTJcfD63Rj3wuo6gRx+JrhqeF1Cnn9LK51Zezqxcouy5rppWe63Or+0qvI0rcya6aWd+l/J9Wfrkv8AwWf/AGV2/wCa6eAP/A4/4V3HwA/4KE/BP9qnx1ceGfh38SvDHi/XrOzfUJrLTrgySx26uiNIRgfKGkjH/AhX87f/AAS5/wCCJfin/gqJ8M/FHinw5448M+F4fDOqrpT2+pWks807mJZfMHlkBUw4AznJVumOf0i/4JO/8EDPir/wTg/bV0v4iah4y8A+IvD/APZ15puoxWLXdveFJVUoVR4ij4dFJBdcYBya8/iDhLhrL6delDGS9vTvaLtq7XS0j19QpY7FSkvdur9ItaX1d7taan2jf/8ABYv9l3S9VuLG4+OHgGG6tZGilje/wUdSVYHjqCDXrX7P37Tvw/8A2q/CN3r3w58W6N4x0axvG0+4vNNm82KG4VEdoif7wWRDj0YV/IR8aJV1n4m+JNUt7NbfT5NWuTHhMKCXZguQMdPzr9hf+DQr4xrBY/GP4ez3bfPLYeI7G1LDapYSwXDAdckJbdOy/n6HFnhhhcsyeWZYarKTjytp2taTSurK+7+5MnA5pUrOLm1aVuj6rTq/TY/VP9oj9u74O/sl65p2mfEn4ieGPBuoatC1xaW2o3XlyzxqdpcKATtzxk98+hrlvhr/AMFWv2c/jF430/w34X+MHgzXNe1Z2js7G0uy81wyqWIUY5O1Sce1fg1/wcjfG24+L/8AwVR8Xad9qW607wBZWOhWYyGWAGCOaYYxwftE0oJPPHsAOf8A+DeGwhvf+Cwfwljmht5fKfVpFVgMArpN4ysOOoIGPfFFHwvwv+r39r1qsuf2Tqcqtb4XJLa+2j8w/tDESqcsbWvZaN6Xte6l1Wp++Gmf8Fk/2WNWYrF8ePhwpHabVUhz9N+K9q+CXx78GftI+BY/E/gPxLpPizw/NNJbpf6dOJoGkjba6hh3B/x6V/Mh/wAFyP2HP+GHP2//ABVptnHpCeHvGxfxdoVvYQmKPT7S6up1+zFdoVTFJHIoVcqE8vGMkD9C/wDg0s/awl1rwN8Q/grqBiX/AIR+RPE2inIDywzN5V2uOu1JBbkYB5mbJHAPn594f4TD5DHO8vqyqJ8rs0rJPR9Fs9DShj67qRhUtq7PRq2nq+tkfp1+0N+3V8H/ANk7X9N0v4kfEPwz4N1LVoGurO21K6Eck8SttLheTt3cZPGQfQ16F4C8d6P8UPBOk+JPD+oW+raHrtpFf2F7Acx3UEih0kU+jKQfxr8Nf+CxHgGb/gqX/wAF6PCHwG0W5tdNj8M6Pb6Pf3lyS0SAQy6rdSAxqWGYHSFQePNUAlQSR+6PhXwtpvgbwvpui6PY22m6To9rFZWVpbxiOG1giQJHGijhVVVAAHQAV8fnmS4fAYLCVFNutWhzyWloxb93p19eh1YXEVatWalblWi0fd9b66K70W6tdH5Cf8Hf3/JGPgd/2MGpf+kqV8y/8Gm3H/BSfxV/2TjUs/8Agz0qvpv/AIO/dv8AwpT4Hlmw3/CRagAPXNqlfNH/AAacwsv/AAUp8V/3R8N9SOT3/wCJnpP+NfqmStLw6xHrL/0qP+Rw/wDMdL1X/pKP6Hbj/USf7pr8X/8Ag0N/5CP7Sn/X3oH89Vr9oLj/AI95P901+L3/AAaGhhqX7Sm5cf6XoGD686rX5xkv/JO5l60P/S5HbiP97pf9vfkj9pK/GL/g7faMzfAMfxLqF+X47brUD+tfs7X4x/8AB23Gs118AVX/AFg1C/Lf7u61x+uafh3d5/Qt/e/9IkYZ7/uj9Y/mj8//APgur+yPH+x3/wAFFvF2n2SiPR/GBHivTUWRpPLiu5Zi6ksAciZJeOcDHJr9MP8Ag2v/AGt/+Fk/8E4PiR8NLxvMl+EMNzNABEFY2mofbLkDOfnImWc57B1HTGOP/wCDtv8AZnuNV8J/C34uWNqZLfRPtHhvV5gAWRZWSWzz3xuF0PTLr0zz8T/8ECf2pNO/Z7/ao8YaDrEk4tfih4Mv/DtmiEhft4CzQFu3zbJYx33SqB1wf1rE3z7ginUes6aT804Nxfo3H8H5nkVrYZyUXZQv6Ws7J6bJNP5LXQ/Qr/g0cVV/ZT+K3l8L/wAJfGcen+hRV+tVfkj/AMGipY/sp/Fjcu3/AIq+LA9vsUVfrdX5H4h2fEWKa/mX/pKPeyn/AHZesv8A0pkd3dx2FrJPNIsUMKGSR2OFRQMkk+gFfz6/sDfAPS/+C3n/AAUa/aU8e+IFuY/DXiTQL2OwZm8m4tJJmt7ey4GRuS1iZWzkZPev1o/4LQ/tKw/su/8ABNz4n6yc/b9c0e58O6aA5VvtV5BLFGRgZyuS3GPu9RX4D/8ABPr/AILX/FT/AIJsfDHVvB/w68N/DvUNP1rU21a4n1vR7u5uzMYo4ivmQ3UI8sLEpClTgljnmvqOA8hx9fJsZisvgnVny04XfLZXvNptpPomvM4sy9nWrqlPZb79dfv0Xpc+V/Dmu6h8L/H+n6pGm3UfC+pRXgGPuSwyhlH/AH0lf1yeBPjG37QX7AulePmijhk8ZeAo9bkiQYWF7jTxKyAZP3WYjGT06mv5IfiV8Qbz4t/EnXvFN/Dp8N54i1S61O9SyiMVqks0jSukaszFI1ZzhSzEDAyep/ow/wCCE/xxX49f8EU7XTftJudV8GWWseGrks5by9jTSW65PZbeaBR2AX8K+08XsBKrgsNj5L3ozUX6SV279k0l5vXY58HJqclLeUWvVpXX6n82unf8hSEf9N0/9CFf2sR/6tfpX8VOmxkaxar18yePJA6HcK/tWj/1a/SvK8cfiwa/6+f+2Hdlfxz+X6jq/DGWXTP+Ck//AAcz6pcL5ereCPhzZPAFl/dtJFZWRgO3Gdw/tG5Z1ORuQA+x/Zf9pj4sf8KG/Zx8feOAsUjeDvDmoa2qSZ2Oba2kmAOOcEpjjnmv5VP2Gv8Agor48/4J/fEfWPGXgnT/AAfqHibXbB7G+l8Q21xeyLE8qzMFKXETDLIh5znAr5jw5yXF4rD47E4JfvfZ8kNbazerT6NRXdN62Mc5/eSjRkuaPVNb3duunw8ya80eX/Hv4cH4QfHDxl4JZv8AkT9evdEB3BmAtp2i5I74T86/qa/4I3fGJvjp/wAEwPgtr0iqssPhyLR3xn5zYM9jvOSeW+z7j7senSv5c/2kPj9q/wC1L8cNc8fa7peg6brviS4N9qEWi2j2lnJKeWcIzyNuc5LEsckknkmv26/4NK/2itW+IX7NHxH+HeoS7rH4d6tbXWmREktbw6gbmR0Gf4fNhkbjuzHHPP6B4qZbXrcO0MVWX7ym483VJNcr12fvNIxy2bVaF09U1+t2/lb5n5B/8FRTt/4KN/G/B/5nLUP/AEc1fuxo/wC+/wCDaaUH/ln8EAw/8FAr8J/+CoCM/wDwUT+ORwu9fGeofLn/AKbtX7saKPI/4NrLkP8ALu+CGwHPXGkVPiCrZflSf88fyRjgf93kv7j/ACP51fggGPxl8H7WKt/bljhh1U/aU5r9K/8Ag7WCH9vz4elVPnR+AYGyP7p1C/H+Nfmt8EHjHxj8H4Y8a5Y9v+niOv0q/wCDtPL/ALfnw/jVlj8z4fwDd3/5CN+a+0zSN+JsvSV/cq/+2W/Gxzw/iT9If+5DA/4IPf8ABYf4Z/8ABM/4X+PtG+IOi+NtQuvFWqW19ZNoFhb3MaRxwsjeYZbiIq2TnABGB17V+rH/AAT9/wCC3/w3/wCCkn7R994A8A+G/GWnnS/Dlzr9ze65b29uMRXNpAIkWKaXOftO7JIxs96/JH/giB/wRe8C/wDBUf4Y+Ode8aeLvG3hu48K6nBp9tDoMlpGsqvEZC0nnQynOeOMCv1b/wCCbX/BCnwT/wAEx/2kdY+IHhDxz4u8QJrHh2fw/Jp+tw2zGMSXNrP5qywpH0NtjaU535yMc/kviD/qx9cxal7T635/BzWVrJeXfQ9TAvEWiop8l3/L3fne1/mfzxXvgRvE/hj4v36x5j8K3NtqMxz/AKuOW/S0OR7vcRivoX/g3k+Mtr8HP+CqPgmTVNUXSdJ1i01HTrtpP9XJ/oM7xhjg/wDLRFxjua9P/wCCNXwjs/2i9S/a88CSaUmp6lr3ge8axj8tXczRXcTwhd3cTiJgOOVHfmvzg8L+MLzwV4ssdW0yZrW+sWEkEi5+UkY7YPcjrX63K+ZwzDJ5SSStFeSnTstPJ3sfN5fGcaDcPelpJJ7JqMeVel1fur+h9MftYaTaftJfED9qj42aVqEd5oVv8QIrKzcBlN1b6lqF7PbSgEdoNPAPIx5g4Pbs/wDg3XTd/wAFivhOW+9jWdw9v7HvcfrXZ2f7Mq/CD/g3AuvHTTLJcfFH4hWM6RFR+4gsvttmnPu6ytj0b3rjf+Dc4eV/wWH+E/O7dFrA+n/Enva82tWhPh7MadPanGrTXl7OlGL++Sf3nrYWny1E2rNyT/JK3k0k7H6Xf8HUf7FrfFv9lbRfjFp21L/4VyG31Nd2Dc2F3NFEpAxyY5yhABHyyyE5wMfjX/wTl/ba1n/gn5+1f4c+JWkxrdQWkRsNVtCm77XYzMnnRgZHzfKGU5+8i1/Vh+018KdN+Ov7OnjrwZrC/wDEt8UaDe6ZcEIGaNZYHTeoP8S5DD3Ar+OnxrpH/CNeLNY06ORpIrG9ntlZhywSRkGfqBmvl/CjGwzLJq+UYz3owdrP+WetvlJPz18jbMKcY4hwjpzLm9Gnq126P1bZ+0n/AAa0fs3618Vfip8Tv2mPFV42oXl/Pc+HLSaRwZLi7laC6u5iMZG1TCinOD5kgxlc1+1VfN//AASO/Zs039lP/gnh8MfCumyfaPN0tdYurgqFa4nvCbl2bHceYEHsgr6Qr8Y4vzX+0M2q1o/Anyx8ox0X+fzPWyukoYeLj9rX79vuVkfmH/wdT/s+XnxM/YS0PxzarHJH8MtcjurpTu3CG8aO0LADjh3jzu6Akg9j+Qf/AASV/wCChy/8ExP2p7v4jz+HpvGGn6noN34fudOtrxLaVElntpxIrsrDIe2TggZBPNf1O/En4caH8YPh/rXhXxNptvrHh/xDZy6fqFlPny7mCRSroSCCMgnkEEHBBBANfDGof8Gyf7Jt3LMYfC/imximdnWGHxHclIQSSFXeWOBnjJJ4GSa+y4R40yrDZNVyTOacpU5NtcvnbzT0d3e5z4rA1XVdSi7N2fmmlbS+nReutz511H/g7x8J3FhItn8E/EzXEiMsfmeILZVDY4ziInH4Vpf8GjHgC8h+BHxm8bzQCK38ReIrPSYm3E73s4JJX46YH25RkdTkdq9sm/4NgP2UpmTOi+NFVf4R4ilG7jHJxnn2Nfb/AMB/gN4S/Zl+E2i+B/A+i2+geF/D9utrZWcLM+xVGMs7ku7nqXclmPJJNcWe59w9Tyypl+QUpxdZxc3J30g7xtdvW99icPg8R7aNSvNy5b2vbqmvspfj2R19fjH/AMHbtwsdx8AVVo1m+36iTk4bG60x+A+bmv2cr5p/bw/4JPfCP/go5r+g6l8TLfxFdXHhu2ktbBdP1R7SOJZG3OdoBBYkLk/7C+lfM8I5pQy7NaWNxN+WPNeyu9Ytd13OrMsNOvQ9lDuvw1IP+Cx/wMt/2i/+CYXxh0NolnntPDsuu2WELt59hi9jCY53MYNnHUORyDiv5VPA3jG88AeNtJ1zTzJDqmi3sV9bMGKtHJGwYc9uRX9ocVlHFYrb7d0KoI8Md2VxjnPWvgzxr/wbYfss+OfG2ta9ceHvFFtd65eS3ssdrr00cMLyyGRhGvO1ck4HOBwK+z8O+O8HktCrg8wUnTk1JWSetrO6bXRIwx2AlWldJWas/wCv6ei+Xhv/AAaOXLXX7KnxYZk8vHi+IbT1H+hQ/wD1q/WqvDf2Ff8Agnj8N/8AgnV4G1zw98NbXWLbT/EWojVLz+0L9ryRphEkQ2lsbVCoOB3Jr3Kvh+Ks1p5lmtbHUr8s2mr77Ja/cdeAoypUFTnvr+LbPxz/AODsP40ah4k0v4L/AAT8NzG61bxJrEms3dlEd0hYKLSz3AAthmuLjA6EoOpAx+g3we/4JYfAP4V/Cfw74Zl+EHwx1uTQ7CK0kv8AUPC9ldXN7IqAPNJJJGzsztliST1rk/2iv+CLfwQ/ai/afX4v+KrTxU3jZbmyulubLXJraJGtFjWEKi/dAESk7cEnJzk5r6yr0cw4ijHK8Jl+XznH2fNKf2bzk09LPW2yfa2hjQwsvbzq1le+3p6eiXzv3Z/PP/wdE/sa+Df2Yfjp8Ndc+H/hbw/4P0fxdot1bXOnaNYJZWrXNtOpaby4wEDMl0inAHEYruP+DTb4rpL8QPjP8Kr24ZrPxRoNvq1tB5+xI5IHeC4CAEHe63cRJXBxD7cfqv8At0f8EuPhL/wUV1Pw1dfE7T9c1CTwnHPHp62Wqy2aKJihcsqHDH92uCelcJ+zD/wQv+Af7Hvx00n4ieA9P8V6T4j0kSqjPrs00M6SLtZJEb7y9DjI5AzkcV9d/rzl2I4V/sbG88qyi0nZNXUnKOt77WTOaWBqxq81JK17/JvXpppf8j+XO/0vUPBniG40+6tpob3TrlhPHNGytDLG5UqykZGGXocda/cfTv8Ag728Gmyj+1fBLxXFPtUOsevWzqGxyASikjPQ4GR2FfY/7VH/AAQq/Z1/bB+L+r+O/FvhnWI/E2vbDqF1pusT2q3TJGsauYwSgbaigkAZIyckknzX/iGD/ZR/d/8AEj8ZfKct/wAVHN8/14/livYzbjjhXO6NH+16NRzgnpHRJu3Mk1JXTa3auZLA4uP8OXK+tuXW23xJnyT/AMFWf+C2+n/tm/8ABJOGbwzpGueB9S8ceMDoNxp0t4lxJd2FrG01wd6AZQs1qrLgf6wjJGc/bH/BK3/glH8NPhr+wF8PNN+JXwj+HuueOrqxkvtavNX8N211evJPPJKiO80Zf93E8ceDjGzoKr6//wAG4n7M3iPwVofh+60vxk2l+HPtRsIl8QyqYjcSJJKScZJJRRk9h7Aj7g8HeF7fwR4V0/R7OS7ltdNgS2ha6naeYoowNzsSzHA6k5r4bOuIsFDLoZfkjnTj7SU3fR9oq6k27K97mmAweJ9q6mMs373W+l/d0tvyrW1km2tdz8U/+Do79hvwT8GPhf8ACvxl8OfAfhDwXBbahfabq/8AYOjwact15qQNbmQQoqttMcoBbkeYa+ff+DX79oiH4Nf8FG7rQdT1I2Oj/ELQJtFSF5/LgudRSeGS3JU8NJ8s8aDr+/YDqQf3Y/bZ/YI+Hv8AwUB8CaX4b+I1vrF1pOj3v2+GKw1B7TdJtx85X7w74Pf8a+f/AIW/8G637Mvwd+J+h+MND0PxZb634b1W21qwkbxDcMsNxBKsqHGem5Rkd6+iyvjrL3wxPJcyc5Tlz2aSaV9Y6uSbtL8B1cFX9tKdKy1TXyS0t5tP7+5+A/8AwVC8mX/go78bXhZcSeMdSDOGyuVmYH8QQR7HNfblx/wcGfD8f8Enz8AYfhz4tfxLF8Ph4L/tE3tt9gM32IWrXWd5k25y+3ZnoMjrX6JePf8Ag2+/Zj+JfjfVvEOsaR4yutU1u9l1C9kbxJcHz5pXZ5GOecszEnn+uceX/g2F/ZRkhZV0HxjGWP3l8Rz7h+eR+nevbxnHXC2OwuGoY6FSTo8rVkl7yS7S1VzCnl+IhDlj2t01Xz7n4A/sJ/D2b4tftvfBnw7a27Tf2t4x0e3lVYjKoi+2xGV2UYyqxhmPI4U5I6j78/4O1zGf29vAP8U0fgCBiA3IB1G/AyPTg81+s37F3/BGj4A/sE/Eabxh8P8Awrex+KJLJtPXUdS1Oa+khhZlZhGrt5aMxRcsqhsAgEAsCz9tP/gjb8Ef2/fi3b+NviRp/iLUNdtNNi0iF7TWJbWKO2jeWRUCLx9+aRs9SWrmr+JmX1eIaOY8slSpwlFaJtyl1tfTZdehrHLpqLdtbr7knv8Ae/60X4of8EZ/+C0mh/8ABK/wB450PWPBGr+M5PF2pW9/DJY6jFarbCOJoypDgkk5zxX6Nfsd/wDByxo/7Z37UXgf4Y6D8H9Z0268Y3rW0l9d+IInWwjWNpGk8uOEmTCqxxlRxyQMkdof+DYT9k8iP/in/GAK4yR4jny/1+vtivUv2QP+CI3wD/Yd+LFj428A6Pr1v4i061ntILi91aS7VEmxvO1vl3cYBxwK8viTP+D8w9vi40ajxE1o22o81kldKW1l9/QingsbT92nUaXa0bK+r6X/ABPzX/4NbAtx/wAFBPjI3yvHJ4aufmByGB1G2r8vP2n/AIdw/Bv9pT4jeD0TcfCfinUtEQKOn2a7khAH/fH41/UN+xN/wSI+C/8AwT8+Jmq+Lvhvpmu2Os61pz6XdPeatLdRvC80cxwjcBt8S8jtkd64L47f8G+/7Nv7RXxr17x94j0LxI2veJr9tT1H7Lrk0EE87Nudgg+7ubJO0jqcYr1Mt8S8vw2eYnHtS9nVhBJWV+aC66+b11M6OU1aVFU1rZ97dIr9O58V/wDBRv4Tf8KT/wCDYb4J6G3yStNomqSqVKtHJex3N46EHncrXBU+4PSvin/g3Y+T/gsH8J8H7q6vk4650i8/xr+hv9sj9gb4d/t1fBLSfh746tNU/wCEX0bUbfUre20y9ayIkgjkijQlRzGFkYbfp0wK8Y/Z1/4IIfs8/stfHfw38RvCOmeKrXxJ4Vne4sWm1yWSHc8ckZ3pgbhtkPBPOBnPOeHK/EDAU8jxmBxKl7Ws6rVkmv3i6u629Dq+o1YuPKl7vL17JfPofYHixtvhbUicDFpKcnt8hr+Mv4vN/wAXL8UHBb/ibXmSOn+ufGK/s28UeHrfxd4a1HSbozLa6pbSWkxikMcgSRSjbWHKtgnBHINfA83/AAbI/srXccv2jRfGdxJcSPJLI/iKbfIz5LEkAdznjH5cV5PhzxfgMi+sPGqT50rcqT2vvdruVjsHVq4mNWGyTX3tP9D7A/Y94/ZP+Gn/AGK+nf8ApNHXo1Yfw0+H+n/Cj4faL4Z0r7QdN0GzjsbXz5PMk8uNQq7m7nAHNblfm+Imp1ZSjs23+J6GFpyp0YQlukl9yCiiisToCiiigArzvxz+138J/hh4putD8TfE/wCHfh3WrHb9o0/U/EdnaXVvuRXXfFJIGXcjKwyOQwPQivRK/BT/AIOW/wDggda6w/x4/bK/4WlcRzLb6Ze/8Il/wjoZSY47HTdv2z7SDzt8zPk8Z28/eqoRu7AftL4S/bD+Efj7xFa6PoPxS+HOtatfSeTbWVh4lsrm4uHwTtSNJCzNgE4AJ4r0av54f+CLv/Bvj4Y8H/Cj4J/tr+KPjoNB0HwyieP9S0a48NolvZwWckkjq94brhAsO4v5OcZ4zzX0Zef8HpfwDtvjNNoqfDn4lT+D47z7MviJPsvmSR5wZxaFw3l5yQC+/bg7Q3yDT2LekOgH7JY5rn5vi14VtviJD4Qk8TeH4/FlxAbqLRG1GEajJEASZFt93mFMKx3BccH0q14G8eaH8T/CGneIPDWsaX4g0HWIFubHUtNukurS9ib7skcsZKOp7FSRX44/EVFH/B6Z4CxgsfAsrHK4wf7Evx/Lv+FTCF736ID9oLy8h0+0luLiWOCCBDJJJIwVI1AyWJPAAHJJrI+H3xL8OfFrwzHrXhXxBonibR5naOO/0m+ivbWRlOGUSRsykg8EA8Gsb9pHVND0T9nbx9e+JtNl1jw3Z+HNQn1awiba99aLbSNNCpyuC8YZQdwwT1HWvyt/ZU/4LDfAL/gnv/wRZ0v4zfB/9n/xd4c+Gt58RJ/Ddz4Yi1x725s7uSBpHvXubh5SY28mKPDMMM6KO2ZjBtXSA/Yaivj/AP4KH/8ABYfwn/wT/k+B8M3hPxB42uvj1qi6boMelyxRrGGNqBI5Yktn7XFtVA2eeRxnzL/grH/wcdfCH/glX8VtP8AahomsfELxzJCt1qmmaLeW8aaDE6B4xcu7ZWWRWR0j2ZMbByVBTdXsZ2Ttv+m4H6G1h/EH4n+GvhLoS6p4q8RaH4Z0x5lt1u9Wv4rKBpWztQPIyruODgZycV5L/wAE5f8Agof8P/8Agp9+zJY/FL4dNqUOk3F5Ppt5p+pJFHf6Vdwkb4J1jeRFYo8cq4Y5jmjbjOB+fv8Awefuyf8ABMHwUV4P/Cx7H/0g1Cko+9yyA/XaGdLmFZI2WSORQyspyrA9CD6U6vzh+P8A/wAF6fCn7H/jLwX8EfBvws+J3x2+LFr4X07UNU0DwXpxupNJgeyilXzNoeQuY5In2rGVCSKSwJAPsv8AwSm/4LGfD3/gq74V8SN4b0bxF4L8W+Dbo2ut+GtfWNLy27CVNjEvHk7CWVGVwVKj5S1yw81Hmtp/mB9K/Ev4xeEfgxpNvf8AjDxV4b8J2N1N9nhudZ1KGwhmkwTsVpWUFsAnAOcA1xZ/b1+BgCn/AIXR8J8McD/irtP5/wDIvsfyrwH/AILW/wDBHCz/AOCxvwo8G+Grj4gXXw9l8HapNqUV3Fo66otyJIhG0bRmaLHQEEN+Ffgj+zR/wbwW/wC0P/wV5+MX7LLfFybSYvhPojawviZfDImbVCH09fLNr9qUR/8AH997zW/1XT5uJjGHLd7gf1YeC/G+i/Ejwxaa34d1jS9e0W/UtbX+nXSXVrcAMVJSSMlWAYEcE8gjtWpX45+Kf+CtHwZ/4Nj/AIFfD/8AZNuG8UfG7xp4IsJb7ULvSorTToLOO/vbu9WO4DTyNDcYmRlhIbMUkchYB1B+4v8AglD/AMFefhn/AMFdvhDrXiXwFb6xoeqeF7uKx1vQdYMAvrF5IhIkyiKR91vIfNSOVthdoJRsXbSdNpc3QD6M+IfxQ8M/CDw//a3izxFoPhfSmlWAXmrX8VjbmRs7U8yRlXccHAzk4NbkE8d1AkkbrJHIoZHU7lYHkEHuDX5I/wDB58cf8EpfCeen/CzNNz/4LtUr9PP2cZ2uf2efAcjrseTw7p7MuPuk20ZxStpcDtKK+K/+CvH/AAXI+F3/AASA0zw5a+LNN1nxd4u8WxS3Om6Do80CzR28bojT3LSODDE25xG2xvMeKRR91itz/gl//wAFuvhH/wAFQvgh4w8YaCNS8FzfDmFbnxVp+vPEh0iBklkW481GKvAUglO87SPLbKjjNeyna9gPsiivxmi/4PWvgI/xSXT2+F/xTj8JNL5f9sn7EboLt++bTzsY38Y87O35sZ+Svrj/AIKuf8F0PAP/AASf1D4QyeJPDOueMtC+LH2yeHUtDuoCtja2xsy0wVyBNuS8VlAZQdn3ucivYzuo21A+4aK/LrxT/wAHQ3gjwz/wT4sf2hJfg58SLfRdQ8dDwRBpt88FrLclrOe7W8ilOUki2Q7CByHJGSFyc74Af8HcX7Pnx+/bF0r4Y2/h/wAX+HvDuvXg07T/ABjrL2ttYmcr8hmi8wtDE75RXLE5ZCyqC21KjNuyX9fqB+q1FFFZAFFFFABRRRQAUUUUAFfEH/ByECf+CJfx7x/0CrLr/wBhOzr7fryr9tz9kPw5+3p+y14u+Efi6/1zS/DvjSCK3vbrR5oob6JY54px5bSxyICWiUHcjcE9Dgio2TTYH5Q/FeDVJP8AgyktV0lbj7UPB2lGTyfvfZx4htjcZ/2fJEm7/ZzXg4+M/wCwXP8A8G01j4XvJdCb4iQ6C/kaaEm/4SAeOTZXAS5fZ85txcNIQ7nyBAyKeSqV+537NH7FHgn9mP8AY30H4F2cN14r8B6Ho8ugvB4kWC9fVLSXzPNiuVWNIpFdZHVl8sKVOCDzn4C1X/gzs/ZP1T4t3HiZdU+LFrp1xqTagPDkGtWa6TEhk3/ZVzaG4EGPkA87eF/jzzXdhsRGHuttK99G199unfvoGp7H/wAGw1tdWn/BDX4GreLIsjRa06CTr5ba5qBjP0KFSPbFfGn7RXxO8N/B/wD4PIPBfiDxb4g0Xwvodn4GZJ9R1a9jsrSEvo18qhpZGVV3MQBkjJIHU1+2XhTwnpXgLwzYaLoemafoujaVAlrZWFjbpb2tnCgCpHHGgCoigABVAAA4r4H/AOCjn/Btv8Ef+Cnf7S118U/Hni34raPr95p9tpz22g6jYQWYjgUqhCzWcr7jk5Jcj0ArljKLm3LZ3/4AHuH7Sv7YHwn+N/7Jvxi0XwX8Tvh74w1r/hA9cnGn6P4itL65Ma2MwZvLikZtoyMnGBkV+V//AAR0/Y9vv26f+DVz4vfC3R1V9a8TeI9Sn0tJLgQK15avp93AjOQQqtLboDnqGIyM5H1/+x7/AMGtvwD/AGJ/iVrHinwr4z+MN/qGteG9T8LzJqmp6dLEltf27W8rqI7GMiRVYlSSVBAyrDivqn/gmt/wTj8Ff8Et/wBm/wD4Vf4B1bxTrWgnVbjVzceILi3nu/NmWNWXdBDCmweWuBszyeTxhxqRiu+q/r5gfjP+xn+0T4U/4K8ft2/8E3fBOm/2teQfs4+An1vxaWkEDWmrafDFHDyR+8DXem2UpC5zFdAfKwfb4L8aYvH+nf8ABw9+01H4Z+LHwh+Dfie6v9QjTVPibZRXGm3lk5gdYIjPaXUSSNCI2UsqEorKrfNtP7of8E1P+CJPwf8A+CWPxL+IHiv4e3nivVtV+IbRC4bX5bO4GkxRyTSeTaNDbRPHG5mG5WZtwhi7rk87/wAFNv8Ag3w+AP8AwVQ+JOmeMvGi+KPCXi2yhaC81bwlNZ2VzrabY0jF4ZraYTGJYwqNgMqnbkqFC9ksZTctL29d2r6/O/8AW4arU+Rf+DO74baP8P8A4ZfHRtB+Knhf4iWN9renmS10TTNSs4tMkVLlfNb7ba2+fPXaVEYO1YxuCk7R0v8Awehf8ovvBf8A2Uax/wDSDUK/Qn/gnn/wT5+Hv/BMr9mux+F3w1g1H+xLW8n1G5vdSkjl1DVLqZhunuJI441dwixxghBiOGNf4c1g/wDBTr/gmN4D/wCCrPwI0v4f/ELWPF2i6Lo+tRa9FN4dube3uXmjhmiCs08Ey7Ns7kgKDkDnGQeSpUUqrlJ6d/6/AOh+cn7YX/BKz9oDRP2zNB/aL/Y8+L3hvQfi5438A2C+IvC2sX1ol3cWdrZadaq1rFNDJHLbOba1EgnwEm2ESEOAn0L/AMEP/wDgr18Sf2w/jN8UPgN8f/Bek+Evjp8K2a61H+w4VXT7i1Q29u3msLiZTdCaTJaJvKZGXaF2893+2B/wb6fBb9rz4xeGfiL/AMJF8UPhn8QvDdjDp/8AwkvgXWoNK1LUkhgjghe4la3kJkSKJUDpsO3g5AUD0/8A4Jnf8EmfhL/wSq+HOraH8OrfVdU1LXr173VPEevtb3Wt3+4IFhkuIoYv3KbAVjChQzO3LMxNSqxdOz39PXz9APpqvxj/AOCav/K3B+2F6/8ACFyf+jtAr9nK+Y/gf/wSk+HvwC/4KMfEn9pvR9a8ZXXjr4o6W2k6rp95dWz6RbxFrNt0EawLKrZsouXlcfM/HIxzqVk0B+P/AOwj8QvhN8Jv+Dlf9p6//aavNN0fxd/ampjwdf8Aihgthbo0mUDM37tWbTTEIjJ8vl7lBDsgOt/wQBTwZ4t/4OIPj1rn7PtpfR/AmLRb3EkKvFZBpZ4DHtVjkRNOtyYVIBEYHAwQP0Z/4KX/APBu9+z/AP8ABUn4v2vj7xp/wl/hTxhHaR2V5qfhS6tbOTV448iM3Qmt5lkkRSEEmA+xI03FUUD1n/gmb/wSk+Ev/BKH4Vat4X+F9nqkz+ILxL3VtZ1mSG41XUmRAkaSTRxRgxR/OUjChVaWUgAuxPZUxKkpSTfvW0u7ddvvd+/5HSx8R/8AB59z/wAEpPCn/ZTNN/H/AIl2qV9q/s8f8FIP2fYf2fvAqz/HL4SwzL4f09Xjn8W2McqN9njBDK0isrA8EMoI7gVf/wCCnf8AwTJ8C/8ABV39nzTvhv8AELWPF2i6HpuuweIIp/Dtzb29008UNxCqs08Ey+WVuHJAUHIXkDIPwUf+DKr9l4t/yUH49hfQaxpP/wAra5Y8vLZgfJ//AAcJatq2v/8ABwj8D9U8J/ED4d+CLnVPAelXHhrxb4rhS+8OWrPcan5E0pMFxGUeQgJIY2jRpI3LIql1rf8ABIHwz4N+HP7ZH7a/jD4pfFb4a/Gq1s/hH4pPj7QPAmnX9nDr9qs1pJqE1tJ9ktLQxkRzQhoZF3PPvjzGfMr9XP2x/wDggD8B/wBuL9nD4WfDrxifFlt/wp/QrTw3oHiTTLu2g1w2VvDFCI55Wt3ikDCFWIMQUMzlAm41vf8ABP7/AIIffAr/AIJ0/Avx/wCAfCen654m0v4pWzWHim68TXUV1daxaGOaIWrmKKKMRBJ5hhUBPmEkk4x2QxKjT5bvbbX+tvw0A/m5/bO/a41b9oH/AIJYfD/Q9Isf2ePhv8KfDni+5TQPAHhubULzxjBLi5eS5u5rx55DBm4c7jKgcyxgKdgCfpd/wWw8Haf8Rfjv/wAElPD+sW632k63rFjp97buOJoJrjwzHIrezKxFe++F/wDgzt/ZV8MeBvFejnWvi1qVx4ntobaLVL3VdPkvNDEdzFOWtCtksau/leWzOjkxySKNpbNfUnxs/wCCNvw5+Puv/sv6nr/ij4hPffsnzWlx4XlivrQNrMls2nsraiWtm80s2mwljD5Od8mMZXaVMRBuLXRfjrt+Aj4x/wCD1LbF/wAEx/hyoUKo+J9kBjtjSdVrxD/g6F/Yt+F/7LVx+x7J4A8H6b4Zk07XP+EXha0Lj/iXwTw3EUTAsQxE1xO5dgXZpWJY5r9Yv+CoX/BLvwD/AMFZfgRovw9+ImseLtF0fQ9fi8RQT+Hbm3t7p547e4twjNPBMvllLlyQFByq/MACDR/4KSf8Enfh7/wVDm+HL+Pdc8baL/wrLVpNY0weH7u2gFxM/lZE/nW825R5K4C7Ty3J4xz08RKK5U3br/XUZ9QUUUVzgFFFFAH/2Q==" class="img-responsive logo-s" width="100px">\
                         </div>\
                         <div class="col-sm-8 text-right">\
                            <address>\
                                <h3 style="text-align:center;margin-bottom: 0px;font-weight:600;">U N ACADEMY</h3>\
                                <h4 style="text-align:center;margin-top: 0px;margin-bottom: 0px;font-weight:600;"> For Kids </h4>\
                                <p style="text-align:center;line-height: 1;">625/B, Unit 2 Latifabad Hyderabad</p>\
                            </address>\
                        </div>\
                    </div>\
                </div>\
            </div>\
            <div class="row">\
                <div class="col-sm-12">\
                    <div class="panel panel-default">\
                        <div class="panel-body">\
                            <div class="table-responsive">\
                              <table class="challan-no">\
                                <tbody>\
                                    <tr>\
                                        <th><span>Challan No</span></th>\
                                        <td><span>'+obj["month"].replace("-","")+'</span></td>\
                                    </tr>\
                                </tbody>\
                            </table>\
                            <table class="enrol">\
                                <tbody>\
                                    <tr>\
                                        <th><span>Enrol No</span></th>\
                                        <td><span>'+obj["gr_num"]+'</span></td>\
                                    </tr>\
                                </tbody>\
                            </table>\
                            <div class="clearfix"></div>\
                            <table class="table table-condensed mt-3">\
                                <tbody>\
                                    <tr>\
                                        <td>Name of Student</td>\
                                        <td>'+obj["name"]+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>Father Name </td>\
                                        <td>'+obj["f_name"]+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>Class</td>\
                                        <td>'+obj["class_id"]+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>For the Month of</td>\
                                        <td>'+obj["month"]+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td><span class="">Issue Date: </span> '+obj["issue"]+'</td>\
                                        <td><span class="">Due Date: </span> '+obj["due"]+'</td>\
                                    </tr>\
                                </tbody>\
                            </table>\
                            <hr>\
                            <div class="clearfix"></div>\
                            <table class="table table-condensed ">\
                                <thead>\
                                    <tr>\
                                        <td width="10%"><strong>S#</strong></td>\
                                        <td width="60%" ><strong>Description</strong></td>\
                                        <td width="30%" class="text-right"><strong>Amount</strong></td>\
                                    </tr>\
                                </thead>\
                                <tbody>\
                                    <tr>\
                                        <td>1</td>\
                                        <td>Admission Fee</td>\
                                        <td class="text-right">0</td>\
                                    </tr>\
                                    <tr>\
                                        <td>2</td>\
                                        <td>Security</td>\
                                        <td class="text-right">0</td>\
                                    </tr>\
                                    <tr>\
                                        <td>3</td>\
                                        <td>Annual Charges</td>\
                                        <td class="text-right">'+obj["annual_fees"]+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>5</td>\
                                        <td>Tuition Fees</td>\
                                        <td class="text-right">'+obj["monthly_fees"]+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>6</td>\
                                        <td>Miscellaneous</td>\
                                        <td class="text-right">'+obj["misc_fees"]+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>7</td>\
                                        <td>Transport Fees</td>\
                                        <td class="text-right">0</td>\
                                    </tr>\
                                    <tr>\
                                        <td>8</td>\
                                        <td>Arrears </td>\
                                        <td class="text-right">'+obj["arrears"]+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td>9</td>\
                                        <td>Current Penalty</td>\
                                        <td class="text-right">'+obj["current_penalty"]+'</td>\
                                    </tr>\
                                    <tr>\
                                        <td class="thick-line"></td>\
                                        <td class="thick-line text-right"><strong>Grand Total</strong></td>\
                                        <td class="thick-line text-right">'+total+'</td>\
                                    </tr>\
                                </tbody>\
                            </table>\
                            <h3 class="text-center"><strong>INSTRUCTIONS</strong></h3>\
                            <ol>\
                                <li>Last date for submission of fee is 10th of each month.</li>\
                                <li>Late Fee will be charged @ 10/- per day.</li>\
                                <li>Penalty will be charged by U N ACADEMY through next month fee challan.</li>\
                            </ol> \
                            <div class="mt-5">\
                                <div class="col-sm-4 dated">\
                                    <h5 class="ml-5"><strong>Date</strong></h5>\
                                </div>\
                                <div class="col-sm-2">\
                                </div>\
                                <div class="col-md-6 text-right sign ">\
                                    <h6 class="signature"><strong>Signature of Receiver</strong></h6>\
                                </div>\
                            </div> \
                        </div>\
                    </div>\
                </div>\
            </div>\
        </div>\
    </div>\
    <div class="col-sm-6">\
        <div class="row">\
            <div class="col-sm-12">\
                <div class="invoice-title">\
                    <h6 class="pull-right">OFFICE COPY</h6>\
                </div>\
                <div class="row">\
                    <div class="col-sm-4">\
                     <img src="data:image/jpeg;base64,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" class="img-responsive logo-s" width="100px">\
                 </div>\
                 <div class="col-sm-8 text-right">\
                    <address>\
                        <h3 style="text-align:center;margin-bottom: 0px;font-weight:600;">U N ACADEMY</h3>\
                        <h4 style="text-align:center;margin-top: 0px;margin-bottom: 0px;font-weight:600;"> For Kids </h4>\
                        <p style="text-align:center;line-height: 1;">625/B, Unit 2 Latifabad Hyderabad</p>\
                    </address>\
                </div>\
            </div>\
        </div>\
    </div>\
    <div class="row">\
        <div class="col-sm-12">\
            <div class="panel panel-default">\
                <div class="panel-body">\
                    <div class="table-responsive">\
                      <table class="challan-no">\
                        <tbody>\
                            <tr>\
                                <th><span>Challan No</span></th>\
                                <td><span>'+obj["month"].replace("-","")+'</span></td>\
                            </tr>\
                        </tbody>\
                    </table>\
                    <table class="enrol">\
                        <tbody>\
                            <tr>\
                                <th><span>Enrol No</span></th>\
                                <td><span>'+obj["gr_num"]+'</span></td>\
                            </tr>\
                        </tbody>\
                    </table>\
                    <div class="clearfix"></div>\
                    <table class="table table-condensed mt-3">\
                        <tbody>\
                            <tr>\
                                <td>Name of Student</td>\
                                <td>'+obj["name"]+'</td>\
                            </tr>\
                            <tr>\
                                <td>Father Name </td>\
                                <td>'+obj["f_name"]+'</td>\
                            </tr>\
                            <tr>\
                                <td>Class</td>\
                                <td>'+obj["class_id"]+'</td>\
                            </tr>\
                            <tr>\
                                <td>For the Month of</td>\
                                <td>'+obj["month"]+'</td>\
                            </tr>\
                            <tr>\
                                <td><span class="">Issue Date: </span> '+obj["issue"]+'</td>\
                                <td><span class="">Due Date: </span> '+obj["due"]+'</td>\
                            </tr>\
                        </tbody>\
                    </table>\
                    <hr>\
                    <div class="clearfix"></div>\
                    <table class="table table-condensed ">\
                        <thead>\
                            <tr>\
                                <td width="10%"><strong>S#</strong></td>\
                                <td width="60%" ><strong>Description</strong></td>\
                                <td width="30%" class="text-right"><strong>Amount</strong></td>\
                            </tr>\
                        </thead>\
                        <tbody>\
                            <tr>\
                                <td>1</td>\
                                <td>Admission Fee</td>\
                                <td class="text-right">0</td>\
                            </tr>\
                            <tr>\
                                <td>2</td>\
                                <td>Security</td>\
                                <td class="text-right">0</td>\
                            </tr>\
                            <tr>\
                                <td>3</td>\
                                <td>Annual Charges</td>\
                                <td class="text-right">'+obj["annual_fees"]+'</td>\
                            </tr>\
                            <tr>\
                                <td>5</td>\
                                <td>Tuition Fees</td>\
                                <td class="text-right">'+obj["monthly_fees"]+'</td>\
                            </tr>\
                            <tr>\
                                <td>6</td>\
                                <td>Miscellaneous</td>\
                                <td class="text-right">'+obj["misc_fees"]+'</td>\
                            </tr>\
                            <tr>\
                                <td>7</td>\
                                <td>Transport Fees</td>\
                                <td class="text-right">0</td>\
                            </tr>\
                            <tr>\
                                <td>8</td>\
                                <td>Arrears </td>\
                                <td class="text-right">'+obj["arrears"]+'</td>\
                            </tr>\
                            <tr>\
                                <td>9</td>\
                                <td>Current Penalty</td>\
                                <td class="text-right">'+obj["current_penalty"]+'</td>\
                            </tr>\
                            <tr>\
                                <td class="thick-line"></td>\
                                <td class="thick-line text-right"><strong>Grand Total</strong></td>\
                                <td class="thick-line text-right">'+total+'</td>\
                            </tr>\
                        </tbody>\
                    </table>\
                    <h3 class="text-center"><strong>INSTRUCTIONS</strong></h3>\
                    <ol>\
                        <li>Last date for submission of fee is 10th of each month.</li>\
                        <li>Late Fee will be charged @ 10/- per day.</li>\
                        <li>Penalty will be charged by U N ACADEMY through next month fee challan.</li>\
                    </ol> \
                    <div class="mt-5">\
                        <div class="col-sm-4 dated">\
                            <h5 class="ml-5"><strong>Date</strong></h5>\
                        </div>\
                        <div class="col-sm-2">\
                        </div>\
                        <div class="col-md-6 text-right sign ">\
                            <h6 class="signature"><strong>Signature of Receiver</strong></h6>\
                        </div>\
                    </div> \
                </div>\
            </div>\
        </div>\
    </div>\
</div>\
</div>\
</div>\
</div>'
    
    $(".print_pdf_show").append(html);

  });

    printJS({printable:'printSection',type: 'html',scanStyles:false,style:'\
@media print { body {\
    box-sizing: border-box;\
    margin: 0 auto;\
    padding: 5px;\
    width: 21cm;\
    height: 29.7cm; \
    background: #FFF;\
    font-size: 12px;\
    box-shadow: 0 0 1in -0.25in rgba(0, 0, 0, 0.5);\
}\
address{\
    font-style: normal;\
}\
address h2{\
    margin-top: 0;\
}\
address h3{\
    margin-top: 0;\
}\
.mt-2{\
    margin-top: 20px;\
}\
.mt-3{\
    margin-top: 30px;\
}\
\
.mt-5{\
    margin-top: 45mm;\
}\
.logo-s{\
    margin-top: 10px;\
}\
table.challan-no{\
    float: left;\
    width: 49%;\
}\
table.enrol{\
    float: right;\
    width: 49%;\
}\
table.enrol th, table.challan-no th {\
    width: 60%;\
    background: #EEE;\
    border-color: #BBB;\
    border-radius: 0.25em;\
    border-style: solid;\
    border-width: 1px;\
    padding: 0.5em;\
    position: relative;\
    text-align: left;\
}\
table.enrol td, table.challan-no td {\
    width: 30%;\
    border-color: #DDD;\
    border-radius: 0.25em;\
    border-style: solid;\
    border-width: 1px;\
    padding: 0.5em;\
    position: relative;\
    text-align: left;\
}\
.table > tbody > tr > .no-line {\
    border-top: none;\
}\
.table > thead > tr > .no-line {\
    border-bottom: none;\
}\
.table > tbody > tr > .thick-line {\
    border-top: 2px solid;\
    border-bottom: 2px solid;\
}\
.dated, .sign{\
    border-top: 2px solid;\
    margin-top: 60px;\
}\
   .col-sm-1, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-md-6, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-sm-10, .col-sm-11, .col-sm-12 {\
        float: left;\
   }\
   .col-sm-12 {\
        width: 100%;\
        display: block;\
        padding: 15px;\
   }\
   .col-sm-11 {\
        width: 91.66666667%;\
   }\
   .col-sm-10 {\
        width: 83.33333333%;\
   }\
   .col-sm-9 {\
        width: 75%;\
   }\
   .col-sm-8 {\
        width: 66.66666667%;\
   }\
   .col-sm-7 {\
        width: 58.33333333%;\
   }\
   .col-sm-6 {\
        width: 48%;\
        margin: 1%;\
   }\
   .col-md-6{\
      width: 50%;\
   }\
   .col-sm-5 {\
        width: 41.66666667%;\
   }\
   .col-sm-4 {\
        width: 33.33333333%;\
   }\
   .col-sm-3 {\
        width: 25%;\
   }\
   .col-sm-2 {\
        width: 16.66666667%;\
   }\
   .col-sm-1 {\
        width: 8.33333333%;\
   }\
body {\
    padding: 5px;\
    width: 21cm;\
    height: 24.7cm; \
    background: #FFF;\
    font-size: 12px;\
    box-shadow: none;\
}\
@page {\
     size: 8.27in 11in;\
 }\
 .table {\
margin-top: 7mm;\
}\
}\
}}'});
}

function add_std(){
  window.open(SERVER_URI + '/add_std_form','_self');
}

function fees_mng(){
  window.open(SERVER_URI + '/fees_page','_self');
}

function class_mng(){
  window.open(SERVER_URI + '/class_page','_self');
}

function fees_his(){
  window.open(SERVER_URI + '/fees_history','_self');
}
function add_class(){
  window.open(SERVER_URI + '/add_class','_self');  
}
function addStudent(){
  var isEmpty = false;
  //var values = $("#stdForm").serialize();
  var data = {};
  $('#stdForm').find('input, textarea, select').each(function(i, field) {
      data[field.name] = field.value;
  });

  var today = new Date();
  var dd = today.getDate();
  var mm = today.getMonth(); //January is 0!

  var yyyy = today.getFullYear();
  if (dd < 10) {
    dd = '0' + dd;
  } 
  if (mm < 10) {
    mm = '0' + mm;
  } 
  var today = mm + '-' + dd + '-' + yyyy;
  data['today_date'] = today;
  console.log(today);
  debugger;
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
        "url": SERVER_URI+"/addStudent",
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
          window.open(SERVER_URI + '/add_std','_self');
      });
      swal(
        'Saved!',
        'Request has been saved.',
        'success'
      )
    })
  }
}


function promote_std(){
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
      "url": SERVER_URI+"/promote_std",
      "method": "GET",
      "headers": {
        "cache-control": "no-cache"
      }
    }
    $.ajax(settings).done(function (response) {
      swal(
        'Saved!',
        'Request has been saved.',
        'success'
      )
    });
  })
}

function std_alumnai(){
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
      "url": SERVER_URI+"/std_alumnai",
      "method": "GET",
      "headers": {
        "cache-control": "no-cache"
      }
    }
    $.ajax(settings).done(function (response) {
      swal(
        'Saved!',
        'Request has been saved.',
        'success'
      )
    });
  })
} 

function addClass(){
  var isEmpty = false;
  //var values = $("#stdForm").serialize();
  var data = {};
  $('#classForm').find('input, textarea, select').each(function(i, field) {
      data[field.name] = field.value;
  }); 
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
        "url": SERVER_URI+"/addClass",
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
          window.open(SERVER_URI + '/add_std','_self');
      });
      swal(
        'Saved!',
        'Request has been saved.',
        'success'
      )
    })
  }
}


/////////////////////////////////Delete Employee//////////////////////////////////////
function delStudent(stdId){
  var obj = {"stdId" : stdId};
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
        "url": SERVER_URI+"/delete_student",
        "method": "POST",
        "headers": {
          "content-type": "application/json",
          "cache-control": "no-cache"
        },
        "processData": false,
        "data": JSON.stringify(obj)
      }
      $.ajax(settings).done(function (response) {    
          getClass();
      });
      swal(
        'Deleted!',
        'Employee has been deleted.',
        'success'
      )
  })
}

function delClass(stdId){
  var obj = {"stdId" : stdId};
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
        "url": SERVER_URI+"/delete_class",
        "method": "POST",
        "headers": {
          "content-type": "application/json",
          "cache-control": "no-cache"
        },
        "processData": false,
        "data": JSON.stringify(obj)
      }
      $.ajax(settings).done(function (response) {    
          getClass();
      });
      swal(
        'Deleted!',
        'Class has been deleted.',
        'success'
      )
  })
}