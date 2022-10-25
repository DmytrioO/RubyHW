puts 'Умова:'
puts 'Дан целочисленный массив. Вывести номер первого из тех его элементов, которые удовлетворяют двойному неравенству: A[0] < A[i] < A[-1]. Если таких элементов нет, то вывести [ ].'
array = [20, 1, 4, 9, 8, 7, 13, 18, 3, 6]
puts 'Масив: ' + array.to_s
puts 'Рішення: '
puts 'a = -1'
puts 'array.each do |e|'
puts '  if (e > array[0] and e < array[-1])'
puts '    a = array.index(e)'
puts '    puts a.to_s'
puts '    break'
puts '  end'
puts 'end'
puts 'if a == - 1'
puts '  puts \'[ ]\''
puts 'end'
a = -1
print 'Результат виконання: '
array.each do |e|
	if (e > array[0] and e < array[-1])
		a = array.index(e)
		puts a.to_s
		break
	end
end
if a == - 1
	puts '[ ]'
end
