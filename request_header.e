note
	description: "Summary description for {REQUEST_HEADER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	REQUEST_HEADER

inherit
	ANY
		redefine
			out
		end

feature
	content_out: STRING
		deferred
		end

	out: STRING
		local
			i: INTEGER
		do
			Result := tag_str + ": " + content_out
		end

	list_sep (a_list: LIST [STRING]; sep: CHARACTER): STRING
		local
			i: INTEGER
		do
			Result := ""
			from i := 1
			until i > a_list.count
			loop
				Result := Result + a_list [i]

				if i /= a_list.count then
					Result := Result + sep.out
				end

				i := i + 1
			end
		end

	tag_str: STRING
		deferred
		end

	id: INTEGER
		deferred
		end
end
