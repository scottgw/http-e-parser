note
	description: "Summary description for {REQUEST_HEADER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	REQUEST_HEADER

inherit
	ANY
		redefine
			out
		end

create
	accept,
	accept_charset,
	accept_encoding,
	accept_language,
	host,
	user_agent

feature
	host (a_address: STRING)
		do
			id := Host_id
			str := a_address
		end

	accept (a_list: ARRAYED_LIST [STRING])
		do
			id := Accept_id
			list := a_list
		end

	accept_charset (a_list: ARRAYED_LIST [STRING])
		do
			id := Accept_charset_id
			list := a_list
		end

	accept_encoding (a_list: ARRAYED_LIST [STRING])
		do
			id := Accept_encoding_id
			list := a_list
		end

	accept_language (a_list: ARRAYED_LIST [STRING])
		do
			id := Accept_language_id
			list := a_list
		end

	user_agent (a_list: ARRAYED_LIST [STRING])
		do
			id := User_agent_id
			list := a_list
		end

	str: STRING
	list: ARRAYED_LIST [STRING]

	out: STRING
		local
			i: INTEGER
		do
			Result := tag_str + ": "

			inspect id
			when Host_id then
				Result := Result + str
			when User_agent_id then
				result := Result + list_sep (list, ' ')
			else
				Result := Result + list_sep (list, ',')
			end
		end

	list_sep (a_list: ARRAYED_LIST [STRING]; sep: CHARACTER): STRING
		local
			i: INTEGER
		do
			Result := ""
			from i := 1
			until i > list.count
			loop
				Result := Result + list [i]

				if i /= list.count then
					Result := Result + sep.out
				end

				i := i + 1
			end
		end

	tag_str: STRING
		do
			inspect id
			when Accept_id then
				Result := "Accept"
			when Accept_charset_id then
				Result := "Accept-Charset"
			when Accept_encoding_id then
				Result := "Accept-Encoding"
			when Accept_language_id then
				Result := "Accept-Language"
			when Host_id then
				Result := "Host"
			when User_agent_id then
				Result := "User-Agent"
			else

			end
		end

feature {NONE}
	id: INTEGER

	Accept_id: INTEGER = 1
	Accept_charset_id:  INTEGER = 2
	Accept_encoding_id: INTEGER = 3
	Accept_language_id: INTEGER = 4
	Host_id: INTEGER = 8
	User_agent_id: INTEGER = 19
end
