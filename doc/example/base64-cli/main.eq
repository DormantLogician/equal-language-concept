(Base64App)

(B64)<-".EXTERN/ETP9nJHVUVh20LjhmD9E/base64.eqm"

('InputWord, (B64):PlaintextWord V ((B64):Bit(8))(4))

('String, (B64):Bit(8),)

"""
Encoder/decoder command line application.
"""
('CommandLine, 'In:InputWord, ('[' O InputWord O String], InputWord O String),
 (InputWord O String),
  (('' O 'In O String) &
   (("-d" O (B64):EncodedWord O <0) V
   ("" O (B64):PlaintextWord O <0) V
   ("-d" O ~(B64):EncodedWord O ("Error - input is not a base64-encoded string.")) V
   ((~"" & ~"-d") O <0 O ("Error - unknown command given to program.")))))

"""
Initialize application.
"""
(CommandLine, StdIn, (StdOut O StdErr))


