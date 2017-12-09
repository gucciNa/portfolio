$(function(){
	$( '#bb-bookblock' ).bookblock( {
		orientation : 'vertical',
		speed : 1000,
		shadowFlip : 0.7,
		direction : 'ltr'
	});

	var current = 1;

    $('.labMenu').click(function(){
			switch (current) {
				case 2:
					$( '#bb-bookblock' ).bookblock( 'jump' , current - 1);
					break;
				case 3:
					$( '#bb-bookblock' ).bookblock( 'jump' , current - 2);
					break;	
			}
			setTimeout(currentTo1, 1000);
			return false;
    });

		$('.studyMenu').click(function(){
			switch (current) {
				case 1:
					$( '#bb-bookblock' ).bookblock( 'jump' , current + 1);
					break;
				case 3:
					$( '#bb-bookblock' ).bookblock( 'jump' , current - 1);
					break;	
			}
			setTimeout(currentTo2, 1000);
			return false;
    });

    $('.mapMenu').click(function(){
			switch (current) {
				case 1:
					$( '#bb-bookblock' ).bookblock( 'jump' , current + 2);
					break;
				case 2:
					$( '#bb-bookblock' ).bookblock( 'jump' , current + 1);
					break;	
			}
			setTimeout(currentTo3, 1000);
			return false;
    });

		$('#bb-bookblock').children().on( {
			'swipeleft' : function(event) {
				$('bb-bookblock').bookblock('next');
				return false;
			},
			'swiperight' : function(event) {
				$('bb-bookblock').bookblock('prev');
				return false;
			}
		} );

		var currentTo1 = function() {
			current = 1;
		}
		var currentTo2 = function() {
			current = 2;
		}
		var currentTo3 = function() {
			current = 3;
		}

});
