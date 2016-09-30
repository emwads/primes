
class Primes

  def self.is_prime?(num)
    return false if num <= 1
    (2..Math.sqrt(num).floor).each do |i|
      return false if num % i == 0
    end
    true
  end


  def self.first_n_primes(n)
    primes = []
    i = 2
    while primes.length < n
      if is_prime?(i)
        primes.push(i)
      end
      i +=1
    end
    primes
  end


  def self.prime_table( n = 10 )
    n_primes = first_n_primes(n)
    table = Array.new(n) { Array.new(n) }

    (0...n).each do |i|
      (0..i).each do |j|
        table[i][j] = n_primes[i] * n_primes[j]
        table[j][i] = table[i][j] if i != j
      end
    end

    [n_primes, table]
  end


  def self.print_primes_table( n=10 )
    n_primes, table = prime_table( n )
    return false if n_primes.length < 1
    table_padding = Math.log10(table[n_primes.length-1].last).floor + 1 + 1
    result = "*" + " " * (table_padding - 2 ) + "|"

    n_primes.each{ |el| result << el.to_s.rjust( table_padding ) }
    result << "\n" + "-" * table_padding * (n_primes.length + 1) + "\n"

    table.each_with_index do |line, i|
      result << n_primes[i].to_s.rjust( table_padding - 1 ) + "|"
      line.each { |el| result << el.to_s.rjust( table_padding ) }
      result << "\n"
    end

    print result
  end

end
