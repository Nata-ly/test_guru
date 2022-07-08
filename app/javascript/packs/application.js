import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import './utilites/sorting'
import './utilites/check_password_match'
import './utilites/form_inline'

Rails.start()
Turbolinks.start()
ActiveStorage.start()
