# Tensor-Completion-for-Estimating-Missing-Values-in-Visual-Data
Tensor Completion by Python and Numba<br>
<br>
本文的算法来自Liu等的两篇论文中的HaLRTC(其余算法会在之后补全) <br>
The algorithm in this article is from HaLRTC in two papers by Liu et al.(The rest of the algorithms will be completed later)<br>
<br>
Matlab 代码来自https://ece.uwaterloo.ca/~ece602/Projects/2017/Project1/main.html#2 感谢你们的工作！<br>
Matlab from https://ece.uwaterloo.ca/~ece602/Projects/2017/Project1/main.html#2 Thanks for your work!<br>
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

## Run HaLRTC.py
```shell
python HaLRTC_house.py
```
### Input
![](https://github.com/prolulu/Tensor-Completion-for-Estimating-Missing-Values-in-Visual-Data/blob/master/house_corrupt.jpg)
### Result
![](https://github.com/prolulu/Tensor-Completion-for-Estimating-Missing-Values-in-Visual-Data/blob/master/house_result.jpg)
