Student Robotics Robot Simulator
================================

This is a simple, portable robot simulator developed for [Student Robotics](https://studentrobotics.org), originally for a summer school aimed at 15-18 year olds. It allows competitors to test their code for such things as navigation and item finding while remaining similar to the [Student Robotics API][sr-api] which they are using to control their real hardware.

Installing and running
----------------------

The simulator requires a Python 2.7 installation, the [pygame](http://pygame.org/) library, [PyPyBox2D](https://pypi.python.org/pypi/pypybox2d/2.1-r331), and [PyYAML](https://pypi.python.org/pypi/PyYAML/).

Pygame, unfortunately, can be tricky (though [not impossible](http://askubuntu.com/q/312767)) to install in virtual environments. If you are using `pip`, you might try `pip install hg+https://bitbucket.org/pygame/pygame`, or you could use your operating system's package manager. Windows users could use [Portable Python](http://portablepython.com/). PyPyBox2D and PyYAML are more forgiving, and should install just fine using `pip` or `easy_install`.

Once the dependencies are installed, simply run the `robot.py` script to test out the simulator.

## Troubleshooting

When running `python simulator.py <file>`, you may be presented with an error: `ImportError: No module named 'robot'`. This may be due to a conflict between sr.tools and sr.robot. To resolve, symlink simulator/sr/robot to the location of sr.tools.

On Ubuntu, this can be accomplished by:
* Find the location of srtools: `pip show sr.tools`
* Get the location. In my case this was `/usr/local/lib/python2.7/dist-packages`
* Create symlink: `ln -s path/to/simulator/sr/robot /usr/local/lib/python2.7/dist-packages/sr/`

## Shipping the simulator

The simulator is distributed using `pyinstaller`. Execute the script at `scripts/ship-simulator.sh`, and it'll create a `simulator.zip` with the required files in.

This currrently only works for Mac and Linux. Windows instructions coming soon!

## Writing and running a program

Instructions on writing and running a program can be found in `extra/README.md`.

[sr-api]: https://studentrobotics.org/docs/programming/sr/
