puts 'Умова:'
puts 'Дан целочисленный массив. Найти среднее арифметическое квадратов его элементов.'
array = [1, -1, 4, -4, 9, -9, 8, -8, 7, -7, 3, -3, 6, -6]
puts 'Масив: ' + array.to_s
puts 'Моє рішення:'
puts 'sum = 0.0'
puts 'array.each do |e|'
puts '  sum = sum + (e ** 2)'
puts 'end'
puts 'sum = (sum / array.length).round(2)'
sum = 0.0
array.each do |e|
	sum = sum + (e ** 2)
end
sum = (sum / array.length).round(2)
puts "Результат: #{sum}"
