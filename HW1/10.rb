puts "Умова задачі:"
puts "Дан целочисленный массив. Осуществить циклический сдвиг элементов массива вправо на одну позицию."
array = [20, 1, 4, 9, 8, 7, 13, 18, 3, 6]
puts "Масив: " + array.to_s
puts 'Моє рішення:'
puts 'i = array.length'
puts 'a = -1'
puts 'while i > a'
puts '  array[i] = array[i - 1]'
puts '  i = i - 1'
puts 'end'
puts 'i = array.length - 1'
puts 'array[i] = nil'
puts 'array.compact!'
i = array.length
a = -1
while i > a
	array[i] = array[i - 1]
	i = i - 1
end
i = array.length - 1
array[i] = nil
array.compact!
puts 'Результат: ' + array.to_s
