note
	description: "Summary description for {HTTP_HEADER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HTTP_REQUEST

inherit
	ANY
		redefine
			out,
			default_create
		end

create
	make, default_create

feature
	default_create
		do
			create general_headers.make (10)
			create request_headers.make (10)
			complete := False
		end

	make (meth: HTTP_METHOD)
		do
			set_method (meth)
		end

	method: HTTP_METHOD
	uri: REQUEST_URI

	set_method (meth: HTTP_METHOD)
		do
			method := meth
		end

	set_uri (a_uri: REQUEST_URI)
		require
			a_uri /= Void
		do
			uri := a_uri
		end

	add_range (int: INTEGER_INTERVAL)
		do
			create range.make (int)
			request_headers.extend (range)
		end

	add_accept (list: LIST [TUPLE [STRING, STRING]])
		do
			create accept.make (list)
			request_headers.extend (accept)
		end

	add_accept_language (list: LIST [STRING])
		do
			create accept_language.make (list)
			request_headers.extend (accept_language)
		end

	add_accept_charset (list: LIST [STRING])
		do
			create accept_charset.make (list)
			request_headers.extend (accept_charset)
		end

	add_accept_encoding (list: LIST [STRING])
		do
			create accept_encoding.make (list)
			request_headers.extend (accept_encoding)
		end

	add_user_agent (a_str: STRING)
		do
			create user_agent.make (a_str)
			request_headers.extend (user_agent)
		end

	add_host (a_str: STRING)
		do
			create host.make (a_str)
			request_headers.extend (host)
		end

	range: RANGE
	accept: ACCEPT
	accept_language: ACCEPT_LANGUAGE
	accept_charset: ACCEPT_CHARSET
	accept_encoding: ACCEPT_ENCODING
	user_agent: USER_AGENT
	host: HOST

	general_headers: ARRAYED_LIST [GENERAL_HEADER]
	request_headers: ARRAYED_LIST [REQUEST_HEADER]

	set_complete
		do
			complete := True
		end

	complete: BOOLEAN

feature
	out: STRING
		do
			Result := method.out + " " + uri.out + " HTTP/1.1%N"
			across
				general_headers as gc
			loop
				Result := Result + gc.item.out + "%N"
			end
			across
				request_headers as rc
			loop
				Result := Result + rc.item.out + "%N"
			end
		end
end
