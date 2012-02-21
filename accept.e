note
	description: "Summary description for {ACCEPT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ACCEPT

inherit
	REQUEST_HEADER

create
	make

feature
	id: INTEGER = 1

	make (a_types: LIST [TUPLE[STRING, STRING]])
		do
			types := a_types
		end

	types: LIST [TUPLE[fst: STRING; snd: STRING]]

	tag_str: STRING = "Accept"

	content_out: STRING
		local
			l: ARRAYED_LIST [STRING]
		do
			create l.make (10)

			across
				types as tc
			loop
				l.extend (tc.item.fst + "/" + tc.item.snd)
			end

			Result := list_sep (l, ',')
		end
end
