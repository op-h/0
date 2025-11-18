@echo off
setlocal enabledelayedexpansion

:: Set directory to current folder
cd /d "%~dp0"

echo.
echo ===================================================
echo      GENERATING CRYPTO ALGORITHM FILES...
echo ===================================================
echo.

:: =====================================================
:: 1. CAESAR CIPHER
:: =====================================================
echo Creating caesar.py...
(
echo # ceser
echo def encrypt(text, shift):
echo     text = text.lower().replace(" ","")
echo     result = ""
echo     for ch in text:
echo         if ch.isalpha():
echo             base = ord('a')
echo             result += chr((ord(ch) - base + shift) %% 26 + base)
echo         else:
echo             result += ch
echo     return result
echo.
echo def decrypt(cipher, shift):
echo     return encrypt(cipher, -shift)
echo.
echo text = "Hello World"
echo shift = 3
echo.
echo encrypted = encrypt(text, shift)
echo decrypted = decrypt(encrypted, shift)
echo.
echo print("Encrypted:", encrypted)
echo print("Decrypted:", decrypted)
) > caesar.py

:: =====================================================
:: 2. SUBSTITUTION CIPHER
:: =====================================================
echo Creating substitution.py...
(
echo # substition
echo import string
echo plain = string.ascii_uppercase
echo key = "QWERTYUIOPASDFGHJKLZXCVBNM"
echo encryp_map={plain[i]:key[i] for i in range (26)}
echo decryp_map={key[i]:plain[i] for i in range (26)}
echo.
echo def encrypt(text):
echo     result=""
echo     text = text.upper().replace(" ","")
echo     for ch in text:
echo         if ch.isalpha():
echo             result += encryp_map[ch]
echo         else:
echo             result += ch
echo     return result
echo.
echo def decrypt(cipher):
echo     result=""
echo     cipher = cipher.upper().replace(" ","")
echo     for ch in cipher:
echo         if ch.isalpha():
echo             result += decryp_map[ch]
echo         else:
echo             result += ch
echo     return result
echo.
echo text = "Hello World"
echo cipher = encrypt(text)
echo print("Encrypted:", cipher)
echo decrypted = decrypt(cipher)
echo print("Decrypted:", decrypted)
) > substitution.py

:: =====================================================
:: 3. VIGENERE CIPHER
:: =====================================================
echo Creating vigenere.py...
(
echo # vignere
echo def vigenere_encrypt(text, key):
echo     result = ""
echo     key = key.upper()
echo     key_index = 0
echo.
echo     for ch in text.upper():
echo         if ch.isalpha():
echo             shift = ord(key[key_index %% len(key)]) - ord('A')
echo             enc = chr((ord(ch) - ord('A') + shift) %% 26 + ord('A'))
echo             result += enc
echo             key_index += 1
echo         else:
echo             result += ch
echo     return result
echo.
echo def vigenere_decrypt(cipher, key):
echo     result = ""
echo     key = key.upper()
echo     key_index = 0
echo.
echo     for ch in cipher.upper():
echo         if ch.isalpha():
echo             shift = ord(key[key_index %% len(key)]) - ord('A')
echo             dec = chr((ord(ch) - ord('A') - shift) %% 26 + ord('A'))
echo             result += dec
echo             key_index += 1
echo         else:
echo             result += ch
echo     return result
echo.
echo text = "ATTACKADAWN"
echo key = "LEMON"
echo.
echo encrypted = vigenere_encrypt(text, key)
echo decrypted = vigenere_decrypt(encrypted, key)
echo.
echo print("Encrypted:", encrypted)
echo print("Decrypted:", decrypted)
) > vigenere.py

