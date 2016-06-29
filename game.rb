require 'gosu'

class GameWindow < Gosu::Window
  def initialize
    super(1204, 598)
    self.caption = 'Watch Out!!'
    @background = Gosu::Image.new(self, 'images/fondo.png', false)
    @message = Gosu::Image.from_text(self, "Presiona o para mutear", Gosu.default_font_name, 30)
    @message2 = Gosu::Image.from_text(self, info, Gosu.default_font_name, 30)
    @message3 = Gosu::Image.from_text(self, "Perdiste!! Presiona R para reiniciar", Gosu.default_font_name, 50)
    @x = 500.0
    @y = 390.0
    @xstatic = 0
    @ystatic = 0
    @draws = 0
    @buttons_down = 0
    @buttons_down2 = 0
    @music = Gosu::Song.new(self, 'sounds/main.ogg')
    @music.volume = 0.005
    @music.play(true)
    @player = Gosu::Image.new(self, 'images/nigel.png', false)
    @startnig = Gosu::milliseconds
    @thing = false
    @b = 0
    @a = 0
    ############################COSAS DE JONSITO
    @cuerpox1 = 550.0
    @cuerpoy1 = 0.0
    @cuerpox2 = 1200.0
    @cuerpoy2 = 200.0
    @cuerpox3 = 250.0
    @cuerpoy3 = 200.0
    @cuerpox4 = 100.0
    @cuerpoy4 = 500.0
    @cuerpox5 = 200.0
    @cuerpoy5 = 300.0
    @start = false
    @inicio = 0
    @ataque = 0
    @johnCaraPos = Random.rand(5)
    @carastart = false
    @dibujarataque = false
    @carafin = 0
    @lose = false
    @festejofinal = 0
    @esquivadas = 0
    @cooldownsalto = 5000
    @tiempoataque = 100
    @tiempocarafin = 50
    @multiplicacionataquex = 6.0
    @sumaataqueyA = 10
    @sumaataqueyB = 3
    @sumaataqueyC = 0.5
    ############################COSAS DE JONSITO
  end

  def update
    @music.stop if button_down?(Gosu::KbO)
    if @lose == false
  ###############################################################################################arrows
      if @x < 1094
        @x += 6 if button_down?(Gosu::KbRight)
      else
      end

      if @x > 0
        @x -= 6 if button_down?(Gosu::KbLeft)
      else
      end

      if button_down?(Gosu::KbLeft)
        @lado = "izquierda"
      elsif button_down?(Gosu::KbRight)
        @lado = "derecha"
      end
  ###############################################################################################arrows.end

  ###############################################################################################space
      if button_down?(Gosu::KbSpace)

        @now = Gosu::milliseconds
        @now_i = @now.to_i
        @start_i = @startnig.to_i

        if @now_i > @start_i + @cooldownsalto
          if @lado == "izquierda"
            @x -= 500 if @x > 500
            @player = Gosu::Image.new(self, 'images/nigelmoviendose.png', false)
          elsif @lado == "derecha"
            @x += 500 if @x < 594
            @player = Gosu::Image.new(self, 'images/nigelmoviendose_b.png', false)
          end

          @startnig = @now
        else
        end
      end
    end
