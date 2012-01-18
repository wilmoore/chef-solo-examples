# Cookbook Name:: nodejs
# Recipe:: default

case node[:platform]
when "ubuntu"
  execute "apt-get update" do
    action    :nothing
  end

  package "git-core curl build-essential openssl libssl-dev" do
    action    :install
    options   '--force-yes'
  end

  bash "install nodejs from source" do
    code <<-EOH
      INSTALL_DIR=/tmp/node-install-$(date +"%Y%m%d%H%M%S") && \
      rm -rf $INSTALL_DIR && mkdir -p $INSTALL_DIR && cd $INSTALL_DIR && \
      curl -# -L http://nodejs.org/dist/node-latest.tar.gz | tar -xz --strip 1 && \
      ./configure --prefix=/usr/local && make install && \
      curl http://npmjs.org/install.sh | sh 
    EOH
  end
else
  Chef::Log.error "no platform support."
end
