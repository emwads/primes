# Primes Class/Table Generation
This includes the Primes class which gives some functionality including checking if an integer is prime, outputting the first n primes, creating a multiplication table of the first n primes, and printing said table out.


## Setup

### Generating a Table
Generate a primes table with the first 10 primes using `ruby generate_table.rb`
Note: this command can take a single integer argument afterwards for a table with the first n primes (e.g., `ruby generate_table.rb "15"`)


### Testing/Primes Class
After downloading the repository, run `bundle install` in the terminal to install the rspec gem for testing purposes.

The Primes class is in the lib/primes folder.


## Usage
The Primes class has a few useful methods as follows:

### `Primes::is_prime?(number)`
This class method checks if a number is prime. It checks this by setting a test factor (integers from 2 to the square root of the number) and testing to see if the number is divisible by the test factor with no remainders.

The time complexity of this is O(sqrt(number))

### `Primes::first_n_primes(n)`
This method returns the first n prime numbers, calculated by trial division. Other sieving approaches were not used to allow more flexibility on picking an arbitrarily high n (number of primes).

The time complexity of this is complicated because there are no known functions that give all the primes, or the gaps between subsequent prime numbers. In this implementation, the method is guessing and checking numbers that can be primes with no real way to know how many numbers must be checked before finding the n number of primes. I'll call the time complexity of this O( f(n) ). The space complexity is linear.

### `Primes::prime_table(n)`
This class method creates a multiplication table of the first n primes (defaults to 10). It does this by calling the first_n_primes to create an array of primes, multiplying each number of the primes array with every number of the primes array and populating a table.

The time complexity of this can be described as O( f(n) + n(n+1)/2 ), where the first term describes the time complexity of the finding the first n primes, and the second term describes multiplying numbers in the primes array. This simplifies to O( f(x) + n^2). The space complexity is quadratic.

### `Primes::print_primes_table(n)`
This class method calls the primes_table class method with the default value of 10 and prints it out in a (hopefully) aesthetically pleasing way. It also has a time complexity of O( f(x) + n^2).

example
```
*  |   2   3   5   7  11  13  17  19  23  29
--------------------------------------------
  2|   4   6  10  14  22  26  34  38  46  58
  3|   6   9  15  21  33  39  51  57  69  87
  5|  10  15  25  35  55  65  85  95 115 145
  7|  14  21  35  49  77  91 119 133 161 203
 11|  22  33  55  77 121 143 187 209 253 319
 13|  26  39  65  91 143 169 221 247 299 377
 17|  34  51  85 119 187 221 289 323 391 493
 19|  38  57  95 133 209 247 323 361 437 551
 23|  46  69 115 161 253 299 391 437 529 667
 29|  58  87 145 203 319 377 493 551 667 841
```

## Tests
Tests for the above methods are found in the `spec/` folder. They can be run with the command `bundle exec rspec` .


## Minor Notes on Time Complexity
As opposed to the time complexities of each method discussed in the relevant sections above, the time complexity of creating a multiplication table of the first 10 prime numbers is constant, O(1), as no arguments to the prime_tables are changing -- it's staying at a constant 10.
