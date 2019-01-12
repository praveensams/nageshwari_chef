#
# Cookbook:: navya_apache
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

(1..100).each do |a|


   directory "/mnt/#{a}" do
      owner 'root'
	  group 'root'
   end

   file "/mnt/#{a}/file_#{a}" do
   	  content "
	  I am from folder #{a}
	  "
   end

end
