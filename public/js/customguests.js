
	$(document).ready(function() {
	  var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		/*  className colors
		
		className: default(transparent), important(red), chill(pink), success(green), info(blue)
		
		*/		
		
		  
		/* initialize the external events
		-----------------------------------------------------------------*/
	
		$('#external-events div.external-event').each(function() {
		
			// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
			// it doesn't need to have a start or end
			var eventObject = {
				title: $.trim($(this).text()) // use the element's text as the event title
			};
			
			// store the Event Object in the DOM element so we can get to it later
			$(this).data('eventObject', eventObject);
			
			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex: 999,
				revert: true,      // will cause the event to go back to its
				revertDuration: 0  //  original position after the drag
			});
			
		});
	
	
		/* initialize the calendar
		-----------------------------------------------------------------*/
		
		var calendar =  $('#calendar').fullCalendar({
			dayClick: function(date, jsEvent, view) {
				$("#myModal").modal("show");
			},
			header: {
				left: 'title',
				center: 'agendaDay,agendaWeek,month',
				right: 'prev,next today'
			},
			editable: true,
			firstDay: 1, //  1(Monday) this can be changed to 0(Sunday) for the USA system
			selectable: true,
			defaultView: 'month',
			
			allDaySlot: false,
			selectHelper: true,
			select: function(start, end, allDay) {
				if (title) {
					calendar.fullCalendar('renderEvent',
						{
							title: title,
							start: start,
							end: end,
							url: 'http://google.com/',
							className: 'important',
							allDay: allDay
						},
						true // make the event "stick"
					);
				}
				calendar.fullCalendar('unselect');
			},
			droppable: true, // this allows things to be dropped onto the calendar !!!
			drop: function(date, allDay) { // this function is called when something is dropped
			
				// retrieve the dropped element's stored Event Object
				var originalEventObject = $(this).data('eventObject');
				
				// we need to copy it, so that multiple events don't have a reference to the same object
				var copiedEventObject = $.extend({}, originalEventObject);
				
				// assign it the date that was reported
				copiedEventObject.start = date;
				copiedEventObject.allDay = allDay;
				
				// render the event on the calendar
				// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
				$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
				
				// is the "remove after drop" checkbox checked?
				if ($('#drop-remove').is(':checked')) {
					// if so, remove the element from the "Draggable Events" list
					$(this).remove();
				}
				
			},
			
			events: [
				{
					title: 'Pending',
					start: new Date(y, m, 1),
					url: 'http://google.com/',
				},
				{
					title: 'Reserved',
					start: new Date(y, m, d, 10, 30),
					allDay: false,
					className: 'important',
					url: 'http://google.com/',
				},
				{
					title: 'Pending',
					start: new Date(y, m, d, 12, 0),
					end: new Date(y, m, d, 14, 0),
					allDay: false,
					className: 'important',
					url: 'http://google.com/',
				},
				{
					title: 'Reserved',
					start: new Date(y, m, d+1, 19, 0),
					end: new Date(y, m, d+1, 22, 30),
					url: 'http://google.com/',
					allDay: false,
				},
				{
					title: 'Pending',
					start: new Date(y, m, 28),
					end: new Date(y, m, 29),
					url: 'http://google.com/',
					className: 'success'
				}
			],			
		});
	});

//parallax effect
materialKitDemo = {

  checkScrollForParallax:function(){
      oVal = ($(window).scrollTop() / 3);
      big_image.css({
          'transform':'translate3d(0,' + oVal +'px,0)',
          '-webkit-transform':'translate3d(0,' + oVal +'px,0)',
          '-ms-transform':'translate3d(0,' + oVal +'px,0)',
          '-o-transform':'translate3d(0,' + oVal +'px,0)'
      });
	},

}

// ekko lightbox
$(document).on('click', '[data-toggle="lightbox"]', function(event) {
    event.preventDefault();
    $(this).ekkoLightbox();
});

//slick slider
$(".slider").slick({
    infinite:true,
    slideToShow: 1,
    slideToScroll: 1
});

