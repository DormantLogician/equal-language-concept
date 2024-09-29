(B64)

"""
Rearranges 1, 2, or 3 octets into 4 6-bit groups, adding a number of '0' bits
to right when there are less than 3 octets - adds 1 pad for 3 groups, and
2 pads for 2 groups to always output a total of 4 base64 encoded octets. 
"""
+[('A: Bit then 'B: Bit then 'C: Bit then 'D: Bit then 'E: Bit then 'F: Bit then 'G: Bit then 'H: Bit) then 
  ('I: Bit then 'J: Bit then 'K: Bit then 'L: Bit then 'M: Bit then 'N: Bit then 'O: Bit then 'P: Bit) then 
  ('Q: Bit then 'R: Bit then 'S: Bit then 'T: Bit then 'U: Bit then 'V: Bit then 'W: Bit then 'X: Bit)]
(Regroup: 
(('T1: Bit then 'T2: Bit then 'A then 'B then 'C then 'D then 'E then 'F) then 'A1: AlphabetLetter) with 
(('T3: Bit then 'T4: Bit then 'G then 'H then 'I then 'J then 'K then 'L) then 'A2: AlphabetLetter) with 
(('T5: Bit then 'T6: Bit then 'M then 'N then 'O then 'P then 'Q then 'R) then 'A3: AlphabetLetter) with 
(('T7: Bit then 'T8: Bit then 'S then 'T then 'U then 'V then 'W then 'X) then 'A4: AlphabetLetter))

+[('A: Bit then 'B: Bit then 'C: Bit then 'D: Bit then 'E: Bit then 'F: Bit then 'G: Bit then 'H: Bit) then 
  ('I: Bit then 'J: Bit then 'K: Bit then 'L: Bit then 'M: Bit then 'N: Bit then 'O: Bit then 'P: Bit)]
(Regroup:
(('T1: Bit then 'T2: Bit then 'A then 'B then 'C then 'D then 'E then 'F) then 'A1: AlphabetLetter) with 
(('T3: Bit then 'T4: Bit then 'G then 'H then 'I then 'J then 'K then 'L) then 'A2: AlphabetLetter) with 
(('T5: Bit then 'T6: Bit then 'M then 'N then 'O then 'P then 'Q then 'R) then 'A3: AlphabetLetter) with 
Pad)

+['A: Bit then 'B: Bit then 'C: Bit then 'D: Bit then 'E: Bit then 'F: Bit then 'G: Bit then 'H: Bit]
(Regroup: 
(('T1: Bit then 'T2: Bit then 'A then 'B then 'C then 'D then 'E then 'F) then 'A1: AlphabetLetter) with 
(('T3: Bit then 'T4: Bit then 'G then 'H then 'I: Bit then 'J: Bit then 'K: Bit then 'L: Bit) then 'A2: AlphabetLetter) with 
Pad with 
Pad)

(MappedEncodedWord: MappedAlphabetLetter then MappedAlphabetLetter then (('W if MappedAlphabetLetter) or ('T if Pad)) then ((MappedAlphabetLetter if 'W) or (Pad if 'T)))

['T: PlaintextWord](EncodeOperation: Strip[Regroup['T] and MappedEncodedWord])

['E: EncodedWord](Decode: [EncodeOperation['T: PlaintextWord] and 'E]('T))

['P: PlaintextWord](Encoded: EncodeOperation['P])


