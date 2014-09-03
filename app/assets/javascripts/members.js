// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('page:update', onStartMember);

$(document).ready(onStartMember);

function onStartMember() {
	initMonthlyDatePicker();
	initDatePicker();

	selectChanged('person', 'member');
	selectChanged('mum', 'member');
	selectChanged('dad', 'member');

	$('#member_person_id').change(function() {
		selectChanged('person', 'member');
	});
	$('#member_mum_id').change(function() {
		selectChanged('mum', 'member');
	});
	$('#member_dad_id').change(function() {
		selectChanged('dad', 'member');
	});
}

