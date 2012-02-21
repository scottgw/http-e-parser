all: http_parser.e http_scanner.e

http_parser.e: http.y
	geyacc -t http_tokens -o $@ $<

http_tokens.e: http.y
	geyacc -t http_tokens $< > /dev/null

http_scanner.e: http.l http_tokens.e
	gelex -o $@ $<
