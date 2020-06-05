# Event types

	read
	subscribe
	buy

# Attributes for the events

	##read first visit

		country
		user_id
		source
		topic

	##read returning
		
		country
		user_id
		topic	

	##subscribe
		
		user_id

	##buy
	
		user_id
		price

#Columns values

	##country

		country_1, country_2, ... , country_8

	##source

		Reddit, AdWords, SEO

	##topic

		Africa, Europe, South America, North America, Australia, Asia

	##price

		8, 80

#Examples

	##read first visit 	2018-03-30 23:59:56;read;country_5;2458361283;Reddit;Asia
			
	##read returning	2018-03-31 05:04:50;read;country_4;2458361208;Africa

	##subscribe		2018-03-30 23:48:48;subscribe;2458173588	

	##buy			2018-03-30 23:11:30;buy;2458339835;80	
