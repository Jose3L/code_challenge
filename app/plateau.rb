class Plateau
  attr_reader :max_x
  attr_reader :max_y

  def initialize(size)
    @max_x = size.split[0].to_i
    @max_y = size.split[1].to_i
  end
end
