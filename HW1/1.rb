puts "Умова задачі:"
puts "Дан целочисленный массив. Необходимо вывести вначале его элементы с четными индексами, а затем - с нечетными."
array = [20, 1, 4, 9, 8, 7, 13, 18, 3, 6]
puts "Масив: " + array.to_s
array1 = [nil]
array.each do |e| 
	if e % 2 == 0 
		array1.unshift(e) 
	else 
		array1.push(e) 
	end 
	array1.compact! 
end
puts 'Моє рішення:'
puts 'array = [20, 1, 4, 9, 8, 7, 13, 18, 3, 6]'
puts 'array1 = [nil]'
puts 'array.each do |e|'
puts '  if e % 2 == 0' 
puts '    array1.unshift(e)' 
puts '  else' 
puts '    array1.push(e)' 
puts '  end' 
puts '  array1.compact!' 
puts 'end'
puts 'Результат виконання: ' + array1.to_s
