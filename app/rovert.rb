class Rovert
  attr_reader :x
  attr_reader :y
  attr_reader :direction

  ALLOW_MOVEMENTS = ['L','R','M']

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
end
