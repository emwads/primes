require "primes"

describe Primes do

  describe "::is_prime?" do
    it "returns false for all numbers <= 1" do
      expect(Primes.is_prime?(0)).to be_falsey
      expect(Primes.is_prime?(1)).to be_falsey
      expect(Primes.is_prime?(-1394)).to be_falsey
    end

    it "accurately checks if the rest of numbers are prime" do
      expect(Primes.is_prime?(4)).to be_falsey
      expect(Primes.is_prime?(9)).to be_falsey
      expect(Primes.is_prime?(2)).to be_truthy
      expect(Primes.is_prime?(3)).to be_truthy
      expect(Primes.is_prime?(89)).to be_truthy
    end
  end

  describe "::first_n_primes" do
    it "returns an empty array from n's < 1" do
      expect(Primes.first_n_primes(0)).to eq([])
      expect(Primes.first_n_primes(-4)).to eq([])
    end
    it "accurately returns the first n primes" do
      expect(Primes.first_n_primes(0)).to eq([])
      expect(Primes.first_n_primes(1)).to eq([2])
      expect(Primes.first_n_primes(10)).to eq([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
    end
  end

  describe "::prime_table" do
    n_primes, table = Primes.prime_table

    it "defaults to a multiplication table of the first 10 primes" do
      expect(n_primes.length).to eq(10)
    end

    it "accurately gives a few lines" do
      expect(table[0]).to contain_exactly(4, 6, 10, 14, 22, 26, 34, 38, 46, 58)
      expect(table[1]).to contain_exactly(6, 9, 15, 21, 33, 39, 51, 57, 69, 87)
    end

    it "accepts other values for first n primes" do
      five_primes, _ = Primes.prime_table(5)
      expect(five_primes.length).to eq(5)
    end

  end

  describe "::print_primes_table" do
    it "prints something out" do
      expect { Primes.print_primes_table }.to output.to_stdout
    end

    it "prints a few values out" do
      expect { Primes.print_primes_table }.to output(/4\s+6\s+10\s+14\s+22\s+26\s+\s+34\s+38\s+46\s+58\s+/).to_stdout
    end
  end

end
