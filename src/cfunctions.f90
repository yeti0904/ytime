module CFunctions
    implicit none

    interface
        function getchar() bind(C)
            use :: iso_c_binding, only: c_int
            integer (kind = c_int) :: getchar
        end function getchar
        function putchar(c) bind(C)
            use :: iso_c_binding, only: c_int
            integer (kind = c_int) :: putchar
            integer (kind = c_int) :: c
        end function putchar
    end interface

    contains
    subroutine putch(c)
        use :: iso_c_binding, only: c_int

        integer                :: c
        integer (kind = c_int) :: ch
        integer (kind = c_int) :: rc

        ch = c
        rc = putchar(ch)
    end subroutine putch
end module CFunctions
