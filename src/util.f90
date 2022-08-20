module Utils
    implicit none

    ! functions
    contains
    subroutine Util_Sleep(seconds)
        real :: start
        real :: seconds
        real :: elapsed
        call cpu_time(start)
        call cpu_time(elapsed)

        do while (elapsed - start <= seconds)
            call cpu_time(elapsed)
        end do
    end subroutine Util_Sleep
end module Utils
