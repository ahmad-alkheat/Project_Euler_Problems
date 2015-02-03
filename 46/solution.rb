t0 = Time.now
require 'prime'

def squares_times_two(num)
  squares = []
  (1..Math.sqrt(num)).each do |n|
    squares << (n*n) * 2
  end
  squares
end

def conjecture?(num)
	primes = Prime.take(num)
	primes.each do |p|
		squares_times_two(num).each do |s|
			return true if p + s == num
		end
	end
	false
end

num =33
while true 
	if num%2 != 0 && !Prime.prime?(num) && !conjecture?(num) 
		puts num
		break
	end
  num+=1
end

p Time.now - t0


