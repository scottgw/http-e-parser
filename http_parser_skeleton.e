note
	description: "Summary description for {HTTP_PARSER_SKELETON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	HTTP_PARSER_SKELETON

inherit
  YY_PARSER_SKELETON
    rename
      make as skeleton_make
    redefine
      report_error
    end

  HTTP_SCANNER
    rename
      make as scanner_make
    end

feature
  report_error (message: STRING)
    do
      print ("Error, last token: " + last_token.out + "%N")
      Precursor (message)
    end

  method: HTTP_METHOD

  make
    do
      skeleton_make
      scanner_make
    end
end
