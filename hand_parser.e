note
	description: "Summary description for {HAND_PARSER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HAND_PARSER

feature
	set_request (a_req: HTTP_REQUEST)
		do
			request := a_req
		end

	reset
		do
			first_line := True
			error := False
			finished := False
			create request
		end

	parse_line (a_str: STRING)
		require
			not_finished: not finished
		local
			words: ARRAYED_LIST [STRING]
		do
			if first_line then
				words := tokenize_space (a_str)
				parse_first_line (words)
			else
				words := strtok_header (a_str)
				if words.count = 1 then
					request.set_complete
					finished := True
				else
					parse_others (words)
				end
			end
		end

	finished: BOOLEAN
	request: HTTP_REQUEST
	error: BOOLEAN

feature {NONE}
	parse_others (words: ARRAYED_LIST [STRING])
		local
			tag: STRING
			list: ARRAYED_LIST [STRING]

			reqs: ARRAYED_LIST [REQUEST_HEADER]
			gens: ARRAYED_LIST [GENERAL_HEADER]
			alive: BOOLEAN
		do
			reqs := request.request_headers
			gens := request.general_headers
			tag := words [1]

			if tag.is_equal ("Accept") then
				parse_accepts (words [2])
			elseif tag.is_equal ("Accept-Language") then
				list := tokenize_comma (words [2])
				request.add_accept_language (list)
			elseif tag.is_equal ("Accept-Charset") then
				list := tokenize_comma (words [2])
				request.add_accept_charset (list)
			elseif tag.is_equal ("Accept-Encoding") then
				list := tokenize_comma (words [2])
				request.add_accept_encoding (list)
			elseif tag.is_equal ("Host") then
				request.add_host (words [2])
			elseif tag.is_equal ("User-Agent") then
				request.add_user_agent (words [2])
			elseif tag.is_equal ("Connection") then
				alive := words[2].as_lower.is_equal ("keep-alive")
				gens.extend (create {GENERAL_HEADER}.connection (alive))
			elseif tag.is_equal ("Range") then
				request.add_range (parse_range (words[2]))
			end
		end

	parse_accepts (a_str: STRING)
		local
			types: LIST [STRING]
			type_split: LIST [STRING]
			tuple_list: ARRAYED_LIST [TUPLE [STRING, STRING]]
		do
			types := tokenize_comma (a_str)

			create tuple_list.make (10)

			across
				types as tc
			loop
				--
				type_split := tc.item.split ('/')
				tuple_list.extend ([type_split [1], type_split [2]])
			end

			request.add_accept (tuple_list)
		end

	parse_range (a_str: STRING): INTEGER_INTERVAL
		local
			start_range: STRING
			end_range: STRING
			split: LIST [STRING]
			start_i: INTEGER
			end_i: INTEGER
		do
			split := a_str.split ('=')
			start_range := split [1]
			end_range := split [2]

			if start_range.is_empty then
				start_i := -1
			elseif start_range.is_integer then
				start_i := start_range.to_integer
			else
				error := True
			end

			if end_range.is_empty then
				end_i := {INTEGER}.max_value
			elseif end_range.is_integer then
				end_i := end_range.to_integer
			else
				error := True
			end

			create Result.make (start_i, end_i)
		end

	parse_first_line (words: ARRAYED_LIST [STRING])
		do
			add_method (words [1])
			add_uri (words [2])
			verify_http (words [3])

			first_line := False
		end

	add_method (a_str: STRING)
		local
			m: HTTP_METHOD
		do
			m := parse_method (a_str)
			if attached m then
				request.set_method (m)
			else
				error := True
			end
		end

	add_uri (a_str: STRING)
		do
			request.set_uri (parse_uri (a_str))
		end

	parse_uri (a_str: STRING): REQUEST_URI
		local
			i: INTEGER
		do
			if a_str.is_equal ("*") then
				create Result.star
			elseif a_str.as_lower.starts_with ("http://") then
				i := a_str.index_of ('/', 8)
				create Result.absolute (a_str.substring (8, i),
				                        a_str.substring (i, a_str.count))
			elseif a_str [1] = '/' then
				create Result.relative (a_str)
			end
		end

	parse_method (a_str: STRING): HTTP_METHOD
		do
			if a_str.is_equal ("GET") then
				create Result.get
			elseif a_str.is_equal ("OPTIONS") then
				create Result.options
			elseif a_str.is_equal ("HEAD") then
				create Result.head
			elseif a_str.is_equal ("POST") then
				create Result.post
			elseif a_str.is_equal ("PUT") then
				create Result.put
			elseif a_str.is_equal ("DELETE") then
				create Result.delete
			elseif a_str.is_equal ("TRACE") then
				create Result.trace
			elseif a_str.is_equal ("CONNECT") then
				create Result.connect
			else
				Result := Void
			end
		end

	verify_http (a_str: STRING)
		do
			if a_str.is_equal ("HTTP/1.1") then
				request.set_version (1,1)
			elseif a_str.is_equal ("HTTP/1.0") then
				request.set_version (1,0)
			else
				error := True
			end
		end

	first_line: BOOLEAN

feature {NONE}
	strtok_header (a_str: STRING): ARRAYED_LIST [STRING]
		local
			i: INTEGER
			tag: STRING
		do
			i := a_str.index_of (':', 1)

			if i = 0 then
				error := True
			else
				Result := tokenize_space (a_str.substring (i+1, a_str.count))
				Result.put_front (a_str.substring (1, i-1))
			end
		end

	tokenize_comma (a_str: STRING): ARRAYED_LIST [STRING]
		do
			Result := strtok (a_str, ',')
		end

	tokenize_space (a_str: STRING): ARRAYED_LIST [STRING]
		do
			Result := strtok (a_str, ' ')
		end

	strtok (a_str: STRING; sep: CHARACTER): ARRAYED_LIST [STRING]
		local
			str: STRING
			i: INTEGER
			j: INTEGER
		do
			str := a_str

			create Result.make (10)

			from
				i := 1
			until
				i > str.count
			loop
				j := str.index_of (sep, i)

				if j = i then

				elseif j = 0 then
					Result.extend (str.substring (i, str.count))
					i := str.count
				else
					Result.extend (str.substring (i, j - 1))
					i := j
				end

				i := i + 1
			end
		end

end