:: =====================================================
:: 4. AFFINE CIPHER
:: =====================================================
echo Creating affine.py...
(
echo # affine
echo import math
echo.
echo def mod_inverse(a):
echo     for x in range(26):
echo         if (a * x) %% 26 == 1:
echo             return x
echo     return None  
echo.
echo def affine_encrypt(text, a, b):
echo     text = text.lower().replace(" ", "")
echo     result = ""
echo.
echo     for ch in text:
echo         if ch.isalpha():
echo             x = ord(ch) - ord('a')
echo             enc = chr((a * x + b) %% 26 + ord('a'))
echo             result += enc
echo         else:
echo             result += ch
echo.
echo     return result
echo.
echo def affine_decrypt(cipher, a, b):
echo     cipher = cipher.lower().replace(" ", "")
echo     result = ""
echo.
echo     a_inv = mod_inverse(a)
echo     if a_inv is None:
echo         return "a has no modular inverse! Choose another a."
echo.
echo     for ch in cipher:
echo         if ch.isalpha():
echo             y = ord(ch) - ord('a')
echo             dec = chr((a_inv * (y - b)) %% 26 + ord('a'))
echo             result += dec
echo         else:
echo             result += ch
echo.
echo     return result
echo.
echo text = "hello world"
echo a = 5    
echo b = 8
echo.
echo encrypted = affine_encrypt(text, a, b)
echo decrypted = affine_decrypt(encrypted, a, b)
echo.
echo print("Encrypted:", encrypted)
echo print("Decrypted:", decrypted)
) > affine.py

:: =====================================================
:: 5. PLAYFAIR CIPHER
:: =====================================================
echo Creating playfair.py...
(
echo # playfair
echo import numpy as np
echo.
echo def playfair(text, key, mode=1):
echo     vals = (key + "abcdefghiklmnopqrstuvwxyz").lower().replace(' ', '').replace('j', 'i')
echo     matrix = np.array(list(dict.fromkeys(vals))[:25]).reshape(5, 5)
echo.
echo     text = text.lower().replace(' ', '').replace('j', 'i')
echo     clean = ""
echo     for char in text:
echo         if len(clean) %% 2 == 1 and clean[-1] == char:
echo             clean += "x"
echo         clean += char
echo     if len(clean) %% 2 == 1: clean += "x" 
echo.
echo     result = ""
echo     for i in range(0, len(clean), 2):
echo         a, b = clean[i], clean[i+1]
echo         r1, c1 = np.argwhere(matrix == a)[0]
echo         r2, c2 = np.argwhere(matrix == b)[0]
echo.
echo         if r1 == r2:   
echo             result += matrix[r1, (c1 + mode) %% 5] + matrix[r2, (c2 + mode) %% 5]
echo         elif c1 == c2: 
echo             result += matrix[(r1 + mode) %% 5, c1] + matrix[(r2 + mode) %% 5, c2]
echo         else:          
echo             result += matrix[r1, c2] + matrix[r2, c1]
echo     return result
echo.
echo key = "monarchy"
echo txt = "balloon"
echo enc = playfair(txt, key, 1)   
echo dec = playfair(enc, key, -1)  
echo print(f"Encrypted: {enc}")
echo print(f"Decrypted: {dec}")
) > playfair.py

:: =====================================================
:: 6. TRANSPOSITION CIPHER
:: =====================================================
echo Creating transposition.py...
(
echo # transpostion
echo.
echo def get_column_order(key):
echo     key_nums = [int(k) - 1 for k in key]
echo     order = [0] * len(key_nums)
echo     for pos, rank in enumerate(key_nums):
echo         order[rank] = pos
echo     return order
echo.
echo def trans_encrypt(text, key):
echo     text = text.replace(" ", "").lower()
echo     cols = len(key)
echo.
echo     while len(text) %% cols != 0:
echo         text += "x"
echo.
echo     rows = [text[i:i+cols] for i in range(0, len(text), cols)]
echo     order = get_column_order(key)
echo.
echo     cipher = ""
echo     for col in order:
echo         for row in rows:
echo             cipher += row[col]
echo     return cipher
echo.
echo def trans_decrypt(cipher, key):
echo     cols = len(key)
echo     rows_count = len(cipher) // cols
echo     order = get_column_order(key)
echo     grid = [[""] * cols for _ in range(rows_count)]
echo.
echo     idx = 0
echo     for col in order:
echo         for row in range(rows_count):
echo             grid[row][col] = cipher[idx]
echo             idx += 1
echo.
echo     plain = ""
echo     for row in grid:
echo         plain += "".join(row)
echo     return plain
echo.
echo text = "BAGHDADIRAQ"
echo key = "3124"
echo.
echo encrypted = trans_encrypt(text, key)
echo decrypted = trans_decrypt(encrypted, key)
echo.
echo print("Encrypted:", encrypted)
echo print("Decrypted:", decrypted.replace('x', ''))
) > transposition.py

