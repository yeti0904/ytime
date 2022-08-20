! this code is broken

module Clock
    ! modules
    use :: Utils

    implicit none

    ! functions
    contains
    subroutine RunClock()
        ! constants
        integer, parameter :: secondsInDay    = 86400
        integer, parameter :: secondsInHour   = 3600
        integer, parameter :: secondsInMinute = 60
    
        integer :: rawTime
        integer :: hours
        integer :: minutes
        integer :: days
    
        do
            rawTime = time()

            days = floor(real(rawTime) / real(secondsInDay))
            hours = floor(days / real(secondsInHour))
            minutes = 
            print "(I2,A,I2)", hours, ":", minutes
            call Util_Sleep(0.042)
        end do
    end subroutine RunClock
end module Clock
