#
# Cookbook:: navya_webserver
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

node.default['ports']=4040

if ( node['platform'] == "centos" )

    ['httpd','httpd-tools'].each do |a|
    
        package a do
    	    action :install
    		not_if "rpm -q grep #{a}"
    	end
    
    end
    
    
    cookbook_file "/var/www/html/index.html" do
    	source "index.html"
    	notifies :restart , "service[httpd]", :delayed
    end
    
    template "/etc/httpd/conf/httpd.conf" do
        source "httpd.conf.erb"
    	notifies :restart,"service[httpd]",:delayed
    end
    
    service "httpd" do
    	action :start
    end

else
	puts "Platform is not matching"
end
