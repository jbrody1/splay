
# Cookbook Name:: worker
# Recipe:: default
#
# Copyright (C) 2015 Splay Corp
#
# All rights reserved - Do Not Redistribute
#

include_recipe "meteor"
include_recipe "git"

user = node[:splay][:user]

group user do
end

user user do
  supports :manage_home => true
  gid user
  home "/home/#{user}"
  shell "/bin/bash"
end

git "/home/#{user}/server" do
  repository "https://github.com/jbrody1/broadcast"
  revision "master"
  group user
  user user
  action :checkout
end

