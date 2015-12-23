module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = create_current_user
    end

    protected
      def create_current_user
        data = {
          ip: self.env["REMOTE_ADDR"],
        }
        CurrentUser.new(data)
      end

      class CurrentUser
        attr_accessor :room, :ip, :nickname

        def initialize(opts = {})
          @room = opts[:room_id] ? Room.find(opts[:room_id]) : Room.first
          @ip = opts[:ip]
          @nickname = opts[:nickname] || rand_nickname
        end

        def room_id=(room_id)
          @room = Room.find(room_id)
        end

        private
        def rand_nickname
          (Time.now.strftime("%Y%m%d%H%M%S").to_i.to_s(36) + rand(1000).to_s).rjust(12, "0")
        end
      end
  end
end
