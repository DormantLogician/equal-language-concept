(Base64App)

(B64)<-".EXT/ETP9nJHVUVh20LjhmD9E/base64.eqh"

"""
Assuming 'PlaintextGrammar' is a grammar that is defined by the language.
"""
['T](CmdErr: (write (PlaintextGrammar and "Error - unknown command given to program.") to 'StdErr else ') then 'T then 'U(2))

['T](FormatErr: write (PlaintextGrammar and "Error - input is not a base64-encoded string.") to 'StdErr else ') then 'T then 'U(2))

"""
'Begin(2) is stream begin, 'Middle(3) is a character in stream, and 'End(4) is stream end - 'intmin(0)'
(null character) is used to indicate begin and end of stream.
"""
(DecodeMode: ('Begin(2) then ('Middle(3) then "-") then ('Middle(3) then "d") then 'End(4))
(EncodeMode: ('Begin(2) then 'End(4))

(InputWord: PlaintextWord or (Bit(8) then Bit(8) then Bit(8) then Bit(8)))

(StreamChr: 'Begin(2) or ('Middle(3) then Bit(8)) or 'End(4))

"""
A base64 command line application - supports encoding and decoding data from standard input.
'Word - Represents a character from input stream.
'AppArgs - Sequence of arguments given by user on command line - includes beginning and end of stream.
"""
('Word: StreamChr)(import)(export: 'AppArgs: StreamChr then next)
(CommandLine: (add 'Word to 'Store else ') then
              if 'Word is 'End(4) then (write 'Store + 'Word to 'AppArgs else '))

('''Input: InputWord)(import: 'AppArgs: StreamChr then next)(export: 'StdOut: InputWord, 'StdErr: 'AnyError)
(Base64App:
    (read 'ArgV from 'AppArgs else ') then
       ((('ArgV is DecodeMode) then
           ('''Input is EncodedWord then (write (B64)Decoded['''Input] to 'StdOut else ') else FormatErr['''Input]))
    or
        (('ArgV is EncodeMode) then
           ('''Input is PlaintextWord then (write (B64)Encoded['''Input] to 'StdOut else ')))
    or
        (('ArgV is (~DecodeMode and ~EncodeMode)) then CmdErr['''Input]))


CommandLine(read StreamChr from ' else ')(import)(export: 'AppArgs)

Base64App(read InputWord from ''StdIn else ')(import: 'AppArgs)(export: 'StdOut,'StdErr)


