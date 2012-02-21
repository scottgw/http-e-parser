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
		end

	make (meth: HTTP_METHOD)
		do
			set_method (meth)
		end

	method: HTTP_METHOD
	uri: STRING

	set_method (meth: HTTP_METHOD)
		do
			method := meth
		end

	set_uri (a_uri: STRING)
		require
			a_uri /= Void
		do
			uri := a_uri
		end

	general_headers: ARRAYED_LIST [GENERAL_HEADER]
	request_headers: ARRAYED_LIST [REQUEST_HEADER]

feature
	out: STRING
		do
			Result := method.out + " " + uri + " HTTP/1.1%N"
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
