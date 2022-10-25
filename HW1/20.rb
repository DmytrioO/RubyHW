puts 'Умова:'
puts 'Дан целочисленный массив. Упорядочить его по возрастанию.'
array = [1, -1, 4, -4, 9, -9, 8, -8, 7, -7, 3, -3, 6, -6]
puts 'Масив: ' + array.to_s
puts 'Моє рішенння:'
puts 'array.sort!'
array.sort!
puts 'Результат: ' + array.to_s
