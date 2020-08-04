# Tensor-Completion-for-Estimating-Missing-Values-in-Visual-Data
Tensor Completion by Python and Numba<br>
<br>
本文的算法来自Liu等的两篇论文中的HaLRTC(其余算法会在之后补全) <br>
The algorithm in this article is from HaLRTC in two papers by Liu et al.(The rest of the algorithms will be completed later)<br>
<br>
Matlab 代码来自https://ece.uwaterloo.ca/~ece602/Projects/2017/Project1/main.html#2 感谢你们的工作！<br>
Matlab from https://ece.uwaterloo.ca/~ece602/Projects/2017/Project1/main.html#2 Thanks for your work!<br>
上述网址可能无法访问，Matlab源码已经上传至此Repo.<br>
The above URL may not be accessible, Matlab source code has been uploaded to this Repo.<br>
<br>
本项目旨在用Python实现原作者的算法，并用Numba模块对巨量的for循环进行加速。<br>
This project aims to implement the algorithm in Python and use the Numba module to accelerate a huge number of for loops.<br>
## Dependencies
·Python 3.8<br>
·Numpy 1.17.4<br>
·Numba 0.46.0<br>
·Tensorly 0.4.3<br>
·OpenCV 4.1.2<br>

## Run HaLRTC.py
```shell
python HaLRTC.py
```
### Input
![](https://github.com/prolulu/Tensor-Completion-for-Estimating-Missing-Values-in-Visual-Data/blob/master/seaside_corrupt.jpg)
### Result
![](https://github.com/prolulu/Tensor-Completion-for-Estimating-Missing-Values-in-Visual-Data/blob/master/seaside_result.jpg)

## Run HaLRTC_house.py
```shell
python HaLRTC_house.py
```
### Origin
![](https://github.com/prolulu/Tensor-Completion-for-Estimating-Missing-Values-in-Visual-Data/blob/master/house.jpg)
### Input
![](https://github.com/prolulu/Tensor-Completion-for-Estimating-Missing-Values-in-Visual-Data/blob/master/house_corrupt.jpg)
### Result
![](https://github.com/prolulu/Tensor-Completion-for-Estimating-Missing-Values-in-Visual-Data/blob/master/house_result.jpg)

## P.S.
该项目为本人课程作业项目，来源于开源，回馈给开源。<br>
This project is my coursework project, which is derived from open source and gives back to community.<br>
若有任何对于本项目的疑问和建议欢迎联系lulutyh@163.com <br>
If you have any questions or suggestions about this project, please contact lulutyh@163.com <br>
