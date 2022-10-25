puts 'Умова:'
puts 'Дан целочисленный массив. Найти индекс максимального элемента.'
array = [1, -1, 4, -4, 9, -9, 8, -8, 7, -7, 3, -3, 6, -6]
puts 'Масив: ' + array.to_s
puts 'Моє рішення:'
puts 'index = array.index(array.max)'
index = array.index(array.max)
puts 'Результат: ' + index.to_s
