require 'spec_helper'

describe PairingWithNick do
  it 'has a version number' do
    expect(PairingWithNick::VERSION).not_to be nil
  end

  it 'does something useful' do
    output = PairingWithNick::Reddit.new.reddit
    expect(output).not_to be nil
  end

end
