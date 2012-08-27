require 'spec_helper'

describe Localidad do
  it { should have_many(:lugares) }
  it { should have_many(:hoteles) }
end
