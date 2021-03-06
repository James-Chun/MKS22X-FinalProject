# MKS22X-FinalProject

-~-DESCRIPTION-~-
Balloon tower defense with enemies (balloons) entering from a designated zone and moving through a path to the end. The player will be tasked with placing towers (monkeys) along this path to stop the advance of the enemies. The player will gain income by popping balloons  allowing him/her to place more towers. 



-~-HOW TO PLAY-~-
1. Start up the Game
2. Start placing monkeys
3. Buy more monkeys
4. Don't lose
5. Don't get too cocky now there's a lot of balloons heading your way.



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
      
May 24, 2019
James - Balloon health - implemented health for balloons
      - Working on changing color of balloon depending on its health
      - Trying to use tint() but it permanently tints all images after it is performed so I need to find a way to "untint"
      - Probably by reversing the coloring through another tint() call

Devin - Still working on monkey placement
      - Have decided to compare the placement of the monkey to the nearest two points
      - Monkey placement inside the line is restricted so far

May 26, 2019
James - More progress on projectile (basically the same as balloon)
      - Projectile movement will track balloon's points (targeting system not yet implemented) and continously move towards it
      - Functions the same as balloon movement just the end point is constantly moving (projectile speed is set and moves very      
        fast)
      - Have yet to make projectile disappear after reaching balloon and balloon take damage once getting intercepted by 
        projectile

May 27, 2019
James - Worked on projectile movement
      - Projectiles disappear after reaching the balloon
      - Also implemented damage for the projectiles and balloons (once projectile reaches balloon it reduces health of balloon 
        and then disappears)
        
May 28, 2019
James - Gave monkeys images
      - Fixed bugs with arrows and balloons

Devin - Worked on monkey distance tracker
      - Using math formulas to calculate distance instead of using complicated methods
      - Still buggy because the coordinate plane for processing is not a typical plane with origin in the center

May 29, 2019
James - Helped Devin

Devin - Finally got monkey placement to work
      - Problem was using the wrong variables in the calculations
      - Monkeys can now determine which line to compare to and can determine distance from that line and whether or not it is 
        touching said line

May 30, 2019
James - Began working on path aesthetics
      - Will import picture of path at each randPoint, make it as long as distance to next point, and rotate to line up
      - Will first have to understand rotate and translate

Devin - Finishing up monkey placement (centering)
      - Working on monkeys shooting at constant rate
      - Just need to develop timer (probably based on frameCount) and making new projectile at monkeys at intervals
      
May 31, 2019
James - Still working on path aesthetics
      - Make image from top left corner so translate to that corner plus more to center onto top middle
      - Rotate world to line up with next point (the y-plane is flipped)
      - Then make image
      
Devin - Monkey shooting works
      - Working on waves of ballooons
      - Just using timer to release balloons at intervals
      
June 2, 2019
Devin - Monkeys can now attack the first balloon in their range
      - Monkeys now shoot arrows from their location that travel to the target balloon dealing damage upon contact
      - Reorganized tabs and moved movement methods from main to the respective classes to clean up the main tab
      
James - Finished with path aesthetics
      - Did aforementioned setup
      - Had to adjust rotating angle (using asin()) and account for flipped y-coordinate plane
      - Now will begin work on having path indicate forbidden areas for monkeys
      
June 3, 2019
James - Paths now indicate where not to place monkeys
      - Once path imaging was figured out this step was easy.
      - Simply make a rectangle (with larger width to account for the zone size and same length to surround each path segment)
      - Then color it red
      - All of this happens when monkey it being dragged

Devin - Made monkey attacking smoother
      - Worked on ballon taking damage and popping and list manipulation
   
June 4, 2019
Devin - Added 15 waves of balloons and a play button to send these balloons once the previous wave has been beat
      - created 5 different kind of balloons with varying speed and health
      - smoothed out monkey attack even more
      - added a speed up button from 2x-4x the speed affecting both monkeys and balloons
      - made the range display of the monkey turn red when is is dragged from the shop over the path signaling that the monkey cannot be         placed there
      - added a money and health system 
            - each pop gives one dollar
            - player cannot place down towers if they do not have the money
            - health is deducted based on how many layers the balloon still has
            - exits when health reaches zero
      - added a sorting system that allows for first targetting but is very taxing on the system to run
      
      
