WEEK 1
This week I created my page and figured out how to make Processing JS work properly in a browser. I learned that in order for it to run, it must be hosted, and as such needs to be a live page for me to observe changes. Once that was done, I then created my canvas and started work. The player character is now controllable, in that they respond to keystrokes and as such move forward and backwards. They also respond to pressing up on the arrow keys, which causes the player character to jump. A basic collider system has also been set in place so that players can jump on top of platforms. Some basic html and css were added. Objects were created for the player character and for platforms, and a simple HUD was added. I fell behind what I wanted to do this week, as the collider took me longer than expected, and the camera control that I had intended to implement did not work. I will hopefully make up for it in the coming weeks. My next focus is finishing the collider, and making the "camera" track the player.

This is the tutorial I referred to occasionally.
https://www.khanacademy.org/computing/computer-programming/programming-games-visualizations

The page is live here: nulandgames.com/jumpman

WEEK 2
I learned how bad ProcessingJs is. Many of the functions that I needed, namely the camera() element, simply do not work. After hours of struggling with the program, I called it a day. I forgot to upload anything to github, as I A) had nothing to show for a weeks work, and B) completely forgot.

WEEK 3 - The week of compromise
After last weeks abject failure, I knew that I needed to take the game in a new direction. As such, the game now has new rules, and what I am trying to do is now different. The game is now focused around collecting coins that bounce around the screen, while also avoiding the "spikes", which instantly kill the player. The spikes move at a tenth of the speed of the coins, so it should be easy.

Added: -Boundaries! The player can no longer leave the screen. Rip Jum's freedom
       -Coins! There are now coins! The total of coins that you have is listed in the top left. They bounce whenever they hit a wall, and have a max and min speed!
       -Spikes! Small squares, that on contact, will end your game! They also bounce, and are a nice red to help the player see where they are!
       -Win and loss conditions! Collect 100 coins and you win! Get hit with a spike, and die! Jum is very fragile, you know. Comes with being a skeleton.

To do: Make it pretty. The CSS is... lacking.
