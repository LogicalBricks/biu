require 'spec_helper'

describe Localidad do
  it { should have_many(:lugares) }
  it { should have_many(:hoteles) }
  it { should have_many(:restaurantes) }
end
