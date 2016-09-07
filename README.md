# Mega-Engine-Fork
**Mega Engine - Open-source Classic Megaman engine for Game Maker 8.1 and Studio!**

Original source code by [WreckingPrograms](https://twitter.com/WreckingProg) - Original forum post: http://sprites-inc.co.uk/showthread.php?tid=1648

![Mega Engine](http://i.imgur.com/Tzy8LkV.png)

This is a fork of Mega Engine 1.3, intended to incorporate contributions from users.

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
- E-Tanks, M-Tanks, health drops, weapon drops and extra lives
- Fully functional checkpoints

Tutorial series on how to use the engine: http://bit.ly/2bc7HQE

[Engine playthrough](https://www.youtube.com/watch?v=LmcvNggdHew):

[![Tutorial](https://img.youtube.com/vi/LmcvNggdHew/0.jpg)](https://www.youtube.com/watch?v=LmcvNggdHew)

# F.A.Q.

**Q**: Why would I use this engine over other Game Maker engines?

**A**: Most engines tend to try and accomplish only what is necessary for the example level(s) and do not consider flexibility and ease of use; the Mega Engine does account for all that. Plus, this engine is fully compatible with Game Maker Studio, unlike most other engines.

**Q**: What is the engine’s frame rate?

**A**: The engine runs at 60 frames per second (assuming your PC can handle it, of course)

**Q**: I don’t want sliding and/or buster charging in my game. How do I disable them?

**A**: Go to Objects > Player > objGlobalControl and open the Create event code. Upon scrolling down, you will encounter a section called “Option variables”. Here you will see the variables global.enableCharge and global.enableSlide. Set either of them to false to disable the ability.

**Q**: Where can I view the credits of the game?

**A**: The credits can be found in the Game Information.

**Q**: I ran into a bug! How do I report it?

**A**: Use the built-in GitHub [issue tracker](https://github.com/rafaelcp/Mega-Engine-Fork/issues).

**Q**: I have an idea or suggestion for the engine, where do I post it?

**A**: Again, use the built-in GitHub [issue tracker](https://github.com/rafaelcp/Mega-Engine-Fork/issues). Better yet, implement your ideas and send a [pull request](https://github.com/rafaelcp/Mega-Engine-Fork/pulls).
