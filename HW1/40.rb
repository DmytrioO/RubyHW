puts 'Умова:'
puts 'Дано натуральное число N. Если N - нечетное, то найти произведение 1*3*…*N; если N - четное, то найти произведение 2*4*…*N.'
print 'Введіть число N: '
n = (gets.chomp).to_i
if n < 0 or n > 9
	while n < 0 or n > 9
		puts 'N не може бути від\'ємним, чи більшим за 9!'
		print 'Введіть число N ще раз: '
		n = (gets.chomp).to_i
	end
end
if n != 0
	sum = 1
	if n % 2 == 0
		i = 2
	end
	if n % 2 != 0
		i = 1
	end
	while i <= n
		sum = sum * i
		i = i + 2
	end
end
if n == 0
	sum = 0
end
puts 'Результат:' + sum.to_s
puts ''
puts 'Моє рішення:'
puts 'n = (gets.chomp).to_i
if n < 0 or n > 9
	while n < 0 or n > 9
		puts \'N не може бути від\'ємним, чи більшим за 9!\'
		print \'Введіть число N ще раз: \'
		n = (gets.chomp).to_i
	end
end
if n != 0
	sum = 1
	if n % 2 == 0
		i = 2
	end
	if n % 2 != 0
		i = 1
	end
	while i <= n
		sum = sum * i
		i = i + 2
	end
end
if n == 0
	sum = 0
end'
