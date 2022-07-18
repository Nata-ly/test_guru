userpass = 'admin123456'
user1 = User.new( first_name: 'John',
                  last_name: 'Smith',
                  email: 'nikifor1114@mail.ru',
                  type: 'Admin',
                  password: userpass,
                  password_confirmation: userpass
                )
user1.skip_confirmation! #only if using confirmable in devise settings in user model.
user1.save!

# Add categories
html = Category.find_or_create_by(title: 'HTML')
ruby = Category.find_or_create_by(title: 'Ruby')
sybd = Category.find_or_create_by(title: 'СУБД')

# Add tests
html_test = html.tests.find_or_create_by(title: 'HTML', level: 1, writer: user1, visible: true)
ruby_test = ruby.tests.find_or_create_by(title: 'Начальный уровень', level: 0, writer: user1, visible: true)
sybd_test = sybd.tests.find_or_create_by(title: 'Основы баз данных', level: 1, writer: user1, visible: true)

# Add answers and questions
#html_test
html_test_q1 = html_test.questions.find_or_create_by(body: 'Расшифруйте аббревиатуру HTML.')
html_test_q1.answers.find_or_create_by(body: 'HyperText Markup Language', correct: 0)
html_test_q1.answers.find_or_create_by(body: 'HeadText Modulation Language', correct: 0)
html_test_q1.answers.find_or_create_by(body: 'HeadingText Mode Language', correct: 1)

html_test_q2 = html_test.questions.find_or_create_by(body: 'Где правильно использовать тег title?')
html_test_q2.answers.find_or_create_by(body: 'в теге head')
html_test_q2.answers.find_or_create_by(body: 'в теге footer', correct: :true)
html_test_q2.answers.find_or_create_by(body: 'в теге body')

html_test_q3 = html_test.questions.find_or_create_by(body: 'При помощи какого тега можно создать ссылку в документе?')
html_test_q3.answers.find_or_create_by(body: '<p>')
html_test_q3.answers.find_or_create_by(body: '<link>')
html_test_q3.answers.find_or_create_by(body: '<a>', correct: :true)


#ruby_test
ruby_test_q1 = ruby_test.questions.find_or_create_by(body: 'Где записана сокращенная форма кода: x = x / 3')
ruby_test_q1.answers.find_or_create_by(body: 'Нет сокращенной формы')
ruby_test_q1.answers.find_or_create_by(body: 'x /= 3', correct: :true)
ruby_test_q1.answers.find_or_create_by(body: 'x = / 3')

ruby_test_q2 = ruby_test.questions.find_or_create_by(body: 'Чем отличается puts от print:')
ruby_test_q2.answers.find_or_create_by(body: 'Ничем, оба делают одно и тоже')
ruby_test_q2.answers.find_or_create_by(body: 'puts позволяет выводить переменные, а print только текст')
ruby_test_q2.answers.find_or_create_by(body: 'print без пропуска строки, а puts с пропуском', correct: :true)

ruby_test_q3 = ruby_test.questions.find_or_create_by(body: 'Какой метод позволяет перевести строку в нижний регистр:')
ruby_test_q3.answers.find_or_create_by(body: 'dcase()')
ruby_test_q3.answers.find_or_create_by(body: 'downcase()', correct: :true)
ruby_test_q3.answers.find_or_create_by(body: 'lowercase')


#sybd_test
sybd_test_q1 = sybd_test.questions.find_or_create_by(body: 'Не относится к командам SQLite, взаимодействующием с реляционными базами данных, аналогичны SQL.')
sybd_test_q1.answers.find_or_create_by(body: 'SELECT')
sybd_test_q1.answers.find_or_create_by(body: 'CREATE')
sybd_test_q1.answers.find_or_create_by(body: 'NEW', correct: :true)

sybd_test_q2 = sybd_test.questions.find_or_create_by(body: 'Последовательность операций над БД, переводящих ее из одного непротиворечивого состояния в другое непротиворечивое состояние, называется:')
sybd_test_q2.answers.find_or_create_by(body: 'транзитом')
sybd_test_q2.answers.find_or_create_by(body: 'транзакцией', correct: :true)
sybd_test_q2.answers.find_or_create_by(body: 'циклом')

sybd_test_q3 = sybd_test.questions.find_or_create_by(body: 'СУБД – это:')
sybd_test_q3.answers.find_or_create_by(body: 'специальный программный комплекс для обеспечения доступа к данным и управления ими', correct: :true)
sybd_test_q3.answers.find_or_create_by(body: 'система средств администрирования банка данных')
sybd_test_q3.answers.find_or_create_by(body: 'система средств архивирования и резервного копирования банка данных')


Progress.find_or_create_by(user_id: user1.id, test_id: html_test.id)
Progress.find_or_create_by(user_id: user1.id, test_id: sybd_test.id)
Progress.find_or_create_by(user_id: user1.id, test_id: html_test.id)
Progress.find_or_create_by(user_id: user1.id, test_id: sybd_test.id)
Progress.find_or_create_by(user_id: user1.id, test_id: ruby_test.id)
