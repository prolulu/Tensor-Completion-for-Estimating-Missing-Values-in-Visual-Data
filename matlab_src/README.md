# How to run Matlab scripts?

## 1.Create a dirty image
```shell
init_image
```
After that, make sure you init `Image` and `known`


## 2.Run scripts


```shell
epoch = 50;
FaLRTC(Image, epoch, known); 
#Time Consumption prediction: 100s

HaLRTC(Image, epoch, known);
#Time Consumption prediction: 200s

SiLRTC(Image, epoch*10, known);
#Time Consumption prediction: 1000s
```
