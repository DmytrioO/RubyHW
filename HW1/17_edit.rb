puts 'Умова:'
puts 'Дан целочисленный массив. Преобразовать его, вставив перед каждым отрицательным элементом нулевой элемент.'
array = [1, -1, 4, -4, 9, -9, 8, -8, 7, -7, 3, -3, 6, -6]
puts 'Масив: ' + array.to_s
i = 1
a = array.length
while i < a
  if array[i] < 0
    ind_end = a - 1
    while ind_end >= i
      array[ind_end + 1] = array[ind_end]
      ind_end = ind_end - 1
    end
    array[i] = array[0]
    i = i + 1
    a = a + 1
  end
  i = i + 1
end
puts array.to_s