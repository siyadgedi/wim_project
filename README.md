# Final Project

## Submission Information

This project is an implementation of WIM, where objects in the miniature world are manipulated and the changes are simultaneously observed in the larger world. Objects are manipulated through a marker and spindle user interface, by which objects can be scaled, rotated, and moved around.

We have also added another dimension of interactivity, where the world itself can be rotated by a separate plane interface that affects the world in miniature and by extension the larger world, and the objects behave accordingly to their physics.

## Code

The main piece of code used was a script that is attached to the smaller version of an object. This script will update the scale, position, and the rotation of the larger object. For the scale and the position, there is a set conversion that is used. This helps keep it so that the two objects are moving the same distance proportionally to their ground.
In order to add the script to as many objects as we wanted to, there is a simple naming scheme that is followed to keep all objects similar to eachother. The code will look for an object with the name of Big _____, where the blank is the name of the small object with the script attached to it. This made it very easy to set up with new objects as we were able to apply the code to any object we wanted to as long as we followed the naming scheme.

## Rotation of the World

The rotating of the world was implemented with a seperate control object to minimize overlap with the other objects. The code within this object just sets the rotation of the other ground to be the same as itself. In the code for the spindle, there is code to prevent the user from tilting it too much and having objects fall out of the top, where there's no barriers.

## License

Material for [CSCI 5619 Fall 2023](https://canvas.umn.edu/courses/391288/assignments/syllabus) by [Evan Suma Rosenberg](https://illusioneering.umn.edu/) is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-nc-sa/4.0/).