:: =====================================================
:: 7. HILL 2x2 CIPHER
:: =====================================================
echo Creating hill2x2.py...
(
echo # hill 2x2
echo import numpy as np
echo def char_to_num(ch):
echo     return ord(ch) - ord('a')
echo.
echo def num_to_char(n):
echo     return chr(n + ord('a'))
echo.
echo def clean_text(text):
echo     return text.replace(" ", "").lower()
echo.
echo def hill_encrypt(text, key):
echo     text = clean_text(text)
echo     if len(text) %% 2 == 1:
echo         text += 'x'
echo     result = ""
echo     for i in range(0, len(text), 2):
echo         pair = text[i:i+2]
echo         vec = np.array([[char_to_num(pair[0])],
echo                         [char_to_num(pair[1])]])
echo         enc = (key.dot(vec)) %% 26
echo         result += num_to_char(int(enc[0][0]))
echo         result += num_to_char(int(enc[1][0]))
echo     return result
echo.
echo def hill_decrypt(cipher, key):
echo     cipher = clean_text(cipher)
echo     det = int(round(np.linalg.det(key)))
echo     det_mod_inv = None
echo     for x in range(26):
echo         if (det * x) %% 26 == 1:
echo             det_mod_inv = x
echo             break
echo     if det_mod_inv is None:
echo         return "Key matrix is NOT invertible modulo 26!"
echo     a, b = key[0][0], key[0][1]
echo     c, d = key[1][0], key[1][1]
echo     adj = np.array([[d, -b],
echo                     [-c, a]])
echo     inv_key = (det_mod_inv * adj) %% 26
echo     result = ""
echo     for i in range(0, len(cipher), 2):
echo         pair = cipher[i:i+2]
echo         vec = np.array([[char_to_num(pair[0])],
echo                         [char_to_num(pair[1])]])
echo         dec = (inv_key.dot(vec)) %% 26
echo         result += num_to_char(int(dec[0][0]))
echo         result += num_to_char(int(dec[1][0]))
echo     return result
echo.
echo key = np.array([[3, 3],
echo                 [2, 5]])   
echo.
echo text = "helloworld"
echo encrypted = hill_encrypt(text, key)
echo decrypted = hill_decrypt(encrypted, key)
echo print("Encrypted:", encrypted)
echo print("Decrypted:", decrypted)
) > hill2x2.py

