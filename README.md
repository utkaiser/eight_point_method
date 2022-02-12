# Eight-point method

This repository contains a MATLAB implementation of the [Eight-point algorithm](https://en.wikipedia.org/wiki/Eight-point_algorithm), solving the camera calibration problem.
This algorithm first determines the intrinsic 
parameters of a camera by using an image of a rig and key points picked by yourself.
Second, it estimates the relative camera pose between two images (see first image) of the same 
underlying 3D scene (see second image). This is also called a calibrated two-view structure-from-motion problem.
<br><br>
<p align="center">
  <img src="https://www.researchgate.net/profile/Hamidur-Rahman-5/publication/286778168/figure/fig2/AS:669574605320219@1536650434653/Epipolar-Geometry-and-Epipolar-Constraint-Base-Line.png" width=600> 
</p>
<br><br>
<p align="center">
  <img src="https://www.cc.gatech.edu/classes/AY2016/cs4476_fall/results/proj3/html/psachdeva6/vis_arrows_ND.jpg" width=600> 
</p>