// for Birthday
let birthdayDate = moment();
$('.datepickerBirthday').datetimepicker({
	format: 'YYYY-MM-DD',
	maxDate: birthdayDate,
	icons: {
			time: "fa fa-clock-o",
			date: "fa fa-calendar",
			up: "fa fa-chevron-up",
			down: "fa fa-chevron-down",
			previous: 'fa fa-chevron-left',
			next: 'fa fa-chevron-right',
			today: 'fa fa-screenshot',
			clear: 'fa fa-trash',
			close: 'fa fa-remove',
	},
});

// for Regular Baptism Date
let startDate = moment().add(14, 'days').calendar();
let endDate = moment().add(3, 'months').calendar();

$('.datepickerRegularDesiredDate').datetimepicker({
	format: 'YYYY-MM-DD',
	minDate: startDate,
	maxDate: endDate,
	daysOfWeekDisabled: [1,2,3,4,5,6],
	icons: {
			time: "fa fa-clock-o",
			date: "fa fa-calendar",
			up: "fa fa-chevron-up",
			down: "fa fa-chevron-down",
			previous: 'fa fa-chevron-left',
			next: 'fa fa-chevron-right',
			today: 'fa fa-screenshot',
			clear: 'fa fa-trash',
			close: 'fa fa-remove',
	},
});

// for Special Baptism Date
$('.datepickerSpecialDesiredDate').datetimepicker({
	format: 'YYYY-MM-DD',
	minDate: startDate,
	maxDate: endDate,
	daysOfWeekDisabled: [0,1],
	icons: {
			time: "fa fa-clock-o",
			date: "fa fa-calendar",
			up: "fa fa-chevron-up",
			down: "fa fa-chevron-down",
			previous: 'fa fa-chevron-left',
			next: 'fa fa-chevron-right',
			today: 'fa fa-screenshot',
			clear: 'fa fa-trash',
			close: 'fa fa-remove',
	},
});


//for funeral blessing
let startDatee = moment().add(2, 'days').calendar();
let endDatee = moment().add(1, 'w').calendar();

$('.datepickerFBlessingDesiredDate').datetimepicker({
	format: 'YYYY-MM-DD',
	minDate: startDatee,
	maxDate: endDatee,
	daysOfWeekDisabled: [1,2,3,4,5,6],
	icons: {
			time: "fa fa-clock-o",
			date: "fa fa-calendar",
			up: "fa fa-chevron-up",
			down: "fa fa-chevron-down",
			previous: 'fa fa-chevron-left',
			next: 'fa fa-chevron-right',
			today: 'fa fa-screenshot',
			clear: 'fa fa-trash',
			close: 'fa fa-remove',
	},
});

// //for anointing of the sick
// let blessStartDate = moment().add(2, 'days').calendar();
// let blessEndDate = moment().add(1, 'w').calendar();

// $('.datepickerAnointDesiredDate').datetimepicker({
// 	format: 'YYYY-MM-DD',
// 	minDate: blessStartDate,
// 	maxDate: blessEndDate,
// 	// daysOfWeekDisabled: [0,1],
// 	icons: {
// 			time: "fa fa-clock-o",
// 			date: "fa fa-calendar",
// 			up: "fa fa-chevron-up",
// 			down: "fa fa-chevron-down",
// 			previous: 'fa fa-chevron-left',
// 			next: 'fa fa-chevron-right',
// 			today: 'fa fa-screenshot',
// 			clear: 'fa fa-trash',
// 			close: 'fa fa-remove',
// 	},
// });

// $('.datepickerAnointDesiredDate1').datetimepicker({
// 	format: 'YYYY-MM-DD',
// 	minDate: blessStartDate,
// 	maxDate: blessEndDate,
// 	// daysOfWeekDisabled: [0,1],
// 	icons: {
// 			time: "fa fa-clock-o",
// 			date: "fa fa-calendar",
// 			up: "fa fa-chevron-up",
// 			down: "fa fa-chevron-down",
// 			previous: 'fa fa-chevron-left',
// 			next: 'fa fa-chevron-right',
// 			today: 'fa fa-screenshot',
// 			clear: 'fa fa-trash',
// 			close: 'fa fa-remove',
// 	},
// });

// //for establishment blessing desired date
// let estBlessStartDate = moment().add(1, 'w').calendar();
// let estBlessEndDate = moment().add(1, 'm').calendar();