:: =====================================================
:: 8. HILL 3x3 CIPHER
:: =====================================================
echo Creating hill3x3.py...
(
echo # hill 3x3
echo import numpy as np
echo.
echo def char_to_num(ch):
echo     return ord(ch) - ord('a')
echo.
echo def num_to_char(n):
echo     return chr(n + ord('a'))
echo.
echo def clean_text(text):
echo     return text.replace(" ", "").lower()
echo.
echo def hill_encrypt_3x3(text, key):
echo     text = clean_text(text)
echo     while len(text) %% 3 != 0:
echo         text += 'x'
echo     result = ""
echo     for i in range(0, len(text), 3):
echo         triple = text[i:i+3]
echo         vec = np.array([[char_to_num(triple[0])],
echo                         [char_to_num(triple[1])],
echo                         [char_to_num(triple[2])]])
echo         enc = (key.dot(vec)) %% 26
echo         result += num_to_char(int(enc[0][0]))
echo         result += num_to_char(int(enc[1][0]))
echo         result += num_to_char(int(enc[2][0]))
echo     return result
echo.
echo def hill_decrypt_3x3(cipher, key):
echo     cipher = clean_text(cipher)
echo     det = int(round(np.linalg.det(key)))
echo     det_mod_inv = None
echo     for x in range(26):
echo         if (det * x) %% 26 == 1:
echo             det_mod_inv = x
echo             break
echo     if det_mod_inv is None:
echo         return "Key matrix is NOT invertible modulo 26!"
echo     inv_key = (det_mod_inv * np.round(np.linalg.inv(key) * det).astype(int)) %% 26
echo     result = ""
echo     for i in range(0, len(cipher), 3):
echo         triple = cipher[i:i+3]
echo         vec = np.array([[char_to_num(triple[0])],
echo                         [char_to_num(triple[1])],
echo                         [char_to_num(triple[2])]])
echo         dec = (inv_key.dot(vec)) %% 26
echo         result += num_to_char(int(dec[0][0]))
echo         result += num_to_char(int(dec[1][0]))
echo         result += num_to_char(int(dec[2][0]))
echo     return result
echo.
echo key = np.array([[6, 24, 1],
echo                 [13, 16, 10],
echo                 [20, 17, 15]]) 
echo.
echo text = "helloworld"
echo.
echo encrypted = hill_encrypt_3x3(text, key)
echo decrypted = hill_decrypt_3x3(encrypted, key)
echo print("Encrypted:", encrypted)
echo print("Decrypted:", decrypted)
) > hill3x3.py

:: =====================================================
:: 9. MULTIPLICATION CIPHER
:: =====================================================
echo Creating multiplication.py...
(
echo # multiplication
echo.
echo def mod_inverse(a, m):
echo     for i in range(1, m):
echo         if (a*i) %% m == 1:
echo             return i
echo     return None
echo.
echo def multiplicative_encrypt(text, key):
echo     text = text.upper().replace(" ", "")
echo     cipher = ""
echo     for ch in text:
echo         if ch.isalpha():
echo             c = ( (ord(ch)-65) * key ) %% 26
echo             cipher += chr(c + 65)
echo         else:
echo             cipher += ch
echo     return cipher
echo.
echo def multiplicative_decrypt(cipher, key):
echo     inv = mod_inverse(key,26)
echo     if inv is None:
echo         return "Error: key has no inverse modulo 26!"
echo     plain = ""
echo     for ch in cipher:
echo         if ch.isalpha():
echo             p = ( (ord(ch)-65) * inv ) %% 26
echo             plain += chr(p + 65)
echo         else:
echo             plain += ch
echo     return plain
echo.
echo text = "HELLO"
echo key = 5   
echo.
echo encrypted = multiplicative_encrypt(text, key)
echo decrypted = multiplicative_decrypt(encrypted, key)
echo.
echo print("Encrypted:", encrypted)
echo print("Decrypted:", decrypted)
) > multiplication.py

:: =====================================================
:: 10. FREQUENCY ANALYSIS
:: =====================================================
echo Creating frequency.py...
(
echo # frequency
echo from collections import Counter
echo.
echo ENGLISH_FREQ = "ETAOINSHRDLCUMWFGYPBVKJXQZ"
echo.
echo def encrypt(text, key_map):
echo     text = text.upper()
echo     result = ""
echo     for ch in text:
echo         if ch.isalpha():
echo             result += key_map.get(ch, ch)
echo         else:
echo             result += ch
echo     return result
echo.
echo def decrypt(ciphertext, key_map):
echo     reverse_map = {v: k for k, v in key_map.items()}
echo     return encrypt(ciphertext, reverse_map)
echo.
echo key_map = {
echo     'A': 'Q', 'B': 'W', 'C': 'E', 'D': 'R', 'E': 'T',
echo     'F': 'Y', 'G': 'U', 'H': 'I', 'I': 'O', 'J': 'P',
echo     'K': 'A', 'L': 'S', 'M': 'D', 'N': 'F', 'O': 'G',
echo     'P': 'H', 'Q': 'J', 'R': 'K', 'S': 'L', 'T': 'Z',
echo     'U': 'X', 'V': 'C', 'W': 'V', 'X': 'B', 'Y': 'N',
echo     'Z': 'M'
echo }
echo.
echo plain = "I LOVE PENTRATION TESTING"
echo cipher = encrypt(plain, key_map)
echo print("Ciphertext:", cipher)
echo.
echo decrypted = decrypt(cipher, key_map)
echo print("Decrypted:", decrypted)
) > frequency.py

