require 'spec_helper'
require 'rspec'
require 'wungine/wunderground'

describe "Wungine::Wundergound" do
  context 'get forecast by zip' do
    it 'returns data' do
      @w = Wungine::Wunderground.get_conditions_by_zip
      expect(@w.city).to eq('Coraopolis')
    end
  end
end