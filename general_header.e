note
	description: "Summary description for {GENERAL_HEADER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GENERAL_HEADER

inherit
	ANY
		redefine
			out
		end

create
	connection

feature
	keepalive: BOOLEAN

	connection (a_alive: BOOLEAN)
		do
			id := Connection_id
			keepalive := a_alive
		end

	out: STRING
		do
			inspect id
			when Connection_id then
				Result := "Connection: "
				if keepalive then
					Result := Result + "Keep-Alive"
				else
					Result := Result + "close"
				end
			else

			end
		end

feature {NONE}
	id: INTEGER

	Connection_id: INTEGER = 1

end
