require "icloud/version"

require 'icloud/util'
require 'icloud/client'
require 'icloud/response'
require 'icloud/plist_response'
require 'icloud/json_response'
require 'icloud/proto_buf_response'
require 'icloud/request'

require 'icloud/protocol_buffers/messages.rb'

require 'icloud/responses/account_settings_response.rb'
require 'icloud/responses/authentication_response.rb'
require 'icloud/responses/configuration_response.rb'
require 'icloud/responses/default_response.rb'
require 'icloud/responses/backup/backup_devices_response.rb'
require 'icloud/responses/backup/backup_device_response.rb'

require 'icloud/requests/configuration_request.rb'
require 'icloud/requests/account_settings_request.rb'
require 'icloud/requests/authentication_request.rb'
require 'icloud/requests/backup/backup_devices_request.rb'
require 'icloud/requests/backup/backup_device_request.rb'

module Icloud
end
