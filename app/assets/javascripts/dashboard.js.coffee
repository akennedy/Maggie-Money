$(document).ready ->

  $('.show_list').live('click', ->
    list = $(this).data('list')
    $("##{list}_list").slideToggle()
  )