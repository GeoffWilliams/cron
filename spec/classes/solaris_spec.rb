require 'spec_helper'
describe 'cron::solaris' do

  let :facts do
    {
      :os => {
        :family => 'Solaris',
      }
    }
  end

  context 'with default values for all parameters' do
    it { should contain_class('cron::solaris') }
  end

  context 'with default values for all parameters' do
    it { should contain_file("/var/cron").with(
      {
        :ensure => "directory",
        :owner  => "root",
        :group  => "root",
        :mode   => "0700",
      }
    )}
  end

end
