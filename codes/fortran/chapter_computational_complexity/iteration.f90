! File: iteration.f90
! Created Time: 2026-01-07
! Author: Zhuoqun Li (lizhuoqun221@mails.ucas.ac.cn)


module mod_iteration
    implicit none

contains

    ! for 循环
    function for_loop(n) result(res)
        integer, intent(in) :: n
        integer :: res
        integer :: i

        res = 0
        ! 循环求和 1, 2, ..., n-1, n
        do i = 1, n
            res = res + i
        end do
    end function for_loop


    ! while 循环
    function while_loop(n) result(res)
        integer, intent(in) :: n
        integer :: res
        integer :: i

        res = 0
        i = 1 ! 初始化条件变量
        ! 循环求和 1, 2, ..., n-1, n
        do while(i <= n)
            res = res + i
            i = i + 1 ! 更新条件变量
        end do
    end function while_loop


    ! while 循环（两次更新）
    function while_loop_ii(n) result(res)
        integer, intent(in) :: n
        integer :: res
        integer :: i

        res = 0
        i = 1 ! 初始化条件变量
        ! 循环求和 1, 4, 10, ...
        do while(i <= n)
            res = res + i
            ! 更新条件变量
            i = i + 1
            i = i * 2
        end do
    end function while_loop_ii

    ! 双层 for 循环
    function nested_for_loop(n) result(res)
        integer, intent(in) :: n
        character(:), allocatable :: res
        character(len=10) :: tmp
        integer :: i, j

        res = ""
        ! 循环 i = 1, 2, ..., n-1, n
        do i = 1, n
            ! 循环 j = 1, 2, ..., n-1, n
            do j = 1, n
                write (tmp, '("(", i0, ", ", i0, "),")') i, j
                res = res // trim(tmp) // ' '
            end do
        end do
    end function nested_for_loop
    

end module mod_iteration


! Driver Code
program main
    use mod_iteration
    implicit none

    integer :: n = 5
    integer :: res
    character(:), allocatable :: res_str

    res = for_loop(n)
    write (*, '(a, i0)') new_line('a')//"for 循环的求和结果 res = ", res

    res = while_loop(n)
    write (*, '(a, i0)') new_line('a')//"while 循环的求和结果 res = ", res

    res = while_loop_ii(n)
    write (*, '(a, i0)') new_line('a')//"while 循环（两次更新）求和结果 res = ", res

    res_str = nested_for_loop(n)
    write (*, '(a, a)') new_line('a')//"双层 for 循环的遍历结果 ", res_str

end program main