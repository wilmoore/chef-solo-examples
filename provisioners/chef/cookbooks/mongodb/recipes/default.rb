# Cookbook Name:: mongodb
# Recipe:: default

case node['platform']
when "ubuntu"
    execute "apt-get update" do
        action    :nothing
    end

    execute "add gpg key" do
        command   "apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10"
        action    :nothing
    end

    file "/etc/apt/sources.list.d/mongodb-10gen.list" do
        owner     "root"
        group     "root"
        mode      "0755"
        action    :create
        content   "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen"
        notifies  :run, resources("execute[apt-get update]"), :immediately
    end

    package "autoconf" do
        action    :install
        options   '--force-yes'
    end

    package "mongodb-10gen" do
        action    :install
        options   '--force-yes'
    end
else
  Chef::Log.error "no platform support."
end
