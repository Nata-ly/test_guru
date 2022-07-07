document.addEventListener('turbolinks:load', function() {
  let new_user_form = document.querySelector('#new_user')

  if (new_user_form)
    { new_user_form.addEventListener('input', check_password_match ) }
})

function check_password_match() {
  let password = document.querySelector('#user_password')
  let password_confirmation = document.querySelector('#user_password_confirmation')
  if (password_confirmation.value && password.value != password_confirmation.value) {
    password.style.border = '2px solid red'
    password_confirmation.style.border = '2px solid red'
  } else {
    password.style.border = '1px solid #ced4da'
    password_confirmation.style.border = '1px solid #ced4da'
  }
}
