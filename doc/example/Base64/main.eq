(Base64App)

(B64)<-".EXTERN/ETP9nJHVUVh20LjhmD9E/base64.eqm"

('InputWord, (B64):PlaintextWord V ((B64):Bit(8) O (B64):Bit(8) O (B64):Bit(8) O (B64):Bit(8)))

"""
Encoder/decoder command line application.
"""
('CommandLine, ('In:InputWord), ('Out:InputWord, 'Err:((B64):Bit(8),)), (),
 (''' O 'In O 'Command) &
  (("-d" O 'A:(B64):EncodedWord O <('Out, 'A, '')) V
  ("" O  O 'B:(B64):PlaintextWord O <('Out, 'B, '')) V
  ("-d" O ~(B64):EncodedWord O <('Err, "Error - input is not a base64-encoded string.", '')) V
  ((~"" & ~"-d") O ' O <('Err, "Error - unknown command given to program.", ''))))

"""
Initialize application.
"""
(CommandLine, StdIn, (StdOut, StdErr), ())


