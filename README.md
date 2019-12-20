# Tensor-Completion-for-Estimating-Missing-Values-in-Visual-Data
Tensor Completion by Python and Numba<br>
本文的算法来自Liu等的两篇论文中的HaLRTC(其余算法会在之后补全)，代码来自https://ece.uwaterloo.ca/~ece602/Projects/2017/Project1/main.html#2 感谢你们的工作！<br>

本项目旨在用Python实现原作者的Matlab代码，并用Numba模块对巨量的for循环进行加速。<br>

## Dependencies
·Python 3.8<br>
·Numpy 1.17.4<br>
·Numba 0.46.0<br>
·Tensorly 0.4.3<br>
·OpenCV 4.1.2<br>

## Run
```shell
python HaLRTC.py
```
### Result
<图片>
<图片>

```shell
python HaLRTC_house.py
```
### Result
<图片>
<图片>
