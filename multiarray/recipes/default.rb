#
# Cookbook:: multiarray
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

node['operation'].each do |k,v|


   directory "/mnt/#{k}" do

     user 'root'
	 group 'root'

   end

   file "/mnt/#{k}/#{v}" do
   	   content "
	    I am coming from the folder #{k} , i am the file #{v}
		"
	end

end
