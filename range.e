note
	description: "Summary description for {RANGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	RANGE

inherit
	REQUEST_HEADER

create
	make

feature
	id: INTEGER = 16

	make (a_interval: INTEGER_INTERVAL)
		do
			interval := a_interval
		end

	interval: INTEGER_INTERVAL

	tag_str: STRING = "Range"

	content_out: STRING
		do
			Result := "bytes="
			if interval.lower >= 0 then
				Result := Result + interval.lower.out
			end

			Result := Result + "-"

			if interval.upper < {INTEGER}.max_value then
				Result := Result + interval.upper.out
			end
		end

end
