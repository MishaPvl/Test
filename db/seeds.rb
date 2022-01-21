def male_first_names
  %w[Андрей Сергей Михаил Василий Денис Николай Виктор Дмитрий Владимир Олег].sample
end

def male_middle_names
  %w[Андреевич Сергеевич Михаилович Васильевич Денисович Николаевич Олегович].sample
end

def male_last_names
  %w[Иванов Лебедев Семенов Павлов Зайцев Волков Скворцов Грибов Елизаров Осипов].sample
end

def random_subject
  %w[Физика  История Культуроведение ТРПО Сети Математика].sample
end

3.times do

  Exam.find_or_create_by(first_name: male_first_names,
                         middle_name: male_middle_names,
                         last_name: male_last_names,
                         subject: random_subject,
                         date: 2021-21-01)
end

def female_first_names
  %w[Анфиса Лариса Ольга Мария Лидия Валерия Анна Марина Екатерина].sample
end

def female_middle_names
  %w[Сергеевна Олеговна Алексеевна Александровна Вячеславовна Ульяновна].sample
end

def female_last_names
  %w[Репина Хромова Боярская Аксенова Багрова Костикова Пирогова Мастерова].sample
end



4.times do
  Exam.find_or_create_by(first_name: female_first_names,
                         middle_name: female_middle_names,
                         last_name: female_last_names,
                         subject: random_subject,
                         date: 2022-01-21)
end

puts 'Seeds OK!'