###############################################################################################space.end
################################################################################################johnsito
    if button_down?(Gosu::KbR)
      @lose = false
      @player = Gosu::Image.new(self, 'images/nigel.png', false)
      @esquivadas = 0
      @tiempoataque = 100
      @tiempocarafin = 50
      @multiplicacionataquex = 6.0
      @sumaataqueyA = 10
      @sumaataqueyB = 3
      @sumaataqueyC = 0.5
      @cooldownsalto = 5000
    end

    if @lose == true
      @cuerpox1 = 550
      @cuerpoy1 = 0
      @cuerpox2 = 1200
      @cuerpoy2 = 200
      @cuerpox3 = 250
      @cuerpoy3 = 200
      @cuerpox4 = 100.0
      @cuerpoy4 = 500.0
      @cuerpox5 = 200
      @cuerpoy5 = 300
      @watchout = false
      @dibujarataque = false
      @carastart = false
      @aleatoriedad = 0
      @ataque = 0
      @carafin = 0
      @inicio = 0
    end

    if @inicio > 50
      @start = true
    else
      @inicio +=1
    end

    if @esquivadas > 4
      @tiempoataque = 50
      @tiempocarafin = 25
      @multiplicacionataquex = 12.0
      @sumaataqueyA = 15
      @sumaataqueyB = 6
      @sumaataqueyC = 1
      @cooldownsalto = 2500
    end

    if @start == true

      if @ataque > @tiempoataque
        if @carafin > @tiempocarafin
          @carastart = false
          @watchout = true
        else
          @carastart = true
          @carafin +=1
        end
      else
        @ataque += 1
      end
    else
    end


    if @watchout == true
      @dibujarataque = true
      if @johnCaraPos == 0
        if @cuerpoy1 < 600
          @cuerpox1 = @cuerpox1 + (@multiplicacionataquex*((@xstatic-550.0) / (@ystatic)))
          @cuerpoy1 = @cuerpoy1 + @sumaataqueyA
        else
          @cuerpox1 = 550
          @cuerpoy1 = 0
          @watchout = false
          @dibujarataque = false
          @johnCaraPos = Random.rand(5)
          @aleatoriedad = 0
          @carafin = 0
          @esquivadas += 1
        end
        if (@cuerpox1 - 50) > @x && (@cuerpox1 - 50) < (@x + 200) && (@cuerpoy1 - 50) > @y && (@cuerpoy1 - 50) < (@y + 200)
          @lose = true
          @cuerpox1 = 550
          @cuerpoy1 = 0
          @watchout = false
          @dibujarataque = false
          @johnCaraPos = Random.rand(5)
          @aleatoriedad = 0
          @carafin = 0
        end
        if (@cuerpox1 + 50) > @x && (@cuerpox1 + 50) < (@x + 200) && (@cuerpoy1 + 50) > @y && (@cuerpoy1 + 50) < (@y + 200)
          @lose = true
          @cuerpox1 = 550
          @cuerpoy1 = 0
          @watchout = false
          @dibujarataque = false
          @johnCaraPos = Random.rand(5)
          @aleatoriedad = 0
          @carafin = 0
        end
      end
      if @johnCaraPos == 1
        if @cuerpoy2 < 600
          @cuerpox2 = @cuerpox2 + (@multiplicacionataquex*((@xstatic-1204.0) / (@ystatic+100)))
          @cuerpoy2 = @cuerpoy2 + @sumaataqueyB
        else
          @cuerpox2 = 1200
          @cuerpoy2 = 200
          @watchout = false
          @dibujarataque = false
          @johnCaraPos = Random.rand(5)
          @aleatoriedad = 0
          @carafin = 0
          @esquivadas += 1
        end
        if (@cuerpox2 - 50) > @x && (@cuerpox2 - 50) < (@x + 200) && (@cuerpoy2 - 50) > @y && (@cuerpoy2 - 50) < (@y + 200)
          @lose = true
          @cuerpox2 = 1200
          @cuerpoy2 = 200
          @watchout = false
          @dibujarataque = false
          @johnCaraPos = Random.rand(5)
          @aleatoriedad = 0
          @carafin = 0
        end
        if (@cuerpox2 + 50) > @x && (@cuerpox2 + 50) < (@x + 200) && (@cuerpoy2 + 50) > @y && (@cuerpoy2 + 50) < (@y + 200)
          @lose = true
          @cuerpox2 = 1200
          @cuerpoy2 = 200
          @watchout = false
          @dibujarataque = false
          @johnCaraPos = Random.rand(5)
          @aleatoriedad = 0
          @carafin = 0
        end
      end
      if @johnCaraPos == 2
        if @cuerpoy3 < 600
          @cuerpox3 = @cuerpox3 + (@multiplicacionataquex*((@xstatic-250.0) / (@ystatic+100)))
          @cuerpoy3 = @cuerpoy3 + @sumaataqueyB
        else
          @cuerpox3 = 250
          @cuerpoy3 = 200
          @watchout = false
          @dibujarataque = false
          @johnCaraPos = Random.rand(5)
          @aleatoriedad = 0
          @carafin = 0
          @esquivadas += 1
        end
        if (@cuerpox3 - 50) > @x && (@cuerpox3 - 50) < (@x + 200) && (@cuerpoy3 - 50) > @y && (@cuerpoy3 - 50) < (@y + 200)
          @lose = true
          @cuerpox3 = 250
          @cuerpoy3 = 200
          @watchout = false
          @dibujarataque = false
          @johnCaraPos = Random.rand(5)
          @aleatoriedad = 0
          @carafin = 0
        end
        if (@cuerpox3 + 50) > @x && (@cuerpox3 + 50) < (@x + 200) && (@cuerpoy3 + 50) > @y && (@cuerpoy3 + 50) < (@y + 200)
          @lose = true
          @cuerpox3 = 250
          @cuerpoy3 = 200
          @watchout = false
          @dibujarataque = false
          @johnCaraPos = Random.rand(5)
          @aleatoriedad = 0
          @carafin = 0
        end
      end
      if @johnCaraPos == 3
        if @cuerpoy4 < 550
          @cuerpox4 = @cuerpox4 + (@multiplicacionataquex*((@xstatic) / (@ystatic+100)))
          @cuerpoy4 = @cuerpoy4 + @sumaataqueyC
        else
          @cuerpox4 = 100.0
          @cuerpoy4 = 500.0
          @watchout = false
          @dibujarataque = false
          @johnCaraPos = Random.rand(5)
          @aleatoriedad = 0
          @carafin = 0
          @esquivadas += 1
        end
        if (@cuerpox4 - 50) > @x && (@cuerpox4 - 50) < (@x + 100) && (@cuerpoy4 - 50) > @y && (@cuerpoy4 - 50) < (@y + 100)
          @lose = true
          @cuerpox4 = 100.0
          @cuerpoy4 = 500.0
          @watchout = false
          @dibujarataque = false
          @johnCaraPos = Random.rand(5)
          @aleatoriedad = 0
          @carafin = 0
        end
        if (@cuerpox4 + 50) > @x && (@cuerpox4 + 50) < (@x + 100) && (@cuerpoy4 + 50) > @y && (@cuerpoy4 + 50) < (@y + 100)
          @lose = true
          @cuerpox4 = 100.0
          @cuerpoy4 = 500.0
          @watchout = false
          @dibujarataque = false
          @johnCaraPos = Random.rand(5)
          @aleatoriedad = 0
          @carafin = 0
        end
      end
      if @johnCaraPos == 4
        if @cuerpoy5 < 600
          @cuerpox5 = @cuerpox5 + (@multiplicacionataquex*((@xstatic-200.0) / (@ystatic+100)))
          @cuerpoy5 = @cuerpoy5 + @sumaataqueyB
        else
          @cuerpox5 = 200
          @cuerpoy5 = 300
          @watchout = false
          @dibujarataque = false
          @johnCaraPos = Random.rand(5)
          @aleatoriedad = 0
          @carafin = 0
          @esquivadas += 1
        end
        if (@cuerpox5 - 50) > @x && (@cuerpox5 - 50) < (@x + 100) && (@cuerpoy5 - 50) > @y && (@cuerpoy5 - 50) < (@y + 200)
          @lose = true
          @cuerpox5 = 200
          @cuerpoy5 = 300
          @watchout = false
          @dibujarataque = false
          @johnCaraPos = Random.rand(5)
          @aleatoriedad = 0
          @carafin = 0
        end
        if (@cuerpox5 + 50) > @x && (@cuerpox5 + 50) < (@x + 100) && (@cuerpoy5 + 50) > @y && (@cuerpoy5 + 50) < (@y + 200)
          @lose = true
          @cuerpox5 = 200
          @cuerpoy5 = 300
          @watchout = false
          @dibujarataque = false
          @johnCaraPos = Random.rand(5)
          @aleatoriedad = 0
          @carafin = 0
        end
      end
    end

    if @lose == true
      @festejofinal += 1
      @festejofinal = 0 if @festejofinal == 50
      if @festejofinal <25
        @player = Gosu::Image.new(self, 'images/festejo1.png', false)
      end
      if @festejofinal >25
        @player = Gosu::Image.new(self, 'images/festejo2.png', false)
      end
    end




