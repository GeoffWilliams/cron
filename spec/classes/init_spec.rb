require 'spec_helper'
describe 'cron' do

  # we require a basic set of facts to allow the code to compile
  let :facts do
    {
      :os => {
        :family => 'RedHat',
      }
    }
  end

  context 'with default values for all parameters' do
    it { should contain_class('cron') }
  end

  context 'RedHat tests' do
    # facts to use for testing RedHat
    let :facts do
      {
        :os => {
          :family => 'RedHat',
        }
      }
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

    context 'permissions on /var/log/cron' do
      it { should contain_file('/var/log/cron').with(
        {
          :owner  => 'root',
          :group  => 'root',
          :mode   => '0600',
        }
      )}
    end

  end
end
