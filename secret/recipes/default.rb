#
# Cookbook:: secret
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

secret = Chef::EncryptedDataBagItem.load_secret("/etc/chef/encrypted_data_bag_secret")

luigi_keys = Chef::EncryptedDataBagItem.load("india", "chennai", secret)

puts luigi_keys['a']

