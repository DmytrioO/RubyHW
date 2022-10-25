puts 'Умова:'
puts 'Дан целочисленный массив и число К. Если существует элемент, больший К, то вывести true; в противном случае вывести false.'
array = [20, 1, 4, 9, 8, 7, 13, 18, 3, 6]
puts 'Масив: ' + array.to_s
print 'Введіть число К: '
k = (gets.chomp).to_i
ind = 0
array.each do |e|
	if e > k
		ind = 1
	end
end
if  ind == 0
	puts 'Результат: ' + false.to_s
end
if ind == 1
	puts 'Результат: ' + true.to_s
end
puts ''
puts 'Моє рішення:'
puts 'k = (gets.chomp).to_i
ind = 0
array.each do |e|
	if e > k
		ind = 1
	end
end
if  ind == 0
	puts \'Результат: \' + false.to_s
end
if ind == 1
	puts \'Результат: \' + true.to_s
end'
