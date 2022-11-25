'''
File: quick_sort.py
Created Time: 2022-11-25
Author: Krahets (krahets@163.com)
'''

import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from include import *


"另一种思维 实现快速排序"
def quick_sort(nums,l,r):
    if l>=r:
        return 
    i,j,x=l-1,r+1,nums[l+r>>1]
    while i<j:
        while True:
            i+=1
            if nums[i]>=x:break
        while True:
            j-=1
            if nums[j]<=x:break
        if i<j:nums[i],nums[j]=nums[j],nums[i]
    quick_sort(nums,l,j),quick_sort(nums,j+1,r)
if __name__=='__main__':
    nums=[4,1,3,1,5,2]
    n=len(nums)
    help_ls=[0 for _ in range(n)]
    quick_sort(nums,0,n-1)
    print("快速排序完成后 nums = ",nums)
