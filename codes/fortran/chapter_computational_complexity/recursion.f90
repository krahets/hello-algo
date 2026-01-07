! File: recursion.f90
! Created Time: 2026-01-07
! Author: Zhuoqun Li (lizhuoqun221@mails.ucas.ac.cn)


module mod_recursion
    implicit none

contains

    ! 递归
    recursive function recur(n) result(res)
        integer, intent(in) :: n
        integer :: res

        ! 终止条件
        if (n == 1) then 
            res = 1
            return
        end if
        
        ! 递：递归调用
        res = recur(n - 1)
        ! 归：返回结果
        res = n + res
    end function recur


    ! 使用迭代模拟递归
    function for_loop_recur(n) result(res)
        integer, intent(in) :: n
        integer :: res
        integer, allocatable :: stack(:)
        integer :: i
        
        ! 使用一个显式的栈来模拟系统调用栈
        allocate(stack(0))
        res = 0

        ! 递：递归调用
        do i = n, 1, -1
            ! 通过“入栈操作”模拟“递”
            stack = [stack, i]
        end do

        ! 归：返回结果
        do while (size(stack) > 0)
            res = res + stack(size(stack))
            ! 通过“出栈操作”模拟“归”
            stack = stack(1:size(stack)-1)
        end do

        ! res = 1+2+3+...+n
        
    end function for_loop_recur


    ! 尾递归
    recursive function tail_recur(n, res) result(final_res)
        integer, intent(in) :: n, res
        integer :: final_res

        ! 终止条件
        if (n == 0) then
            final_res = res
            return 
        end if
        ! 尾递归调用
        final_res = tail_recur(n - 1, res + n)
    end function tail_recur


    ! 斐波那契数列：递归
    recursive function fib(n) result(res)
        integer, intent(in) :: n
        integer :: res

        ! 终止条件 f(1) = 0, f(2) = 1
        if (n == 1 .or. n == 2) then
            res = n - 1
            return
        end if
        ! 递归调用 f(n) = f(n-1) + f(n-2)
        res = fib(n - 1) + fib(n - 2)
        ! 返回结果 f(n)
    end function fib


end module mod_recursion


program main
    use mod_recursion
    implicit none
    integer :: n = 5
    integer :: res

    res = recur(n)
    write (*, '(a,i0)') new_line('a')//"递归函数的求和结果 res = ", res

    res = for_loop_recur(n)
    write (*, '(a,i0)') new_line('a')//"使用迭代模拟递归求和结果 res = ", res

    res = tail_recur(n, 0)
    write (*, '(a,i0)') new_line('a')//"尾递归函数的求和结果 res = ", res

    res = fib(n)
    write (*, '(a,i0,a,i0)') new_line('a')//"斐波那契数列的第 ", n, " 项为 ", res

end program main