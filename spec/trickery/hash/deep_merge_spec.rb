require 'spec_helper'

require File.expand_path(File.join(%w(.. .. .. .. lib trickery hash deep_merge)), __FILE__)

describe Hash do

  it 'responds to deep_merge' do
    assert { {}.respond_to?(:deep_merge) }
  end

  it 'merges deeply' do
    assert { { a: { b: 0 } } == { a: { b: 1 } }.deep_merge({ a: { b: 0 } }) }
  end

  it 'merges multiple' do
    a = { a: { b: 0, c: 3 } }
    b = { a: { b: 1, c: 4 } }
    c = { a: { b: 2 } }
    assert { { a: { b: 2, c: 4 } } == a.deep_merge(b, c) }
  end

  it 'merges nil' do
    a = { a: { b: 0 } }
    b = { a: { b: nil } }
    assert { { a: { b: nil } } == a.deep_merge(b) }
  end

end
