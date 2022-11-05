puts "Умова задачі:"
puts "Дан целочисленный массив. Необходимо вывести вначале его элементы с четными индексами, а затем - с нечетными."
array = [20, 1, 4, 9, 8, 7, 13, 18, 3, 6]
puts "Масив: " + array.to_s
puts 'Моє рішення:'
puts 'array.partition { |e| e.even? }.flatten'
puts 'Результат виконання: ' + (array.partition { |e| e.even? }).flatten.to_s
