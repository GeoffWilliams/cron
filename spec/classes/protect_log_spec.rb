require 'spec_helper'
describe 'cron::protect_log' do

  #
  # RedHat
  #
  context "RedHat" do
    let :facts do
      {
        :os => {
          :family => 'RedHat',
        }
      }
    end

    context 'with default values for all parameters' do
      it { should contain_class('cron::protect_log') }
    end

    context 'permissions on /var/log/cron' do
      it { should contain_file('/var/log/cron').with(
        {
          :owner => 'root',
          :group => 'root',
          :mode  => '0600',
        }
      )}
    end
  end

  #
  # AIX
  #
  context "AIX" do
    let :facts do
      {
        :os => {
          :family => 'AIX',
        }
      }
    end

    context 'with default values for all parameters' do
      it { should contain_class('cron::protect_log') }
    end

    context 'permissions on /var/adm/cron/log' do
      it { should contain_file('/var/adm/cron/log').with(
        {
          :ensure => 'file',
          :mode   => '0640',
        }
      )}
    end
  end

  #
  # Solaris
  #
  context "Solaris" do
    let :facts do
      {
        :os => {
          :family => 'Solaris',
        }
      }
    end

    context 'with default values for all parameters' do
      it { should contain_class('cron::protect_log') }
    end

    context 'permissions on /var/cron/log' do
      it { should contain_file('/var/cron/log').with(
        {
          :ensure => 'file',
          :owner  => 'root',
          :group  => 'root',
          :mode   => '0600',
        }
      )}
    end
  end
end
