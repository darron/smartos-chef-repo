current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "#{ENV['CHEF_NODE_NAME']}"
client_key               "#{ENV['CHEF_CLIENT_KEY']}"
validation_client_name   "#{ENV['CHEF_SMARTOS_ORGNAME']}-validator"
validation_key           "#{ENV['CHEF_SMARTOS_VALIDATION_KEY']}"
chef_server_url          "https://api.opscode.com/organizations/#{ENV['CHEF_SMARTOS_ORGNAME']}"
cache_type               'BasicFile'
cache_options(:path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            "#{current_dir}/../cookbooks"

# required to extract the right interface for knife ssh
knife[:ssh_attribute] = "ipaddress"

knife[:joyent_username] = ENV['JOYENT_USERNAME']
knife[:joyent_password] = ENV['JOYENT_PASSWORD']
# knife[:joyent_keyname] = ENV['SDC_CLI_KEY_ID'] || 'keyname'
knife[:joyent_keyfile] = ENV['JOYENT_SSH_PRIVATE_KEY_PATH'] || "#{ENV['HOME']}/.ssh/id_rsa"
knife[:joyent_api_url] = 'https://us-sw-1.api.joyentcloud.com/'

cookbook_copyright "#{ENV['YOUR_NAME']}"
cookbook_license   "#{ENV['CHEF_COOKBOOK_LICENSE']}"
cookbook_email     "#{ENV['YOUR_EMAIL']}"