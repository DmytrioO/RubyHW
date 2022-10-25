puts "Умова задачі:"
puts "Дан целочисленный массив. Найти количество его локальных максимумов."
array = [20, 1, 4, 9, 8, 7, 13, 18, 3, 6]
puts "Масив: " + array.to_s
puts 'Моє рішення: '
puts 'minimum = 0'
puts 'maximum = 0'
puts 'counter = 0'
puts 'i = 1'
puts 'a = array.length'
puts 'while i < a'
puts '  if (array[i] < array[i - 1])'
puts '    minimum = 1'
puts '    if (maximum == 1)'
puts '      counter = counter + 1'
puts '      maximum = 0'
puts '    end'
puts '  else'
puts '    maximum = 1'
puts '    minimum = 0'
puts '  end'
puts '  i = i + 1'
puts 'end'
minimum = 0
maximum = 0
counter = 0
i = 1
a = array.length
while i < a
	if (array[i] < array[i - 1])
		minimum = 1
		if (maximum == 1)
			counter = counter + 1
			maximum = 0
		end
	else
		maximum = 1
		minimum = 0
	end
	i = i + 1
end
puts 'Результат: ' + counter.to_s
