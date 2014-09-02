$(document).on('page:load', onStartCompetitionTemplate);

$(document).ready(onStartCompetitionTemplate);

function onStartCompetitionTemplate() {
	initMonthlyDatePicker();
  	initDatePicker();

  	selectChanged('venue', 'competition_template');
  	$('#competition_template_venue_id').change(function() {
    	selectChanged('venue', 'competition_template');
  	});
}