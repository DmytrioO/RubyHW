puts 'Умова:'
puts 'Дан целочисленный массив. Найти среднее арифметическое его элементов.'
array = [20, 1, 4, 9, 8, 7, 13, 18, 3, 6]
puts 'Масив: ' + array.to_s
puts 'Моє рішення:'
puts 'sum = 0.0
array.each do |e|
	sum = sum + e
end
sum = (sum / array.length).round(2)'
sum = 0.0
array.each do |e|
	sum = sum + e
end
sum = (sum / array.length).round(2)
puts 'Результат: ' + sum.to_s
