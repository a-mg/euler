set num   to 600851475143
set prime to 2

repeat while prime is less than num
    if num mod prime equals 0
        (* prime is a factor of num. if we divide num by prime, the value of num
           will successively contain the original num's prime factors, until its
           final value is its largest prime factor *)
        set num to num / prime
    end if

    set prime to prime + 1
end repeat

-- division returns floats, but we want the answer as an int
return num as integer
