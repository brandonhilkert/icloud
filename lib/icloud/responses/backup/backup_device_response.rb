module Icloud
  class BackupDeviceResponse < ProtoBufResponse
    def parse
      super(Icloud::ProtocolBuffers::Backups)
    end

    def process(client)
    end
  end
end
