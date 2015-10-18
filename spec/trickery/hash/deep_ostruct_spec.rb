require 'spec_helper'

require File.expand_path(File.join(%w(.. .. .. .. lib trickery hash deep_ostruct)), __FILE__)

describe Hash do

  it 'responds to deep_ostruct' do
    assert { {}.respond_to?(:deep_ostruct) }
  end

  it 'creates open struct' do
    assert { {}.deep_ostruct.is_a? OpenStruct }
  end

  it 'sets properties' do
    assert { { foo: 42 }.deep_ostruct.foo == 42 }
  end

  it 'creates open structs deeply' do
    assert { { foo: {} }.deep_ostruct.foo.is_a? OpenStruct }
  end

  it 'sets properties deeply' do
    assert { { foo: { bar: 42 } }.deep_ostruct.foo.bar == 42 }
  end

end
