puts 'Умова:'
puts 'Дан целочисленный массив и число К. Вывести количество элементов, меньших К.'
array = [20, 1, 4, 9, 8, 7, 13, 18, 3, 6]
puts 'Масив: ' + array.to_s
print 'Введіть число К: '
k = (gets.chomp).to_i
counter = 0
array.each do |e|
	if (e < k)
		counter = counter + 1
	end
end
puts "Результат: #{counter}"
puts ''
puts 'Моє рішення:'
puts 'k = (gets.chomp).to_i
counter = 0
array.each do |e|
	if (e < k)
		counter = counter + 1
	end
end'
