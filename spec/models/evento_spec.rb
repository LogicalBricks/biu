require 'spec_helper'

describe Evento do
  it { should belong_to(:localidad) }
  it { should have_many(:fotografias) }
  it { should have_one(:localizacion) }

  it { should validate_presence_of(:nombre) }
  it { should validate_presence_of(:resumen) }
  it { should validate_presence_of(:descripcion) }
  it { should validate_presence_of(:fecha_y_hora) }

  it { should ensure_length_of(:nombre).is_at_most(255) }
  it { should ensure_length_of(:resumen).is_at_most(255) }
  it { should ensure_length_of(:descripcion).is_at_most(2500) }

  describe '.proximos' do
    it 'should include an event which will happen today' do
      evento = FactoryGirl.create :evento, fecha_y_hora: 1.hour.from_now
      Evento.proximos.all.should include(evento)
    end

    it 'should include an event which will happen tomorrow' do
      evento = FactoryGirl.create :evento, fecha_y_hora: 1.day.from_now
      Evento.proximos.all.should include(evento)
    end

    it 'should include an event which will happen next week' do
      evento = FactoryGirl.create :evento, fecha_y_hora: 1.week.from_now
      Evento.proximos.should include(evento)
    end

    it 'should NOT include an event which happened today ' do
      evento = FactoryGirl.create :evento, fecha_y_hora: 1.hour.ago
      Evento.proximos.should_not include(evento)
    end

    it 'should NOT include an event which happened yesterday ' do
      evento = FactoryGirl.create :evento, fecha_y_hora: 1.day.ago
      Evento.proximos.should_not include(evento)
    end

    it 'should NOT include an event which will happen one month from now' do
      evento = FactoryGirl.create :evento, fecha_y_hora: 1.month.from_now
      Evento.proximos.should_not include(evento)
    end
  end #.proximos

  describe 'del_mes' do
    it 'should include an event which happened at beginning of month' do
      evento = FactoryGirl.create :evento, fecha_y_hora: Date.today.beginning_of_month
      Evento.del_mes.should include(evento)
    end

    it 'should include an event which will happen at end of month' do
      evento = FactoryGirl.create :evento, fecha_y_hora: Date.today.end_of_month
      Evento.del_mes.should include(evento)
    end

    it 'should include an event which will happen at middle of month' do
      evento = FactoryGirl.create :evento, fecha_y_hora: Date.today.beginning_of_month + 15.days
      Evento.del_mes.should include(evento)
    end

    it 'should NOT include an event which will happen next month' do
      evento = FactoryGirl.create :evento, fecha_y_hora: Date.today.next_month
      Evento.del_mes.should_not include(evento)
    end

    it 'should NOT include an event which happened last month' do
      evento = FactoryGirl.create :evento, fecha_y_hora: Date.today.prev_month
      Evento.del_mes.should_not include(evento)
    end

  end #.del_mes
end
