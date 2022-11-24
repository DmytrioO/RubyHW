require 'gem_for_game'

class Pet
  include Make_HTML

  TIME_BEFORE_START = 600
  START_TIRE = 51.33
  START_HUNGER = 51.33

  def set_statuses
    @chmood = 1
    @chhunger = 1
    @chtire = 1
    @game_true = 0
    @status_pet = 'живий'
  end
  
  def get_name_html(name_file)
    @name_file = name_file
  end
  
  def make_start
    make_css
  end
  
  def info_status
    @status_pet
  end
  
  def set_time
    @time = Time.new - TIME_BEFORE_START
  end
   
  def give_breed(breed)
    puts 'Прийнято!'
    @breed = breed.capitalize
  end

  def give_name(name)
    puts 'Домовились!'
    @name = name.capitalize
  end
  
  def details
    puts "Тип улюбленця: #{@breed}"
    puts "Ім'я улюбленця: #{@name}"
  end
  
  def set_health
    @health = (rand(2..10) * 10).to_f
    case @health
    when 20
      puts "На жаль, твій улюбленець з'явився на світ достатньо слабеньким :("
      puts 'Проте не переймайся - при належному догляді він ще зможе стати досить класним!'
      puts "Рівень здоров'я #{@name}: #{@health}"
    when 30
      puts "Інколи в житті трапляється так, що наші улюбленці не можуть похизуватися міцним здоров'ям..."
      puts 'Але зауважу, що при належному догляді в нього є всі шанси стати здоровішим!'
      puts "Рівень здоров'я #{@name}: #{@health}"
    when 40
      puts "Його доля бути міцним як скеля, але стан здоров'я поки не дозволяє..."
      puts "Не забувай сумлінно доглядати за #{@name}, і буде вам щастя!"
      puts "Рівень здоров'я #{@name}: #{@health}"
    when 50
      puts "Для оптиміста стакан наполовину повний, для песиміста - наполовину пустий... А що сказати про #{@name}?"
      puts "Стан здоров'я твого улюбленця дещо кращий, ніж могло би бути, але не варто нехтувати якісним доглядом"
      puts "Рівень здоров'я #{@name}: #{@health}"
    when 60
      puts 'Мушу визнати, що тобі трапився досить непоганий улюбленець.'
      puts "Не забувай доглядати за #{@name}, і досить скоро отримаєш надзвичайно міцного улюбленця!"
      puts "Рівень здоров'я #{@name}: #{@health}"
    when 70
      sell_pet
      puts "Не забувай доглядати за #{@name}, і досить скоро отримаєш надзвичайно міцного улюбленця!"
      puts "Рівень здоров'я #{@name}: #{@health}"
    when 80
      puts 'Твій улюбленець досить міцний та здоровий. Приємно бачити його таким :)'
      puts "Якщо хочеш, щоб справи у #{@name} були ще краще - сумлінно за ним доглядай!"
      puts "Рівень здоров'я #{@name}: #{@health}"
    when 90
      puts 'Та твій улюбленець прямо таки максимально наближений до ідеалу!'
      puts 'Належний догляд допоможе стати йому по справжньому класним!'
      puts "Рівень здоров'я #{@name}: #{@health}"
    when 100
      puts 'Хоч в житті ідеалів і не існує - мушу сказати, що твій улюбленець просто ідеальний.'
      puts "#{@name} знадобиться належний догляд, щоб не погіршувати стан його здоров'я!"
      puts "Рівень здоров'я #{@name}: #{@health}"
    end
    @medicine = 0
    @ind_medicine = 0
  end
  
  def set_mood
    @mood = (rand(1..3) * 10).to_f
    case @mood
    when 10
      puts 'Настрій твого улюбленця препаскудний. Схоже тобі доведеться дуже сильно постратися, щоб його виправити.'
      puts "Рівень настрою #{@name}: #{@mood}"
    when 20
      puts "Настрій #{@name} просто жахливий. Сподіваюся ти знайдеш, чим його розвеселити."
      puts "Рівень настрою #{@name}: #{@mood}"
    when 30
      puts "#{@name} чимось дуже стурбований, настрій достатньо поганенький."
      puts 'Приділяй якомога більше часу своєму улюбленцю, якщо прагнеш побачити його в кращому настрої!'
      puts "Рівень настрою #{@name}: #{@mood}"
    end
  end
  
  def set_tire
    @tire = START_TIRE
  end
  
  def set_hunger
    @hunger = START_HUNGER
  end
  
  def show_statistics
    if @status_pet == 'вмер'
      @mood = 0
      @tire = 0
      @hunger = 0
    end
    puts "Час: #{@time}"
    puts "Здоров'я: #{@health}"
    puts "Настрій: #{@mood}"
    puts "Бадьорість: #{@tire}"
    puts "Ситість: #{@hunger}"
    puts ''
    if @mood != '?'
      if @mood >= 53.00 then status_emoji = 'живий та веселий' end
      if @mood.between?(40, 52.99) then status_emoji = 'живий та нейтральний' end
      if @mood.between?(0, 39.99) then status_emoji = 'живий та сумний' end
      if @status_pet == 'вмер' then status_emoji = 'вмер' end
    end
      get_info(@breed, @name, @health, @hunger, @tire, @mood, @time, status_emoji)
      put_into_html
  end
  
  def care
    @chmood = 0
    set_sentence = rand(0..2)
    case set_sentence
    when 0
      puts 'Коли гладиш свого улюбленця час проходить непомітно!'
    when 1
      puts 'Твій улюбленець дивиться тобі прямо у вічі. За його поглядом стає зрозуміло, що він дуже задоволений цим процесом.'
    when 2
      puts "#{@name} просто неймовірно кайфує, від того, що ти його пестиш!"
    end
    mood = rand(3..7)
    change_mood(mood)
    time = 600
    change_time(time)
  end
  
  def give_medicine
    if @medicine == 1 && @health < 30 then puts 'Ти вже давав ліки своєму другу. Доведеться почекати!' end
    if @health >= 30 then puts 'Твій улюбленець має завеликий рівень здоровʼя для прийому ліків!' end
    if @medicine != 1 && @health < 30
      change_health(10)
      @medicine += 1
      @ind_medicine = @time
    end
  end
  
  def give_food
    puts 'Обери тип їжі:'
    puts '1 - Корм'
    puts '2 - Фрукти чи овочі'
    puts '3 - Щось зі столу'
    status = '0'
    while not status.to_i.between?(1, 3)
      print 'Обирай: '
      status = gets.chomp
      if status.to_s.downcase == 'help'
        puts 'Підказка: Необхідно обрати тип їжі для свого улюбленця. Кожен тип їжі має певні властивості.'
        puts '1 - Корм збільшує ситість улюбленця від +7 до +20, проте інколи улюбленець може не захотіти його їсти.'
        puts '2 - Фрукти та овочі він їстиме завжди. Вони можуть збільшувати показник здоровʼя на 0...+2, та ситості від +3 до +6. Проте інколи вони можуть бути зіпсованими, і знімати 5 показників здоровʼя, 3 ситості та 10 настрою.'
        puts '3 - Коли ти даєш щось зі столу - це може збільшувати показник настрою на +3...+8 та ситість на +8...+14, проте інколи зі столу ти можеш дати щось не те - тоді улюбленець втратить 12 показників здоровʼя, 15 ситості та 10 настрою.'
      end
      unless status.to_i.between?(1, 3) then puts 'Команда некоректна! Спробуй ще раз!' end
    end
    case status.to_s
    when '1'
      status_eat = rand(0..10)
      if status_eat == 9 then puts "Яка прикрість, #{@name} не хоче їсти цей корм :("
      else
        puts "#{@name} нормально поїв, і тепер виглядає більш ситим!"
        @chhunger = 0
        hunger_eat = rand(7..20)
        change_hunger(hunger_eat)
      end
    when '2'
      status_eat = rand(0..12)
      if status_eat == 8 or status_eat == 9
        @chhunger = 0
        @chmood = 0
        puts "Їжа виявилася несвіжою :( #{@name} виглядає не дуже добре"
        change_health(-5)
        change_hunger(-3)
        change_mood(-10)
      else
        puts "#{@name} нормально поїв, і тепер виглядає більш ситим!"
        health_eat = rand(0..2)
        hunger_eat = rand(3..6)
        @chhunger = 0
        change_health(health_eat)
        change_hunger(hunger_eat)
      end
    when '3'
      status_eat = rand(0..15)
      if status_eat > 11
        puts 'Виявляється улюбленцю такого давати було не можна :('
        @chmood = 0
        @chhunger = 0
        change_health(-12)
        change_hunger(-15)
        change_mood(-10)
      else
        puts "#{@name} нормально поїв, і тепер виглядає більш ситим!"
        @chmood = 0
        @chhunger = 0
        mood_eat = rand(3..8)
        hunger_eat = rand(8..14)
        change_mood(mood_eat)
        change_hunger(hunger_eat)
      end
    end
    change_time(1200)
  end
  
  def play_game
    if @tire < 20
      puts 'Твій улюбленець надто стомлений для гри'
    else
      @game_true = 1
      status_game = rand(1..8)
      @chmood = 0
      if status_game.between?(1, 2)
        puts "Ви з #{@name} чудово провели час."
        change_mood(20)
      end
      if status_game.between?(3, 4)
        puts "Гра пройшла без негараздів. Очі #{@name} наповнені щастям!"
        change_mood(18)
      end
      if status_game.between?(5, 6)
        puts "Після веселої гри - і #{@breed}, і господар виглядають задоволеними ;)"
        change_mood(16)
      end
      if status_game == 7
        puts "На жаль, #{@name} вдарився під час гри, через що майже не отримав задоволення :("
        change_mood(2)
      end
      if status_game == 8
        puts "По ходу гри, #{@name} вдалося знайти на підлозі якесь смачне сміття. Тепер він почуває себе дещо погано :("
        change_mood(-1)
        change_health(-3)
      end
      change_time(1800)
    end
  end
  
  def pause_sleep(time)
    @chtire = 0
    max_sleep = (100 - @tire) / (10.0 / 3600)
    if @tire == 100
      puts 'Твій улюбленець поки не хоче спати!'
    end 
    if time.to_i <= max_sleep
      change_time(time.to_i)
      dif_tire = ((10.0 / 60) * (time.to_i / 60.0)).round(2)
      change_tire(dif_tire)
    else
      change_time(max_sleep)
      dif_tire = 100 - @tire
      change_tire(dif_tire)
    end
  end
  
  def watch_for_pet(time)
    change_time(time)
  end
  
  def talk_to_pet
    @chmood = 0
    print 'Що ти хочеш сказати?: '
    sentence = gets.chomp
    reaction = rand(0..10)
    if reaction < 8
      puts "Навряд #{@name} тебе зрозумів, але він помітно повеселішав!"
      mood_new = rand(2..7)
    else
      puts "Не знаю, що тобою було сказано, але по очам #{@name} видно, що йому це не сподобалось"
      mood_new = 0 - rand(2..5)
    end
    change_mood(mood_new)
    change_time(600)
  end
  
  def give_a_treet
    status_treet = rand(0..10)
    @chhunger = 0
    @chmood = 0
    if status_treet == 10
      puts 'Все йшло добре, але твій улюбленець подавився :('
      change_mood(-2)
    else
      puts 'Роздався чавкіт на весь будинок. Схоже твоєму улюбленцю зайшов гостиничик :)'
      new_mood = rand(2..4)
      change_mood(new_mood)
    end
    change_hunger(0.5)
    change_time(60)
  end
  
  def bring_to_walk
    status_walk = '0'
    while status_walk.to_s.downcase != 'так' && status_walk.to_s.downcase != 'ні'
      print 'Чи бажаєш ти застерегтися, взявши повідок/клітку для улюбленця?(Так/ні): '
      status_walk = gets.chomp
      if status_walk.to_s.downcase != 'так' && status_walk.to_s.downcase != 'ні' && status_walk.to_s.downcase != 'help'
        puts 'Команда некоректна! Спробуй ще раз'
        puts ''
      end
      if status_walk.to_s.downcase == 'help'
        puts "Ви з #{name} йдете на прогулянку. Ти можеш одягнути на нього повідець чи посадити в клітку, щоб убезпечити себе та його від неприємностей."
        puts ''
      end
    end
    @chmood = 0
    if status_walk.to_s.downcase == 'так'
      success_walk = rand(0..10)
      if success_walk.between?(0, 6)
        puts "Прогулянка пройшла успішно! #{@name} явно задоволений!"
        mood = rand(8..16)
        change_mood(mood)
        @game_true = 1
      end
      if success_walk.between?(7, 8)
        puts "На прогулянці #{@name} зʼїв якесь сміття, і тепер йому погано!"
        change_health(-0.5)
        change_mood(-1)
        @game_true = 1
      end
      if success_walk.between?(9, 10)
        puts "Надворі йшов дощ, тому #{@name} не дуже задоволений цією прогулянкою!"
        mood = rand(1..4)
        change_mood(mood)
        @game_true = 1
      end
    else
      success_walk = rand(0..50)
      if success_walk.between?(0, 6)
        puts "Прогулянка пройшла успішно! #{@name} явно задоволений!"
        mood = rand(12..21)
        change_mood(mood)
        @game_true = 1
      end
      if success_walk.between?(7, 8)
        puts "На прогулянці #{@name} зʼїв якесь сміття, і тепер йому погано!"
        change_health(-0.5)
        change_mood(-1)
        @game_true = 1
      end
      if success_walk.between?(9, 10)
        puts "Надворі йшов дощ, тому #{@name} не дуже задоволений цією прогулянкою!"
        mood = rand(6..9)
        change_mood(mood)
        @game_true = 1
      end
      if success_walk.between?(10.01, 20)
        puts "Хто б міг подумати, але #{@name} вирішив підкорити вільний світ, тому просто напросто втік від тебе"
        @status_pet = 'втік'
        unvisible_pet
      end
      if success_walk.between?(30.01, 40)
        puts "Хто б міг подумати, але #{@name} вирішив підгодуватися, з'ївши якусь бабусю. Тепер його присплять, а тебе чекає кримінальна відповідальність!"
        @status_pet = 'спить'
        only_sleep
      end
      if success_walk > 40
        puts "Можливо #{name} в минулому житті був гонщиком, а можливо суіцидником - в будь-якому разі він вирішив побігати по дорозі, і зустрівся з автомобілем"
        @status_pet = 'автомобіль'
        only_sleep
      end
    end
    change_time(5400)
  end
  
  def samogon
    samogon_status = '0'
    while samogon_status.to_s.downcase != 'так' && samogon_status.to_s.downcase != 'ні'
      print 'Ти впевнений, що хочеш спробувати дати самогону?(Так/Ні): '
      samogon_status = gets.chomp
      if samogon_status.to_s.downcase != 'так' && samogon_status.to_s.downcase != 'ні'
        puts 'Команда некоректна! Спробуй ще раз!'
        puts ''
      end
    end
    if samogon_status.to_s.downcase == 'так'
      puts 'Звідки ж тобі було знати, що самогон так подіє на твого улюбленця? Він збільшився і зʼїв тебе :('
      @status_pet = 'поїв'
      unvisible_pet
    else puts 'ОК!' end
  end
  
  def ending_story
    case @status_pet
    when 'вмер'
      puts 'Ви були хорошими друзями, проте неналежний догляд зробив своє діло, тому твій улюбленецю загинув. Сподіваюсь, що в наступний раз ти поставишся до питання серйозніше :('
    when 'втік'
      puts "Пізно з'ясовувати причини втечі, та й шукати твого улюбленця впринципі теж. Сподіваюсь вам було весело разом, і що йому зараз непогано там де він є. А тобі дякую за увагу і бажаю удачі :)"
    when 'спить'
      puts 'Хочу щиро привітати тебе з тим, що це всього лиш гра, і нічого страшного не відбулося ;) Сподіваюся, що під час наступного проходження ти будеш обережніше!'
    when 'автомобіль'
      puts 'Що ж... Мабуть так було написано долею. Так буває, так трапляється, ну а потім забувається. Сподіваюсь наступне проходження буде позитивнишим.'
    when 'поїв'
      puts 'Якщо чесно, то це настільки тупа кінцівка, що навіть не знаю, що сказати XD'
    end
  end

  def get_time_for_sleep
    status_time = '0'
    puts 'Необхідно вказати час сну улюбленця.'
    puts 'Бажаєш його ввести в хвилинах, чи в годинах?'
    while not status_time.to_i.between?(1, 2)
      print 'Підказка - для вибору хвилин введи 1, а годин - 2: '
      status_time = gets.chomp
      unless status_time.to_i.between?(1, 2) then puts 'Команда некоректна! Спробуй ще раз!' end
    end
    print 'Введи час сну: '
    time_sleep = gets.chomp
    if status_time == '1' then time_sleep = ((time_sleep.to_i) * 60).to_i
    else time_sleep = ((time_sleep.to_i) * 3600).to_i end
    return time_sleep
  end

  def get_time_for_watch
    status_time = '0'
    puts 'Необхідно вказати час спостереження за улюбленцем.'
    puts 'Бажаєш його ввести в хвилинах, чи в годинах?'
    while not status_time.to_i.between?(1, 2)
      print 'Підказка - для вибору хвилин введи 1, а годин - 2: '
      status_time = gets.chomp
      unless status_time.to_i.between?(1, 2) then puts 'Команда некоректна! Спробуй ще раз!' end
    end
    print 'Введи час спостереження: '
    time_watch = gets.chomp
    if status_time == '1' then time_watch = ((time_watch.to_i) * 60).to_i
    else time_watch = ((time_watch.to_i) * 3600).to_i end
    time_watch
  end

  def get_help
    puts 'В грі для різних дій доступні різні команди. Ось список:'
    puts 'Щоб полікувати - вписуй команди: дати ліки, лікувати. !Доступно раз на 24 ігрових години!'
    puts 'Щоб погодувати - вписуй команди: дати їжу, годувати, погодувати.'
    puts 'Щоб покласти спати - вписуй команди: спати, поспати. !Доступно коли шкала бадьорості менше за 100!'
    puts 'Щоб погратися - вписуй команди: грати, пограти, гратися, погратися. !Доступно коли шкала бадьорості більше за 20!'
    puts 'Щоб попестити - вписуй команду: пестити.'
    puts 'Щоб порозмовляти - вписуй команду: розмовляти, балакати, побалакати, поговорити, говорити.'
    puts 'Щоб пригостити смаколиком - вписуй команди: ласощі, дати смаколика, дати ласощі, смаколик, пригостити.'
    puts 'Щоб вивести на прогулянку - вписуй команду: прогулянка.'
    puts 'Якщо ти хочеш трохи перемотати час - вписуй команди: спостерігати, спостереження.'
    puts 'Також є експериментальна, і по суті, жартівлива команда: самогон'
    puts 'Ціль гри - не дати вмерти своєму улюбленцю, та отримувати від неї задоволення!'
  end

  def sell_pet
    puts 'Маєш досить непоганого улюбленця... Продасиш?'
    print 'Так/Ні: '
    sell = gets.chomp
    case sell.to_s.downcase
    when 'так'
      puts 'Взагалі то друзів не продають |:'
    when 'ні'
      puts 'Ну і ладно :('
    else
      puts 'Щось я не можу розібрати твоїх слів... Проїхали!'
    end
  end
  
  private

  def change_time(time)
    @time = @time + time
    if @chmood == 1
      dif_mood = (0.0 - ((5.0 / 60.0) * (time / 60))).round(2)
      change_mood(dif_mood)
    end
    if @chhunger == 1
      dif_hunger = (0.0 - ((8.0 / 60.0) * (time / 60))).round(2)
      change_hunger(dif_hunger)
    end
    if @chtire == 1
      if @game_true == 0
        dif_tire = (0.0 - ((8.0 / 60.0) * (time / 60))).round(2)
        change_tire(dif_tire)
      end
      if @game_true == 1
        dif_tire = (0.0 - ((12.0 / 60.0) * (time / 60))).round(2)
        change_tire(dif_tire)
      end
    end
    @chmood = 1
    @chhunger = 1
    @chtire = 1
    if (@time - @ind_medicine).to_i >= 86400 then @medicine = 0 end
    if @mood < 10
      mood_changed = 10.0 - @mood
      mood_time = (720.0 * mood_changed).round(2)
      dif_mood = (0.0 - ((2.0 / 60.0) * (mood_time / 60))).round(2)
      change_health(dif_mood)
    end
    if @hunger.between?(24.99, 10)
      hunger_changed = 25 - @hunger
      hunger_time = ((60.0 * hunger_changed) / 8.0).round(2)
      dif_hunger = (0.0 - ((2.0 / 60.0) * hunger_time)).round(2)
      change_health(dif_hunger)
    end
    if @hunger < 10
      hunger_changed = 10 - @hunger
      hunger_time = ((60.0 * hunger_changed) / 8.0).round(2)
      dif_hunger = (0.0 - ((8.0 / 60.0) * hunger_time)).round(2)
      change_health(dif_hunger)
    end
    if @tire < 10
      tire_changed = 10 - @tire
      if @game_true == 0 then tire_time = ((60.0 * tire_changed) / 8.0).round(2)
      else tire_time = ((60.0 * tire_changed) / 12.0).round(2) end
      dif_tire = (0.0 - ((8.0 / 60.0) * tire_time)).round(2)
      change_health(dif_tire)
    end
    if @mood > 70 and @tire > 70 and @hunger > 70
      dif_health = ((3.0 / 60.0) * (time / 60)).round(2)
      change_health(dif_health)
    end
  end
  
  def change_mood(mood)
    @mood = (@mood + mood).round(2)
    if @mood > 100 then @mood = 100 end
    if @mood < 0 then @mood = 0 end
  end
  
  def change_hunger(hunger)
    @hunger = (@hunger + hunger).round(2)
    if @hunger > 100 then @hunger = 100 end
    if @hunger < 0 then @hunger = 0 end
  end
  
  def change_tire(tire)
    @tire = (@tire + tire).round(2)
    if @tire > 100 then @tire = 100 end
    if @tire < 0 then @tire = 0 end
  end
  
  def change_health(health)
    @health = (@health + health).round(2)
    if @health > 100 then @health = 100 end
    if @health <= 0
      @health = 0
      @status_pet = 'вмер'
    end
  end
  
  def unvisible_pet
    @mood = '?'
    @health = '?'
    @tire = '?'
    @hunger = '?'
  end
  
  def only_sleep
    @health = 0
    @tire = 0
    @mood = 0
    @hunger = 0
  end