// $('.datepickerEstBlessingDesiredDate').datetimepicker({
// 	format: 'YYYY-MM-DD',
// 	minDate: estBlessStartDate,
// 	maxDate: estBlessEndDate,
// 	daysOfWeekDisabled: [0,1],
// 	icons: {
// 			time: "fa fa-clock-o",
// 			date: "fa fa-calendar",
// 			up: "fa fa-chevron-up",
// 			down: "fa fa-chevron-down",
// 			previous: 'fa fa-chevron-left',
// 			next: 'fa fa-chevron-right',
// 			today: 'fa fa-screenshot',
// 			clear: 'fa fa-trash',
// 			close: 'fa fa-remove',
// 	},
// });



$('.datepicker').datetimepicker({
		format: 'YYYY-MM-DD',
		icons: {
				time: "fa fa-clock-o",
				date: "fa fa-calendar",
				up: "fa fa-chevron-up",
				down: "fa fa-chevron-down",
				previous: 'fa fa-chevron-left',
				next: 'fa fa-chevron-right',
				today: 'fa fa-screenshot',
				clear: 'fa fa-trash',
				close: 'fa fa-remove',
		},
 });

$('.datepicker1').datetimepicker({
		format: 'YYYY-MM-DD',
		icons: {
				time: "fa fa-clock-o",
				date: "fa fa-calendar",
				up: "fa fa-chevron-up",
				down: "fa fa-chevron-down",
				previous: 'fa fa-chevron-left',
				next: 'fa fa-chevron-right',
				today: 'fa fa-screenshot',
				clear: 'fa fa-trash',
				close: 'fa fa-remove',
		},
 });

$('.datepicker2').datetimepicker({
		format: 'YYYY-MM-DD',
		icons: {
				time: "fa fa-clock-o",
				date: "fa fa-calendar",
				up: "fa fa-chevron-up",
				down: "fa fa-chevron-down",
				previous: 'fa fa-chevron-left',
				next: 'fa fa-chevron-right',
				today: 'fa fa-screenshot',
				clear: 'fa fa-trash',
				close: 'fa fa-remove',
		},
 });
$('.datepicker3').datetimepicker({
		format: 'YYYY-MM-DD',
		icons: {
				time: "fa fa-clock-o",
				date: "fa fa-calendar",
				up: "fa fa-chevron-up",
				down: "fa fa-chevron-down",
				previous: 'fa fa-chevron-left',
				next: 'fa fa-chevron-right',
				today: 'fa fa-screenshot',
				clear: 'fa fa-trash',
				close: 'fa fa-remove',
		},
 });

 $(function () {
	$('.timepicker').datetimepicker({
			format: 'LT',
			icons: {
        time: "fa fa-clock-o",
        date: "fa fa-calendar",
        up: "fa fa-chevron-up",
        down: "fa fa-chevron-down",
        previous: 'fa fa-chevron-left',
        next: 'fa fa-chevron-right',
        today: 'fa fa-screenshot',
        clear: 'fa fa-trash',
        close: 'fa fa-remove'
		}
	});
	$('.timepicker1').datetimepicker({
			format: 'LT',
			interval: 15, // 15 minutes
			icons: {
        time: "fa fa-clock-o",
        date: "fa fa-calendar",
        up: "fa fa-chevron-up",
        down: "fa fa-chevron-down",
        previous: 'fa fa-chevron-left',
        next: 'fa fa-chevron-right',
        today: 'fa fa-screenshot',
        clear: 'fa fa-trash',
        close: 'fa fa-remove'
		}
	});
});

$('.selectpicker').selectpicker({
	style: 'btn-primary',
	size: 4
});

$(".btn-valid").click(()=> {
	swal({
		title: 'Are you sure?',
		text: "You won't be able to revert this!",
		type: 'info',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: 'Yes, delete it!'
	}).then((result) => {
		if (result.value) {
			swal(
				'Success!',
				'Please wait 1-3 working days for your request to be processed',
				'success'
			)
		}
	})
});


// $('.datepicker').datepicker({ format: 'yyyy-dd-mm' });
// $('.datepicker1').datepicker({ format: 'yyyy-dd-mm' });
// $('.datepicker2').datepicker({ format: 'yyyy-dd-mm' });
// $('.datepicker3').datepicker({ format: 'yyyy-dd-mm' });