module ProgramMode
    enum, bind(C) ! ProgramMode
        enumerator :: ProgramMode_Clock = 1
        enumerator :: ProgramMode_Stopwatch
        enumerator :: ProgramMode_Timer
        enumerator :: ProgramMode_None
    end enum
end module ProgramMode

program ytime
    use :: ProgramMode
    use :: Stopwatch
    use :: Timer

    implicit none
    integer              :: mode = ProgramMode_None
    integer              :: argc
    character (len = 64) :: arg
    integer              :: i ! iterator
    integer              :: stat
    
    ! loop through arguments
    arg  = ""
    argc = command_argument_count()
    i = 0
    do while (i <= argc)
        call get_command_argument(i, arg)
        if (arg(1:1) == "-") then
            if ((arg == "-h") .or. (arg == "--help")) then
                write (*, "(a)") "ytime help"
                write (*, "(a)") "-h / --help : show this menu"
                write (*, "(a)") "-m / --mode : set mode"
                write (*, "(a)") ""
                write (*, "(a)") "Modes and arguments:"
                write (*, "(a)") " - stopwatch"
                write (*, "(a)") " - timer [time]"
                stop
            else if ((arg == "-m") .or. (arg == "--mode")) then
                if (i == argc) then
                    write (*, "(a)") "[ERROR] mode not given"
                    stop
                end if
                i = i + 1
                call get_command_argument(i, arg)

                if (arg == "clock") then
                    mode = ProgramMode_Clock
                else if (arg == "stopwatch") then
                    mode = ProgramMode_Stopwatch
                else if (arg == "timer") then
                    mode = ProgramMode_Timer

                    if (i == argc) then
                        write (*, "(a)") "[ERROR] time for timer not given"
                        stop
                    end if
                    
                    i = i + 1
                    call get_command_argument(i, arg)
                    read (arg, *, iostat = stat) timerTime

                    if (stat /= 0) then
                        write (*, "(a)") "[ERROR] given timer time invalid"
                        stop
                    end if
                else
                    write (*, "(a)") "[ERROR] Invalid program mode"
                    stop
                end if
            else
                write (*, "(a)") "[ERROR] Unrecognised argument", arg
                stop
            end if
        end if
        i = i + 1
    end do

    if (mode == ProgramMode_None) then
        write (*, "(a)") "Run this command again with the --help option"
        stop
    end if

    select case (mode)
        case (ProgramMode_Stopwatch)
            call RunStopwatch()
        case (ProgramMode_Timer)
            call RunTimer()
        case (ProgramMode_Clock)
            write (*, "(a)") "[ERROR] Unsupported mode"
            stop
            call RunClock()
        case default
            ! do nothing
    end select
end program ytime
