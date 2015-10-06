#
# Cookbook Name:: testgaurav
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

require 'pp'

pp node.debug_value('os')
#this prints the attributes vakue as
=begin
[["set_unless_enabled?", false],
 ["default", :not_present],
 ["env_default", :not_present],
 ["role_default", :not_present],
 ["force_default", :not_present],
 ["normal", :not_present],
 ["override", :not_present],
 ["role_override", :not_present],
 ["env_override", :not_present],
 ["force_override", :not_present],
 ["automatic", "windows"]]
=end

pp node.debug_value('testWindowsAttribute')

Chef::Log.info("#{cookbook_name}:#{recipe_name} :: Hello Chef")


=begin
find = Mixlib::ShellOut.new("find . -name '*.rb'")
find.run_command
# If all went well, the results are on +stdout+
puts find.stdout
# find(1) prints diagnostic info to STDERR:
puts "error messages" + find.stderr
=end

puts Chef::Config[:file_cache_path]

extend Chef::Mixin::ShellOut
output = shell_out("dir")
puts output.stdout
puts output.stderr

#raise "This is a user defined exception" if node['platform'] != 'redh'
#Chef::Application.exit!("This is getting exited by using Chef::Application.exit!(message)")
#Chef::Application.fatal!("This is getting exited by using Chef::Application.exit!(message)")

puts output.exitstatus()	#output is 127
puts "END"

Testgaurav.hello_name('Gaurav Saxena')

create_file_content 'testgaurav' do

	extn '.rb'
	content "This is coming from definitions create_file_content"
end

#name_file "Gaurav Saxena" do
#	title "MR."
#	path "#{Dir.home()}"
#end

template "/tmp/names.txt" do
	source "names.txt.erb"
	variables ({
		:enabled => true,
		:names => %w(Gaurav Saxena Montu MAnisha Asha Ramesh )
		})
end

remote_file "/tmp/K08v211.tgz" do
  source "http://rds01.lexington.ibm.com:8080/BlueCARE/v.2.1.1/base/linux/K08v211.tgz"
  action :nothing
end

file "/tmp/ruby_block.txt" do
	action :nothing
	content "This file resource was notified from ruby block"
end

ruby_block "Call remote_file " do
	block do
		puts "Inside ruby block"

	end
	notifies :create_if_missing, "remote_file[/tmp/K08v211.tgz]", :immediate
end

#using databags
=begin
c:\chef>knife data bag show pmc_users db2as
comment:  DB2 Admin user
gid:      db2asgrp
home:     /home/db2as
id:       db2as
name:     db2as
password: pM0dularc
shell:    /bin/bash
=end
db2as = search(:pmc_users,"id:db2as").first
puts db2as["comment"]		#DB2 Admin user

puts db2as		#data_bag_item[db2as]
