(B64)

"""
Rearranges 1, 2, or 3 octets into 4 6-bit groups, adding a number of '0' bits to
right when there are less than 3 octets - adds 1 pad for 3 6-bit groups, and 2
pads for 2 6-bit groups so that 4 base64 encoded octets are always output.

'Regrouped' is reversible, which means we can easily get 8-bit words back based on
6-bit groups described in category body, which makes implementing the decoder
trivial.
"""
(+'Regrouped[('A:Bit O 'B:Bit O 'C:Bit O 'D:Bit O 'E:Bit O 'F:Bit O 'G:Bit O 'H:Bit) O 
             ('I:Bit O 'J:Bit O 'K:Bit O 'L:Bit O 'M:Bit O 'N:Bit O 'O:Bit O 'P:Bit) O 
             ('Q:Bit O 'R:Bit O 'S:Bit O 'T:Bit O 'U:Bit O 'V:Bit O 'W:Bit O 'X:Bit)], 
((1 O 1 O 'A O 'B O 'C O 'D O 'E O 'F) O AlphabetLetter) O
((1 O 1 O 'G O 'H O 'I O 'J O 'K O 'L) O AlphabetLetter) O
((1 O 1 O 'M O 'N O 'O O 'P O 'Q O 'R) O AlphabetLetter) O
(' O ((1 O 1 O 'S O 'T O 'U O 'V O 'W O 'X) O AlphabetLetter)))


(+'Regrouped[('A:Bit O 'B:Bit O 'C:Bit O 'D:Bit O 'E:Bit O 'F:Bit O 'G:Bit O 'H:Bit) O 
             ('I:Bit O 'J:Bit O 'K:Bit O 'L:Bit O 'M:Bit O 'N:Bit O 'O:Bit O 'P:Bit)],
((1 O 1 O 'A O 'B O 'C O 'D O 'E O 'F) O AlphabetLetter) O 
((1 O 1 O 'G O 'H O 'I O 'J O 'K O 'L) O AlphabetLetter) O
((1 O 1 O 'M O 'N O 'O O 'P O 1 O 1) O AlphabetLetter) O
(' O Pad))

(+'Regrouped['A:Bit O 'B:Bit O 'C:Bit O 'D:Bit O 'E:Bit O 'F:Bit O 'G:Bit O 'H:Bit],
((1 O 1 O 'A O 'B O 'C O 'D O 'E O 'F) O AlphabetLetter) O
((1 O 1 O 'G O 'H O 1 O 1 O 1 O 1) O AlphabetLetter) O
Pad O
(' O Pad))

('MappedEncodedWord, MappedAlphabetLetter O
                     MappedAlphabetLetter O
                     ('A:MappedAlphabetLetter V 'B:Pad) O 
                     (('A O MappedAlphabetLetter) V (('A V 'B) O Pad))

"""
Adds map to plaintext back onto an encoded word.
"""
('Remapped['E:Unmapped[EncodedWord]], ('[Unmapped['Mapped] & 'E], 'Mapped) & MappedEncodedWord)

('Encoded['P:PlaintextWord], Unmapped[Regrouped['P] & MappedEncodedWord])

"""
In decoder, we deduce what plain text is based on description of encoded word.
"""
('Decoded['E:Unmapped[EncodedWord]], ('[Regrouped['P:PlaintextWord] & 'Remapped['E]], 'P))


