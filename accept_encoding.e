note
	description: "Summary description for {ACCEPT_ENCODING}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ACCEPT_ENCODING

inherit
	REQUEST_HEADER

create
	make

feature
	make (a_encodings: LIST [STRING])
		do
			encodings := a_encodings
		end

	encodings: LIST [STRING]

	id: INTEGER = 3

	tag_str: STRING = "Accept-Encoding"

	content_out: STRING
		do
			Result := list_sep (encodings, ',')
		end

end
