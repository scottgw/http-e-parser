note
	description: "Summary description for {USER_AGENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	USER_AGENT

inherit
	REQUEST_HEADER

create
	make

feature
	make (a_str: STRING)
		do
			name := a_str
		end

	name: STRING

	tag_str: STRING = "User-Agent"

	id: INTEGER = 19

	content_out: STRING
		do
			Result := name
		end

end
