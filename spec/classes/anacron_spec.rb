require 'spec_helper'
describe 'cron::anacron' do

  # we require a basic set of facts to allow the code to compile
  let :facts do
    {
      :os => {
        :family => 'RedHat',
      }
    }
  end

  context 'with default values for all parameters' do
    it { should contain_class('cron::anacron') }
  end


  context 'Installs additional packages' do
    it {should contain_package('cronie-anacron')}
  end

  context 'permissions on /etc/anacrontab' do
    it { should contain_file('/etc/anacrontab').with(
      {
        :owner => 'root',
        :group => 'root',
        :mode  => '0600',
      }
    )}
  end
end
