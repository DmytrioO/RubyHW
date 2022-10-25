puts "Умова задачі:"
puts "Дан целочисленный массив. Осуществить циклический сдвиг элементов массива влево на одну позицию."
array = [20, 1, 4, 9, 8, 7, 13, 18, 3, 6]
puts "Масив: " + array.to_s
puts "Моє рішення:"
puts 'i = 0'
puts 'a = array.length'
puts 'del = array[0]'
puts 'while i < a'
puts '  array[i] = array[i + 1]'
puts '  i = i + 1'
puts 'end'
puts 'array.compact!'
puts 'array.push(del)'
i = 0
a = array.length
del = array[0]
while i < a
	array[i] = array[i + 1]
	i = i + 1
end
array.compact!
array.push(del)
puts 'Результат: ' + array.to_s
