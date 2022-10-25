puts 'Умова:'
puts 'Дан целочисленный массив. Заменить все отрицательные элементы на значение минимального.'
array = [1, -1, 4, -4, 9, -9, 8, -8, 7, -7, 3, -3, 6, -6]
puts 'Масив: ' + array.to_s
puts 'Моє рішення: '
puts 'minimum = array.min'
puts 'i = 0'
puts 'a = array.length'
puts 'while i < a'
puts '  if array[i] < 0'
puts '    array[i] = minimum'
puts '  end'
puts '  i = i + 1'
puts 'end'
minimum = array.min
i = 0
a = array.length
while i < a
	if array[i] < 0
		array[i] = minimum
	end
	i = i + 1
end
puts 'Результат: ' + array.to_s
