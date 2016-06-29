@start = false
@inicio = 0
@ataque = 0
@johnCaraPos = 7
@carastart = false
@dibujarataque = false
@carafin = 0

update
@inicio +=1

if @inicio > 3000
  @start = true
end

if @start == true

  if @ataque > 50
    if @carafin > 50
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
    @johncuerpo = Gosu::Image.new(self, 'images/cabeza_recta_arriba.png', false)
    if @cuerpoy1 < 550
      @cuerpox1 = @cuerpox1 + (6.0*((@xstatic-550.0) / (@ystatic)))
      @cuerpoy1 = @cuerpoy1 + 10
    else
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
    @johncuerpo = Gosu::Image.new(self, 'images/cabeza_torcida_derecha.png', false)
    if @cuerpoy2 < 550
      @cuerpox2 = @cuerpox2 + (6.0*((@xstatic-1204.0) / (@ystatic+100)))
      @cuerpoy2 = @cuerpoy2 + 3
    else
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
    @johncuerpo = Gosu::Image.new(self, 'images/cabeza_torcida_izquierda.png', false)
    if @cuerpoy3 < 550
      @cuerpox3 = @cuerpox3 + (6.0*((@xstatic-250.0) / (@ystatic+100)))
      @cuerpoy3 = @cuerpoy3 + 3
    else
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
    @johncuerpo = Gosu::Image.new(self, 'images/cabeza_torcida_izquierdaa.png', false)
    if @cuerpoy4 < 550
      @cuerpox4 = @cuerpox4 + (6.0*((@xstatic) / (@ystatic+100)))
      @cuerpoy4 = @cuerpoy4 + 0.5
    else
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
    @johncuerpo = Gosu::Image.new(self, 'images/cabeza_recta_izquierda.png', false)
    if @cuerpoy5 < 550
      @cuerpox5 = @cuerpox5 + (6.0*((@xstatic-200.0) / (@ystatic+100)))
      @cuerpoy5 = @cuerpoy5 + 3
    else
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












draw
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
    @johnCara = Gosu::Image.new(self, 'images/cabeza_torcida_izquierdaa.png', false)
    @johnCara.draw(0, 0 , 1)
    @xstatic = @x
    @ystatic = @y
  end
  if @johnCaraPos == 4
    @johnCara = Gosu::Image.new(self, 'images/cabeza_recta_izquierda.png', false)
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


@johnarriba = Gosu::Image.new(self, 'images/cabeza_recta_arriba.png', false)
@johnderecha = Gosu::Image.new(self, 'images/cabeza_torcida_derecha.png', false)
@johnizquierdaarbol = Gosu::Image.new(self, 'images/cabeza_torcida_izquierda.png', false)
@johnizquierdaarbol2 = Gosu::Image.new(self, 'images/cabeza_torcida_izquierdaa.png', false)
@johnizquierda = Gosu::Image.new(self, 'images/cabeza_recta_izquierda.png', false)
