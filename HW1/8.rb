puts 'Умова:'
puts 'Дан целочисленный массив. Заменить все отрицательные элементы на значение максимального.'
array = [1, -1, 4, -4, 9, -9, 8, -8, 7, -7, 3, -3, 6, -6]
puts 'Масив: ' + array.to_s
puts 'Моє рішення:'
puts 'array_minus = [nil]'
puts 'array.each do |e|'
puts '  if (e < 0)'
puts '    array_minus.push(e)'
puts '  end'
puts 'end'
puts 'array_minus.compact!'
puts 'maximum = array_minus.max'
puts 'i = 0'
puts 'a = array.length'
puts 'while i < a'
puts '  if (array[i] < 0)'
puts '    array[i] = maximum'
puts '  end'
puts '  i = i + 1'
puts 'end'
array_minus = [nil]
array.each do |e|
	if (e < 0)
		array_minus.push(e)
	end
end
array_minus.compact!
maximum = array_minus.max
i = 0
a = array.length
while i < a
	if (array[i] < 0)
		array[i] = maximum
	end
	i = i + 1
end
puts 'Результат' + array.to_s
