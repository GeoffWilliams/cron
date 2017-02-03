#
# AIX
# ===
#
require 'spec_helper'
describe 'cron::cron_allow_deny' do
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
      it { should contain_class('cron::cron_allow_deny') }
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
      it { should contain_class('cron::cron_allow_deny') }
    end

    context 'removes /etc/cron.d/cron.deny' do
      it { should contain_file("/etc/cron.d/cron.deny").with(
        {
          :ensure => "absent",
        }
      )}
    end

    context 'creates /etc/cron.d/cron.allow' do
      it { should contain_file("/etc/cron.d/cron.allow").with(
        {
          :ensure => "file",
          :owner  => "root",
          :group  => "root",
          :mode   => "0400",
        }
      )}
    end

    context 'authorises root and adm if requested' do
      let :params do
        {
          "allow_users" => ["root"],
        }
      end

      it { should contain_file_line("/etc/cron.d/cron.allow_user_root").with(
        {
          :ensure => "present",
          :path   => "/etc/cron.d/cron.allow",
          :line   => "root",
        }
      )}
    end

  end
end
