#!/usr/bin/perl

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
