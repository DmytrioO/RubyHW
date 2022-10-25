puts 'Умова:'
puts 'Дано целое число. Найти сумму его цифр.'
print 'Введіть число від 0 до 999: '
num = (gets.chomp).to_i
if num > 999 or num < 0
	while num > 999 or num < 0
		puts 'Число некоректне!'
		print 'Введіть ще раз: '
		num = (gets.chomp).to_i
	end
end
r1 = (num / 100).to_i
r2 = (num / 10).to_i - (r1 * 10)
r3 = num - (r1 * 100 + r2 * 10)
sum = r1 + r2 + r3
puts sum.to_s
