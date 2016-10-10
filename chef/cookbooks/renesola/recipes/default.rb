#
# Cookbook Name:: renesola
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'apt'
include_recipe 'apache2'
include_recipe 'python'

apache_site "000-default"  

include_recipe 'apache2::mod_wsgi'
service 'apache2' do
  action [:start, :enable]
end
include_recipe 'postgresql'
include_recipe 'build-essential'
# rabbitmq recipe doesn't seem to have this
#include_recipe 'rabbitmq' shit recipe
template "rabbitmq-server" do
      path "/etc/init.d/rabbitmq-server"
      source "rabbitmq-server.erb"
      owner "root"
      group "root"
      mode "0755"
    end
include_recipe 'redis::install_from_package'
include_recipe 'git'
include_recipe 'nodejs'
nodejs_npm 'coffee-script'
# for redis-cli
package 'redis-tools'
# setup daemons
service 'redis-server' do
  action [:start, :enable]
end
service 'postgresql' do
  action [:start, :enable]
end
service 'rabbitmq-server' do
  action [:start, :enable]
end

group "www-data" do
  action :modify
  members "ubuntu"
  append true
end
################### make directories
directory "/var/www/python_test_apps" do
  owner 'www-data'
  group 'www-data'
  mode '0775'
  action :create
end
directory "/var/www/python_test_apps/renesola" do
  owner 'www-data'
  group 'www-data'
  mode '0775'
  action :create
end
directory "/var/www/crm" do
  owner 'www-data'
  group 'www-data'
  mode '0775'
  action :create
end
################ Fix permissions

execute "fix permissions /var/www/ owner" do
  command "chown -R www-data:www-data /var/www"
  action :run
  only_if do File.exists?("/var/www") end
end
execute "fix permissions" do
  command "chmod -R g+rw /var/www"
  action :run
  only_if do File.exists?("/var/www") end
end
######################## install python modules
python_pip "django" do
  version "1.6.5"
end

python_pip "fabric" do
  version "1.10.1"
end

python_pip "pillow" do
  version "2.7.0"
end

python_pip "south" do
  version "1.0.2"
end

python_pip "webob" do
  version "1.4"
end
python_pip "webtest" do
  version "2.0.18"
end
python_pip "amqp" do
  version "1.4.6"
end
python_pip "anyjson" do
  version "0.3.3"
end
python_pip "beautifulsoup4" do
  version "4.3.2"
end
python_pip "coverage" do
  version "3.7.1"
end
python_pip "django-braces" do
  version "1.4.0"
end
python_pip "django-extensions" do
  version "1.5.0"
end
python_pip "django-nose" do
  version "1.3"
end
python_pip "django-webtest" do
  version "1.7.7"
end
python_pip "djangorestframework" do
  version "3.0.5"
end
python_pip "ecdsa" do
  version "0.13"
end
python_pip "jdcal" do
  version "1.0"
end
python_pip "kombu" do
  version "3.0.24"
end
python_pip "nose" do
  version "1.3.4"
end
python_pip "openpyxl" do
  version "2.1.4"
end
python_pip "paramiko" do
  version "1.15.2"
end
python_pip "psycopg2" do
  version "2.6"
end
python_pip "pycrypto" do
  version "2.6.1"
end
python_pip "redis" do
  version "2.10.3"
end
python_pip "reportlab" do
  version "3.1.44"
end
python_pip "six" do
  version "1.9.0"
end
python_pip "waitress" do
  version "0.8.9"
end
python_pip "wsgiref" do
  version "0.1.2"
end

################################### rsa keys for github

cookbook_file "/home/ubuntu/.ssh/id_rsa.pub" do
  path "/home/ubuntu/.ssh/id_rsa.pub"
  source ".ssh/id_rsa.pub"
  action :create_if_missing
  mode '0644'
  owner 'ubuntu'
  group 'ubuntu'
end

cookbook_file "/home/ubuntu/.ssh/id_rsa" do
  path "/home/ubuntu/.ssh/id_rsa"
  source ".ssh/id_rsa"
  action :create_if_missing
  mode '0600'
  owner 'ubuntu'
  group 'ubuntu'
end
cookbook_file "/home/ubuntu/.ssh/known_hosts" do
  path "/home/ubuntu/.ssh/known_hosts"
  source ".ssh/known_hosts"
  action :create_if_missing
  mode '0600'
  owner 'ubuntu'
  group 'ubuntu'
end
