'''
File: merge_sort.py
Created Time: 2022-11-25
Author: Krahets (krahets@163.com)
'''

import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from include import *


"""
另一种 思路实现归并排序
"""
def merge_sort(nums,l,r):
    if l>=r:return 
    mid=l+r>>1                  #划分中点
    #进行归并
    merge_sort(nums,l,mid)
    merge_sort(nums,mid+1,r)

    k,i,j=0,l,mid+1             #借助辅助数组 完成排序
    while i<=mid and j<=r:  
        if nums[i]<=nums[j]:    #这一步保证了 稳定排序
            help_ls[k]=nums[i]
            i+=1
        else:
            help_ls[k]=nums[j]
            j+=1
        k+=1
    
    while i<=mid:               #对于左边区域
        help_ls[k]=nums[i]
        k,i=k+1,i+1
    while j<=r:                 #对于右边区域
        help_ls[k]=nums[j]
        k,j=k+1,j+1

    i,j=l,0
    while i<=r:
        nums[i]=help_ls[j]
        i,j=i+1,j+1
if __name__=='__main__':
    nums=[4,1,3,1,5,2]
    n=len(nums)
    help_ls=[0 for _ in range(n)]
    merge_sort(nums,0,n-1)
    print("归并排序完成后 nums = ",nums)