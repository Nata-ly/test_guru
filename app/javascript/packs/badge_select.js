document.addEventListener('turbolinks:load', function() {
  let control = document.querySelector('#badge_rule_name')
  if (control){
    rule_value_change()
    rule_value = $('#badge_rule_value').html()
    filtrRuleValue()
    control.addEventListener('change', filtrRuleValue)
  }
})

function filtrRuleValue() {
  console.log(rule_value)
  $('#badge_rule_value').parent().hide()
  rule_name = document.querySelector('#badge_rule_name')
  category = rule_name.value

  if (category == 'category'){
    $('#badge_rule_value').html($(rule_value).filter('optgroup[label="Category"]').html())
    $('#badge_rule_value').parent().show()
  }

  if (category == 'attempt'){
    $('#badge_rule_value').html($(rule_value).filter('optgroup[label="Test"]').html())
    $('#badge_rule_value').parent().show()
  }

  if (category == 'level'){
    $('#badge_rule_value').html($(rule_value).filter('optgroup[label="Level"]').html())
    $('#badge_rule_value').parent().show()
  }
}

function rule_value_change(){
  value = document.querySelector('#badge_rule_value')
  optgroup = document.createElement('optgroup')
  optgroup.label = 'Level'
  for (i = 0; i < 11; i++){
    opt = document.createElement('option')
    opt.textContent = i
    opt.value = i
    optgroup.appendChild(opt)
  }
  value.appendChild(optgroup)
}
