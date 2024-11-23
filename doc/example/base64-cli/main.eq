(Base64App)

(B64)<-".EXTERN/ETP9nJHVUVh20LjhmD9E/base64.eqm"

('InputWord, (B64):PlaintextWord V ((B64):Bit(8))(4))

('String, (B64):Bit(8),)

"""
Encoder/decoder command line application.
"""
('CommandLine, 'In:InputWord, ('[' O (InputWord O 'Output) O 'Err:String], 'Output O 'Err),
 (InputWord O String),
  (('' O ('In O 'Out) O String) &
   (("-d" O ('A:(B64):EncodedWord O (B64):Decoded['A]) O <0) V
   ("" O ('B:(B64):PlaintextWord O (B64):Encoded['B]) O <0) V
   ("-d" O (~(B64):EncodedWord O <0) O "Error - input is not a base64-encoded string.") V
   ((~"" & ~"-d") O (' O <0) O "Error - unknown command given to program."))))

"""
Initialize application.
"""
(CommandLine, StdIn, (StdOut O StdErr))


