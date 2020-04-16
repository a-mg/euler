# 005:
#
# 2520 is the smallest number that can be divided by each of the numbers from 1
# to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the
# numbers from 1 to 20?

def factors(num):
    # dictionary of prime factors and exponents
    # 10 => {2: 1, 5: 1}
    factors = {}
    prime   = 2
    while prime <= num:
        if num % prime == 0:
            num /= prime
            if prime in factors:
                factors[prime] += 1
            else:
                factors[prime] = 1
        else:
            prime += 1
    return factors

# get all factorizations in 2..20
factorizations = [factors(n) for n in range(2, 20)]

# find max power for each prime
reduced = {}
for item in factorizations:
    for prime, power in item.items():
        if (prime in reduced and power > reduced[prime]) \
                or (prime not in reduced):
            reduced[prime] = power

# calculate powers
reduced = [prime ** power for prime, power in reduced.items()]

# calculate product
product = 1
for r in reduced:
    product *= r

print(product)
