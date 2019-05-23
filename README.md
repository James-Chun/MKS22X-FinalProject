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
      
May 22, 2019
James - Worked more on balloons and getting them to follow the path
      - Each balloon will keep track of the random point they are currently moving towards
      - In the draw() every 45 frames the balloons will determine if they have a point to move towards and move to that point
      - It should be noted that there is an error when the balloon reaches the last point (has to do with getPoint and hasNextPoint are         slightly out of sync)
      
Devin - Finished the random path generator
      - Started work on monkey (tower) placement [making sure the monkeys don't overlap with the path]
      
