note
	description: "Summary description for {REQUEST_URI}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	REQUEST_URI

create
	star, absolute, relative

feature
	star
		do
			is_star := True
		end

	is_star: BOOLEAN

	absolute (a_host: STRING; a_resource: STRING)
		do
			is_absolute := True
			host := a_host
			resource := a_resource
		end

	relative (a_str: STRING)
		do
			is_absolute := False
			resource := a_str.twin
		end

	is_absolute: BOOLEAN

	host: STRING
	resource: STRING

	extension: STRING
		local
			i: INTEGER
		do
			i := resource.last_index_of ('.', resource.count)

			if i /= 0 then
				Result := resource.substring (i+1, 1)
			end
		end

end
