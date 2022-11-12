require 'erb'

class Pet
  def call(env)
    @chtire = 1
    @chhunger = 1
    @chmood = 1
    @game_true = 1
    @request = Rack::Request.new(env)
    response.finish
  end

  def response
    case @request.path
    when "/"
      Rack::Response.new(render("start_form.html.erb"))
    when "/set_cookies"
      set_time
      set_health
      set_mood
      set_tire_and_hunger
      Rack::Response.new do |response|
        response.set_cookie('name', @request.params['name'])
        response.set_cookie('type', @request.params['type'])
        response.set_cookie('time', @time)
        response.set_cookie('health', @health.to_s)
        response.set_cookie('mood', @mood.to_s)
        response.set_cookie('tire', @tire.to_s)
        response.set_cookie('hunger', @hunger.to_s)
        response.redirect('/gen_pet')
      end
    when '/change_cookies'
      Rack::Response.new do |response|
        response.set_cookie('time', @time)
        response.set_cookie('health', @health.to_s)
        response.set_cookie('mood', @mood.to_s)
        response.set_cookie('tire', @tire.to_s)
        response.set_cookie('hunger', @hunger.to_s)
        response.redirect('/play_game')
      end
    when "/gen_pet"
      Rack::Response.new(render("cookie_setter.html.erb"))
    when "/play_game"
      if @health > 0
        Rack::Response.new(render("index.html.erb"))
      else
        Rack::Response.new(render("dead.html.erb"))
      end
    when "/change"
      make_changes
    when '/info'
      Rack::Response.new(render("info.html.erb"))
    when '/samogon'
      Rack::Response.new(render("samogon.html.erb"))
    when '/food_set'
      Rack::Response.new(render("food_set.html.erb"))
    when '/sleep'
      Rack::Response.new(render("sleep.html.erb"))
    when '/watching'
      Rack::Response.new(render("watch.html.erb"))
    when '/wait_for_24'
      Rack::Response.new(render("wait.html.erb"))
    when '/too_strong'
      Rack::Response.new(render("too_strong.html.erb"))
    when '/medicine'
      Rack::Response.new(render("medicine.html.erb"))
    when '/care'
      Rack::Response.new(render("care.html.erb"))
    when '/treet'
      Rack::Response.new(render("give_a_treet.html.erb"))
    when '/status_eat'
      Rack::Response.new(render("status_eat.html.erb"))
    when '/game'
      Rack::Response.new(render("play_game.html.erb"))
    when '/walk_set'
      Rack::Response.new(render("walk_question.html.erb"))
    when '/walk'
      Rack::Response.new(render("walk_result.html.erb"))
    when '/run_cookie'
      @health = 0
      @tire = 0
      @mood = 0
      @hunger = 0
      Rack::Response.new do |response|
        response.set_cookie('time', @time)
        response.set_cookie('health', @health.to_s)
        response.set_cookie('mood', @mood.to_s)
        response.set_cookie('tire', @tire.to_s)
        response.set_cookie('hunger', @hunger.to_s)
        response.redirect('/run')
      end
    when '/run'
      Rack::Response.new(render("run.html.erb"))
    when '/criminal_cookie'
      @health = 0
      @tire = 0
      @mood = 0
      @hunger = 0
      Rack::Response.new do |response|
        response.set_cookie('time', @time)
        response.set_cookie('health', @health.to_s)
        response.set_cookie('mood', @mood.to_s)
        response.set_cookie('tire', @tire.to_s)
        response.set_cookie('hunger', @hunger.to_s)
        response.redirect('/criminal')
      end
    when '/criminal'
      Rack::Response.new(render("criminal.html.erb"))
    when '/road_cookie'
      @health = 0
      @tire = 0
      @mood = 0
      @hunger = 0
      Rack::Response.new do |response|
        response.set_cookie('time', @time)
        response.set_cookie('health', @health.to_s)
        response.set_cookie('mood', @mood.to_s)
        response.set_cookie('tire', @tire.to_s)
        response.set_cookie('hunger', @hunger.to_s)
        response.redirect('/road')
      end
    when '/road'
      @health = 0
      @tire = 0
      @mood = 0
      @hunger = 0
      Rack::Response.new do |response|
        response.set_cookie('time', @time)
        response.set_cookie('health', @health)
        response.set_cookie('mood', @mood)
        response.set_cookie('tire', @tire)
        response.set_cookie('hunger', @hunger)
      end
      Rack::Response.new(render("road.html.erb"))
    else
      Rack::Response.new(render("404_not_found.html.erb"), 404)
    end
  end

  def make_changes
    if @request.params['samogon']
      Rack::Response.new do |response|
        response.redirect('/samogon')
      end
    else
      if (@request.params['s_no'])
        Rack::Response.new do |response|
          response.redirect('/play_game')
        end
      else
        if (@request.params['s_yes'])
          Rack::Response.new(render("eat_you.html.erb"))
        else
          if (@request.params['food'])
            Rack::Response.new do |response|
              response.redirect('/food_set')
            end
          else
            if (@request.params['feed'])
              give_food('feed')
              Rack::Response.new do |response|
                response.redirect('/status_eat')
              end
            else
              if (@request.params['fruit'])
                give_food('fruit')
                Rack::Response.new do |response|
                  response.redirect('/status_eat')
                end
              else
                if (@request.params['f_table'])
                  give_food('table')
                  Rack::Response.new do |response|
                    response.redirect('/status_eat')
                  end
                else
                  if (@request.params['sleep'])
                    pause_sleep
                    Rack::Response.new do |response|
                      response.redirect('/sleep')
                    end
                  else
                    if (@request.params['care'])
                      care
                      Rack::Response.new do |response|
                        response.redirect('/care')
                      end
                    else
                      if (@request.params['treet'])
                        give_a_treet
                        Rack::Response.new do |response|
                          response.redirect('/treet')
                        end
                      else
                        if (@request.params['watch'])
                          watch_for_pet
                          Rack::Response.new do |response|
                            response.redirect('/watching')
                          end
                        else
                          if (@request.params['medicine'])
                            if @medicine == 1 and @health < 30
                              Rack::Response.new do |response|
                                response.redirect('/wait_for_24')
                              end
                            else
                              if @health >= 30
                                Rack::Response.new do |response|
                                  response.redirect('/too_strong')
                                end
                              else
                                if @medicine != 1 and @health < 30
                                  give_medicine
                                  Rack::Response.new do |response|
                                    response.redirect('/medicine')
                                  end
                                end
                              end
                            end
                          else
                            if (@request.params['play'])
                              play_game
                              Rack::Response.new do |response|
                                response.redirect('/game')
                              end
                            else
                              if (@request.params['walk'])
                                Rack::Response.new do |response|
                                  response.redirect('/walk_set')
                                end
                              else
                                if (@request.params['w_yes'])
                                  normal_walk
                                  Rack::Response.new do |response|
                                    response.redirect('/walk')
                                  end
                                else
                                  if (@request.params['w_no'])
                                    danger_walk
                                    Rack::Response.new do |response|
                                      response.redirect('/walk')
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  def render (template)
    path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end

  def read_cookies_name(name)
    @request.cookies[name]
  end

  def set_time
    @time = Time.new
  end

  def set_health
    @health = (rand(2..10) * 10).to_f
    @medicine = 0
    @ind_medicine = 0
  end

  def health_message
    case @health
    when 20
      return "На жаль, твій улюбленець з'явився на світ достатньо слабеньким :( <br>
      Проте не переймайся - при належному догляді він ще зможе стати досить класним! <br>
      Рівень здоров'я #{read_cookies_name('name')}: #{@health}"
    when 30
      return "Інколи в житті трапляється так, що наші улюбленці не можуть похизуватися міцним здоров'ям... <br>
      Але зауважу, що при належному догляді в нього є всі шанси стати здоровішим! <br>
      Рівень здоров'я #{read_cookies_name('name')}: #{@health}"
    when 40
      return "Його доля бути міцним як скеля, але стан здоров'я поки не дозволяє... <br>
      Не забувай сумлінно доглядати за #{read_cookies_name('name')}, і буде вам щастя! <br>
      Рівень здоров'я #{read_cookies_name('name')}: #{@health}"
    when 50
      return "Для оптиміста стакан наполовину повний, для песиміста - наполовину пустий... А що сказати про #{read_cookies_name('name')}? <br>
      Стан здоров'я твого улюбленця дещо кращий, ніж могло би бути, але не варто нехтувати якісним доглядом <br>
      Рівень здоров'я #{read_cookies_name('name')}: #{@health}"
    when 60
      return "Мушу визнати, що тобі трапився досить непоганий улюбленець. <br>
      Не забувай доглядати за #{read_cookies_name('name')}, і досить скоро отримаєш надзвичайно міцного улюбленця! <br>
      Рівень здоров'я #{read_cookies_name('name')}: #{@health}"
    when 70
      #sell_pet
      return "Не забувай доглядати за #{read_cookies_name('name')}, і досить скоро отримаєш надзвичайно міцного улюбленця! <br>
      Рівень здоров'я #{read_cookies_name('name')}: #{@health}"
    when 80
      return "Твій улюбленець досить міцний та здоровий. Приємно бачити його таким :) <br>
      Якщо хочеш, щоб справи у #{read_cookies_name('name')} були ще краще - сумлінно за ним доглядай! <br>
      Рівень здоров'я #{read_cookies_name('name')}: #{@health}"
    when 90
      return "Та твій улюбленець прямо таки максимально наближений до ідеалу! <br>
      Належний догляд допоможе стати йому по справжньому класним! <br>
      Рівень здоров'я #{read_cookies_name('name')}: #{@health}"
    when 100
      return "Хоч в житті ідеалів і не існує - мушу сказати, що твій улюбленець просто ідеальний. <br>
      #{read_cookies_name('name')} знадобиться належний догляд, щоб не погіршувати стан його здоров'я! <br>
      Рівень здоров'я #{read_cookies_name('name')}: #{@health}"
    end
  end

  def set_mood
    @mood = (rand(1..3) * 10).to_f
  end

  def mood_message
    case @mood
    when 10
      return "Настрій твого улюбленця препаскудний. Схоже тобі доведеться дуже сильно постратися, щоб його виправити. <br>
      Рівень настрою #{read_cookies_name('name')}: #{@mood}"
    when 20
      return "Настрій #{read_cookies_name('name')} просто жахливий. Сподіваюся ти знайдеш, чим його розвеселити. <br>
      Рівень настрою #{read_cookies_name('name')}: #{@mood}"
    when 30
      return "#{read_cookies_name('name')} чимось дуже стурбований, настрій достатньо поганенький. <br>
      Приділяй якомога більше часу своєму улюбленцю, якщо прагнеш побачити його в кращому настрої! <br>
      Рівень настрою #{read_cookies_name('name')}: #{@mood}"
    end
  end

  def set_tire_and_hunger
    @tire = 50.0
    @hunger = 50.0
  end

  def give_food(type)
    case type
    when 'feed'
      status_eat = rand(0..10)
      if status_eat == 9
        @status_food = 'feed_not'
        change_time(1200)
      end
      if status_eat != 9
        @status_food = 'feed_yes'
        @chhunger = 0
        hunger_eat = rand(7..20)
        change_hunger(hunger_eat)
        change_time(1200)
      end
    when 'fruit'
      status_eat = rand(0..12)
      if status_eat == 8 or status_eat == 9
        @status_food = 'fruit_not'
        @chhunger = 0
        @chmood = 0
        change_health(-5)
        change_hunger(-3)
        change_mood(-10)
        change_time(1200)
      end
      if status_eat != 8 and status_eat != 9
        @status_food = 'fruit_yes'
        health_eat = rand(0..2)
        hunger_eat = rand(3..6)
        @chhunger = 0
        change_health(health_eat)
        change_hunger(hunger_eat)
        change_time(1200)
      end
    when 'table'
      status_eat = rand(0..15)
      if status_eat > 11
        @status_food = 'table_not'
        @chmood = 0
        @chhunger = 0
        change_health(-12)
        change_hunger(-15)
        change_mood(-10)
        change_time(1200)
      end
      if status_eat <= 11
        @status_food = 'table_yes'
        @chmood = 0
        @chhunger = 0
        mood_eat = rand(3..8)
        hunger_eat = rand(8..14)
        change_mood(mood_eat)
        change_hunger(hunger_eat)
        change_time(1200)
      end
    end
  end

  def pause_sleep
    time = 3600
    @chtire = 0
    max_sleep = (100 - @tire) / (10.0 / 3600)
    if @tire == 100
      puts 'Твій улюбленець поки не хоче спати!'
    end
    if time.to_i <= max_sleep
      change_time(time.to_i)
      dif_tire = ((10.0 / 60) * (time.to_i / 60.0)).round(2)
      change_tire(dif_tire)
    end
    if time.to_i > max_sleep
      change_time(max_sleep)
      dif_tire = 100 - @tire
      change_tire(dif_tire)
    end
  end

  def care
    @chmood = 0
    mood = rand(3..7)
    change_mood(mood)
    time = 600
    change_time(time)
  end

  def give_a_treet
    @status_treet = rand(0..10)
    @chhunger = 0
    @chmood = 0
    if @status_treet == 10
      change_hunger(0.5)
      change_mood(-2)
      change_time(60)
    end
    if @status_treet != 10
      change_hunger(0.5)
      new_mood = rand(2..4)
      change_mood(new_mood)
      change_time(60)
    end
  end

  def watch_for_pet
    time = 3600
    change_time(time)
  end

  def give_medicine
      change_health(10)
      @medicine = @medicine + 1
      @ind_medicine = @time
  end

  def care_message
    set_sentence = rand(0..2)
    case set_sentence
    when 0
      return "Коли гладиш свого улюбленця час проходить непомітно!"
    when 1
      return "Твій улюбленець дивиться тобі прямо у вічі. За його поглядом стає зрозуміло, що він дуже задоволений цим процесом."
    when 2
      return "#{read_cookies_name('name')} просто неймовірно кайфує, від того, що ти його пестиш!"
    end
  end

  def treet_message
    if @status_treet == 10
      return 'Все йшло добре, але твій улюбленець подавився :('
    else
      return "Роздався чавкіт на весь будинок. Схоже твоєму улюбленцю зайшов гостиничик :)"
    end
  end

  def food_message
    if @status_food == 'feed_not'
      return "Яка прикрість, #{read_cookies_name('name')} не хоче їсти цей корм :("
    end
    if @status_food == 'feed_yes'
      return "#{read_cookies_name('name')} нормально поїв, і тепер виглядає більш ситим!"
    end
    if @status_food == 'fruit_not'
      return "Їжа виявилася несвіжою :( #{read_cookies_name('name')} виглядає не дуже добре"
    end
    if @status_food == 'fruit_yes'
      return "#{read_cookies_name('name')} нормально поїв, і тепер виглядає більш ситим!"
    end
    if @status_food == 'table_not'
      return 'Виявляється улюбленцю такого давати було не можна :('
    end
    if @status_food == 'table_yes'
      return "#{read_cookies_name('name')} нормально поїв, і тепер виглядає більш ситим!"
    end
  end

  def play_game
    if @tire >= 20
      @game_true = 1
      @status_game = rand(1..8)
      @chmood = 0
      if @status_game == 1 or @status_game == 2
        change_time(1800)
        change_mood(20)
      end
      if @status_game == 3 or @status_game == 4
        change_time(1800)
        change_mood(18)
      end
      if @status_game == 5 or @status_game == 6
        change_time(1800)
        change_mood(16)
      end
      if @status_game == 7
        change_time(1800)
        change_mood(2)
      end
      if @status_game == 8
        change_time(1800)
        change_mood(-1)
        change_health(-3)
      end
    end
  end

  def game_message
    if @tire < 20
      return 'Твій улюбленець надто стомлений для гри'
    else
      if @status_game == 1 or @status_game == 2
        return "Ви з #{read_cookies_name('name')} чудово провели час."
      end
      if @status_game == 3 or @status_game == 4
        puts "Гра пройшла без негараздів. Очі #{read_cookies_name('name')} наповнені щастям!"
      end
      if @status_game == 5 or @status_game == 6
        return "Після веселої гри - і #{read_cookies_name('type')}, і господар виглядають задоволеними ;)"
      end
      if @status_game == 7
        return "На жаль, #{read_cookies_name('name')} вдарився під час гри, через що майже не отримав задоволення :("
      end
      if @status_game == 8
        return "По ходу гри, #{read_cookies_name('name')} вдалося знайти на підлозі якесь смачне сміття. Тепер він почуває себе дещо погано :("
      end
    end
  end

  def normal_walk
    @success_walk = rand(0..10)
    if @success_walk >= 0 and @success_walk <= 6
      mood = rand(8..16)
      change_mood(mood)
      @game_true = 1
      change_time(5400)
    end
    if @success_walk == 7 or @success_walk == 8
      change_health(-0.5)
      change_mood(-1)
      @game_true = 1
      change_time(5400)
    end
    if @success_walk == 9 or @success_walk == 10
      mood = rand(1..4)
      change_mood(mood)
      @game_true = 1
      change_time(5400)
    end
  end

  def danger_walk
    @success_walk = rand(0..40)
    if @success_walk >= 0 and @success_walk <= 6
      mood = rand(12..21)
      change_mood(mood)
      @game_true = 1
      change_time(5400)
    end
    if @success_walk == 7 or @success_walk == 8
      change_health(-0.5)
      change_mood(-1)
      @game_true = 1
      change_time(5400)
    end
    if @success_walk == 9 or @success_walk == 10
      mood = rand(6..9)
      change_mood(mood)
      @game_true = 1
      change_time(5400)
    end
    if @success_walk > 10 and @success_walk <= 20
      change_time(5400)
    end
    if @success_walk > 20 and @success_walk <= 30
      change_time(5400)
    end
    if @success_walk > 30
      change_time(5400)
    end
  end

  def walk_message
    if @success_walk >= 0 and @success_walk <= 6
      return "Прогулянка пройшла успішно! #{read_cookies_name('name')} явно задоволений!"
    end
    if @success_walk == 7 or @success_walk == 8
      return "На прогулянці #{read_cookies_name('name')} зʼїв якесь сміття, і тепер йому погано!"
    end
    if @success_walk == 9 or @success_walk == 10
      return "Надворі йшов дощ, тому #{read_cookies_name('name')} не дуже задоволений цією прогулянкою!"
    end
    if @success_walk > 10 and @success_walk <= 20
      return "Хто б міг подумати, але #{read_cookies_name('name')} вирішив підкорити вільний світ, тому просто напросто втік від тебе"
    end
    if @success_walk > 20 and @success_walk <= 30
      return "Хто б міг подумати, але #{read_cookies_name('name')} вирішив підгодуватися, з'ївши якусь бабусю. Тепер його присплять, а тебе чекає кримінальна відповідальність!"
    end
    if @success_walk > 30
      return "Можливо #{read_cookies_name('name')} в минулому житті був гонщиком, а можливо суіцидником - в будь-якому разі він вирішив побігати по дорозі, і зустрівся з автомобілем"
    end
  end

  def make_walk_button
    if @success_walk >= 0 and @success_walk <= 10
      return "<form action=\"/change_cookies\" method=\"get\"> \n
        <input class=\"button\" type='submit' value='ОК'> \n
        </form> \n"
    end
    if @success_walk > 10 and @success_walk <= 20
      return "<form action=\"/run_cookie\" method=\"get\"> \n
        <input class=\"button\" type='submit' value='ЙОЙ'> \n
        </form> \n"
    end
    if @success_walk > 20 and @success_walk <= 30
      return "<form action=\"/criminal_cookie\" method=\"get\"> \n
        <input class=\"button\" type='submit' value='Капець :('> \n
        </form> \n"
    end
    if @success_walk > 30
      return "<form action=\"/road_cookie\" method=\"get\"> \n
        <input class=\"button\" type='submit' value='Капець :('> \n
        </form> \n"
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
    if (@time - @ind_medicine).to_i >= 86400
      @medicine = 0
    end
    if @mood < 10
      mood_changed = 10.0 - @mood
      mood_time = (720.0 * mood_changed).round(2)
      dif_mood = (0.0 - ((2.0 / 60.0) * (mood_time / 60))).round(2)
      change_health(dif_mood)
    end
    if @hunger < 25 and @hunger >= 10
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
      if @game_true == 0
        tire_time = ((60.0 * tire_changed) / 8.0).round(2)
      end
      if @game_true == 1
        tire_time = ((60.0 * tire_changed) / 12.0).round(2)
      end
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
    if @mood > 100
      @mood = 100
    end
    if @mood < 0
      @mood = 0
    end
  end

  def change_hunger(hunger)
    @hunger = (@hunger + hunger).round(2)
    if @hunger > 100
      @hunger = 100
    end
    if @hunger < 0
      @hunger = 0
    end
  end

  def change_tire(tire)
    @tire = (@tire + tire).round(2)
    if @tire > 100
      @tire = 100
    end
    if @tire < 0
      @tire = 0
    end
  end

  def change_health(health)
    @health = (@health + health).round(2)
    if @health > 100
      @health = 100
    end
    if @health <= 0
      @health = 0
    end
  end
end