(Base64App)

(B64)<-".EXTERN/ETP9nJHVUVh20LjhmD9E/base64.eqh"

('InputWord, (B64):PlaintextWord V ((B64):Bit(8) O (B64):Bit(8) O (B64):Bit(8) O (B64):Bit(8)))

"""
Encoder/decoder command line application.
"""
('CommandLine, 'In:InputWord, ('Out:InputWord, 'Err:((B64):Bit(8),)), (),
 ('' O 'Command) &
  (("-d" O <('Out, (B64):Decoded['In & (B64):EncodedWord], ')) V
  ("" O <('Out, (B64):Encoded['In & (B64):PlaintextWord], ')) V
  ("-d" O (('In & ~(B64):EncodedWord) O <('Err, "Error - input is not a base64-encoded string.", '))) V
  ((~"-d" & ~"") O <('Err, "Error - unknown command given to program.", '))))

"""
Initialize application.
"""
(CommandLine, StdIn, (StdOut, StdErr), ())


