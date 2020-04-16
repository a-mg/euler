# 005:
#
# 2520 is the smallest number that can be divided by each of the numbers from 1
# to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the
# numbers from 1 to 20?

from functools import reduce

primes_powers = {}

# iterate over the range to check (excluding 1)
for number in range(2, 20):
    prime = 2
    power = 0
    while prime <= number:
        if number % prime == 0:
            # if prime is a factor of number, divide it out and count how many
            # times it multiplies into the number
            number /= prime
            power += 1
            if (prime in primes_powers and power > primes_powers[prime]) \
                    or (prime not in primes_powers):
                # this captures the highest power of each prime factor of
                # numbers in the range
                primes_powers[prime] = power
        else:
            prime += 1
            power = 0

# raise primes to respective powers
raised_primes = [prime ** power for prime, power in primes_powers.items()]

# calculate product (solution)
product = reduce(lambda a, b: a * b, raised_primes)
print(product)