end 

puts 'Привіт! Вітаю у грі.'
puts 'В цій грі ти заведеш собі улюбленця, і тобі доведеться доглядати за ним.'
puts 'Давай домовимося, якщо знадобиться допомога - вписуй команду help'
pet = Pet.new
pet.make_start
pet.set_statuses
status = 'стоп'
while status != 'старт'
  print 'Давай оберемо тип твого улюбленця: '
  breed = gets.chomp
  if breed.to_s.downcase != 'help'
    pet.give_breed(breed)
    status = 'старт'
  else
    puts 'Підказка: Ти можеш ввести будь-який тип для свого улюбленця.'
    puts 'Для більш цікавої гри раджу вводити якийсь справжній тип!'
  end
end
status = 'стоп'
while status != 'старт'
  print "Тепер давай поговоримо про його ім'я. Як назвеш?: "
  name = gets.chomp
  if name.to_s.downcase != 'help'
    pet.give_name(name)
    status = 'старт'
  else
    puts "Підказка: Ти можеш ввести будь-яке ім'я для свого улюбленця."
    puts "Для більш цікавої гри раджу вводити якесь справжнє ім'я!"
  end
end
status = 'стоп'
while status.to_s.downcase != 'далі'
  puts 'Давай повторимо ще раз:'
  pet.details
  puts 'Можемо приступати, чи хочеш щось змінити?'
  puts "Підказка: для зміни впиши параметр, який необхідно змінити(ім'я чи порода)."
  print 'Якщо змін не потрібно, впиши - далі: '
  status = gets.chomp
  case status.to_s.downcase
  when "ім'я"
    print "Введи нове ім'я: "
    name = gets.chomp
    pet.give_name(name)
  when 'порода'
    print 'Введи нову породу: '
    breed = gets.chomp
    pet.give_breed(breed)
  when 'help'
    puts 'Підказка: для зміни впиши параметр, який необхідно змінити(ім\'я чи порода).' 
    puts 'Якщо змін не потрібно - впиши: далі.'
  else
      puts 'Команда некоректна! Спробуй ще раз!'
  end
