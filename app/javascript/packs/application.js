import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"

import { I18n } from "i18n-js"
import translations from "./translations.json"

window.i18n = new I18n(translations)

import "channels"
import './utilites/sorting'
import './utilites/check_password_match'
import './utilites/form_inline'

Rails.start()
Turbolinks.start()
ActiveStorage.start()
