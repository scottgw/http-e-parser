note
	description : "http_parser application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization
	x: HTTP_METHOD

	make
			-- Run application.
		local
			p: HTTP_PARSER
			hand_parser: HAND_PARSER
		do
--			--| Add your code here
--			create p.make


--			p.set_input_buffer (create {YY_BUFFER}.make ("GET * HTTP/1.1%R%N"))
--			p.parse

--			if p.scanning_error then
--				print ("Scanning error %N")
--			else
--				if p.syntax_error then
--					print ("Syntax error: " + p.text + "%N")
--				else
--					print (p.last_any_value.out + "%N")
--				end
--			end
			create hand_parser
			hand_parser.reset

			hand_parser.parse_line ("GET * HTTP/1.1")
			hand_parser.parse_line ("Connection: keep-alive")
			hand_parser.parse_line ("Host: somehost")
			hand_parser.parse_line ("Accept: http/1,http/2")
			hand_parser.parse_line ("User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11")
			print (hand_parser.request)
		end

end
