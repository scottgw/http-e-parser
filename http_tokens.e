indexing

	description: "Parser token codes"
	generator: "geyacc version 3.9"

class HTTP_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_any_value: ANY

feature -- Access

	token_name (a_token: INTEGER): STRING is
			-- Name of token `a_token'
		do
			inspect a_token
			when 0 then
				Result := "EOF token"
			when -1 then
				Result := "Error token"
			when TOKENS then
				Result := "TOKENS"
			when SP then
				Result := "SP"
			when HT then
				Result := "HT"
			when CRLF then
				Result := "CRLF"
			when DIGITS then
				Result := "DIGITS"
			when STAR then
				Result := "STAR"
			when DOT then
				Result := "DOT"
			when ONEPOINTONE then
				Result := "ONEPOINTONE"
			when FWDSLASH then
				Result := "FWDSLASH"
			when OPTIONS then
				Result := "OPTIONS (%"OPTIONS%")"
			when GET then
				Result := "GET (%"GET%")"
			when HEAD then
				Result := "HEAD (%"HEAD%")"
			when POST then
				Result := "POST (%"POST%")"
			when PUT then
				Result := "PUT (%"PUT%")"
			when DELETE then
				Result := "DELETE (%"DELETE%")"
			when TRACE then
				Result := "TRACE (%"TRACE%")"
			when CONNECT then
				Result := "CONNECT (%"CONNECT%")"
			when HTTP then
				Result := "HTTP (%"HTTP%")"
			else
				Result := yy_character_token_name (a_token)
			end
		end

feature -- Token codes

	TOKENS: INTEGER is 258
	SP: INTEGER is 259
	HT: INTEGER is 260
	CRLF: INTEGER is 261
	DIGITS: INTEGER is 262
	STAR: INTEGER is 263
	DOT: INTEGER is 264
	ONEPOINTONE: INTEGER is 265
	FWDSLASH: INTEGER is 266
	OPTIONS: INTEGER is 267
	GET: INTEGER is 268
	HEAD: INTEGER is 269
	POST: INTEGER is 270
	PUT: INTEGER is 271
	DELETE: INTEGER is 272
	TRACE: INTEGER is 273
	CONNECT: INTEGER is 274
	HTTP: INTEGER is 275

end
