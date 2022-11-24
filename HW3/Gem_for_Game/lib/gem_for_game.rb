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
  
  def put_into_html
    File.write("#{@breed}_#{@name}.html", "<!DOCTYPE html>\n
<html>
  <head>
    <meta charset='UTF-8'>
    <title>Tamagochi_Stat</title>
    <link href='style.css' rel='stylesheet' type='text/css'>
  </head>\n
  <body>
    <div>
      <p class='name_info'>Тип улюбленця: #{@breed}</p>
      <p class='name_info'>Ім'я улюбленця: #{@name}<br></p>
    </div>
    <p>Час: #{@time}</p>
    <p>Рівень здоров'я: #{@health}</p>
    <p>Рівень настрою: #{@mood}</p>
    <p>Рівень бадьорості: #{@tire}</p>
    <p>Рівень ситості: #{@hunger}</p>\n")
    case @status
    when "живий та веселий"
      put_into_file('    <div class="emoji">&#128512;</div>')
    when "живий та нейтральний"
      put_into_file('    <div class="emoji">&#128528;</div>')
    when "живий та сумний"
      put_into_file('    <div class="emoji">&#x2639;</div>')
    when "вмер"
      put_into_file('    <div class="emoji">&#x2620;</div>')
    end
    File.write("#{@breed}_#{@name}.html", "\n  </body>\n", mode: 'a')
    File.write("#{@breed}_#{@name}.html", "</html>\n", mode: 'a')
  end

  def make_css
    File.write("style.css", "p {\n
  font-size: 24px;
  text-align: center;
}\n
.name_info {
  font-size: 36px;
}\n
div {
  margin-bottom: 50px;
}\n
html {
  background-image: url(https://images.pexels.com/photos/325185/pexels-photo-325185.jpeg);
  background-repeat: no-repeat;
  background-position: center center;
  background-attachment: fixed;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}\n
.emoji {
  font-size:7rem;
  width:100%;
  text-align:center;
}\n")
  end

  private

  def put_into_file(text)
    File.write("#{@breed}_#{@name}.html", text, mode: 'a')
  end
end