end
puts ''
puts "Улюбленця створено! Генерую рівень здоров'я: "
pet.set_health
puts 'Формуємо настрій улюбленця: '
pet.set_mood
pet.set_tire
pet.set_hunger
puts 'Формування улюбленця завершено!'
puts ''
puts 'Тепер, перед тим, як ти почнеш гру - я би хотів ознайомити тебе з її правилами:'
puts "1. У твого улюбленця є шкала здоров'я. Слідкуй за тим, щоб вона не падала до 0."
puts "2. Коли рівень здоров'я падає нижче 30 - раз на 24 години ти маєш можливість дати йому ліки, та зробити рівень його здоров'я більшим на 10."
puts "3. В улюбленця є шкала ситості. Вона зменшується щогодини на 8 пунктів. Коли ця шкала падає нижче 25 - улюбленець втрачає 2 пункти здоров'я на годину, якщо нижче 10 - 8."
puts '4. В улюбленця є шкала бадьорості. Вона збільшується на 10 пунктів за кожну годину сну, зменшується на 8 за кожну годину бадьорості та на 12 - гри.'
puts "5. Якщо шкала бадьорості улюбленця впаде нижче 20 - він не зможе з тобою гратися, якщо ж нижче 10 - почне втрачати 8 пунктів здоров'я на годину"
puts "6. В улюбленця є шкала настрою. Її можна поповнювати іграми, пестощами, розмовами, прогулянками та ласощами. Вона падає щогодини на 5 пунктів(за вийнятком розваг). Якщо шкала впаде нижче 10 - улюбленець почне втрачати 2 пункти здоров'я на годину"
puts '7. Показник настрою улюбленця на старті є доволі низьким, так як ви з ним ще не знайомі. Постарайся виправити це непорозуміння.'
puts '8. Кожен вид діяльності займає певний час. Пестощі - 10 хвилин, розмови - 10 хвилин, гра - 30 хвилин, ласощі - 1 хвилина, нагодувати улюбленця - 20 хвилин.'
puts '9. Коли ти кладеш улюбленця спати, чи просто спостерігаєш за ним - час обираєш сам. Проте тривалість сну можлива лише поки показник сну менше за 100!'
puts '10. Якщо всі показники улюбленця(ситість, бадьорість, настрій) будуть не менші за 70 - шкала здоровʼя почне рости на 3 пункти щогодини'
puts '11. Для взаємодії з улюбленцем в термінал вводяться команди типу: спати, погодувати, дати ласощі(скорочено - ласощі), пестити і т.п.'
puts '12. Якщо по ходу гри ти забудеш, або не знатимеш якусь команду - вводь help!'
puts '13. Для виходу з гри введи команду: вийти(вихід).'
puts '14. Від гри необхідно отримувати задоволення, інакше буде нецікаво гратися ;)'
puts ''
pet.set_time
puts 'Який чудовий день. Надворі чудова погода. А ти сидиш і пестиш свого нового улюбленця.'
pet.care
pet.show_statistics
status = 'Старт'
while status.to_s.downcase != 'вийти' && status.to_s.downcase != 'вихід' && pet.info_status == 'живий'
  print 'Обери дію для свого улюбленця: ' 
  status = gets.chomp
  case status.to_s.downcase
  when 'дати ліки'
    pet.give_medicine
  when 'лікувати'
    pet.give_medicine
  when 'пестити'
    pet.care
  when 'спати'
    pet.pause_sleep(pet.get_time_for_sleep)
  when 'поспати'
    pet.pause_sleep(pet.get_time_for_sleep)
  when 'годувати'
    pet.give_food
  when 'погодувати'
    pet.give_food
  when 'дати їжу'
    pet.give_food
  when 'грати'
    pet.play_game
  when 'пограти'
    pet.play_game
  when 'гратися'
    pet.play_game
  when 'погратися'
    pet.play_game
  when 'спостерігати'
    pet.watch_for_pet(pet.get_time_for_watch)
  when 'спостереження'
    pet.watch_for_pet(pet.get_time_for_watch)
  when 'розмовляти'
    pet.talk_to_pet
  when 'балакати'
    pet.talk_to_pet
  when 'побалакати'
    pet.talk_to_pet
  when 'поговорити'
    pet.talk_to_pet
  when 'говорити'
    pet.talk_to_pet
  when 'ласощі'
    pet.give_a_treet
  when 'дати смаколика'
    pet.give_a_treet
  when 'дати ласощі'
    pet.give_a_treet
  when 'смаколик'
    pet.give_a_treet
  when 'пригостити'
    pet.give_a_treet
  when 'прогулянка'
    pet.bring_to_walk
  when 'самогон'
    pet.samogon
  when 'help'
    pet.get_help
  when 'вийти'
    puts 'ОК!'
  when 'вихід'
    puts 'ОК!'
  else
    puts 'Команда некоректна! Спробуй ще раз!'
  end
  pet.show_statistics
end

pet.ending_story