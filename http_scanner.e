class HTTP_SCANNER

inherit
  YY_COMPRESSED_SCANNER_SKELETON

  HTTP_TOKENS

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN is
			-- Is `sc' a valid start condition?
		do
			Result := (sc = INITIAL)
		end

feature {NONE} -- Implementation

	yy_build_tables is
			-- Build scanner tables.
		do
			yy_nxt := yy_nxt_template
			yy_chk := yy_chk_template
			yy_base := yy_base_template
			yy_def := yy_def_template
			yy_ec := yy_ec_template
			yy_meta := yy_meta_template
			yy_accept := yy_accept_template
		end

	yy_execute_action (yy_act: INTEGER) is
			-- Execute semantic action.
		do
if yy_act <= 6 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 28 "http.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'http.l' at line 28")
end
 last_token := STAR
else
--|#line 29 "http.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'http.l' at line 29")
end
 last_token := DOT
end
else
--|#line 30 "http.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'http.l' at line 30")
end
 last_token := GET
end
else
if yy_act <= 5 then
if yy_act = 4 then
--|#line 31 "http.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'http.l' at line 31")
end
 last_token := HTTP
else
--|#line 32 "http.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'http.l' at line 32")
end
 last_token := SP
end
else
--|#line 33 "http.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'http.l' at line 33")
end
 last_token := HT
end
end
else
if yy_act <= 9 then
if yy_act <= 8 then
if yy_act = 7 then
--|#line 34 "http.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'http.l' at line 34")
end
 last_token := CRLF
else
--|#line 35 "http.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'http.l' at line 35")
end
 last_token := ONEPOINTONE
end
else
--|#line 36 "http.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'http.l' at line 36")
end
 last_token := DIGITS; last_integer := text.to_integer 
end
else
if yy_act <= 11 then
if yy_act = 10 then
--|#line 37 "http.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'http.l' at line 37")
end
 last_token := TOKENS; last_string := text.twin 
else
--|#line 38 "http.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'http.l' at line 38")
end
 last_token := FWDSLASH
end
else
--|#line 0 "http.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'http.l' at line 0")
end
default_action
end
end
end
		end

	yy_execute_eof_action (yy_sc: INTEGER) is
			-- Execute EOF semantic action.
		do
			terminate
		end

feature {NONE} -- Table templates

	yy_nxt_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    4,    5,    4,    6,    7,    8,    9,   10,   11,
			   12,   12,   12,   12,   12,   12,   12,   12,   12,   12,
			    8,   13,   14,    8,    8,   16,   16,   17,   16,   18,
			   18,   18,   18,   18,   18,   18,   18,   18,   18,   16,
			   16,   16,   16,   16,   16,   16,   16,   24,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   16,   16,
			   16,   16,   16,   23,   22,   20,   19,   15,   25,    3,
			   25,   25,   25,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   25, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,   12,   12,   12,   26,   12,
			   12,   12,   12,   12,   12,   12,   12,   12,   12,   12,
			   12,   12,   12,   12,   17,   17,   17,   23,   17,   17,
			   17,   17,   17,   17,   17,   17,   17,   17,   17,   17,
			   17,   17,   17,   20,   19,   14,   13,    6,    3,   25,
			   25,   25,   25,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   25, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   68,   69,   69,   64,   69,    0,    0,
			    0,   69,   19,   46,   41,   69,    0,   38,    0,   40,
			   39,    0,    0,   24,    0,   69,   26, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,   25,    1,   25,   25,   25,   25,   25,   26,   26,
			   26,   25,   25,   26,   26,   25,   26,   25,   12,   26,
			   26,   17,   26,   26,   26,    0,   25, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    5,    6,    1,    6,    6,    6,    6,    6,
			    1,    1,    7,    6,    6,    6,    8,    9,   10,   11,
			   12,   13,   14,   15,   16,   17,   18,   19,    1,    1,
			    1,    6,    1,    1,    1,    6,    6,    6,    6,   20,
			    6,   21,   22,    6,    6,    6,    6,    6,    6,    6,
			   23,    6,    6,    6,   24,    6,    6,    6,    6,    6,
			    6,    1,    1,    1,    6,    6,    6,    6,    6,    6,

			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    1,    6,    1,    6,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    2,    2,    2,    1,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   13,   12,    6,   12,    5,   10,    1,
			    2,   11,    9,   10,   10,    7,   10,   10,    9,   10,
			   10,    8,    3,   10,    4,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 69
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 25
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 26
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER is 1
			-- Equivalence code for NULL character

	yyReject_used: BOOLEAN is false
			-- Is `reject' called?

	yyVariable_trail_context: BOOLEAN is false
			-- Is there a regular expression with
			-- both leading and trailing parts having
			-- variable length?

	yyReject_or_variable_trail_context: BOOLEAN is false
			-- Is `reject' called or is there a
			-- regular expression with both leading
			-- and trailing parts having variable length?

	yyNb_rules: INTEGER is 12
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 13
			-- End of buffer rule code

	yyLine_used: BOOLEAN is false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN is false
			-- Is `position' used?

	INITIAL: INTEGER is 0
			-- Start condition codes

feature -- User-defined features


 last_string: STRING
 last_integer: INTEGER

end
