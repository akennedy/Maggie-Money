$(document).ready ->

  $('.datepicker').datepicker({ dateFormat: 'yy-mm-dd' })

  set_negative = (totalSum) ->
    if Number(totalSum) < 0
      $('.cash_flow_plan_remaining').removeClass('positive').addClass('negative')
    else if Number(totalSum) > 0
      $('.cash_flow_plan_remaining').removeClass('negative').addClass('positive')
    else
      $('.cash_flow_plan_remaining').removeClass('negative').removeClass('positive')

  calculate_total = ->
    $('.total').each( ->
      category = $(this).data('category')
      totalSum = $(".#{category}").sum()
      $(this).val("$" + Number(totalSum).toFixed(2))
    )

  calculate_remaining = ->
    totalSum = $('#cash_flow_plan_household_income').sum() - $('.sub_total').sum()
    $('.cash_flow_plan_remaining').val("$" + Number(if (totalSum < 0) then Math.abs(totalSum) else totalSum).toFixed(2))
    set_negative(totalSum)

  percentage = (category) ->
    percent = ($(".#{category}").sum() / $('#cash_flow_plan_household_income').sum()) * 100
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

  $('#cash_flow_plan_household_income').keyup( ->
    calculate_remaining()
    calculate_percentage()
  )

  $('#cash_flow_plan_household_income, .sub_total, .actual').live('keyup', ->
    value = $(this).val().replace(',', '')
    checkForErrors($(this), value)
  )

  $('#cash_flow_plan_household_income, .sub_total, .actual').blur( ->
    value = $(this).val().replace(',', '')
    checkForErrors($(this), value)
    $(this).val(Number(value).toFixed(2)) unless isNaN(value)
  )

  calculate_total()
  calculate_remaining()
  calculate_percentage()
  set_negative($('#cash_flow_plan_household_income').sum() - $('.sub_total').sum())