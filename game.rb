require 'gosu'

class GameWindow < Gosu::Window
  def initialize
    super(1204, 598)
    self.caption = 'Watch Out!!'
    @background = Gosu::Image.new(self, 'images/fondo.png', false)
    @message = Gosu::Image.from_text(self, 'Press "o" to mute', Gosu.default_font_name, 30)
    @x = 500
    @y = 390
    @draws = 0
    @buttons_down = 0

    @music = Gosu::Song.new(self, 'sounds/main.ogg')
    @music.volume = 0.5
    @music.play(true)

    @player = Gosu::Image.new(self, 'images/nigel.png', false)

    @variable
  end

  def update
    @x -= 3 if button_down?(Gosu::KbLeft)
    @x += 3 if button_down?(Gosu::KbRight)
    #@y -= 3 if button_down?(Gosu::KbUp)
    #@y += 3 if button_down?(Gosu::KbDown)

    @music.stop if button_down?(Gosu::KbO)

    if button_down?(Gosu::KbLeft)
      @player = Gosu::Image.new(self, 'images/nigel.png', false)
      @variable = 1
    elsif button_down?(Gosu::KbRight)
      @variable = 2
      @player = Gosu::Image.new(self, 'images/nigel_b.png', false)
    end

    if button_down?(Gosu::KbSpace)
      if @variable == 1
        @x -= 6
        @player = Gosu::Image.new(self, 'images/nigelmoviendose.png', false)

      elsif @variable == 2
        @x += 6
        @player = Gosu::Image.new(self, 'images/nigelmoviendose_b.png', false)
      end
    end
  end

  def button_down(id)
    close if id == Gosu::KbEscape
    @buttons_down += 1
  end

  def button_up(id)
    @buttons_down -= 1
  end

  def needs_redraw?
    !@scene_ready
    @draws == 0|| @buttons_down > 0
  end

  def draw
    @scene_ready ||= true
    @background.draw(0, 0, 0)
    @draws += 1
    @message.draw(10, 10, 1)
    @player.draw(@x, @y, 0)

  end
end

window = GameWindow.new
window.show
