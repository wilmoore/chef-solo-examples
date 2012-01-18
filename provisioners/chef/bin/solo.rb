# REF: http://wiki.opscode.com/display/chef/Chef+Solo#ChefSolo-ConfigureChefSolo
# sudo chef-solo -c provisioners/chef/bin/solo.rb
# sudo chef-solo -c provisioners/chef/bin/solo.rb -j servers/$(hostname -s)/provisions.json
base_directory = File.expand_path("../../", __FILE__)

file_cache_path  '/tmp/chef-solo'
cookbook_path    ['cookbooks', 'site-cookbooks'].map{|value| File.expand_path(value, base_directory) }
role_path        File.expand_path('roles', base_directory)
log_level        :info
log_location     STDOUT
ssl_verify_mode  :verify_none
