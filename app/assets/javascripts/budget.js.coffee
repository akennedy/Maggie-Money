$(document).ready ->

  $('.datepicker').datepicker()

  set_negative = (totalSum) ->
    if Number(totalSum) < 0
      $('.budget_remaining').removeClass('positive').addClass('negative')
    else if Number(totalSum) > 0
      $('.budget_remaining').removeClass('negative').addClass('positive')
    else
      $('.budget_remaining').removeClass('negative').removeClass('positive')

  calculate_total = ->
    $('.total').each( ->
      category = $(this).data('category')
      totalSum = $(".#{category}").sum()
      $(this).val("$" + Number(totalSum).toFixed(2))
    )

  calculate_remaining = ->
    totalSum = $('#budget_household_income').sum() - $('.sub_total').sum()
    $('.budget_remaining').val("$" + Number(if (totalSum < 0) then Math.abs(totalSum) else totalSum).toFixed(2))
    set_negative(totalSum)

  percentage = (category) ->
    percent = ($(".#{category}").sum() / $('#budget_household_income').sum()) * 100
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
    $("##{category}_total").val(Number(totalSum).toFixed(2))
    calculate_remaining()
    percentage(category)
  )

  $('#budget_household_income').keyup( ->
    calculate_remaining()
    calculate_percentage()
  )

  $('#budget_household_income').live('keyup', ->
    value = $(this).val().replace(',', '')
    checkForErrors($(this), value)
  )

  $('.sub_total').live('keyup', ->
    value = $(this).val().replace(',', '')
    checkForErrors($(this), value)
  )

  $('.actual').live('keyup', ->
    value = $(this).val().replace(',', '')
    checkForErrors($(this), value)
  )

  $('#budget_household_income').blur( ->
    value = $(this).val().replace(',', '')
    checkForErrors($(this), value)
    $(this).val(Number(value).toFixed(2)) unless isNaN(value)
  )

  $('.sub_total').blur( ->
    value = $(this).val().replace(',', '')
    checkForErrors($(this), value)
    $(this).val(Number(value).toFixed(2)) unless isNaN(value)
  )

  $('.actual').blur( ->
    value = $(this).val().replace(',', '')
    checkForErrors($(this), value)
    $(this).val(Number(value).toFixed(2)) unless isNaN(value)
  )

  calculate_total()
  calculate_remaining()
  calculate_percentage()
  set_negative($('#budget_household_income').sum() - $('.sub_total').sum())