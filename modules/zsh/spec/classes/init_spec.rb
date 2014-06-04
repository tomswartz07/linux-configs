require 'spec_helper'
describe 'zsh' do

  context 'with defaults for all parameters' do
    it { should contain_class('zsh') }
  end
end
