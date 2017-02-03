require 'spec_helper'
describe 'cron::protect_spool' do
  let :facts do
    {
      :os => {
        :family => 'AIX',
      }
    }
  end

  context 'with default values for all parameters' do
    it { should contain_class('cron::protect_spool') }
  end

  context 'locks down root crontab' do
    it { should contain_file("/var/spool/cron/crontabs/root").with(
      {
        :ensure => "file",
        :owner  => "root",
        :group  => "cron",
        :mode   => "0700",
      }
    )}
  end
end
