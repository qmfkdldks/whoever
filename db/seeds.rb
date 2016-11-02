# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'securerandom'

40.times do
  Product.create(
    	:name => "Production #{SecureRandom.hex(2)}",
	  	:price => SecureRandom.random_number(400),
    	:images => 'http://amazon1.poxo.com/nandaglobal/en.stylenanda.com/web/product/tiny/201608/212369_shop1_905298.jpg'
  		)
end


40.times do |i|
  ProductDetail.create(
		:product_id => i,
    	:images => 'http://amazon1.poxo.com/nandaglobal/en.stylenanda.com/web/product/tiny/201608/212369_shop1_905298.jpg',
    	:description => '<h1>No Description</h1>'
  		)
end

categories = ['Top', 'Outer', 'Pants', 'Skirt']
tags = [['Knit', 'Shirt', 'Hoodies'], ['Jumper', 'Coat', 'Jacket'], ['Long', 'Skinny'], ['Midi', 'Maxi']]

categories.each_with_index do |value, index|
	
	Category.create(
		:name => value
		)
	
	tags[index].each do |tag|
		Tag.create(
		:name => tag,
		:category_id => index + 1
		)
	end

end

# 0...40 doesn't include 40
80.times do
	TagTable.create(
		:tag_id => rand(1...10),
		:product_id => rand(1...40)
		)
end