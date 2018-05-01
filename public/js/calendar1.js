
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
		
		var calendar =  $('#calendar1').fullCalendar({
			editable: true,
			firstDay: 1, //  1(Monday) this can be changed to 0(Sunday) for the USA system
			selectable: true,
			defaultView: 'agendaDay',
			
			allDaySlot: false,
			selectHelper: true,
			select: function(start, end, allDay) {
				// const {value: title} = await swal({
				// 	title: 'Input Event Title',
				// 	input: 'text',
				// 	type: 'question',
				// 	inputPlaceholder: 'Enter your name or nickname',
				// 	showCancelButton: true,
				// 	confirmButtonColor: '#3085d6',
				// 	cancelButtonColor: '#d33',
				// 	confirmButtonText: 'Yes, Add event!',
				// 	cancelButtonText: 'No, cancel!',
				// 	confirmButtonClass: 'btn btn-success',
				// 	cancelButtonClass: 'btn btn-danger',
				// 	buttonsStyling: true,
				// 	inputValidator: (value) => {
				// 		return !value && 'Input Required, Please try again'
				// 	}
				// }).then((value) => {
				// 	if (value.value) {
				// 		swal(
				// 			'Sucess!',
				// 			'Event has been added.',
				// 			'success'
				// 		)
				// 		return value
				// 	} else if (
				// 		value.dismiss === swal.DismissReason.cancel
				// 	) {
				// 		swal(
				// 			'Cancelled',
				// 			'Event has been cancelled.',
				// 			'error'
				// 		)
				// 	}
				// })
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
					title: 'Baptismal',
					start: new Date(y, m, 1),
					url: 'http://google.com/',
				},
				{
					title: 'Wedding',
					start: new Date(y, m, d, 10, 30),
					allDay: false,
					className: 'important',
					url: 'http://google.com/',
				},
				{
					title: 'Busy',
					start: new Date(y, m, d, 12, 0),
					end: new Date(y, m, d, 14, 0),
					allDay: false,
					className: 'important',
					url: 'http://google.com/',
				},
				{
					title: 'Anointing',
					start: new Date(y, m, d+1, 19, 0),
					end: new Date(y, m, d+1, 22, 30),
					url: 'http://google.com/',
					allDay: false,
				},
				{
					title: 'Funeral Mass',
					start: new Date(y, m, 28),
					end: new Date(y, m, 29),
					url: 'http://google.com/',
					className: 'success'
				}
			],			
		});
	});