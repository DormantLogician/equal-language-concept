(Base64App)

(B64)<-".EXTERN/ETP9nJHVUVh20LjhmD9E/base64.eqm"

('InputWord, (B64):PlaintextWord V ((B64):Bit(8))(4))

('String, (B64):Bit(8),)

"""
Encoder/decoder command line application.
"""
('CommandLine, InputWord, ('[' O ' O InputWord O String], InputWord O String),
 (InputWord O String),
  (('In O '' O 'In O String) &
   (((B64):EncodedWord O "-d" O <0) V
   ((B64):PlaintextWord O "" O <0) V
   (~(B64):EncodedWord O "-d" O ("Error - input is not a base64-encoded string.")) V
   (<0 O (~"" & ~"-d") O ("Error - unknown command given to program.")))))

"""
Initialize application.
"""
(CommandLine, StdIn, (StdOut O StdErr))


