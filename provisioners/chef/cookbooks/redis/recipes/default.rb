# Cookbook Name:: redis
# Recipe:: default

case node['platform']
when "ubuntu"

    execute "apt-get update" do
        action    :nothing
    end

    package "redis-server" do
        action    :install
        options   '--force-yes'
    end

else
  Chef::Log.error "The 'redis' cookbook is not supported on this platform."
end
