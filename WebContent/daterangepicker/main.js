requirejs.config({
    "paths": {
      "jquery": "../js/jquery-1.11.3",
      "moment": "./moment",
      "daterangepicker": "./daterangepicker"
    }
});

requirejs(['jquery', 'moment', 'daterangepicker'] , function ($, moment) {
$(document).ready(function() {
  var birthdate=$("#birthdate").val();

  $('.demo i').click(function() {
    $(this).parent().find('input').click();
  });
  
  $('#birthdate').daterangepicker({
	  "timePicker": false,
	    singleDatePicker: true,
	    showDropdowns: true,
	    startDate: birthdate==null||birthdate==""?moment():birthdate
	  });
/*  	 $('#statStart').daterangepicker({
  		"singleDatePicker": true,
  		"timePicker": true,
	    "timePicker24Hour": true,
	    "showDropdowns": true,
	    "locale": {
            format: 'YYYY-MM-DD HH:mm',
            applyLabel: "应用",
            cancelLabel: "取消"
        },
	    "startDate": statStart==null||statStart==""?moment().subtract(1,"month").add(1,"minute"):statStart
	  });
	  $('#statEnd').daterangepicker({
		  "singleDatePicker": true,
	  		"timePicker": true,
		    "timePicker24Hour": true,
		    "showDropdowns": true,
		    "locale": {
	            format: 'YYYY-MM-DD HH:mm',
	            applyLabel: "应用",
	            cancelLabel: "取消"
	        },
	    "startDate": statEnd==null||statEnd==""?moment():statEnd
	  });
	  $('#faceLibStart').daterangepicker({
			"singleDatePicker": true,
			"timePicker": true,
		    "timePicker24Hour": true,
		    "showDropdowns": true,
		    "locale": {
	          format: 'YYYY-MM-DD HH:mm',
	          applyLabel: "应用",
	          cancelLabel: "取消"
	      },
		    "startDate": faceLibStart==null||faceLibStart==""?moment().subtract(1,"year"):faceLibStart
		  });
		  $('#faceLibEnd').daterangepicker({
			  "singleDatePicker": true,
		  		"timePicker": true,
			    "timePicker24Hour": true,
			    "showDropdowns": true,
			    "locale": {
		            format: 'YYYY-MM-DD HH:mm',
		            applyLabel: "应用",
		            cancelLabel: "取消"
		        },
		    "startDate": faceLibEnd==null||faceLibEnd==""?moment():faceLibEnd
		  });
  $('#statTime').daterangepicker({
	  	"timePicker": true,
	    "timePicker24Hour": true,
	    "locale": {
	        "format": "YYYY-MM-DD HH:mm",
	        "separator": " - ",
	        "applyLabel": "Apply",
	        "cancelLabel": "Cancel",
	        "fromLabel": "From",
	        "toLabel": "To",
	        "customRangeLabel": "Custom",
	        "daysOfWeek": [
	            "Su",
	            "Mo",
	            "Tu",
	            "We",
	            "Th",
	            "Fr",
	            "Sa"
	        ],
	        "monthNames": [
	            "January",
	            "February",
	            "March",
	            "April",
	            "May",
	            "June",
	            "July",
	            "August",
	            "September",
	            "October",
	            "November",
	            "December"
	        ],
	        "firstDay": 1
	    },
	    "startDate": statStart==null||statStart==""?moment().subtract(6,"month"):statStart,
	    "endDate": statEnd==null||statEnd==""?moment():statEnd

	}, function(start, end, label) {
	  console.log("New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
	});*/
  updateConfig();

  function updateConfig() {
    var options = {};

    if ($('#singleDatePicker').is(':checked'))
      options.singleDatePicker = true;

    if ($('#showDropdowns').is(':checked'))
      options.showDropdowns = true;

    if ($('#showWeekNumbers').is(':checked'))
      options.showWeekNumbers = true;

    if ($('#showISOWeekNumbers').is(':checked'))
      options.showISOWeekNumbers = true;

    if ($('#timePicker').is(':checked'))
      options.timePicker = true;

    if ($('#timePicker24Hour').is(':checked'))
      options.timePicker24Hour = true;

    /*if ($('#timePickerIncrement').val().length && $('#timePickerIncrement').val() != 1)
      options.timePickerIncrement = parseInt($('#timePickerIncrement').val(), 10);*/

    if ($('#timePickerSeconds').is(':checked'))
      options.timePickerSeconds = true;

    if ($('#autoApply').is(':checked'))
      options.autoApply = true;

    if ($('#dateLimit').is(':checked'))
      options.dateLimit = { days: 7 };

    if ($('#ranges').is(':checked')) {
      options.ranges = {
        'Today': [moment(), moment()],
        'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
        'Last 7 Days': [moment().subtract(6, 'days'), moment()],
        'Last 30 Days': [moment().subtract(29, 'days'), moment()],
        'This Month': [moment().startOf('month'), moment().endOf('month')],
        'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
      };
    }

    if ($('#locale').is(':checked')) {
      options.locale = {
        format: 'YYYY-MM-DD HH:mm',
        separator: ' - ',
        applyLabel: 'Apply',
        cancelLabel: 'Cancel',
        fromLabel: 'From',
        toLabel: 'To',
        customRangeLabel: 'Custom',
        daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr','Sa'],
        monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
        firstDay: 1
      };
    }

    if (!$('#linkedCalendars').is(':checked'))
      options.linkedCalendars = false;

    if (!$('#autoUpdateInput').is(':checked'))
      options.autoUpdateInput = false;

    if ($('#alwaysShowCalendars').is(':checked'))
      options.alwaysShowCalendars = true;

    /*if ($('#parentEl').val().length)
      options.parentEl = $('#parentEl').val();

    if ($('#startDate').val().length)
      options.startDate = $('#startDate').val();

    if ($('#endDate').val().length)
      options.endDate = $('#endDate').val();

    if ($('#minDate').val().length)
      options.minDate = $('#minDate').val();

    if ($('#maxDate').val().length)
      options.maxDate = $('#maxDate').val();

    if ($('#opens').val().length && $('#opens').val() != 'right')
      options.opens = $('#opens').val();

    if ($('#drops').val().length && $('#drops').val() != 'down')
      options.drops = $('#drops').val();

    if ($('#buttonClasses').val().length && $('#buttonClasses').val() != 'btn btn-sm')
      options.buttonClasses = $('#buttonClasses').val();

    if ($('#applyClass').val().length && $('#applyClass').val() != 'btn-success')
      options.applyClass = $('#applyClass').val();

    if ($('#cancelClass').val().length && $('#cancelClass').val() != 'btn-default')
      options.cancelClass = $('#cancelClass').val();
*/
    $('#config-text').val("$('#demo').daterangepicker(" + JSON.stringify(options, null, '    ') + ", function(start, end, label) {\n  console.log(\"New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')\");\n});");

    $('#config-demo').daterangepicker(options, function(start, end, label) { console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')'); });

  }

});
});
