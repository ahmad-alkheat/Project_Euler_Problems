t0 = Time.now
require 'prime'

class Problem46

	def initialize
		@primes_array = [ 2 ]
	end

	def squares_times_two(number)
	  squares = []
	  (1..Math.sqrt(number)).each do |n|
	    squares << (n*n) * 2
	  end
	  squares
	end

	def primes(addPrime)
	  (@primes_array.last..addPrime).each do |p|
	  	@primes_array << p if Prime.prime?(p)
	  end
	  @primes_array
	end

	def conjecture?(num)
		primes(num).each do |prime|
			squares_times_two(num).each do |s|
				return true if prime + s == num
			end
		end
		false
	end


	def find
		num =33
		while true 
			if num%2 != 0 && !Prime.prime?(num) && !conjecture?(num) 
				puts num
				break
			end
		  num+=1
		end
	end
end

problem = Problem46.new
problem.find

p Time.now - t0



