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

# # cd /etc/default
# # awk '/CRONLOG=/ { $1 =
# "CRONLOG=YES" }; \ { print }' cron >
# cron.new
# # mv cron.new cron
# # pkgchk -f -n -p /etc/default/cron
# # chown root:root /var/cron/log
# # chmod go-rwx /var/cron/log
  end


end
