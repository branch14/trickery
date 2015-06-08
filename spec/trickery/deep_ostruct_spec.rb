require 'spec_helper'

describe Trickery::DeepOstruct do

  let(:object) { Class.new { include(Trickery::DeepOstruct) }.new }

  it 'returns an OpenStruct' do
    assert {  object.deep_ostruct(a: 1).is_a?(OpenStruct) }
  end

  it 'works deeply' do
    assert {  object.deep_ostruct(a: {b: 42}).a.b == 42 }
  end

end
