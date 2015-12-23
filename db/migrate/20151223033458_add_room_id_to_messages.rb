class AddRoomIdToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :room_id, :integer
    add_column :messages, :nickname, :string
    add_column :messages, :ip, :string
    Message.all.update_all(room_id: Room.first.id) if Room.count > 0
  end
end
