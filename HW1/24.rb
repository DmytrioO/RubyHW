puts 'Умова:'
puts 'Дан целочисленный массив. Найти минимальный четный элемент.'
array = [1, -1, 4, -4, 9, -9, 8, -8, 7, -7, 3, -3, 6, -6]
puts 'Масив: ' + array.to_s
puts 'Моє рішення: '
puts 'array_2 = [nil]'
puts 'array.each do |e|'
puts '  if (e % 2 == 0)'
puts '    array_2.push(e)'
puts '  end'
puts 'end'
puts 'array_2.compact!'
puts 'minimum = array_2.min'
array_2 = []
array.each do |e|
	if (e % 2 == 0)
		array_2.push(e)
	end
end
minimum = array_2.min
puts "Результат: #{minimum}"
