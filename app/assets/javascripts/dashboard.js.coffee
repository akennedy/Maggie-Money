$(document).ready ->

  $('.show_list').live('click', ->
    list = $(this).data('list')
    $("##{list}_list").slideDown()
    $(this).removeClass('show_list').addClass('hide_list').text('Hide list')
  )

  $('.hide_list').live('click', ->
    list = $(this).data('list')
    $("##{list}_list").slideUp()
    $(this).removeClass('hide_list').addClass('show_list').text('Show list')
  )