module Make_HTML
  def get_info(breed, name, health, hunger, tire, mood, time)
    @breed = breed
    @name = name
    @health = health
    @hunger = hunger
    @tire = tire
    @mood = mood
    @time = time
  end
  
  def put_into_html
  File.write("index.html", "<p>Порода улюбленця: #{@breed}</p>")
  File.write("index.html", "<p>Ім\'я улюбленця: #{@name}<br></p>", mode: "a")
  File.write("index.html", "<p>Час: #{@time}</p>", mode: "a")
  File.write("index.html", "<p>Рівень здоров\'я: #{@health}</p>", mode: "a")
  File.write("index.html", "<p>Рівень настрою: #{@mood}</p>", mode: "a")
  File.write("index.html", "<p>Рівень бадьорості: #{@tire}</p>", mode: "a")
  File.write("index.html", "<p>Рівень ситості: #{@hunger}</p>", mode: "a")
  end
end