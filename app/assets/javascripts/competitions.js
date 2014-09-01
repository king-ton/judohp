$(document).on('page:load', onStartCompetition);

$(document).ready(onStartCompetition);

function onStartCompetition() {
	initMonthlyDatePicker();
  	initDatePicker();

  	selectChanged('venue', 'competition');
  	$('#competition_venue_id').change(function() {
    	selectChanged('venue', 'competition');
  	});
  	
  	selectChanged('competition_template', 'competition');
  	$('#competition_competition_template_id').change(function() {
    	selectChanged('competition_template', 'competition');
  	});
}