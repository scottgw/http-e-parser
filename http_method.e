note
	description: "Summary description for {HTTP_METHOD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HTTP_METHOD

inherit ANY
	redefine
		out
	end


create
	options,
	get,
	head,
	post,
	put,
	delete,
	trace,
	connect

feature
	id: INTEGER

	options
		do
			id := options_id
		end

	get
		do
			id := get_id
		end

	head
		do
			id := head_id
		end

	post
		do
			id := post_id
		end

	put
		do
			id := put_id
		end

	delete
		do
			id := delete_id
		end

	trace
		do
			id := trace_id
		end

	connect
		do
			id := connect_id
		end

	is_options: BOOLEAN
		do
			Result := id = options_id
		end

	is_get: BOOLEAN
		do
			Result := id = get_id
		end

	is_head: BOOLEAN
		do
			Result := id = head_id
		end

	is_post: BOOLEAN
		do
			Result := id = post_id
		end

	is_put: BOOLEAN
		do
			Result := id = put_id
		end

	is_delete: BOOLEAN
		do
			Result := id = delete_id
		end

	is_trace: BOOLEAN
		do
			Result := id = trace_id
		end

	is_connect: BOOLEAN
		do
			Result := id = connect_id
		end


	options_id: INTEGER = 0
	get_id: INTEGER = 1
	head_id: INTEGER = 2
	post_id: INTEGER = 3
	put_id: INTEGER = 4
	delete_id: INTEGER = 5
	trace_id: INTEGER = 6
	connect_id: INTEGER = 7

	out: STRING
		do
			inspect id
			when get_id then
				Result := "GET"
			else
				Result := "<other method>"
			end
		end

end
