note
	description: "Summary description for {ACCEPT_CHARSET}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ACCEPT_CHARSET

inherit
	REQUEST_HEADER

create
	make

feature
	make (a_sets: LIST [STRING])
		do
			charsets := a_sets
		end

	charsets: LIST [STRING]

	id: INTEGER = 2

	tag_str: STRING = "Accept-Charset"

	content_out: STRING
		do
			Result := list_sep (charsets,',')
		end

end
