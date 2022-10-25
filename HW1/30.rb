puts 'Умова:'
puts 'Дан целочисленный массив. Удалить все элементы, встречающиеся ровно два раза.'
array = [1, 1, 1, 2, 3, 3, 4, 5, 6, 6, 6, 6, 8, 21, 23, 23, 23, 21]
puts 'Масив: ' + array.to_s
puts 'Моє рішення: '
puts 'i = 0'
puts 'a = array.length'
puts 'while i < a'
puts '  counter = 0'
puts '  i1 = 0'
puts '  a1 = a'
puts '  while i1 < a1'
puts '    if (array[i1] == array[i])'
puts '      counter = counter + 1'
puts '    end'
puts '    i1 = i1 + 1'
puts '  end'
puts '  marker = array[i]'
puts '  if (counter == 2)'
puts '    i1 = 0'
puts '    a1 = a'
puts '    while i1 < a1'
puts '      if (array[i1] == marker and marker != nil)'
puts '        array[i1] = nil'
puts '      end'
puts '      i1 = i1 + 1'
puts '    end'
puts '  end'
puts '  i = i + 1'
puts 'end'
puts 'array.compact!'
i = 0
a = array.length
while i < a
	counter = 0
	i1 = 0
	a1 = a
	while i1 < a1
		if (array[i1] == array[i])
			counter = counter + 1
		end
		i1 = i1 + 1
	end
	marker = array[i]
	if (counter == 2)
		i1 = 0
		a1 = a
		while i1 < a1
			if (array[i1] == marker and marker != nil)
				array[i1] = nil
			end
			i1 = i1 + 1
		end
	end
	i = i + 1
end
array.compact!
puts 'Результат: ' + array.to_s
