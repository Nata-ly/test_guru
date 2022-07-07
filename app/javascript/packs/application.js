import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import './utilites/sorting'

Rails.start()
Turbolinks.start()
ActiveStorage.start()
