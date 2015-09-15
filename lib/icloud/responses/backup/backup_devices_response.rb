module Icloud
  class BackupDevicesResponse < ProtoBufResponse
    def parse
      super(Icloud::ProtocolBuffers::BackupDevices)
    end

    def process(client)
    end
  end
end
