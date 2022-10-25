puts 'Умова:'
puts 'Дан целочисленный массив. Найти все нечетные элементы.'
array = [20, 1, 4, 9, 8, 7, 13, 18, 3, 6]
puts 'Масив: ' + array.to_s
puts 'Моє рішення:'
puts 'array1 = [nil]
array.each do |e|
	if (e % 2 != 0)
		array1.push(e)
	end
end
array1.compact!'
array1 = [nil]
array.each do |e|
	if (e % 2 != 0)
		array1.push(e)
	end
end
array1.compact!
puts 'Результат: ' + array1.to_s
