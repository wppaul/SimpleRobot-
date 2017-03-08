Project: Simple Robot Driver
==========================================================================================================

--Author :  PAUL WANG              

*************** System requirement ***************
Ruby: version":"2.0.0" or above

*************** Solution *************************

To start with, considering Robot as an object, it can perform a range of actions such as move, rotate around, 
and recoding its current position and direction, based on the requirement, each method is developed individually with a number of tests. If this project require robot move within a specific square tabletop, the tabletop itself may refer to another object, and can add Robot on.
For the arguments, the Simulator file consider a range of factors such as "number of argument needed","whether using the right instructions" and prevent user inputing special characters, and this Simulator allow user using lowercase letter.
*************** File Listing *********************

1. Robot.rb # This is a Robot Class which can perform move and change dirction actions
2. Simulator.rb # This is a test class taking and validating arguments  performing corresponding action and return the final coordinates

*************** How to Run ***********************
in a shell:
ruby Simulator.rb + arguments
eg. ruby Simulator.rb  0,0,N F,F,L,F,R,B
it will return the final position of a Robot such as 0,1
