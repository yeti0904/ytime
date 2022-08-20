module Stopwatch
    ! modules
    use :: CFunctions
    use :: Utils

    implicit none

    ! functions
    contains
    subroutine RunStopwatch()    
        real    :: startTime
        real    :: currentTime
        real    :: elapsed
        integer :: rc

        write (*, "(a)") "Press enter to start the stopwatch"
        rc = getchar()

        call cpu_time(startTime)

        do
            call cpu_time(currentTime)
            elapsed = currentTime - startTime

            print "(F10.3)", elapsed
            call Util_Sleep(0.042)
        end do
    end subroutine RunStopwatch
end module Stopwatch
