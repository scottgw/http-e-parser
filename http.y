%{
class
  HTTP_PARSER

inherit
  HTTP_PARSER_SKELETON

create
  make

%}

-- From the lexer

%token TOKENS
%token SP
%token HT
%token CRLF
%token DIGITS

%token COLON
%token STAR
%token DOT
%token ONEPOINTONE
%token FWDSLASH

%token OPTIONS "OPTIONS"
%token GET "GET"
%token HEAD "HEAD"
%token POST "POST"
%token PUT "PUT"
%token DELETE "DELETE"
%token TRACE "TRACE"
%token CONNECT "CONNECT"

%token HTTP "HTTP"

%type <HTTP_METHOD> Method
%type <HTTP_HEADER> HTTP_message
%type <HTTP_HEADER> Request
%type <REQUEST_URI> Request_URI

%start HTTP_message

%% -- Grammar actions

HTTP_message : Request
             | Response
             ;

Request :  Method SP Request_URI SP HTTP_Version CRLF
             {create $$.make ($1); last_any_value := $$} ;

Response : Status_Line CRLF ;

Method : OPTIONS {create $$.options}
       | GET {create $$.get}
       | HEAD {create $$.head}
       | POST {create $$.post}
       | PUT {create $$.put}
       | DELETE {create $$.delete}
       | TRACE {create $$.trace}
       | CONNECT {create $$.connect} 
       ;

HTTP_Version : HTTP FWDSLASH ONEPOINTONE; -- DIGITS '\.' DIGITS ;


Request_URI : STAR {create $$.star}
            | URI_Absolute
            ;
           -- | abs_path
           -- | authority

URI_Absolute : URI_Scheme COLON URI_Part ;

URI_Part : Hier_Part
         | Opaque_Part
;

Hier_Part : Path_Part QUESTION Query
          | Path_Part
;

Path_Part : Net_Path
          | Abs_Path
;

Net_Path : FWDSLASH FWDSLASH Authority
         | FWDSLASH FWDSLASH Authority Abs_Path
;

Abs_Path : FWDSLASH Path_Segments ;


Status_Line : HTTP_Version ;            

%%
end
