puts 'Умова:'
puts 'Дан целочисленный массив. Найти количество нечетных элементов.'
array = [20, 1, 4, 9, 8, 7, 13, 18, 3, 6]
puts 'Масив: ' + array.to_s
puts 'Моє рішення:'
puts 'indicator = 0
array.each do |e|
	if (e % 2 != 0)
		indicator = indicator + 1
	end
end'
indicator = 0
array.each do |e|
	if (e % 2 != 0)
		indicator = indicator + 1
	end
end
puts 'Результат: ' + indicator.to_s
