$(document).ready ->
  # Slider Checkboxes!
  $('.slider-checkbox').sliderCheckbox
    offLeft: -65

  # Chosen Selects
  $('.chosen').chosen
    placeholder_text_multiple: "- select -"
    placeholder_text_single: "- select -"

  # Masonry
  $('.items.articles').masonry
    isAnimated: false
    columnWidth: 320
    isResizable: true

  # $(window).on 'resize', ->
  #   # $('.items.articles').masonry('destroy')
  #   $('.items.articles').masonry
  #     isAnimated: false
  #     columnWidth: 320
  #     isResizable: true
