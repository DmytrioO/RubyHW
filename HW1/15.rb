puts 'Умова:'
puts 'Дано вещественное число R и массив вещественных чисел. Найти элемент массива, который наиболее близок к данному числу.'
puts "Число R: #{R}"
puts 'Масив: ' + array.to_s
puts 'Моє рішення:'
puts 'R = 15'
puts 'array = [20, 1, 4, 9, 8, 7, 13, 18, 3, 6]'
puts 'difference = (R - array[0]).abs'
puts 'minimum = difference'
puts 'indicator = 0'
puts 'array.each do |e|'
puts '  difference = (R - e).abs'
puts '  if (difference < minimum)'
puts '    minimum = difference'
puts '    indicator = array.index(e)'
puts '  end'
puts 'end'
R = 15
array = [20, 1, 4, 9, 8, 7, 13, 18, 3, 6]
difference = (R - array[0]).abs
minimum = difference
indicator = 0
array.each do |e|
	difference = (R - e).abs
	if (difference < minimum)
		minimum = difference
		indicator = array.index(e)
	end
end
puts 'Результат'
puts "Найменша різниця: #{minimum}"
puts 'Отримане число: ' + array[indicator].to_s
puts "Індекс числа: #{indicator}"
