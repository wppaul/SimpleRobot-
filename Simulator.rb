# Author :  PAUL WANG
# Project : Simple Robot Driver
# This is a test class taking and validating arguments and 
# performing corresponding action and return the final coordinates

require_relative 'Robot.rb'

def manual()
    puts 'Usage: Please input the right command, with space bewteen each input, start with coordinate x and y such as 0,0 but no negtive number'\
	  'followed by initial direction such as N, and then start giving a set of moving instructions such as F as Forward, '\
	  'B as Backward, R as turning Right 90 degree, L as turning Left degree!'
end


# only allow interger as coordinate inputs 
def validate_cor(x,y)
	if (not !!(x =~ /^[0-9]*[0-9]$/)) or (not !!(y =~ /^[0-9]*[0-9]$/))
		puts 'please input the right coordinate x y such as 0 0 with space bewteen each input, but no negtive number'
		exit
	end
end

def validate_dir(dir)
	if not ['N','S','W','E'].include? dir.upcase
		puts "please put the right direction as N, S, W, E"
		exit
	end
end

def validate_inst(inst_array)
    inst_array.slice(3,inst_array.length).each do |x|
		if not ['F','B','L','R'].include? x.upcase
		    puts "The Robot only accept F,B,L,R as moving instructions, please try again!"
		    exit
		end
	end
end

def validate_argument()
	if ARGV.empty?
       manual()
	   exit
	elsif ARGV.length < 3
	   puts "missing argument!"
	   exit
	else
	   validate_cor(ARGV[0],ARGV[1])
	   validate_dir(ARGV[2])
	   validate_inst(ARGV)
	end
end

validate_argument()

move_command = ARGV.slice(3,ARGV.length).map!(&:upcase) # extracting moving commands

test_robot = Robot.new(ARGV[0].to_i,ARGV[1].to_i,ARGV[2].upcase)

# start moving based on commands
move_command.each do |command|
    if command == "F" or command == "B"
        test_robot.move(command)
    end
    if command == "L" or command == "R"
        test_robot.get_current_direction(command)
    end
end

test_robot.report_current_cor

