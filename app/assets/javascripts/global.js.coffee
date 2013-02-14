$(document).ready ->

  $('.show_category').on('click', ->
    category = $(this).data('category')
    body = $(this).closest('table').find('tbody')
    $.cookie("cfp_#{category}_body", !body.is(':visible'))
    body.fadeToggle()
  )

  $('.cfp_body').each ->
    category = $(this).data('category')
    $(this).show() if $.cookie("cfp_#{category}_body") == "true"