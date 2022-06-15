# Add categories
html = Category.find_or_create_by(title: 'HTML')
ruby = Category.find_or_create_by(title: 'Ruby')
sybd = Category.find_or_create_by(title: 'СУБД')

# Add tests
html_test = Test.find_or_create_by(title: 'HTML', level: 1, category_id: html.id)
ruby_test = Test.find_or_create_by(title: 'Начальный уровень', level: 0, category_id: ruby.id)
sybd_test = Test.find_or_create_by(title: 'Основы баз данных', level: 1, category_id: sybd.id)

# Add answers and questions
#html_test
html_test_q1 = Question.find_or_create_by(body: 'Расшифруйте аббревиатуру HTML.', test_id: html_test.id)
Answer.find_or_create_by(body: 'HyperText Markup Language', correct: 0, question_id: html_test_q1.id)
Answer.find_or_create_by(body: 'HeadText Modulation Language', correct: 0, question_id: html_test_q1.id)
Answer.find_or_create_by(body: 'HeadingText Mode Language', correct: 1, question_id: html_test_q1.id)

html_test_q2 = Question.find_or_create_by(body: 'Где правильно использовать тег title?', test_id: html_test.id)
Answer.find_or_create_by(body: 'в теге head', correct: 0, question_id: html_test_q2.id)
Answer.find_or_create_by(body: 'в теге footer', correct: 1, question_id: html_test_q2.id)
Answer.find_or_create_by(body: 'в теге body', correct: 0, question_id: html_test_q2.id)

html_test_q3 = Question.find_or_create_by(body: 'При помощи какого тега можно создать ссылку в документе?', test_id: html_test.id)
Answer.find_or_create_by(body: '<p>', correct: 0, question_id: html_test_q3.id)
Answer.find_or_create_by(body: '<link>', correct: 0, question_id: html_test_q3.id)
Answer.find_or_create_by(body: '<a>', correct: 1, question_id: html_test_q3.id)


#ruby_test
ruby_test_q1 = Question.find_or_create_by(body: 'Где записана сокращенная форма кода: x = x / 3', test_id: ruby_test.id)
Answer.find_or_create_by(body: 'Нет сокращенной формы', correct: 0, question_id: ruby_test_q1.id)
Answer.find_or_create_by(body: 'x /= 3', correct: 1, question_id: ruby_test_q1.id)
Answer.find_or_create_by(body: 'x = / 3', correct: 0, question_id: ruby_test_q1.id)

ruby_test_q2 = Question.find_or_create_by(body: 'Чем отличается puts от print:', test_id: ruby_test.id)
Answer.find_or_create_by(body: 'Ничем, оба делают одно и тоже', correct: 0, question_id: ruby_test_q2.id)
Answer.find_or_create_by(body: 'puts позволяет выводить переменные, а print только текст', correct: 0, question_id: ruby_test_q2.id)
Answer.find_or_create_by(body: 'print без пропуска строки, а puts с пропуском', correct: 1, question_id: ruby_test_q2.id)

ruby_test_q3 = Question.find_or_create_by(body: 'Какой метод позволяет перевести строку в нижний регистр:', test_id: ruby_test.id)
Answer.find_or_create_by(body: 'dcase()', correct: 0, question_id: ruby_test_q3.id)
Answer.find_or_create_by(body: 'downcase()', correct: 1, question_id: ruby_test_q3.id)
Answer.find_or_create_by(body: 'lowercase', correct: 0, question_id: ruby_test_q3.id)


#sybd_test
sybd_test_q1 = Question.find_or_create_by(body: 'Не относится к командам SQLite, взаимодействующием с реляционными базами данных, аналогичны SQL.', test_id: sybd_test.id)
Answer.find_or_create_by(body: 'SELECT', correct: 0, question_id: sybd_test_q1.id)
Answer.find_or_create_by(body: 'CREATE', correct: 0, question_id: sybd_test_q1.id)
Answer.find_or_create_by(body: 'NEW', correct: 1, question_id: sybd_test_q1.id)

sybd_test_q2 = Question.find_or_create_by(body: 'Последовательность операций над БД, переводящих ее из одного непротиворечивого состояния в другое непротиворечивое состояние, называется:', test_id: sybd_test.id)
Answer.find_or_create_by(body: 'транзитом', correct: 0, question_id: sybd_test_q2.id)
Answer.find_or_create_by(body: 'транзакцией', correct: 1, question_id: sybd_test_q2.id)
Answer.find_or_create_by(body: 'циклом', correct: 0, question_id: sybd_test_q2.id)

sybd_test_q3 = Question.find_or_create_by(body: 'СУБД – это:', test_id: sybd_test.id)
Answer.find_or_create_by(body: 'специальный программный комплекс для обеспечения доступа к данным и управления ими', correct: 1, question_id: sybd_test_q3.id)
Answer.find_or_create_by(body: 'система средств администрирования банка данных', correct: 0, question_id: sybd_test_q3.id)
Answer.find_or_create_by(body: 'система средств архивирования и резервного копирования банка данных', correct: 0, question_id: sybd_test_q3.id)

user1 = User.find_or_create_by(username: 'user1', email: 'email1@domen.ru')
Progress.find_or_create_by(user_id: user1.id, test_id: html_test.id)
Progress.find_or_create_by(user_id: user1.id, test_id: sybd_test.id)
user2 = User.find_or_create_by(username: 'user2', email: 'email2@domen.ru')
Progress.find_or_create_by(user_id: user2.id, test_id: html_test.id)
Progress.find_or_create_by(user_id: user2.id, test_id: sybd_test.id)
Progress.find_or_create_by(user_id: user2.id, test_id: ruby_test.id)
