! File: time_complexity.f90
! Created Time: 2026-01-08
! Author: Zhuoqun Li (lizhuoqun221@mails.ucas.ac.cn)


module mod_time_complexity
    implicit none

contains

    ! 常数阶
    function constant(n) result(count)
        integer :: count
        integer, intent(in) :: n
        integer :: size = 100000
        integer :: i
        count = 0
        do i = 1, size
            count = count + 1
        end do
    end function constant


    ! 线性阶
    function linear(n) result(count)
        integer :: count
        integer, intent(in) :: n
        integer :: i
        count = 0
        do i = 1, n
            count = count + 1
        end do
    end function linear

    
    ! 线性阶（遍历数组）
    function array_traversal(nums) result(count)
        integer, intent(in) :: nums(:)
        integer :: count
        integer :: i
        count = 0
        ! 循环次数与数组长度成正比
        do i = 1, size(nums)
            count = count + 1
        end do

    end function array_traversal


    ! 平方阶
    function quadratic(n) result(count)
        integer, intent(in) :: n
        integer :: count
        integer :: i, j
        count = 0
        ! 循环次数与数据大小 n 成平方关系
        do i = 1, n
            do j = 1, n
                count = count + 1
            end do
        end do
    end function quadratic


    ! 平方阶（冒泡排序）
    function bubble_sort(nums) result(count)
        implicit none
        integer, intent(inout) :: nums(:)
        integer :: count
        integer :: i, j, tmp
        count = 0   ! 计数器
        ! 外循环：未排序区间为 [0, i]
        do i = size(nums) - 1, 1, -1
            ! 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
            do j = 1, i
                if (nums(j) > nums(j + 1)) then
                    ! 交换 nums[j] 与 nums[j + 1]
                    tmp = nums(j)
                    nums(j) = nums(j+1)
                    nums(j+1) = tmp
                    count = count + 3  ! 元素交换包含 3 个单元操作
                end if
            end do
        end do   
    end function bubble_sort


    ! 指数阶（循环实现）
    function exponential(n) result(count)
        integer, intent(in) :: n
        integer :: count, base
        integer :: i, j
        count = 0
        base = 1
        ! 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
        do i = 1, n
            do j = 1, base
                count = count + 1
            end do
            base = base * 2
        end do
        ! count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    end function exponential


    ! 指数阶（递归实现）
    recursive function exp_recur(n) result(count)
        integer, intent(in) :: n
        integer :: count
        if (n == 1) then
            count = 1
            return
        end if
        count = exp_recur(n - 1) + exp_recur(n - 1) + 1
    end function exp_recur


    ! 对数阶（循环实现）
    function logarithmic(n) result(count)
        integer, intent(in) :: n
        integer :: count
        integer :: n_local
        count = 0
        n_local = n
        do while (n_local > 1)
            n_local = n_local / 2
            count = count + 1
        end do
    end function logarithmic


    ! 对数阶（递归实现）
    recursive function log_recur(n) result(count)
        integer, intent(in) :: n
        integer :: count
        if (n <= 1) then
            count = 0
            return
        end if
        count = log_recur(n / 2) + 1
    end function log_recur


    ! 线性对数阶
    recursive function linear_log_recur(n) result(count)
        integer, intent(in) :: n
        integer :: count
        integer :: i
        if (n <= 1) then
            count = 1
            return
        end if
        ! 一分为二，子问题的规模减小一半
        count = linear_log_recur(n / 2) + linear_log_recur(n / 2)
        ! 当前子问题包含 n 个操作
        do i = 1, n
            count = count + 1
        end do
    end function linear_log_recur


    ! 阶乘阶（递归实现）
    recursive function factorial_recur(n) result(count)
        integer, intent(in) :: n
        integer :: count
        integer :: i
        if (n == 0) then
            count = 1
            return
        end if
        count = 0
        ! 从 1 个分裂出 n 个
        do i = 1, n
            count = count + factorial_recur(n - 1)
        end do
    end function factorial_recur


end module mod_time_complexity


! Driver Code
program main
    use mod_time_complexity
    implicit none
    ! 可以修改 n 运行，体会一下各种复杂度的操作数量变化趋势
    integer :: n = 8
    integer, allocatable :: nums(:)
    integer :: count
    integer :: i
    write (*, *) '输入数据大小 n =', n

    count = constant(n)
    write (*, *) '常数阶的操作数量 =', count

    count = linear(n)
    write (*, *) '线性阶的操作数量 =', count
    count = array_traversal([(0, i = 1, n)])
    write (*, *) '线性阶（遍历数组）的操作数量 =', count
    
    count = quadratic(n)
    write (*, *) '平方阶的操作数量 =', count
    nums = [(i, i = n, 1, -1)]
    count = bubble_sort(nums)
    write (*, *) '平方阶（冒泡排序）的操作数量 =', count

    count = exponential(n)
    write (*, *) '指数阶（循环实现）的操作数量 =', count
    count = exp_recur(n)
    write (*, *) '指数阶（递归实现）的操作数量 =', count

    count = logarithmic(n)
    write (*, *) '对数阶（循环实现）的操作数量 =', count
    count = log_recur(n)
    write (*, *) '对数阶（递归实现）的操作数量 =', count

    count = linear_log_recur(n)
    write (*, *) '线性对数阶（递归实现）的操作数量 =', count

    count = factorial_recur(n)
    write (*, *) '阶乘阶（递归实现）的操作数量 =', count

    

end program main