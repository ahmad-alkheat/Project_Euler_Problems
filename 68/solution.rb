t0 = Time.now

class Ring
	include Enumerable
	def initialize
		@nums = []
		@ring = []
		@numbers = [ 1 ,2 ,3 ,4 ,5 ,6, 7, 8, 9, 10 ]
	end

	def fill
		@numbers.permutation(10).each do | i, j, k, l, m, n, o, p, q, r| 
			if i + m + l == j + l + n && k + n + m == i + m + l
				@ring[0] = i
				@ring[1] = j
				@ring[2] = k
				@ring[3] = m
				@ring[4] = l
				@ring[5] = n

				format @ring
			end
		end
		puts @nums.max
	end							

	def format(ring)
		smallest_outer_vertex_index = ring.index(ring[0,3].min)
		if smallest_outer_vertex_index == 0 
			presentation = [ ring[0], ring[3], ring[4], ring[1], ring[4], ring[5], ring[2], ring[5], ring[3] ].join.to_i
			@nums << presentation unless @nums.include?(presentation) 
		elsif smallest_outer_vertex_index == 1
			presentation = [ ring[1], ring[4], ring[5], ring[2], ring[5], ring[3], ring[0], ring[3], ring[4] ].join.to_i
			@nums << presentation unless @nums.include?(presentation)	
		else
			presentation = [ ring[2], ring[5], ring[3], ring[0], ring[3], ring[4], ring[1], ring[4], ring[5] ].join.to_i
			@nums << presentation unless @nums.include?(presentation)
		end
	end
end

ring = Ring.new
ring.fill
							
p Time.now - t0
