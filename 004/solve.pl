#!/usr/bin/perl

# 004:
#
# A palindromic number reads the same both ways. The largest palindrome made
# from the product of two 2-digit numbers is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.

$max = 0;

for ($a = 100; $a <= 999; $a++) {
    for ($b = 100; $b <= 999; $b++) {
        $prod = $a * $b;
        if ($prod == reverse $prod and $prod > $max) {
            $max = $prod;
        }
    }
}

print "$max\n";
