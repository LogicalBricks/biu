require 'spec_helper'

describe Lugar do
  it { should validate_presence_of(:nombre) }
  it { should validate_presence_of(:resumen) }
  it { should validate_presence_of(:descripcion) }

  it { should ensure_length_of(:nombre).is_at_most(255) }
  it { should ensure_length_of(:resumen).is_at_most(255) }
  it { should ensure_length_of(:descripcion).is_at_most(2500) }
end
