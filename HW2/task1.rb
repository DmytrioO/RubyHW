array = [621, 445, 147, 159, 430, 222, 482, 44, 194, 522, 652, 494, 14, 126, 532, 387, 441, 471, 337, 446, 18, 36, 202, 574, 556, 458, 16, 139, 222, 220, 107, 82, 264, 366, 501, 319, 314, 430, 55, 336]
#Дізнатися кількість елементів в масиві
puts 'Дізнатися кількість елементів в масиві: ' + array.length.to_s
puts ''
#Перевернути масив
puts 'Перевернути масив: ' + array.reverse.to_s
puts ''
#Знайти найбільше число
puts 'Знайти найбільше число: ' + array.max.to_s
puts ''
#Знайти найменше число
puts 'Знайти найменше число: ' + array.min.to_s
puts ''
#Відсортувати від меншого до більшого
puts 'Відсортувати від меншого до більшого: ' + array.sort.to_s
puts ''
#Відсортувати від більшого до меншого
puts 'Відсортувати від більшого до меншого: ' + array.sort.reverse.to_s
puts ''
#Видалити всі непарні числа
puts 'Видалити всі непарні числа: ' + array.select(&:even?).to_s
puts ''
#Залишити тільки ті числа, які без остачі діляться на 3
puts 'Залишити тільки ті числа, які без остачі діляться на 3: ' + array.select { |e| e%3 == 0 }.to_s
puts ''
#Видалити з масиву числа, які повторюються
puts 'Видалити з масиву числа, які повторюються: ' + array.uniq.to_s
puts ''
#Розділити кожен елемент масиву на 10, при цьому елементи не мають бути округленими до 
#цілого
i = 0
result = []
array.each { |e| result.push(e.to_f/10) }
puts 'Розділити кожен елемент масиву на 10, при цьому елементи не мають бути округленими до цілого: ' + result.to_s
puts ''
#Отримати новий масив, який би містив в собі ті літери англійського алфавіту, порядковий номер яких є в нашому масиві
array1 = []
array.each { |e| array1.push(e) }
i = 0
a = array1.length
while i < a
  b = array1[i] + 64
  if b >= 65 and b <= 90
    array1[i] = b.chr
  end
  i = i + 1
end
puts 'Отримати новий масив, який би містив в собі ті літери англійського алфавіту, порядковий номер яких є в нашому масиві: ' + array1.to_s
puts ''
#Змінити місцями мінімальний і максимльний елементи
array1 = []
array.each { |e| array1.push(e) }
min_index = array1.index(array1.min)
max_index = array1.index(array1.max)
min = array1.min
max = array1.max
array1[min_index] = max
array1[max_index] = min
puts 'Змінити місцями мінімальний і максимльний елементи: ' + array1.to_s
puts ''
#Знайти елементи, які знаходяться перед мінімальним елементом в масиві
array1 = []
min_index = array.index(array.min)
i = 0
while i < min_index
  array1.push(array[i])
  i = i + 1
end
puts 'Знайти елементи, які знаходяться перед мінімальним елементом в масиві: ' + array1.to_s
puts ''
#Знайти три найменших елементи
array1 = []
array.each { |e| array1.push(e) }
max = array1.max
i = 0
min = []
while i < 3
	min.push(array1.min)
	array1[array1.index(array1.min)] = max
	i = i + 1
end
puts 'Знайти три найменших елементи: ' + min.to_s
puts ''