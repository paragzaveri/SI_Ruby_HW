def price_of_gold(unit)
	price = unit * 1366.00
	puts "The amount of gold costs $#{price}."
end

def price_of_gold_from_pounds(pounds)
	ounces = pounds*16
	price_of_gold(ounces)
end

print "How many pounds of gold do you have?: "
amount_of_gold = gets.chomp.to_i

price_of_gold_from_pounds(amount_of_gold)