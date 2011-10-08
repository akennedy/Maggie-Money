$(document).ready ->

  $('.datepicker').datepicker()

  set_negative = (totalSum) ->
    if Number(totalSum) < 0 then $('.budget_remaining').addClass('negative') else $('.budget_remaining').removeClass('negative')

  calculate_remaining = ->
    totalSum = $('#budget_household_income').sum() - $('.sub_total').sum()
    $('.budget_remaining').val("$" + Number(totalSum).toFixed(2) + " left")
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

  calculate_remaining()
  calculate_percentage()
  set_negative($('#budget_household_income').sum() - $('.sub_total').sum())