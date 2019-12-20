import cv2
import numpy as np
from numba import jit
import tensorly as tl
from line_profiler import LineProfiler

def shrinkage(X, t):
    U, Sig, VT = np.linalg.svd(X,full_matrices=False)
    Temp = np.zeros((U.shape[1], VT.shape[0]))
    for i in range(len(Sig)):
        Temp[i, i] = Sig[i]
    Sig = Temp

    Sigt = Sig
    imSize = Sigt.shape

    for i in range(imSize[0]):
        Sigt[i, i] = np.max(Sigt[i, i] - t, 0)

    temp = np.dot(U, Sigt)
    T = np.dot(temp, VT)
    return T

@jit(nopython=True)
def ReplaceInd(X, Image):

    imSize = Image.shape
    for x in range(imSize[0]):
        for y in range(imSize[1]):
            if not(643 < y < 836 and x > 376):
                X[x, y] = Image[x, y]
    return X

def init():
    KownPercentage = 0.5
    Image = cv2.imread("house.png")

    imSize = Image.shape
    known = np.arange(np.prod(imSize) / imSize[2])
    np.random.shuffle(known)
    known = known[:int(KownPercentage * (np.prod(imSize) / imSize[2]))]
    print(known.shape)
    # Corrupting Image
    X = np.zeros(imSize)
    X = ReplaceInd(X, Image)
    #cv2.namedWindow('Corrupting Image', cv2.WINDOW_NORMAL)
    #cv2.imshow("Corrupting Image", X.astype(np.uint8))
    #cv2.waitKey()
    a = abs(np.random.randn(3, 1))
    a = a / np.sum(a)
    p = 1e-6
    K = 50
    ArrSize = np.array(imSize)
    ArrSize = np.append(ArrSize, 3)
    Mi = np.zeros(ArrSize)
    Yi = np.zeros(ArrSize)
    return Image, X, known, a, Mi, Yi, imSize, ArrSize, p, K

def fuc():
    """init 初始化"""
    Image, X, known, a, Mi, Yi, imSize, ArrSize, p, K = init()
    for k in range(K):
        # compute Mi tensors(Step1)
        for i in range(ArrSize[3]):
            temp1 = shrinkage(tl.unfold(X, mode=i) + tl.unfold(np.squeeze(Yi[:, :, :, i]), mode=i) / p, a[i] / p)
            temp = tl.fold(temp1, i, imSize)
            Mi[:, :, :, i] = temp
        # Update X(Step2)
        X = np.sum(Mi - Yi / p, ArrSize[3]) / ArrSize[3]
        X = ReplaceInd(X, Image)
        # Update Yi tensors (Step 3)
        for i in range(ArrSize[3]):
            Yi[:, :, :, i] = np.squeeze(Yi[:, :, :, i]) - p * (np.squeeze(Mi[:, :, :, i]) - X)
        # Modify rho to help convergence(Step 4)
        p = 1.2 * p
    return X

lp = LineProfiler()
lp_wrapper = lp(fuc)
X = lp_wrapper()
lp.print_stats()
#cv2.namedWindow('HaLRTC', cv2.WINDOW_NORMAL)
cv2.imshow("HaLRTC", X.astype(np.uint8))
cv2.waitKey()


