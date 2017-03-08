# Author :  PAUL WANG
# Project : Simple Robot Driver
# This is a Robot Class which can perform move and change dirction actions
class Robot 	
	NORTH = 0 # indicate the robot facing north
	EAST = 1 # indicate the robot facing east
	SOUTH = 2 # indicate the robot facing south
	WEST = 3 # indicate the robot facing west

    def initialize(x,y,facing)
       @co_x= x
       @co_y= y
       @direction_facing = facing
    end

    def move(move_inst)
    	case @direction_facing
    	when "N"
    		if move_inst == "F"
    			@co_y = @co_y + 1
    		end
    		if move_inst == "B"
                @co_y - 1 >= 0 ? (@co_y = @co_y - 1) : report_error() # waring if move to negative  y coordinate
    		end
        when "S"
        	if move_inst == "F"
                @co_y - 1 >= 0 ? (@co_y = @co_y - 1) : report_error()
    		end
    		if move_inst == "B"
    			@co_y = @co_y + 1
    		end
    	when "W"
    		if move_inst == "F"
                @co_x - 1 >= 0 ? (@co_x = @co_x - 1) : report_error() # waring if move to negative  x coordinate
    		end
    		if move_inst == "B"
    			@co_x = @co_x + 1
    		end
        when "E"
        	if move_inst == "F"
    			@co_x = @co_x + 1
    		end
    		if move_inst == "B"
                @co_x - 1 >= 0 ? (@co_x = @co_x - 1) : report_error()
    		end
    	end
    end

    def report_error()
        puts "Turn around, find a valid way to move!! Robot is stay at #{@co_x},#{@co_y}"
    end

    def report_current_cor()
        puts "#{@co_x},#{@co_y}"
    end

    def get_current_direction(rotate_to)
    	temp_dir = convert_current_dir_int()
    	if rotate_to == "L"
    		new_dir = (temp_dir + 3) % 4  # 90-degree left turn as 3 90-degree right turns
    	end
    	if rotate_to == "R"
    		new_dir = (temp_dir + 1) % 4  # turn a robot 90 degrees to its right
    	end
    	@direction_facing = convert_current_dir_string(new_dir)
        # puts "I am facing #{@direction_facing} Now!!!!"
    end

# This method help to get the direction as Interger 
    def convert_current_dir_int()
    	case @direction_facing
    	when "N"
    		@direction_facing = NORTH
    	when "E"
    		@direction_facing = EAST
        when "S"
    		@direction_facing = SOUTH
        when "W"
    		@direction_facing= WEST
    	end
    end

# This method help to convert Interger to corresponding string  
    def convert_current_dir_string(curren_int_dir_int)
    	case curren_int_dir_int
    	when 0
    		curren_int_dir_int = "N"
    	when 1
    		curren_int_dir_int = "E"
        when 2
    		curren_int_dir_int = "S"
        when 3
    		curren_int_dir_int= "W"
    	end
    end
end