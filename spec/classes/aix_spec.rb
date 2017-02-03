#
# AIX
# ===
#
require 'spec_helper'
describe 'cron::aix' do
  let :facts do
    {
      :os => {
        :family => 'AIX',
      }
    }
  end

  context 'with default values for all parameters' do
    it { should contain_class('cron::aix') }
  end

  context 'creates cron.allow' do
    it { should contain_file('/var/adm/cron/cron.allow').with(
      {
        :ensure => 'file',
        :mode   => "0400",
        :owner  => "root",
        :group  => "sys",
      }
    )}
  end

  context 'removes cron.deny' do
    it { should contain_file('/var/adm/cron/cron.deny').with(
      {
        :ensure => 'absent',
      }
    )}
  end

  context 'authorises root and adm if requested' do
    let :params do
      {
        "allow_users" => ["root", "adm"],
      }
    end

    it { should contain_file_line("/var/adm/cron/cron.allow_user_root").with(
      {
        :ensure => "present",
        :path   => "/var/adm/cron/cron.allow",
        :line   => "root",
      }
    )}

    it { should contain_file_line("/var/adm/cron/cron.allow_user_adm").with(
      {
        :ensure => "present",
        :path   => "/var/adm/cron/cron.allow",
        :line   => "adm",
      }
    )}
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
