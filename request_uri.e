note
	description: "Summary description for {REQUEST_URI}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	REQUEST_URI

create
	star, make

feature
	star
		do
			is_star := True
		end

	is_star: BOOLEAN

	make (a_str: STRING)
		do
			str := a_str.twin
		end

	str: STRING

end
