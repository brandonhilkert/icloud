require 'httpclient'
require 'securerandom'

module Icloud
  class Client
    UnauthorizedError = Class.new(StandardError)

    attr_reader :tokens, :account_info, :account_settings, :uris, :tokens, :client_id, :features

    def initialize
      @client = HTTPClient.new
      @client.proxy = 'http://localhost:8080' if $DEBUG
      @client.debug_dev = STDERR if $DEBUG
      @client.ssl_config.verify_mode = OpenSSL::SSL::VERIFY_NONE # TODO: Fix this
      @client_id = SecureRandom.uuid
      @uris = { configuration: 'https://setup.icloud.com/configurations/init?context=settings' }
      @tokens = {}
      @account_info = {}
      @features = {}
      update_configuration
    end

    def update_configuration
      process ConfigurationRequest
    end

    def process(request, *args)
      request = request.new(*args) if request.is_a?(Class) && request < Icloud::Request
      request.prepare self
      puts request.uri
      res = if request.method == :get
              @client.get(request.uri, nil, request.headers)
      elsif request.method == :post
              @client.post(request.uri, request.body, request.headers)
      else
        fail NotImplementedError
      end

      response = request.response.new(res, request)
      raise UnauthorizedError if response.status == 401
      response.process self
      response
    end

    def get_uri(key)
      if @uris.key? key
        @uris[key]
      else
        fail "URI #{key} not found.."
      end
    end

    def authorize(email, pass)
      process AuthenticationRequest.new(email, pass)
      update_configuration
      account_settings
    end

    def account_settings
      @account_settings ||= process AccountSettingsRequest
    end

    def backup_devices
      @backup_devices ||= process BackupDevicesRequest
    end

    def backup_device(udid)
      process BackupDeviceRequest.new(udid)
    end

    def udids
      backup_devices.content.udids
    end

    def latest_backup(udid)
      backup_device(udid).content.backup.sort {|a,b| b.timestamp2 <=> a.timestamp2 }.first
    end
  end
end
