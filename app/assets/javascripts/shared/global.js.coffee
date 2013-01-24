$(document).ready ->
	# Slider Checkboxes!
	$('.slider-checkbox').sliderCheckbox
		offLeft: -65

	# Chosen Selects
	$('.chosen').chosen()

	# Masonry
	$('.items.articles').masonry
		isAnimated: false
		columnWidth: 320