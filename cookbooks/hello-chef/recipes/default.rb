#
# Cookbook:: hello-chef
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
 
log 'Hello Chef!!!'
 
directory '/home/ec2-user/shyam' do
  owner node['user']
  group node['group']
  mode '0755'
  action :create
end

#node['employees'].each do |employee|
#  execute "test-multi-#{employee['name']}" do
#    command "sh shell.sh #{employee['name']} #{employee['email']}"
#    cwd "#{node['devops_dir']}/scripts/"
#    user node['user']
#    group node['group']
#    command "bash shell.sh #{employee['name']} #{employee['email']}"
#  end
#end

#execute "test" do
#  cwd node['devops_dir']
#  user node['user']
#  group node['group']
#  node['employees'].each do |employee|
#  execute "test-multi-#{employee['name']}" do
#    command "echo #{employee['name']} #{employee['email']}"
#  end
#  end
#end

node['employees'].each do |employee|
  execute "test-multi-#{employee['name']}" do
    cwd "#{node['devops_dir']}/scripts/"
    user node['user']
    group node['group']
    command "bash shell.sh #{employee['name']} #{employee['email']} #{node['user']}"
    command "bash shell02.sh #{employee['name']} #{employee['email']} #{node['user']}"
    command "echo $date: #{employee['name']} #{employee['email']} #{node['user']} >> /home/ec2-user/chef-repo/cookbooks/hello-chef/recipes/modules.txt"
#    live_stream true
    ignore_failure true
  end
end

