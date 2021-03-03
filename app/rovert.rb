class Rovert
  attr_reader :x
  attr_reader :y
  attr_reader :direction

  def initialize(position, plateau)
    @x = position.split[0].to_i
    @y = position.split[1].to_i
    @direction = position.split[2]
    @plateau = plateau
  end

end
