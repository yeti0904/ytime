module Timer
    ! modules
    use :: Utils
    use :: CFunctions

    ! variables
    implicit none
    real :: timerTime

    ! functions
    contains
    subroutine RunTimer()
        real    :: startTime
        real    :: elapsed
        integer :: rc

        write (*, "(a)") "Press enter to start the timer"
        rc = getchar()

        call cpu_time(startTime)
        call cpu_time(elapsed)
        do while (elapsed < startTime + timerTime)
            print "(F10.3)", elapsed

            call Util_Sleep(0.042)
            call cpu_time(elapsed)
        end do
        write (*, "(a)") "Timer complete"
    end subroutine RunTimer
end module Timer
