puts "Умова задачі:"
puts "Дан целочисленный массив. Найти максимальный из его локальных максимумов."
array = [20, 1, 4, 9, 8, 7, 13, 18, 3, 6]
puts "Масив: " + array.to_s
puts 'Моє рішення:'
puts 'array = [20, 1, 4, 9, 8, 7, 13, 18, 3, 6]'
puts 'array_max = [nil]'
puts 'minimum = 0'
puts 'maximum = 0'
puts 'i = 1'
puts 'a = array.length'
puts 'while i < a'
puts '  if (array[i] < array[i - 1])'
puts '    minimum = 1'
puts '    if (maximum == 1)'
puts '      array_max.push(array[i - 1])'
puts '      maximum = 0'
puts '    end'
puts '  else'
puts '    maximum = 1'
puts '    minimum = 0'
puts '  end'
puts '  i = i + 1'
puts 'end'
puts 'array_max.compact!'
puts 'max = array_max.max'
array_max = [nil]
minimum = 0
maximum = 0
i = 1
a = array.length
while i < a
	if (array[i] < array[i - 1])
		minimum = 1
		if (maximum == 1)
			array_max.push(array[i - 1])
			maximum = 0
		end
	else
		maximum = 1
		minimum = 0
	end
	i = i + 1
end
array_max.compact!
max = array_max.max
puts 'Результат: ' + max.to_s
