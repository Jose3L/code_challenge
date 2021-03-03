class Rovert
  attr_reader :x
  attr_reader :y
  attr_reader :direction

  ALLOW_MOVEMENTS = ['L','R','M']
  ERROR_OUT_OF_BOUNDS = 'ERROR: out of bounds'

  def initialize(position, plateau)
    @x = position.split[0].to_i
    @y = position.split[1].to_i
    @direction = position.split[2]
    @plateau = plateau
  end

  def move(movements)
    movements.split.each do |movement|
      if ALLOW_MOVEMENTS.include? movement
        movement == 'M' ? forward : turn(movement)
      else
        puts 'ERROR: Movement instruction unknown'
      end
    end
  end

  def get_position
    "#{x} #{y} #{direction}"
  end

  private
  def turn(direction)
    case @direction
    when 'N'
      direction == 'L' ? @direction = 'W' : @direction = 'E'
    when 'E'
      direction == 'L' ? @direction = 'N' : @direction = 'S'
    when 'S'
      direction == 'L' ? @direction = 'E' : @direction = 'W'
    when 'W'
      direction == 'L' ? @direction = 'S' : @direction = 'N'
    end
  end

  def forward
    case @direction
    when 'N'
      @plateau.max_y >= @y + 1 ? @y = @y + 1 : (puts ERROR_OUT_OF_BOUNDS)
    when 'E'
      @plateau.max_x >= @x + 1 ? @x = @x + 1 : (puts ERROR_OUT_OF_BOUNDS)
    when 'S'
      @y - 1 >= 0 ? @y = @y - 1 : (puts ERROR_OUT_OF_BOUNDS)
    when 'W'
      @x - 1 >= 0 ? @x = @x - 1 : (puts ERROR_OUT_OF_BOUNDS)
    end
  end
end
