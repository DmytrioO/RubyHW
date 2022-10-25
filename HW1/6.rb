puts 'Умова:'
puts 'Дан целочисленный массив. Заменить все положительные элементы на значение максимального.'
array = [1, -1, 4, -4, 9, -9, 8, -8, 7, -7, 3, -3, 6, -6]
puts 'Масив: ' + array.to_s
puts 'Моє рішення:'
puts 'maximum = array.max'
puts 'a = array.length'
puts 'i = 0'
puts 'while i < a'
puts '  if (array[i] > 0)'
puts '    array[i] = maximum'
puts '  end'
puts '  i = i + 1'
puts 'end'
maximum = array.max
a = array.length
i = 0
while i < a
	if (array[i] > 0)
		array[i] = maximum
	end
	i = i + 1
end
puts 'Рішення: ' + array.to_s
