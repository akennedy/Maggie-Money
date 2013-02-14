$(document).ready ->

  $('.show_worksheet_list').on('click', ->
    worksheet = $(this).data('worksheet')
    $.cookie("dashboard_#{worksheet}_list", !$("##{worksheet}_list").is(':visible'))
    $("##{worksheet}_list").slideToggle()
  )

  $('.worksheet_list').each ->
    worksheet = $(this).data('worksheet')
    $(this).show() if $.cookie("dashboard_#{worksheet}_list") == "true"