:: =====================================================
:: 11. OTP (ONE TIME PAD)
:: =====================================================
echo Creating otp.py...
(
echo # OTP
echo import random
echo import string
echo.
echo letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ012345"
echo.
echo def generate_key(length):
echo     return ''.join(random.choice(string.ascii_uppercase) for _ in range(length))
echo.
echo def encrypt(plaintext, key):
echo     plaintext = plaintext.upper().replace(" ", "")
echo     ciphertext = ""
echo     for p, k in zip(plaintext, key):
echo         c_index = (ord(p) - 65 + ord(k) - 65) %% 26
echo         ciphertext += chr(c_index + 65)
echo     return ciphertext
echo.
echo def decrypt(ciphertext, key):
echo     plaintext = ""
echo     for c, k in zip(ciphertext, key):
echo         p_index = (ord(c) - 65 - (ord(k) - 65)) %% 26
echo         plaintext += chr(p_index + 65)
echo     return plaintext
echo.
echo def xor_encrypt(plaintext, key):
echo     plaintext = plaintext.upper().replace(" ", "")
echo     ciphertext = ""
echo     for p, k in zip(plaintext, key):
echo         xor_value = (ord(p) - 65) ^^ (ord(k) - 65)
echo         ciphertext += letters[xor_value]
echo     return ciphertext
echo.
echo def xor_decrypt(ciphertext, key):
echo     plaintext = ""
echo     for c, k in zip(ciphertext, key):
echo         xor_value = letters.index(c)
echo         p_value = xor_value ^^ (ord(k) - 65)
echo         plaintext += chr((p_value %% 26) + 65)
echo     return plaintext
echo.
echo text = "HELLO"
echo key = generate_key(len(text))
echo.
echo cipher = encrypt(text, key)
echo plain = decrypt(cipher, key)
echo.
echo xor_cipher = xor_encrypt(text, key)
echo xor_plain = xor_decrypt(xor_cipher, key)
echo.
echo print("Text:", text)
echo print("Key:", key)
echo print("method (1) Cipher:", cipher)
echo print("Decrypted:", plain)
echo print("XOR Cipher method(2):", xor_cipher)
echo print("XOR Decrypted:", xor_plain)
) > otp.py

:: =====================================================
:: OPEN VS CODE
:: =====================================================
echo.
echo Opening VS Code...

set "VSCODE="
if exist "%LOCALAPPDATA%\Programs\Microsoft VS Code\Code.exe" set "VSCODE=%LOCALAPPDATA%\Programs\Microsoft VS Code\Code.exe"
if not defined VSCODE if exist "%PROGRAMFILES%\Microsoft VS Code\Code.exe" set "VSCODE=%PROGRAMFILES%\Microsoft VS Code\Code.exe"
if not defined VSCODE if exist "%PROGRAMFILES(X86)%\Microsoft VS Code\Code.exe" set "VSCODE=%PROGRAMFILES(X86)%\Microsoft VS Code\Code.exe"

if defined VSCODE (
    start "" "%VSCODE%" . caesar.py substitution.py vigenere.py affine.py playfair.py transposition.py hill2x2.py hill3x3.py multiplication.py frequency.py otp.py
) else (
    echo VS Code not found automatically. Files are in: %CD%
    pause
)

exit /b
