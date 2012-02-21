note
	description: "Summary description for {ACCEPT_LANGUAGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ACCEPT_LANGUAGE

inherit
	REQUEST_HEADER

create
	make

feature

	make (a_langs: LIST [STRING])
		do
			langs := a_langs
		end

	langs: LIST [STRING]

	id: INTEGER = 4
	tag_str: STRING = "Accept-Language"

	content_out: STRING
		do
			Result := list_sep (langs, ',')
		end

end
