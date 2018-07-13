var count = 0
var arrEven = []
var arrOdd = []
var firstInput = [];
var secondInput = [];

$(".leftCol").sortable();
$(".leftCol").disableSelection();

$(".rightCol").sortable();
$(".rightCol").disableSelection();

$("#addAdditionalSponsor").click(function(){
  var item2 = `
  <div class='row m-0'>
    <div class='col-md-6'>
      <select id="firstInput${count}" data-style="select-with-transition" title="Single Select" data-size="7" tabindex="-98" class="selectpicker">
        <option value="" class="bs-title-option">Select Role</option>
        <option disabled="">Choose Role</option>
        <option value="Bride">Bride</option>
        <option value="Groom">Groom</option>
        <option value="Mother of the Groom">Mother of the Groom</option>
        <option value="Father of the Groom">Father of the Groom</option>
        <option value="Mother of the Bride">Mother of the Bride</option>
        <option value="Father of the Bride">Father of the Bride</option>
        <option value="Matron of Honor">Matron of Honor</option>
        <option value="Bestman">Bestman</option>
        <option value="Principal Sponsors">Principal Sponsors</option>
        <option value="Secondary Sponsors">Secondary Sponsors</option>
        <option value="Bridesmaids">Bridesmaids</option>
        <option value="Groomsmen">Groomsmen</option>
        <option value="Flowergirl">Flowergirl</option>
        <option value="Ring Coin Bearer">Ring Coin Bearer</option>
      </select>
      <script>$('.selectpicker').selectpicker('refresh');</script>
    </div>
    <div class='col-md-6 p-0'>
      <div class='input-group'>
        <input id="secondInput${count}" class='form-control' type='text' name='sponsorname'/>
        <div class='input-group-prepend'>
          <span class='btnDelete p-1 input-group-text rounded'>
            <i class='material-icons'>delete</i>
          </span>
        </div>
      </div>
    </div>
  </div>`
  $(item2).hide().appendTo("#additionalSponsor .col-md-12.p-0").fadeIn(300);

  var leftCol = `
      <div class="row">
        <div class="col-md-10 p-0 my-auto"><span class="leftEntourageName${count} heading-primary-main">Enter Name</span>
          <hr class="m-1"/><span class="leftEntourageRole${count} heading-primary-sub">Enter Role</span>
        </div>
        <div class="col-md-2 p-0">
          <img id="person" src="/img/man.png" alt="" class="img img-fluid"/>
        </div>
      </div>
    </div>`

  var rightCol = `
      <div class="row">
        <div class="col-md-2 p-0">
          <img id="person" src="/img/man.png" alt="" class="img img-fluid"/>
        </div>
        <div class="col-md-10 p-0 my-auto"><span class="rightEntourageName${count} heading-primary-main">Enter Name</span>
          <hr class="m-1"/><span class="rightEntourageRole${count} heading-primary-sub">Enter Role</span>
        </div>
      </div>
    </div>`

  if(count % 2 == 0) {
    functionality(leftCol, arrEven, "#firstInput", "#secondInput", ".leftEntourageRole", ".leftEntourageName");
  } else {
    functionality(rightCol, arrOdd, "#firstInput", "#secondInput", ".rightEntourageRole", ".rightEntourageName");
  }

  function functionality(col, arrDef, inputNo, inputNo2, entRole, entName) {
    if(count % 2 == 0) {
      $(col).hide().appendTo("#entouragePic .leftCol").fadeIn(300);
    } else {
      $(col).hide().appendTo("#entouragePic .rightCol").fadeIn(300);
    }

    arrDef.push(count);
    window.arrDef = arrDef;
    window.inputNo = inputNo;
    window.inputNo2 = inputNo2;
    window.entRole = entRole
    window.entName = entName
    mainFunctionality(window.arrDef, window.inputNo, window.entRole)
    mainFunctionality(window.arrDef, window.inputNo2, window.entName)
  }

  function mainFunctionality(arrDef, inputNo, entRole) {
    arrDef.forEach((element) => {
      if(inputNo == "#firstInput") {
        $(inputNo + element).change(function(event){
          $(entRole + element).text($(this).val());
        });
      } else {
        $(inputNo + element).keyup(function(event){
          $(entRole + element).text($(this).val());
        });
      }
    });
  }
  
  count++;
});
 
$("#additionalSponsor").on("click", ".btnDelete", function(event){
  $(this).closest('.row.m-0').fadeOut(300, function(){
    $(this).remove();
  });
  var left = ".leftEntourageName";
  var right = ".rightEntourageName";
  var number = $(this).closest('.input-group').find('input').attr("id").match(/\d+/)[0];
  if(number % 2 == 0) {
    $(left + number).closest(".row").fadeOut(300, function(){
      $(this).remove();
    });
  } else {
    $(right + number).closest(".row").fadeOut(300, function(){
      $(this).remove();
    });
  }

  event.stopPropagation();
});