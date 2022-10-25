puts 'Умова:'
puts 'Дан целочисленный массив. Возвести в квадрат отрицательные элементы и в третью степень - положительные. Нулевые элементы - не изменять.'
array = [1, -1, 4, -4, 9, -9, 8, -8, 7, -7, 3, -3, 6, -6]
puts 'Масив: ' + array.to_s
puts 'Моє рішення: '
puts 'i = 0'
puts 'a = array.length'
puts 'while i < a'
puts '  if (array[i] > 0)'
puts '    array[i] = array[i] ** 3'
puts '  end'
puts '  if (array[i] < 0)'
puts '    array[i] = array[i] ** 2'
puts '  end'
puts '  i = i + 1'
puts 'end'
i = 0
a = array.length
while i < a
	if (array[i] > 0)
		array[i] = array[i] ** 3
	end
	if (array[i] < 0)
		array[i] = array[i] ** 2
	end
	i = i + 1
end
puts 'Результат: ' + array.to_s
