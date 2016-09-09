require 'spec_helper'
describe 'tripwire' do

  context 'with defaults for all parameters' do
    it { should contain_class('tripwire') }
  end
end
