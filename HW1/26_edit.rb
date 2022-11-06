puts 'Умова:'
puts 'Дан целочисленный массив. Найти максимальный четный элемент.'
array = [1, -1, 4, -4, 9, -9, 8, -8, 7, -7, 3, -3, 6, -6]
puts 'Масив: ' + array.to_s
maximum = array.select { |e| e.even? }.max
puts maximum.to_s