################################################################################################
  end

  def info
    "Esquivadas:#{@esquivadas}"
  end

  def button_down(id)
    close if id == Gosu::KbEscape
    @buttons_down += 1
  end

  def button_up(id)
    @buttons_down -= 1
  end

  def draw
    @scene_ready ||= true
    @background.draw(0, 0, 0)
    @message2 = Gosu::Image.from_text(self, info, Gosu.default_font_name, 30)
    @message2.draw(10, 50, 2)
    @message.draw(10, 10, 2)
    @draws += 1


    ####################################################################################################### player
    if @lose == false
      if @lado == "izquierda"
        if @thing == true
        @player = Gosu::Image.new(self, 'images/nigelmoviendose.png', false) if @buttons_down >0
          if @a == @b-3
            @thing = false
          else
            @a -=1
          end
        else
          @player = Gosu::Image.new(self, 'images/nigel.png', false)
          if @b == @a-3
            @thing = true
          else
            @b -=1
          end
        end
        @player.draw(@x, @y, 2) if @buttons_down >0 || @buttons_down == 0
      elsif @lado == "derecha"
        if @thing == true
          @player = Gosu::Image.new(self, 'images/nigelmoviendose_b.png', false) if @buttons_down >0
          if @b == @a+3
            @thing = false
          else
            @b +=1
          end
        else
          @player = Gosu::Image.new(self, 'images/nigel_b.png', false)
          if @a == @b+3
            @thing = true
          else
            @a +=1
          end
        end
        @player.draw(@x, @y, 2) if @buttons_down >0 || @buttons_down == 0
      else
        @player.draw(@x, @y, 2) if @buttons_down >0 || @buttons_down == 0
      end
      ################################################################################################################################################player.end

      ################################################################################################################################################john
      if @carastart == true
        if @johnCaraPos == 0
          @johnCara = Gosu::Image.new(self, 'images/cabeza_recta_arriba.png', false)
          @johnCara.draw(0, 0 , 1)
          @xstatic = @x
          @ystatic = @y
        end
        if @johnCaraPos == 1
          @johnCara = Gosu::Image.new(self, 'images/cabeza_torcida_derecha.png', false)
          @johnCara.draw(0, 0 , 1)
          @xstatic = @x
          @ystatic = @y
        end
        if @johnCaraPos == 2
          @johnCara = Gosu::Image.new(self, 'images/cabeza_torcida_izquierda.png', false)
          @johnCara.draw(0, 0 , 1)
          @xstatic = @x
          @ystatic = @y
        end
        if @johnCaraPos == 3
          @johnCara = Gosu::Image.new(self, 'images/cabeza_recta_izquierda.png', false)
          @johnCara.draw(0, 0 , 1)
          @xstatic = @x
          @ystatic = @y
        end
        if @johnCaraPos == 4
          @johnCara = Gosu::Image.new(self, 'images/cabeza_torcida_izquierdaa.png', false)
          @johnCara.draw(0, 0 , 1)
          @xstatic = @x
          @ystatic = @y
        end
        if @johnCaraPos == 7
        end
      end


      if @watchout == true

        if @johnCaraPos == 0
          if @x < @cuerpox1
            @johncuerpo = Gosu::Image.new(self, 'images/tirandocielo2.png', false)

            @grado = -45
          else
            @johncuerpo = Gosu::Image.new(self, 'images/tirandocielo.png', false)
            @grado = 45
          end
          @johncuerpo.draw_rot(@cuerpox1, @cuerpoy1, 2, @grado)
        end

        if @johnCaraPos == 1
          if @x < @cuerpox2
            @johncuerpo = Gosu::Image.new(self, 'images/tirandose2.png', false)
            @grado = -90
          else
            @johncuerpo = Gosu::Image.new(self, 'images/tirandose.png', false)
            @grado = 90
          end
          @johncuerpo.draw_rot(@cuerpox2, @cuerpoy2, 3, @grado)
        end

        if @johnCaraPos == 2
          if @x < @cuerpox3
            @johncuerpo = Gosu::Image.new(self, 'images/tirandose2.png', false)
            @grado = -90
          else
            @johncuerpo = Gosu::Image.new(self, 'images/tirandose.png', false)
            @grado = 90
          end
          @johncuerpo.draw_rot(@cuerpox3, @cuerpoy3, 3, @grado)
        end

        if @johnCaraPos == 3
          if @x < @cuerpox4
            @johncuerpo = Gosu::Image.new(self, 'images/tirandose2.png', false)
            @grado = -90
          else
            @johncuerpo = Gosu::Image.new(self, 'images/tirandose.png', false)
            @grado = 90
          end
          @johncuerpo.draw_rot(@cuerpox4, @cuerpoy4, 3, @grado)
        end

        if @johnCaraPos == 4
          if @x < @cuerpox5
            @johncuerpo = Gosu::Image.new(self, 'images/tirandose2.png', false)
            @grado = -90
          else
            @johncuerpo = Gosu::Image.new(self, 'images/tirandose.png', false)
            @grado = 90
          end
          @johncuerpo.draw_rot(@cuerpox5, @cuerpoy5, 3, @grado)
        end

        if @johnCaraPos == 7
        end
      end
    end

    if @lose == true
      @player.draw(@x, @y, 2)
      @message3.draw(500, 100, 2)
    end

    ################################################################################################################################################john.end
  end
end

window = GameWindow.new
window.show
