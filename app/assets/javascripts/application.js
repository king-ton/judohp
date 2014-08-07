// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require jquery-tablesorter
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.de.js
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

function add_fields(association, content) {
	var new_id = new Date().getTime();
	var regexp = new RegExp("new_" + association, "g");
	$("#" + association + "-list").append(content.replace(regexp, new_id));
}

function remove_fields(link) {
	$(link).prev("input[type=hidden]").val("1");
	$(link).closest(".row").hide();
}

function selectChanged(sel, model) {
	var value = $('#' + model + '_' + sel + '_id option:selected').val();
	var a_href = $('.' + sel + '-edit').attr('href');
	var number = a_href.match(/[0-9]+/g);
	a_href = a_href.replace(number, value);

	if (value == "") {
		$('.' + sel + '-edit').addClass('hidden');
	} else {
		$('.' + sel + '-edit').attr('href', a_href);
		$('.' + sel + '-edit').removeClass('hidden');
	}
}

function initMonthlyDatePicker() {
	$('.input-group.date.month').datepicker({
		format : "dd.mm.yyyy",
		minViewMode : 1,
		language : "de",
		autoclose : true
	});
}

function initDatePicker() {
	$('.input-group.date').datepicker({
		format : "dd.mm.yyyy",
		language : "de",
		autoclose : true
	});
}
