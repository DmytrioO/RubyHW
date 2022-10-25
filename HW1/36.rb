puts 'Умова:'
puts 'Дан дипапазон a..b. Получить массив из чисел, расположенных в этом диапазоне (исключая сами эти числа), в порядке их возрастания, а также размер этого массива.'
print 'Введіть перше число діпазону: '
a1 = (gets.chomp).to_i
print 'Введіть друге число діапазону: '
b1 = (gets.chomp).to_i
puts 'Моє рішення:'
puts 'a1 = (gets.chomp).to_i'
puts 'b1 = (gets.chomp).to_i'
puts 'if (a1 == b1)
	puts \'Числа рівні!\'
	final = 1
end
if (final != 1)
	array1 = [nil]
	if (a1 < b1)
		a = a1 + 1
		b = b1
	else
		a = b1 + 1
		b = a1
	end
	while a < b
		array1.push(a)
		a = a + 1
	end
	array1.compact!
end'
if (a1 == b1)
	puts 'Числа рівні!'
	final = 1
end
if (final != 1)
	array1 = [nil]
	if (a1 < b1)
		a = a1 + 1
		b = b1
	else
		a = b1 + 1
		b = a1
	end
	while a < b
		array1.push(a)
		a = a + 1
	end
	array1.compact!
	puts 'Результат: ' + array1.to_s
	puts 'Розмір масиву: ' + array1.length.to_s
end
