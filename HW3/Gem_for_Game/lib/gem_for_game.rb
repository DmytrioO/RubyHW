module Make_HTML
  def get_info(breed, name, health, hunger, tire, mood, time, status)
    @breed = breed
    @name = name
    @health = health
    @hunger = hunger
    @tire = tire
    @mood = mood
    @time = time
    @status = status
  end
  
  def put_into_html()
    File.write(@breed + "_" + @name + ".html", "<!DOCTYPE html>\n\n")
    File.write(@breed + "_" + @name + ".html", "<head>\n", mode: "a")
    File.write(@breed + "_" + @name + ".html", "<meta charset=\"UTF-8\">\n", mode: "a")
    File.write(@breed + "_" + @name + ".html", "<title>Tamagochi_Stat</title>\n", mode: "a")
    File.write(@breed + "_" + @name + ".html", "<link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\">", mode: "a")
    File.write(@breed + "_" + @name + ".html", "</head>\n\n", mode: "a")
    File.write(@breed + "_" + @name + ".html", "<body>\n", mode: "a")
    File.write(@breed + "_" + @name + ".html", "<div>\n", mode: "a")
    File.write(@breed + "_" + @name + ".html", "<p class=\"name_info\">Тип улюбленця: #{@breed}</p>\n", mode: "a")
    File.write(@breed + "_" + @name + ".html", "<p class=\"name_info\">Ім\'я улюбленця: #{@name}<br></p>\n", mode: "a")
    File.write(@breed + "_" + @name + ".html", "</div>\n", mode: "a")
    File.write(@breed + "_" + @name + ".html", "<p>Час: #{@time}</p>\n", mode: "a")
    File.write(@breed + "_" + @name + ".html", "<p>Рівень здоров\'я: #{@health}</p>\n", mode: "a")
    File.write(@breed + "_" + @name + ".html", "<p>Рівень настрою: #{@mood}</p>\n", mode: "a")
    File.write(@breed + "_" + @name + ".html", "<p>Рівень бадьорості: #{@tire}</p>\n", mode: "a")
    File.write(@breed + "_" + @name + ".html", "<p>Рівень ситості: #{@hunger}</p>\n", mode: "a")
    if (@status == "живий та веселий")
      File.write(@breed + "_" + @name + ".html", "<div class=\"emoji\">&#128512;</div>", mode: "a")
    end
    if (@status == "живий та нейтральний")
      File.write(@breed + "_" + @name + ".html", "<div class=\"emoji\">&#128528;</div>", mode: "a")
    end
    if (@status == "живий та сумний")
      File.write(@breed + "_" + @name + ".html", "<div class=\"emoji\">&#x2639;</div>", mode: "a")
    end
    if (@status == "вмер")
      File.write(@breed + "_" + @name + ".html", "<div class=\"emoji\">&#x2620;</div>", mode: "a")
    end
    File.write(@breed + "_" + @name + ".html", "</body>\n", mode: "a")
  end

  def make_css
    File.write("style.css", "p {\n")
    File.write("style.css", "font-size: 24px;\n", mode: "a")
    File.write("style.css", "text-align: center;\n", mode: "a")
    File.write("style.css", "}\n\n", mode: "a")
    File.write("style.css", ".name_info {\n", mode: "a")
    File.write("style.css", "font-size: 36px;\n", mode: "a")
    File.write("style.css", "}\n\n", mode: "a")
    File.write("style.css", "div {\n", mode: "a")
    File.write("style.css", "margin-bottom: 50px;\n", mode: "a")
    File.write("style.css", "}\n\n", mode: "a")
    File.write("style.css", "html {\n", mode: "a")
    File.write("style.css", "background-image: url(https://images.pexels.com/photos/325185/pexels-photo-325185.jpeg);\n", mode: "a")
    File.write("style.css", "background-repeat: no-repeat;\n", mode: "a")
    File.write("style.css", "background-position: center center;\n", mode: "a")
    File.write("style.css", "background-attachment: fixed;\n", mode: "a")
    File.write("style.css", "-webkit-background-size: cover;\n", mode: "a")
    File.write("style.css", "-moz-background-size: cover;\n", mode: "a")
    File.write("style.css", "-o-background-size: cover;\n", mode: "a")
    File.write("style.css", "background-size: cover;\n", mode: "a")
    File.write("style.css", "}\n\n", mode: "a")
    File.write("style.css", ".emoji {\n", mode: "a")
    File.write("style.css", "font-size:7rem;\n", mode: "a")
    File.write("style.css", "width:100%;\n", mode: "a")
    File.write("style.css", "text-align:center;\n", mode: "a")
    File.write("style.css", "}\n\n", mode: "a")
  end
end