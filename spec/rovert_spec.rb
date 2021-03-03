require_relative '../app/rovert'
require_relative '../app/plateau'

describe 'move' do
  let(:rovert) { Rovert.new('3 3 N', Plateau.new('5 5'))}

  it 'should correctly move to left' do
    expect(rovert.direction).to eq('N')
    rovert.move('L')
    expect(rovert.direction).to eq('W')
    rovert.move('L')
    expect(rovert.direction).to eq('S')
    rovert.move('L')
    expect(rovert.direction).to eq('E')
    rovert.move('L')
    expect(rovert.direction).to eq('N')
  end

  it 'should correctly move to right' do
    expect(rovert.direction).to eq('N')
    rovert.move('R')
    expect(rovert.direction).to eq('E')
    rovert.move('R')
    expect(rovert.direction).to eq('S')
    rovert.move('R')
    expect(rovert.direction).to eq('W')
    rovert.move('R')
    expect(rovert.direction).to eq('N')
  end

  context 'move forward' do
    it 'with direction North' do
      expect(rovert.y).to eq(3)
      rovert.move('M')
      expect(rovert.y).to eq(4)
    end

    it 'with direction East' do
      rovert.move('R')
      expect(rovert.x).to eq(3)
      expect(rovert.direction).to eq('E')
      rovert.move('M')
      expect(rovert.x).to eq(4)
    end

    it 'with direction West' do
      rovert.move('L')
      expect(rovert.x).to eq(3)
      expect(rovert.direction).to eq('W')
      rovert.move('M')
      expect(rovert.x).to eq(2)
    end

    it 'with direction South' do
      rovert.move('R R')
      expect(rovert.y).to eq(3)
      expect(rovert.direction).to eq('S')
      rovert.move('M')
      expect(rovert.y).to eq(2)
    end
  end

  context 'move out of bound' do
    let(:rovert) { Rovert.new('0 0 N', Plateau.new('0 0'))}

    it 'with direction North' do
      expect(STDOUT).to receive(:puts).with(Rovert::ERROR_OUT_OF_BOUNDS)
      expect(rovert.y).to eq(0)
      rovert.move('M')
      expect(rovert.y).to eq(0)
    end

    it 'with direction East' do
      expect(STDOUT).to receive(:puts).with(Rovert::ERROR_OUT_OF_BOUNDS)
      rovert.move('R')
      expect(rovert.x).to eq(0)
      expect(rovert.direction).to eq('E')
      rovert.move('M')
      expect(rovert.x).to eq(0)
    end

    it 'with direction West' do
      expect(STDOUT).to receive(:puts).with(Rovert::ERROR_OUT_OF_BOUNDS)
      rovert.move('L')
      expect(rovert.x).to eq(0)
      expect(rovert.direction).to eq('W')
      rovert.move('M')
      expect(rovert.x).to eq(0)
    end

    it 'with direction South' do
      expect(STDOUT).to receive(:puts).with(Rovert::ERROR_OUT_OF_BOUNDS)
      rovert.move('R R')
      expect(rovert.y).to eq(0)
      expect(rovert.direction).to eq('S')
      rovert.move('M')
      expect(rovert.y).to eq(0)
    end
  end

  it 'with unknown instruction' do
    expect(STDOUT).to receive(:puts).with('ERROR: Movement instruction unknown')
    rovert.move('X')
  end
end

describe 'get_position' do
  let(:rovert) { Rovert.new('3 3 N', Plateau.new('5 5'))}

  it 'should get the current position' do
    expect(rovert.get_position).to eq('3 3 N')
  end
end
