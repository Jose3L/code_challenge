require_relative 'rovert'
require_relative 'plateau'

# Get first input to set the Plateau
input = gets
plateau = Plateau.new(input)

# Get inputs for the Rover 1
input = gets
rover = Rovert.new(input, plateau)

# Get inputs to move Rover 1
input = gets
rover.move(input)
puts rover.get_position

# Get inputs for the Rover 2
input = gets
rover = Rovert.new(input, plateau)

# Get inputs to move Rover 2
input = gets
rover.move(input)
puts rover.get_position
