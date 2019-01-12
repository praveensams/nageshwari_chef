#
# Cookbook:: dynamic_variable
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.


['httpd','httpd-tools'].each do |pack|

   package pack do
   	  action :install
      not_if "rpm -q #{pack}"
   end

 end


cookbook_file "/mnt/test.sh" do
    source "test.sh"
	user 'root'
	group 'root'
	mode 755
end

 s=`sh /mnt/test.sh`

 template "/var/www/html/index.html" do
      source "index.html.erb"
	  variables(
	  :user_count => s
	  )
end


service "httpd" do
	action :restart 
end
