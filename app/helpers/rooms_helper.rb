module RoomsHelper
    def room_category_name(room)
        Category.find(room.category_id).name
    end

    def room_creator_name(room)
        User.find(room.creator_id).name
    end

    def users_in_room(room)
        urooms = UserRoom.where(room_id: room.id)
        users = []
        urooms.each do |uroom|
            users = users.push(User.find(uroom.user_id).name)
        end
        users
    end
end
