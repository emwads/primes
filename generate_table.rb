require_relative 'lib/primes.rb'


if ARGV.empty?
  Primes.print_primes_table()
elsif ARGV[0].index(/^[0-9]+$/)
  Primes.print_primes_table(ARGV[0].to_i)
else
  print "Arguments should be a number\n"
end
