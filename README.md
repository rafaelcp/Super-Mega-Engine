# Open Mega Engine
**Open Mega Engine - Open-source Classic Megaman engine for Game Maker Studio!**

Run the [HTML5 DEMO](https://rawgit.com/rafaelcp/Open-Mega-Engine/master/demo/index.html) inside your browser!

Download the [Windows DEMO (EXE)](https://www.dropbox.com/s/kxaypg7ex8lloi9/OpenMegaEngine.zip?dl=0).

Original source code from 'Mega Engine' by [WreckingPrograms](https://twitter.com/WreckingProg) - Original forum post: http://sprites-inc.co.uk/showthread.php?tid=1648

<img src="https://i.imgur.com/hOlZCn7.png" width="358" alt="Open Mega Engine" title="Open Mega Engine">

This is a fork of Mega Engine 1.3 for GM Studio, intended to incorporate contributions from users.

From the original post:

> The Mega Engine is a free open-source Classic Mega Man engine for Game Maker Studio and Game Maker 8.1, built around the idea of combining accuracy to the original games with being flexible and easy-to-use. It aims to take the best of all entries in the Classic series and combining it in one engine. Being built from the ground up, this engine is the result of three months of work; while this may seem like a short development time, I did not cut any corners in regards to quality.


The engine has several features, including:

- 60 FPS Classic Mega Man gameplay
- Flexibility in adding or changing content in the engine
- Accurate movement, physics, object interaction and more
- Sliding and buster charging (can be disabled with ease)
- Collision with solids, jumpthrough solids, ladders, spikes and water
- A “section system” as present in the Classic titles, including proper screen transitions
- Several built-in special weapons, with flexibility in adding new ones or changing existing ones
- Built-in enemies, as well as flexibility in adding your own
- Three example gimmicks included in the engine, and flexibility in adding your own
- An example Robot Master with full AI, and flexibility to add your own bosses
- A customizable title screen, stage select, boss introduction screen, weapon get screen, game over screen and pause screen
- E-Tanks, M-Tanks, health drops, weapon drops, screws and extra lives
- Fully functional checkpoints
- Gamepad support
- Friendly to multiple keyboard layouts (multiple keys assigned to shoot and jump)
- Experimental HTML5 support

<a href="https://www.youtube.com/watch?v=cGZtF46oGJ8" target="_blank">Open Mega Engine playthrough video<br><img src="https://img.youtube.com/vi/cGZtF46oGJ8/0.jpg" 
alt="Open Mega Engine playthrough video" title="Open Mega Engine playthrough video" width="240" height="180" border="10" /></a>

<a href="https://www.youtube.com/watch?v=LmcvNggdHew" target="_blank">Mega Engine 1.0 playthrough video<br><img src="https://img.youtube.com/vi/LmcvNggdHew/0.jpg" 
alt="Mega Engine 1.0 playthrough video" title="Mega Engine 1.0 playthrough video" width="240" height="180" border="10" /></a>

<a href="https://www.youtube.com/playlist?list=PLZWFosEIaQq13eVkura_XwdqkgZtLEr2D" target="_blank">Tutorial<br><img src="https://img.youtube.com/vi/LT12qZz1PpM/0.jpg" 
alt="Tutorial" title="Tutorial" width="240" height="180" border="10" /></a>

# F.A.Q.

**Q**: Why would I use this engine over other Game Maker engines?

**A**: Most engines tend to try and accomplish only what is necessary for the example level(s) and do not consider flexibility and ease of use; the Mega Engine does account for all that. Plus, this engine is fully compatible with Game Maker Studio, unlike most other engines.

**Q**: What is the engine’s frame rate?

**A**: The engine runs at 60 frames per second (assuming your PC can handle it, of course)

**Q**: I don’t want sliding and/or buster charging and/or screws/bolts in my game. How do I disable them?

**A**: Go to Objects > Player > objGlobalControl and open the Create event code. Upon scrolling down, you will encounter a section called “Option variables”. Here you will see the variables global.enableCharge, global.enableSlide and global.enableScrews. Set any of them to false to disable the feature.

**Q**: Where can I view the credits of the game?

**A**: The credits can be found in the Game Information.

**Q**: I ran into a bug! How do I report it?

**A**: Use the built-in GitHub [issue tracker](https://github.com/rafaelcp/Open-Mega-Engine/issues).

**Q**: I have an idea or suggestion for the engine, where do I post it?

**A**: Again, use the built-in GitHub [issue tracker](https://github.com/rafaelcp/Open-Mega-Engine/issues). Better yet, implement your ideas and send a [pull request](https://github.com/rafaelcp/Open-Mega-Engine/pulls).

# Guidelines for Contribution
- Everything that can be found in MM 1-10 is welcome (mechanics, weapons, bosses, 8-bit resources, etc.)
- Features not present in *every* game should be made optional (include a boolean variable set to false by default) (e.g., start charging while sliding, shop, initial stage, etc.)
- Features not present in *any* game will be discussed by the contributors, but should be optional anyway
- Original content won't be added. This is left for individual games.
- Submit pull requests only to the 'test' branch
- Solve any merge conflicts

# Goals
- Ideally, the engine should be an empty game, and levels, weapons and bosses (from examples or created by the user) should be added by the user according to his individual game 
- It should be possible to replicate any of the 8-bit MM games with the engine
