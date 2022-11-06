puts 'Умова:'
puts 'Дан целочисленный массив. Преобразовать его, вставив после каждого отрицательного элемента нулевой элемент.'
array = [1, -1, 4, -4, 9, -9, 8, -8, 7, -7, 3, -3, 6, -6]
puts 'Масив: ' + array.to_s
puts 'Моє рішення:'
puts 'i = 0'
puts 'a = array.length'
puts 'while i < a'
puts '  if (array[i] < 0)'
puts '    indicator_start = i + 1'
puts '    indicator_end = a - 1'
puts '    while indicator_end >= indicator_start'
puts '      array[indicator_end + 1] = array[indicator_end]'
puts '      indicator_end = indicator_end - 1'
puts '    end'
puts '    array[i + 1] = 0'
puts '    a = a + 1'
puts '  end'
puts '  i = i + 1'
puts 'end'
i = 0
a = array.length
while i < a
	if (array[i] < 0)
		indicator_start = i + 1
		indicator_end = a - 1
		while indicator_end >= indicator_start
			array[indicator_end + 1] = array[indicator_end]
			indicator_end = indicator_end - 1
		end
		array[i + 1] = array[0]
		i = i + 1
		a = a + 1
	end
	i = i + 1
end
puts 'Результат' + array.to_s
