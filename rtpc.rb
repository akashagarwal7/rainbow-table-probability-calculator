# Author - 			Akash Agarwal
# Email  - 			agarwal.akash333@gmail.com
# Github link -		https://github.com/akashagarwal7/rainbow-table-probability-calculator

# Set the values here
@N = 2074
@t = 20
@m = 10.0 # Float used for float division

# Additional set of values
# @N = 18278
# @t = 200
# @m = 2000.0 # Float used for float division
@e = 2.7182818285

# Debug levels
@_mi = 1
@_ptable = 2
@_success_factor = 3

# Always print the configuration global variables
def check
	print_or_not "Value of @N = #{@N}", 4
	print_or_not "Value of @t = #{@t}", 4
	print_or_not "Value of @m = #{@m}", 4
end

# Print the message. b is used to decide debug level
def print_or_not(msg, b)
	# Use one of the three debug levels and comment the rest

	# debug_level = @_mi
	# debug_level = @_ptable
	debug_level = @_success_factor

	if (b >= debug_level) then puts msg end
end

def mi(i)
	print_or_not i, @_mi

	if i == 0

		print_or_not "for i = #{i}, returned 1", @_mi
		return 1

	elsif i == 1

		print_or_not "for i = #{i}, returned #{@m}", @_mi
		return @m

	end

	previous = mi(i-1)
	print_or_not "For i = #{i}, previous value of mi(i-1) = #{previous}", @_mi
	
	val = @N * (1 - @e ** ( -previous / @N ) )

	print_or_not "for i = #{i}, returned #{val}", @_mi
	print_or_not '=' * 40, @_mi 					# Print symbol 40 times
	print_or_not '=' * 40, @_mi 					# Print symbol 40 times
	print_or_not '=' * 40, @_mi 					# Print symbol 40 times

	val
end

def ptable
	product = 1
	for i in 0..@t
		euc = mi(i)
		a = euc/@N
		print_or_not "For i = #{i}, val of #{euc}/#{@N} = #{a}", @_ptable

		b = 1 - a
		print_or_not "Val of 1 - a = #{b}", @_ptable

		print_or_not "Previous val of product = #{product}", @_ptable
		product *= b
		print_or_not "For i = #{i}, val of product = #{product}", @_ptable
		print_or_not '=' * 40, @_ptable 			# Print symbol 40 times
		print_or_not '}' * 40, @_ptable 			# Print symbol 40 times
		print_or_not '}' * 40, @_ptable 			# Print symbol 40 times
	end
	1 - product
end

def success_factor
	rate = 0.98
	l = 0
	while rate < 0.99
		l += 1
		rate = 1 - ((1 - ptable) ** l)
		print_or_not "For L = #{l}, rate = #{rate}", @_success_factor
	end
	print_or_not '$' * 40, 1 						# Print symbol 40 times
	print_or_not '$' * 40, 1 						# Print symbol 40 times
	print_or_not '$' * 40, 1 						# Print symbol 40 times
	print_or_not "Final required value of L = #{l - 1}", @_success_factor
end

# Call the functions
check
success_factor
