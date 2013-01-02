# -*- mode: ruby -*-
# vi: set ft=ruby :

# See: https://github.com/mitchellh/vagrant/pull/1283, hopefully integrated in 1.1.0
if Gem::Version.new(Vagrant::VERSION) < Gem::Version.new('1.1.0') 

  module Vagrant
    module Guest
      class Suse < Redhat
        def change_host_name(name)
          # Only do this if the hostname is not already set
          if !vm.channel.test("sudo hostname | grep '#{name}'")
            vm.channel.sudo("echo '#{name}' > /etc/HOSTNAME")
            vm.channel.sudo("hostname #{name}")
            vm.channel.sudo("sed -i 's@^\\(127[.]0[.]0[.]1[[:space:]]\\+\\)@\\1#{name} #{name.split('.')[0]} @' /etc/hosts")
          end
        end
      end
    end
  end

end