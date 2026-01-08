! File: worst_best_time_complexity.f90
! Created Time: 2026-01-08
! Author: Zhuoqun Li (lizhuoqun221@mails.ucas.ac.cn)


module mod_worst_best_time_complexity
    use stdlib_stats_distribution_uniform, only: shuffle
    implicit none

contains

    ! 生成一个数组，元素为: 1, 2, ..., n ，顺序被打乱
    function random_numbers(n) result(nums)
        integer, intent(in) :: n
        integer :: nums(n)
        integer :: i
        ! 生成数组 nums =: 1, 2, 3, ..., n
        nums = [(i, i = 1, n)]
        ! 随机打乱数组元素
        nums = shuffle(nums)
    end function random_numbers

    ! 查找数组 nums 中数字 1 所在索引
    function find_one(nums) result(index)
        integer, intent(in) :: nums(:)
        integer :: index
        integer :: i
        index = -1
        do i = 1, size(nums)
            ! 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
            ! 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
            if (nums(i) == 1) then
                index = i
                return
            end if
        end do
    end function find_one
end module mod_worst_best_time_complexity


! Driver Code
program main
    use mod_worst_best_time_complexity
    implicit none
    integer :: n = 100
    integer :: i, index
    integer, allocatable :: nums(:)
    
    do i = 1, 10
        nums = random_numbers(n)
        index = find_one(nums)
        write (*, *) new_line('a')//"数组 [ 1, 2, ..., n ] 被打乱后 =", nums
        write (*, *) "数字 1 的索引为", index
    end do
end program main