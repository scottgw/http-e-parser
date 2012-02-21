note
	description: "Summary description for {HOST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HOST

inherit
	REQUEST_HEADER

create
	make

feature
	make (a_host: STRING)
		do
			host := a_host
		end

	id: INTEGER = 8

	tag_str: STRING = "Host"

	content_out: STRING
		do
			Result := host
		end

	host: STRING

end
