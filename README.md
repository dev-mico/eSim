# eSim
Repository for my group's TEALs project, eSim. eSim is an evolution simulator designed to emulate, in a visual manner, the basic concepts behind machine learning. Developed by me (Marcos Lacouture), Bret Craig, and Teddy Arasavelli.

Controls
------------------------------

  Menus:
   eSim controls are straightforward. All menu navigation is done with arrow keys, as well as the "enter" key to "click" something. There    are also several drop-down menus that can be expanded, including things (such as resolution options, for example). These drop-down        menus must be closed to make any changes. An in-depth description of what each option does is available below.
   
   
  Simulation:
   In the simulation, there are a variety of controls that need to be explained.  To move the camera, you can use the arrow keys or alternatively, WASD. You can also zoom in and out with a mouse wheel or trackpad as you would normally.
     
   By clicking a creature, you will highlight the creature (a light-blue aura will surround it), and its relevant characteristics       (species name, attributes, etc.) will be visible in the top-left corner of a screen. If you double-click a creature, you will follow     it, and your camera will follow it as well. Alternatively, you can use the Q and E keys to navigate through creatures, and press "F"     to lock your camera to follow your selected creature.
   
   eSim also has time control available. To speed up time, press the "." key, and to slow it down, press the "," key on your keyboard. To pause the simulation, you can press space or the "P" button.
    

Menu Explanation
------------------------------

 There are a lot of menus in eSim, and it can seem confusing to someone who doesn't know the terminology used in our project. 
 Specifically, the "Simulation Options" portion has a lot of unique terms. Below is a description of each menu, as well as what each 
 option means.
 
 Audio Options
 -----------
 
   Music Volume: The volume of the background music.
   
   Sound Effects Volume: The volume of the "beep" sound effect that occurs when you navigate menus, select creatures, etc.
 
 Simulation Options
 -------------
 
   Species Density: The amount of species that will be generated RELATIVE TO THE WORLD'S SIZE. Recommended to be lower if you increase  world size for performance reasons.
   
   Creature Density: The amount of creatures per species, also RELATIVE TO WORLD SIZE.
   
   Initial Development: All creatures generated in eSim will be generated with a number representing how developed each creature will be. This integer is called "development." More developed creatures will be larger with higher characteristics (attack, stamina, etc.). This option tweaks how developed each creature will be.
   
   World Size: The size of the simulation world.
   
   Food Scarcity: The higher this is, the rarer herbivorous food (the food on each bush) will be.
   
   Creature Density Limit: The limit of creature density. Over time, more creatures wil be born. This limits the amount of creatures that can be born.
   
   Initial Diet: Dropdown menu. This will set the diet of all the creatures initially created.
   
   Species Density Limit: Throughout the simulation, new species will migrate in from the sides. This option limits how many species can be in the simulation at a time.

Fun Facts
----------------------------

Some fun facts about the way our simulator works:

   - All creatures have an "aggressivity" value that determines how aggressive/passive they are as hunters, or in the face of a threat. This number can make creatures unreasonably passive (scavengers) or unreasonably aggressive (hunt for sport), and help to give the creatures some personality.
   
   - Ocasionally, you'll see mutations occur in newborns. A mutation is when a creature has more deviation from their parents' characterisitics than normal. In addition to this characteristic change, mutations usually observe a color change in the creature, as well as an occasional structure change.
   
   -All structures are related to each creature's function! Herbivores look like herbivores, carnivores look like carnivores. Creatures that are more agile are generally thinner than their heavier, high-defense counterparts.
   
   - Members of the same species will always protect each other.
   
   - When faced with a threat, every creature makes fight or flight deliberations based on a number of things; the attacker's size, the number of creatures in the attacker's species, how fast the attacker is, and more.
   
   Overall, there's too much going on behind-the-scenes to explain in totality. Hopefully this can serve to give you an idea of the high amount of work we put into the little details with eSim.
