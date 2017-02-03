require 'spec_helper'
describe 'cron::protect_config' do

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
      it { should contain_class('cron::protect_config') }
    end

    context 'permissions on /etc/crontab' do
      it { should contain_file('/etc/crontab').with(
        {
          :owner => 'root',
          :group => 'root',
          :mode  => '0600',
        }
      )}
    end

    context 'permissions on /etc/cron.hourly' do
      it { should contain_file('/etc/cron.hourly').with(
        {
          :ensure => 'directory',
          :owner  => 'root',
          :group  => 'root',
          :mode   => '0700',
        }
      )}
    end

    context 'permissions on /etc/cron.daily' do
      it { should contain_file('/etc/cron.daily').with(
        {
          :ensure => 'directory',
          :owner  => 'root',
          :group  => 'root',
          :mode   => '0700',
        }
      )}
    end

    context 'permissions on /etc/cron.weekly' do
      it { should contain_file('/etc/cron.weekly').with(
        {
          :ensure => 'directory',
          :owner  => 'root',
          :group  => 'root',
          :mode   => '0700',
        }
      )}
    end

    context 'permissions on /etc/cron.monthly' do
      it { should contain_file('/etc/cron.monthly').with(
        {
          :ensure => 'directory',
          :owner  => 'root',
          :group  => 'root',
          :mode   => '0700',
        }
      )}
    end

    context 'permissions on /etc/cron.daily' do
      it { should contain_file('/etc/cron.daily').with(
        {
          :ensure => 'directory',
          :owner  => 'root',
          :group  => 'root',
          :mode   => '0700',
        }
      )}
    end

    context 'permissions on /etc/cron.d' do
      it { should contain_file('/etc/cron.d').with(
        {
          :ensure => 'directory',
          :owner  => 'root',
          :group  => 'root',
          :mode   => '0700',
        }
      )}
    end

  end
end
