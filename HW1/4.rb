puts 'Умова:'
puts 'Дан целочисленный массив. Преобразовать его, прибавив к нечетным числам последний элемент. Первый и последний элементы массива не изменять.'
array = [20, 1, 4, 9, 8, 7, 13, 18, 3, 6]
puts "Масив: " + array.to_s
puts 'Моє рішення: '
puts 'a = array.length - 1'
puts 'i = 1'
puts 'while i < a'
puts '  if (array[i] % 2 != 0)'
puts '    array[i] = array[i] + array[a]'
puts '  end'
puts '  i = i + 1'
puts 'end'
a = array.length - 1
i = 1
while i < a
	if (array[i] % 2 != 0)
		array[i] = array[i] + array[a]
	end
	i = i + 1
end
puts 'Результат: ' + array.to_s
