require 'spec_helper'

describe Transporte do
  it { should belong_to(:localidad) }
  it { should have_one(:localizacion) }

  it { should validate_presence_of(:nombre) }
  it { should validate_presence_of(:resumen) }
  it { should validate_presence_of(:descripcion) }
  it { should validate_presence_of(:clasificacion) }
  it { should validate_numericality_of(:clasificacion) }

  it { should_not allow_value(4.5).for(:clasificacion) }
  it { should_not allow_value(-5).for(:clasificacion) }

  it { should ensure_length_of(:nombre).is_at_most(255) }
  it { should ensure_length_of(:resumen).is_at_most(255) }
  it { should ensure_length_of(:descripcion).is_at_most(2500) }
end
