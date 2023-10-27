# Assignment 3: Selection and Manipulation

**Due: Tuesday, November 7, 11:59pm CDT**

In this assignment, you will implement a classic bimanual VR interaction technique called **Spindle**, which was originally introduced by [Mapes and Moshell](https://doi-org.ezp1.lib.umn.edu/10.1162/pres.1995.4.4.403) in 1995.  With the technique, two controllers are used to define a virtual spindle that extends from one controller position to the other. The center of this spindle (i.e., the midpoint between the two controllers) represents the primary point of interaction, which can be used to select and manipulate objects.

- In order to translate a virtual object, both hands are moved together to reposition the center of the spindle. The virtual object is then translated by the same amount.
- This technique can also be used to simultaneously manipulate the rotation of the virtual object about two axes (yaw and roll).  When the user moves one hand relative to the other, the orientation of the spindle is updated so that it always connects them.  The virtual object is then rotated by the same amount. Note that this technique does not allow control over the third axis of rotation (pitch).
- Finally, the user can also increase or decrease the distance between the two hands to change the scale of the object. Note that this is typically implemented as a uniform scale, which means that the scale factors for all three axes are always the same.

Spindle therefore allows 3D object manipulation with a total of **six degrees-of-freedom**: XYZ position (3DOF), YZ rotation (2DOF), and uniform XYZ scale (1DOF).

You can see how the translation, rotation, and scaling works in this [online video](https://www.youtube.com/watch?v=75_lpFBQiuo). Note that this is just a brief representative example of the technique, and you should not aim to make your implementation exactly the same. For example, the video shows two laser pointers coming out of the controllers, which are not actually used and should not be part of your implementation.

## Submission Information

You should fill out this information before submitting your assignment. 

1. **Ready for Grading**. When your assignment is complete, you should change the line below to YES and then push to GitHub. This will signal to the TA that your assignment is ready to be graded. If the submission is completed after the due date, the timestamp of the commit will be used to determine how many late points will be applied.

   `NO`

2. **Third Party Assets**. List the name and source of any third party assets that you added, such as models, images, sounds, or any other content used that was not created by you.

   `TO BE COMPLETED`

3. **Grading Instructions**. Please provide a brief description of your VR experience, identify the interaction techniques you implemented, and provide any usage instructions needed for the person grading your assignment.

   `TO BE COMPLETED`

4. **Wizard Bonus Functionality**. If you completed the bonus challenge, then please provide a brief description of the additional functionality that you would like us to consider for extra credit.

   `TO BE COMPLETED`

## Prerequisites

To work with this code, you will first need to install [Godot Engine 4.1.2](https://godotengine.org/).

This assignment is intended to completed with a Quest headset directly connected to a PC using Oculus Link (USB-C cable or WiFi). If your personal computer does not support this, then you can check out one of the VR graphics laptops from CSE-IT.

## Rubric

Graded out of 20 points. Partial credit is possible for each step.

**Part 1: Spindle Visualization**

- Create small marker that visualizes the midpoint between two controllers. At minimum, this should be a small sphere or cube, but you are also free to consider other visual markers, including imported 3D models. (2)

- Draw a spindle that connects the two controllers. This is typically implemented using a box or cylinder that is scaled to appear like a long thin line. The X and Y scale should therefore be quite small, and the Z scale would be set using the distance between the two controllers. You might find the `look_at()` method useful for setting the orientation of the spindle. (2)

**Part 2: Object Selection**

- The starter code is a more robust implementation of the grabbing and dropping code that we started in [Lecture 14](https://github.com/CSCI-5619-Fall-2023/Lecture-14).  Currently, the grabber script is attached directly to each controller.  You should remove this script from the controllers, and instead attach it to spindle midpoint marker.  Then, you will need to set up the Area3D and CollisionShape3D so that you can grab virtual objects using the marker. (2)

**Part 3: Object Manipulation**

- If necessary, complete any functionality need to allow virtual objects to be translated using the spindle. Depending on how you implemented Part 2, you might find that this already works correctly using the grabber script. (2)
- Complete the functionality for manipulating the virtual object rotation. This is more complicated than translation, and you will likely need to either use the orientation of the spindle or compute the desired rotation using the difference between positions of the two hand controllers. (4)
- Complete the functionality for manipulating the virtual object scale. This also has some added complexity because you can't change the scale of RigidBody3D objects. This is a common constraint of game engine physics systems, and Godot will complain if you try to do this. However, you *can* change the scale of the MeshInstance3D and CollisionShape3D child objects of the grabbed rigid body. You will need to set the scale of both to be the same for this to work correctly. (4)

**Part 4**: **Virtual Scene**

- The starter scene includes the box (grabbable rigid body), sphere (grabbable rigid body), and pedestal (static body).  You can use these objects to test the functionality of the spindle interaction technique.  However, in your final version, you should delete these three objects and set up your own custom scene. Similar to previous assignments, you are free to implement this however you want, including importing 3D assets, as long as it contains:
  - At least three grabbable objects with rigid body physics and collision shapes. (2)
  - At least two static bodies, other than the ground, that the grabbable objects can collide with. (2)

*Note: if you want to place objects in your scene a bit further away than you can physically walk, then you can optionally implement virtual locomotion, such as direct movement from the previous assignment, but this is neither required nor part of the grading criteria.*

**Bonus Challenge:** For two points of extra credit, you can try to extend the spindle interaction technique in a meaningful way. For example, [Cho and Wartell](https://ieeexplore.ieee.org/abstract/document/7131738) created a 7DOF extension called Spindle+Wheel that added the missing pitch rotation. Although they used custom devices for this, one could attempt something similar using the input functions of the handheld controllers. This is just one example, however, and creativity is encouraged! (+2)

**Documentation:** Make sure to document any third party assets or code used in this assignment at the top of this readme file. One point will be deducted for using third party assets without attribution. This only refers to additional assets that you find on your own; you don't need to document anything that is already provided along with the assignment. (-1)

## License

Material for [CSCI 5619 Fall 2023](https://canvas.umn.edu/courses/391288/assignments/syllabus) by [Evan Suma Rosenberg](https://illusioneering.umn.edu/) is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-nc-sa/4.0/).
