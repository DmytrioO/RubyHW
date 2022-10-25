puts "Умова задачі:"
puts "Дан целочисленный массив. Найти минимальный из его локальных минимумов."
array = [20, 1, 4, 9, 8, 7, 13, 18, 3, 6]
puts "Масив: " + array.to_s
array_min = [nil]
minimum = 0
maximum = 0
i = 1
a = array.length
while i < a
	if (array[i] < array[i - 1])
		minimum = 1
		maximum = 0
	else
		maximum = 1
		if (minimum == 1)
			array_min.push(array[i - 1])
			minimum = 0
		end
	end
	i = i + 1
end
array_min.compact!
min = array_min.min
puts 'Результат: ' + min.to_s
