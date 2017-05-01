require 'spec_helper'
describe 'hiera_integrations' do
  context 'with default values for all parameters' do
    it { should contain_class('hiera_integrations') }
  end
end
