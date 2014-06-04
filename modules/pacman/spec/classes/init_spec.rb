require 'spec_helper'
describe 'pacman' do

  context 'with defaults for all parameters' do
    it { should contain_class('pacman') }
  end
end
