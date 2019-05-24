# MKS22X-FinalProject

-~-DESCRIPTION-~-
Balloon tower defense with enemies (balloons) entering from a designated zone and moving through a path to the end. The player will be tasked with placing towers (monkeys) along this path to stop the advance of the enemies. The player will be provided with a source of income to allow him/her to place more towers and upgrade current towers. Choose from a variety of towers to form the best defense. 


-~-HOW TO PLAY-~-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



-~-DEVELOPER'S LOG-~-

May 16, 2019
Devin - Began work on the classes
      - Added skeletons for the files "classes" and "playingField"
James - Edited ReadMe

May 18, 2019
Devin - made constructor for monkeys and the ability to drag the mouse to create new monkeys in specified locations

May 20, 2019
James - Began work on the balloon class
      - Balloons work the same as the path with a subclass for individual balloons (for path the individual units are called tiles)
      - Balloons should display an image of a balloon
Devin - Worked on the random path generator

May 21, 2019
James - Note: Balloon coord is on top left of the image
      - Worked balloon so that they start at the beginning of the path
      
Devin - Worked on the random path generator
      - Consulted Mr. Konstantinovich on how to make algorithm for random path
      - Decided to split up the map into sections and generate random x in between each section and a random y for each x-coord 
        and connect all points to generate path.
      
May 22, 2019
James - Worked more on balloons and getting them to follow the path
      - Will have each balloon check the points in the path and have them move towards the next point coordinates.
      
Devin - Finished the random path generator
      - Started work on monkey (tower) placement [making sure the monkeys don't overlap with the path]
      - Checking if monkey is in Between the line segment path
      
May 23, 2019
James - Finished balloon movement
      - Balloons can now traverse the path
      - Balloons have speed
      - Each balloon moves a certain amount in the x and y plane proportional to the length of the segment (each path segment is 
        one big triangle so dividing each leg by the hypotenuse will create a bunch of smaller triangles with hypotenus 1 or path                     
        distance 1 allowing balloons to move at constant speed)
      - Balloons are also properly centered on the path
Devin - Figured out how to check if monkey is on the line
      - Algorithm will check the monkey's x-coord with that of every point on the line, find which two points it is in between.
      - Using that segment of the path, the monkey will "drop a perpendicular" to that segment and see if its distance to that            
        segement is allowable. Depending on this information it will place the monkey.
      
