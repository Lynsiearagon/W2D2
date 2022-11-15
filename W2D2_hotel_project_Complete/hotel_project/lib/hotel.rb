require_relative "room"

class Hotel

    attr_reader :rooms
  
    def initialize(name, hash)
        @name = name
        @rooms = Hash.new 

        hash.each do |room_name, capacity| 
            @rooms[room_name] = Room.new(capacity)
        end
    end

    def name
        @name.split.map(&:capitalize).join(" ")
    end

    def room_exists?(room_name)
        rooms.has_key?(room_name)
    end 

    def check_in(person, room_name)
        if !room_exists?(room_name)
            puts 'sorry, room does not exist'
        elsif
            room_exists?(room_name) && rooms[room_name].add_occupant(person)
            puts 'check in successful'
        else 
            puts 'sorry, room is full'
        end
    end

    def has_vacancy?
        rooms.values.any? { |capacity| capacity.available_space > 0 }
    end

    def list_rooms
        rooms.each do |room_name, capacity|
            puts "#{room_name} : #{capacity.available_space}"
        end
    end
    
end
