$(document).ready ->

  $('.tip').tooltip()
  $('.pop').popover()
  $('.datepicker').datepicker({ dateFormat: 'yy-mm-dd' })
  $('.pop[data-toggle="modal"]').click( ->
    $(this).popover('hide')
  )

  set_negative = (remaining, remaining_field) ->
    if Number(remaining) < 0
      $(".#{remaining_field}").removeClass('positive').addClass('negative')
    else if Number(remaining) > 0
      $(".#{remaining_field}").removeClass('negative').addClass('positive')
    else
      $(".#{remaining_field}").removeClass('negative').removeClass('positive')

  calculate_total = ->
    $('.total').each( ->
      category = $(this).data('category')
      totalSum = $(".#{category}").sum()
      $(this).val("$" + Number(totalSum).toFixed(2))
    )

  calculate_remaining = ->
    remaining = $('.household_income').sum() - $('.sub_total').sum()
    $('.remaining').val("$" + Number(if (remaining < 0) then Math.abs(remaining) else remaining).toFixed(2))
    set_negative(remaining, 'remaining')

  calculate_remaining_balance = ->
    remaining = $('.balance').sum() - $('.balance_sub_total').sum()
    $('.remaining').val("$" + Number(if (remaining < 0) then Math.abs(remaining) else remaining).toFixed(2))
    set_negative(remaining, 'remaining')

  calculate_weekly_remaining = (week, weekSum) ->
    remaining = $(".#{week}_income").val() - weekSum
    $(".#{week}_remaining").val("$" + Number(if (remaining < 0) then Math.abs(remaining) else remaining).toFixed(2))
    set_negative(remaining, "#{week}_remaining")

  percentage = (category) ->
    percent = ($(".#{category}").sum() / $('.household_income').sum()) * 100
    if isNaN(percent)
      percent = 0
    $("##{category}_percent").val(Number(percent).toFixed(2) + " %")

  calculate_percentage = ->
    $('.total').each( ->
      category = $(this).data('category')
      percentage(category)
    )

  checkForErrors = (field, value) ->
    if isNaN(value)
      field.addClass('error')
    else
      field.removeClass('error')

  $('.sub_total').keyup( ->
    category = $(this).data('category')
    totalSum = $(".#{category}").sum()
    $("##{category}_total").val("$" + Number(totalSum).toFixed(2))
    calculate_remaining()
    percentage(category)
  )

  $('.balance_sub_total').keyup( ->
    calculate_remaining_balance()
  )

  $('.week_sub_total, .week_income').keyup( ->
    week = $(this).data('week')
    weekSum = $(".#{week}_sub_total").sum()
    calculate_weekly_remaining(week, weekSum)
  )

  $('.household_income').keyup( ->
    calculate_remaining()
    calculate_percentage()
  )

  $('.balance').keyup( ->
    calculate_remaining_balance()
  )

  $('.income, .balance, .sub_total, .balance_sub_total, .actual').on('keyup', ->
    value = $(this).val().replace(',', '')
    checkForErrors($(this), value)
  )

  $('.income, .balance, .sub_total, .balance_sub_total, .actual').blur( ->
    value = $(this).val().replace(',', '')
    checkForErrors($(this), value)
    $(this).val(Number(value).toFixed(2)) unless isNaN(value) or value is ''
  )

  calculate_total()
  calculate_remaining()
  calculate_remaining_balance()
  calculate_percentage()
  for week in ['week_1', 'week_2', 'week_3', 'week_4']
    calculate_weekly_remaining(week, $(".#{week}_sub_total").sum())