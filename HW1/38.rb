puts 'Умова:'
puts 'Дано число А и натуральное число N. Найти результат следующего выражения 1 + А + А*2 + А*3 + … + А*N.'
print 'Введіть число А: '
a = (gets.chomp).to_i
print 'Введіть число N: '
n = (gets.chomp).to_i
if n < 0 or n > 9
	while n < 0 or n > 9
		puts 'N не може бути від\'ємним, чи більшим за 9!'
		print 'Введіть число N ще раз: '
		n = (gets.chomp).to_i
	end
end
i = 1
sum = 1
while i <= n
	sum = sum + (a * i)
	i = i + 1
end
puts 'Результат: ' + sum.to_s
puts ''
puts 'Моє рішення:'
puts 'a = (gets.chomp).to_i
n = (gets.chomp).to_i
if n < 0 or n > 9
	while n < 0 or n > 9
		puts \'N не може бути від\'ємним, чи більшим за 9!\'
		print \'Введіть число N ще раз: \'
		n = (gets.chomp).to_i
	end
end''
i = 1
sum = 1
while i <= n
	sum = sum + (a * i)
	i = i + 1
end'
