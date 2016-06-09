require 'gosu'

class GameWindow < Gosu::Window
  def initialize
    super(1204, 598)
    self.caption = 'Watch Out!!'
    @background = Gosu::Image.new(self, 'images/fondo.png', false)

    @x = 500
    @y = 300
    @draws = 0
    @buttons_down = 0

    @music = Gosu::Song.new(self, 'sounds/main.ogg')
    @music.volume = 0.5
    @music.play(true)
  end

  def update
    @x -= 3 if button_down?(Gosu::KbLeft)
    @x += 3 if button_down?(Gosu::KbRight)
    @y -= 3 if button_down?(Gosu::KbUp)
    @y += 3 if button_down?(Gosu::KbDown)
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

    if button_down?(Gosu::KbLeft)
      @message = Gosu::Image.new(self, 'images/nigel.png', false)
    elsif button_down?(Gosu::KbRight)
      @message = Gosu::Image.new(self, 'images/nigel_b.png', false)
    else
      @message = Gosu::Image.new(self, 'images/nigel_b.png', false)
    end

    @message.draw(@x, @y, 0)

  end
end

window = GameWindow.new
window.show
