%{
class HTTP_SCANNER

inherit
  YY_COMPRESSED_SCANNER_SKELETON

  HTTP_TOKENS
%}

DIGIT      [0-9]
TOKEN1     [a-zA-Z0-9^_`|~!#$%&'*+,.=-]
SEPARATOR  [][()<>@,;:\\"/?={}\ \t]

CRLF       \r\n
LWS        CRLF (SP|HT)+

TEXT       [\x20-\x7e] | LWS

COMMENT    \( (CTEXT | QUOTED_PAIR | COMMENT )* \)

MARK       [-_.!~*'()]
UNRESERVED [a-zA-Z0-9] | MARK

ESCAPED    [%] HEX HEX
HEX        DIGIT | [A-Fa-f]


CTEXT         [\x20-\x27] | [\x2a-\x7e] | LWS
QUOTED_STRING \" (QDTEXT | QUOTED_PAIR)* \"
QDTEXT        [\x20-\x21] | [\x23-\x7e] | LWS
QUOTED_PAIR   "\" [\x00-\x7f]

%%
"?"       { last_token := QUESTION}
"*"       { last_token := STAR}
":"       { last_token := COLON}
"."       { last_token := DOT}
"GET"     { last_token := GET}
"HTTP"    { last_token := HTTP}
" "       { last_token := SP}
"\t"      { last_token := HT}
{CRLF}    { last_token := CRLF}
{DIGIT}+\.{DIGIT}+ { last_token := ONEPOINTONE}
{DIGIT}+  { last_token := DIGITS; last_integer := text.to_integer }
{TOKEN1}+ { last_token := TOKENS; last_string := text.twin }
"/"       { last_token := FWDSLASH}

%%
 last_string: STRING
 last_integer: INTEGER

end
