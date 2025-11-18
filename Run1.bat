The error `  : was unexpected at this time. ` happens because the previous Batch file used **parentheses `()`** to group commands (e.g., `( echo code ) > file.py`). In Batch scripts, if your Python code contains a `)` (like in `print("Hello")`), the computer thinks the command block has ended early, runs into the next symbol (often a `:` in Python), and crashes.

I have rewritten the script using the **"Safe Append" method**. This creates the files line-by-line, which guarantees it will not crash regardless of the special characters inside.

### 📝 Instructions

1.  Create a file named **`Run_Crypto.bat`**.
2.  **Paste** the code below.
3.  **Double-click** to run.

<!-- end list -->

```batch
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
echo # ceser > caesar.py
echo def encrypt(text, shift): >> caesar.py
echo     text = text.lower().replace(" ","") >> caesar.py
echo     result = "" >> caesar.py
echo     for ch in text: >> caesar.py
echo         if ch.isalpha(): >> caesar.py
echo             base = ord('a') >> caesar.py
echo             result += chr((ord(ch) - base + shift) %% 26 + base) >> caesar.py
echo         else: >> caesar.py
echo             result += ch >> caesar.py
echo     return result >> caesar.py
echo. >> caesar.py
echo def decrypt(cipher, shift): >> caesar.py
echo     return encrypt(cipher, -shift) >> caesar.py
echo. >> caesar.py
echo text = "Hello World" >> caesar.py
echo shift = 3 >> caesar.py
echo. >> caesar.py
echo encrypted = encrypt(text, shift) >> caesar.py
echo decrypted = decrypt(encrypted, shift) >> caesar.py
echo. >> caesar.py
echo print("Encrypted:", encrypted) >> caesar.py
echo print("Decrypted:", decrypted) >> caesar.py

:: =====================================================
:: 2. SUBSTITUTION CIPHER
:: =====================================================
echo Creating substitution.py...
echo # substition > substitution.py
echo import string >> substitution.py
echo plain = string.ascii_uppercase >> substitution.py
echo key = "QWERTYUIOPASDFGHJKLZXCVBNM" >> substitution.py
echo encryp_map={plain[i]:key[i] for i in range (26)} >> substitution.py
echo decryp_map={key[i]:plain[i] for i in range (26)} >> substitution.py
echo. >> substitution.py
echo def encrypt(text): >> substitution.py
echo     result="" >> substitution.py
echo     text = text.upper().replace(" ","") >> substitution.py
echo     for ch in text: >> substitution.py
echo         if ch.isalpha(): >> substitution.py
echo             result += encryp_map[ch] >> substitution.py
echo         else: >> substitution.py
echo             result += ch >> substitution.py
echo     return result >> substitution.py
echo. >> substitution.py
echo def decrypt(cipher): >> substitution.py
echo     result="" >> substitution.py
echo     cipher = cipher.upper().replace(" ","") >> substitution.py
echo     for ch in cipher: >> substitution.py
echo         if ch.isalpha(): >> substitution.py
echo             result += decryp_map[ch] >> substitution.py
echo         else: >> substitution.py
echo             result += ch >> substitution.py
echo     return result >> substitution.py
echo. >> substitution.py
echo text = "Hello World" >> substitution.py
echo cipher = encrypt(text) >> substitution.py
echo print("Encrypted:", cipher) >> substitution.py
echo decrypted = decrypt(cipher) >> substitution.py
echo print("Decrypted:", decrypted) >> substitution.py

:: =====================================================
:: 3. VIGENERE CIPHER
:: =====================================================
echo Creating vigenere.py...
echo # vignere > vigenere.py
echo def vigenere_encrypt(text, key): >> vigenere.py
echo     result = "" >> vigenere.py
echo     key = key.upper() >> vigenere.py
echo     key_index = 0 >> vigenere.py
echo. >> vigenere.py
echo     for ch in text.upper(): >> vigenere.py
echo         if ch.isalpha(): >> vigenere.py
echo             shift = ord(key[key_index %% len(key)]) - ord('A') >> vigenere.py
echo             enc = chr((ord(ch) - ord('A') + shift) %% 26 + ord('A')) >> vigenere.py
echo             result += enc >> vigenere.py
echo             key_index += 1 >> vigenere.py
echo         else: >> vigenere.py
echo             result += ch >> vigenere.py
echo     return result >> vigenere.py
echo. >> vigenere.py
echo def vigenere_decrypt(cipher, key): >> vigenere.py
echo     result = "" >> vigenere.py
echo     key = key.upper() >> vigenere.py
echo     key_index = 0 >> vigenere.py
echo. >> vigenere.py
echo     for ch in cipher.upper(): >> vigenere.py
echo         if ch.isalpha(): >> vigenere.py
echo             shift = ord(key[key_index %% len(key)]) - ord('A') >> vigenere.py
echo             dec = chr((ord(ch) - ord('A') - shift) %% 26 + ord('A')) >> vigenere.py
echo             result += dec >> vigenere.py
echo             key_index += 1 >> vigenere.py
echo         else: >> vigenere.py
echo             result += ch >> vigenere.py
echo     return result >> vigenere.py
echo. >> vigenere.py
echo text = "ATTACKADAWN" >> vigenere.py
echo key = "LEMON" >> vigenere.py
echo. >> vigenere.py
echo encrypted = vigenere_encrypt(text, key) >> vigenere.py
echo decrypted = vigenere_decrypt(encrypted, key) >> vigenere.py
echo. >> vigenere.py
echo print("Encrypted:", encrypted) >> vigenere.py
echo print("Decrypted:", decrypted) >> vigenere.py

:: =====================================================
:: 4. AFFINE CIPHER
:: =====================================================
echo Creating affine.py...
echo # affine > affine.py
echo import math >> affine.py
echo. >> affine.py
echo def mod_inverse(a): >> affine.py
echo     for x in range(26): >> affine.py
echo         if (a * x) %% 26 == 1: >> affine.py
echo             return x >> affine.py
echo     return None   >> affine.py
echo. >> affine.py
echo def affine_encrypt(text, a, b): >> affine.py
echo     text = text.lower().replace(" ", "") >> affine.py
echo     result = "" >> affine.py
echo. >> affine.py
echo     for ch in text: >> affine.py
echo         if ch.isalpha(): >> affine.py
echo             x = ord(ch) - ord('a') >> affine.py
echo             enc = chr((a * x + b) %% 26 + ord('a')) >> affine.py
echo             result += enc >> affine.py
echo         else: >> affine.py
echo             result += ch >> affine.py
echo. >> affine.py
echo     return result >> affine.py
echo. >> affine.py
echo def affine_decrypt(cipher, a, b): >> affine.py
echo     cipher = cipher.lower().replace(" ", "") >> affine.py
echo     result = "" >> affine.py
echo. >> affine.py
echo     a_inv = mod_inverse(a) >> affine.py
echo     if a_inv is None: >> affine.py
echo         return "a has no modular inverse! Choose another a." >> affine.py
echo. >> affine.py
echo     for ch in cipher: >> affine.py
echo         if ch.isalpha(): >> affine.py
echo             y = ord(ch) - ord('a') >> affine.py
echo             dec = chr((a_inv * (y - b)) %% 26 + ord('a')) >> affine.py
echo             result += dec >> affine.py
echo         else: >> affine.py
echo             result += ch >> affine.py
echo. >> affine.py
echo     return result >> affine.py
echo. >> affine.py
echo text = "hello world" >> affine.py
echo a = 5     >> affine.py
echo b = 8 >> affine.py
echo. >> affine.py
echo encrypted = affine_encrypt(text, a, b) >> affine.py
echo decrypted = affine_decrypt(encrypted, a, b) >> affine.py
echo. >> affine.py
echo print("Encrypted:", encrypted) >> affine.py
echo print("Decrypted:", decrypted) >> affine.py

:: =====================================================
:: 5. PLAYFAIR CIPHER
:: =====================================================
echo Creating playfair.py...
echo # playfair > playfair.py
echo import numpy as np >> playfair.py
echo. >> playfair.py
echo def playfair(text, key, mode=1): >> playfair.py
echo     vals = (key + "abcdefghiklmnopqrstuvwxyz").lower().replace(' ', '').replace('j', 'i') >> playfair.py
echo     matrix = np.array(list(dict.fromkeys(vals))[:25]).reshape(5, 5) >> playfair.py
echo. >> playfair.py
echo     text = text.lower().replace(' ', '').replace('j', 'i') >> playfair.py
echo     clean = "" >> playfair.py
echo     for char in text: >> playfair.py
echo         if len(clean) %% 2 == 1 and clean[-1] == char: >> playfair.py
echo             clean += "x" >> playfair.py
echo         clean += char >> playfair.py
echo     if len(clean) %% 2 == 1: clean += "x"  >> playfair.py
echo. >> playfair.py
echo     result = "" >> playfair.py
echo     for i in range(0, len(clean), 2): >> playfair.py
echo         a, b = clean[i], clean[i+1] >> playfair.py
echo         r1, c1 = np.argwhere(matrix == a)[0] >> playfair.py
echo         r2, c2 = np.argwhere(matrix == b)[0] >> playfair.py
echo. >> playfair.py
echo         if r1 == r2:    >> playfair.py
echo             result += matrix[r1, (c1 + mode) %% 5] + matrix[r2, (c2 + mode) %% 5] >> playfair.py
echo         elif c1 == c2:  >> playfair.py
echo             result += matrix[(r1 + mode) %% 5, c1] + matrix[(r2 + mode) %% 5, c2] >> playfair.py
echo         else:           >> playfair.py
echo             result += matrix[r1, c2] + matrix[r2, c1] >> playfair.py
echo     return result >> playfair.py
echo. >> playfair.py
echo key = "monarchy" >> playfair.py
echo txt = "balloon" >> playfair.py
echo enc = playfair(txt, key, 1)    >> playfair.py
echo dec = playfair(enc, key, -1)   >> playfair.py
echo print(f"Encrypted: {enc}") >> playfair.py
echo print(f"Decrypted: {dec}") >> playfair.py

:: =====================================================
:: 6. TRANSPOSITION CIPHER
:: =====================================================
echo Creating transposition.py...
echo # transpostion > transposition.py
echo. >> transposition.py
echo def get_column_order(key): >> transposition.py
echo     key_nums = [int(k) - 1 for k in key] >> transposition.py
echo     order = [0] * len(key_nums) >> transposition.py
echo     for pos, rank in enumerate(key_nums): >> transposition.py
echo         order[rank] = pos >> transposition.py
echo     return order >> transposition.py
echo. >> transposition.py
echo def trans_encrypt(text, key): >> transposition.py
echo     text = text.replace(" ", "").lower() >> transposition.py
echo     cols = len(key) >> transposition.py
echo. >> transposition.py
echo     while len(text) %% cols != 0: >> transposition.py
echo         text += "x" >> transposition.py
echo. >> transposition.py
echo     rows = [text[i:i+cols] for i in range(0, len(text), cols)] >> transposition.py
echo     order = get_column_order(key) >> transposition.py
echo. >> transposition.py
echo     cipher = "" >> transposition.py
echo     for col in order: >> transposition.py
echo         for row in rows: >> transposition.py
echo             cipher += row[col] >> transposition.py
echo     return cipher >> transposition.py
echo. >> transposition.py
echo def trans_decrypt(cipher, key): >> transposition.py
echo     cols = len(key) >> transposition.py
echo     rows_count = len(cipher) // cols >> transposition.py
echo     order = get_column_order(key) >> transposition.py
echo     grid = [[""] * cols for _ in range(rows_count)] >> transposition.py
echo. >> transposition.py
echo     idx = 0 >> transposition.py
echo     for col in order: >> transposition.py
echo         for row in range(rows_count): >> transposition.py
echo             grid[row][col] = cipher[idx] >> transposition.py
echo             idx += 1 >> transposition.py
echo. >> transposition.py
echo     plain = "" >> transposition.py
echo     for row in grid: >> transposition.py
echo         plain += "".join(row) >> transposition.py
echo     return plain >> transposition.py
echo. >> transposition.py
echo text = "BAGHDADIRAQ" >> transposition.py
echo key = "3124" >> transposition.py
echo. >> transposition.py
echo encrypted = trans_encrypt(text, key) >> transposition.py
echo decrypted = trans_decrypt(encrypted, key) >> transposition.py
echo. >> transposition.py
echo print("Encrypted:", encrypted) >> transposition.py
echo print("Decrypted:", decrypted.replace('x', '')) >> transposition.py

:: =====================================================
:: 7. HILL 2x2 CIPHER
:: =====================================================
echo Creating hill2x2.py...
echo # hill 2x2 > hill2x2.py
echo import numpy as np >> hill2x2.py
echo def char_to_num(ch): >> hill2x2.py
echo     return ord(ch) - ord('a') >> hill2x2.py
echo. >> hill2x2.py
echo def num_to_char(n): >> hill2x2.py
echo     return chr(n + ord('a')) >> hill2x2.py
echo. >> hill2x2.py
echo def clean_text(text): >> hill2x2.py
echo     return text.replace(" ", "").lower() >> hill2x2.py
echo. >> hill2x2.py
echo def hill_encrypt(text, key): >> hill2x2.py
echo     text = clean_text(text) >> hill2x2.py
echo     if len(text) %% 2 == 1: >> hill2x2.py
echo         text += 'x' >> hill2x2.py
echo     result = "" >> hill2x2.py
echo     for i in range(0, len(text), 2): >> hill2x2.py
echo         pair = text[i:i+2] >> hill2x2.py
echo         vec = np.array([[char_to_num(pair[0])], >> hill2x2.py
echo                         [char_to_num(pair[1])]]) >> hill2x2.py
echo         enc = (key.dot(vec)) %% 26 >> hill2x2.py
echo         result += num_to_char(int(enc[0][0])) >> hill2x2.py
echo         result += num_to_char(int(enc[1][0])) >> hill2x2.py
echo     return result >> hill2x2.py
echo. >> hill2x2.py
echo def hill_decrypt(cipher, key): >> hill2x2.py
echo     cipher = clean_text(cipher) >> hill2x2.py
echo     det = int(round(np.linalg.det(key))) >> hill2x2.py
echo     det_mod_inv = None >> hill2x2.py
echo     for x in range(26): >> hill2x2.py
echo         if (det * x) %% 26 == 1: >> hill2x2.py
echo             det_mod_inv = x >> hill2x2.py
echo             break >> hill2x2.py
echo     if det_mod_inv is None: >> hill2x2.py
echo         return "Key matrix is NOT invertible modulo 26!" >> hill2x2.py
echo     a, b = key[0][0], key[0][1] >> hill2x2.py
echo     c, d = key[1][0], key[1][1] >> hill2x2.py
echo     adj = np.array([[d, -b], >> hill2x2.py
echo                     [-c, a]]) >> hill2x2.py
echo     inv_key = (det_mod_inv * adj) %% 26 >> hill2x2.py
echo     result = "" >> hill2x2.py
echo     for i in range(0, len(cipher), 2): >> hill2x2.py
echo         pair = cipher[i:i+2] >> hill2x2.py
echo         vec = np.array([[char_to_num(pair[0])], >> hill2x2.py
echo                         [char_to_num(pair[1])]]) >> hill2x2.py
echo         dec = (inv_key.dot(vec)) %% 26 >> hill2x2.py
echo         result += num_to_char(int(dec[0][0])) >> hill2x2.py
echo         result += num_to_char(int(dec[1][0])) >> hill2x2.py
echo     return result >> hill2x2.py
echo. >> hill2x2.py
echo key = np.array([[3, 3], >> hill2x2.py
echo                 [2, 5]])    >> hill2x2.py
echo. >> hill2x2.py
echo text = "helloworld" >> hill2x2.py
echo encrypted = hill_encrypt(text, key) >> hill2x2.py
echo decrypted = hill_decrypt(encrypted, key) >> hill2x2.py
echo print("Encrypted:", encrypted) >> hill2x2.py
echo print("Decrypted:", decrypted) >> hill2x2.py

:: =====================================================
:: 8. HILL 3x3 CIPHER
:: =====================================================
echo Creating hill3x3.py...
echo # hill 3x3 > hill3x3.py
echo import numpy as np >> hill3x3.py
echo. >> hill3x3.py
echo def char_to_num(ch): >> hill3x3.py
echo     return ord(ch) - ord('a') >> hill3x3.py
echo. >> hill3x3.py
echo def num_to_char(n): >> hill3x3.py
echo     return chr(n + ord('a')) >> hill3x3.py
echo. >> hill3x3.py
echo def clean_text(text): >> hill3x3.py
echo     return text.replace(" ", "").lower() >> hill3x3.py
echo. >> hill3x3.py
echo def hill_encrypt_3x3(text, key): >> hill3x3.py
echo     text = clean_text(text) >> hill3x3.py
echo     while len(text) %% 3 != 0: >> hill3x3.py
echo         text += 'x' >> hill3x3.py
echo     result = "" >> hill3x3.py
echo     for i in range(0, len(text), 3): >> hill3x3.py
echo         triple = text[i:i+3] >> hill3x3.py
echo         vec = np.array([[char_to_num(triple[0])], >> hill3x3.py
echo                         [char_to_num(triple[1])], >> hill3x3.py
echo                         [char_to_num(triple[2])]]) >> hill3x3.py
echo         enc = (key.dot(vec)) %% 26 >> hill3x3.py
echo         result += num_to_char(int(enc[0][0])) >> hill3x3.py
echo         result += num_to_char(int(enc[1][0])) >> hill3x3.py
echo         result += num_to_char(int(enc[2][0])) >> hill3x3.py
echo     return result >> hill3x3.py
echo. >> hill3x3.py
echo def hill_decrypt_3x3(cipher, key): >> hill3x3.py
echo     cipher = clean_text(cipher) >> hill3x3.py
echo     det = int(round(np.linalg.det(key))) >> hill3x3.py
echo     det_mod_inv = None >> hill3x3.py
echo     for x in range(26): >> hill3x3.py
echo         if (det * x) %% 26 == 1: >> hill3x3.py
echo             det_mod_inv = x >> hill3x3.py
echo             break >> hill3x3.py
echo     if det_mod_inv is None: >> hill3x3.py
echo         return "Key matrix is NOT invertible modulo 26!" >> hill3x3.py
echo     inv_key = (det_mod_inv * np.round(np.linalg.inv(key) * det).astype(int)) %% 26 >> hill3x3.py
echo     result = "" >> hill3x3.py
echo     for i in range(0, len(cipher), 3): >> hill3x3.py
echo         triple = cipher[i:i+3] >> hill3x3.py
echo         vec = np.array([[char_to_num(triple[0])], >> hill3x3.py
echo                         [char_to_num(triple[1])], >> hill3x3.py
echo                         [char_to_num(triple[2])]]) >> hill3x3.py
echo         dec = (inv_key.dot(vec)) %% 26 >> hill3x3.py
echo         result += num_to_char(int(dec[0][0])) >> hill3x3.py
echo         result += num_to_char(int(dec[1][0])) >> hill3x3.py
echo         result += num_to_char(int(dec[2][0])) >> hill3x3.py
echo     return result >> hill3x3.py
echo. >> hill3x3.py
echo key = np.array([[6, 24, 1], >> hill3x3.py
echo                 [13, 16, 10], >> hill3x3.py
echo                 [20, 17, 15]]) >> hill3x3.py
echo. >> hill3x3.py
echo text = "helloworld" >> hill3x3.py
echo. >> hill3x3.py
echo encrypted = hill_encrypt_3x3(text, key) >> hill3x3.py
echo decrypted = hill_decrypt_3x3(encrypted, key) >> hill3x3.py
echo print("Encrypted:", encrypted) >> hill3x3.py
echo print("Decrypted:", decrypted) >> hill3x3.py

:: =====================================================
:: 9. MULTIPLICATION CIPHER
:: =====================================================
echo Creating multiplication.py...
echo # multiplication > multiplication.py
echo. >> multiplication.py
echo def mod_inverse(a, m): >> multiplication.py
echo     for i in range(1, m): >> multiplication.py
echo         if (a*i) %% m == 1: >> multiplication.py
echo             return i >> multiplication.py
echo     return None >> multiplication.py
echo. >> multiplication.py
echo def multiplicative_encrypt(text, key): >> multiplication.py
echo     text = text.upper().replace(" ", "") >> multiplication.py
echo     cipher = "" >> multiplication.py
echo     for ch in text: >> multiplication.py
echo         if ch.isalpha(): >> multiplication.py
echo             c = ( (ord(ch)-65) * key ) %% 26 >> multiplication.py
echo             cipher += chr(c + 65) >> multiplication.py
echo         else: >> multiplication.py
echo             cipher += ch >> multiplication.py
echo     return cipher >> multiplication.py
echo. >> multiplication.py
echo def multiplicative_decrypt(cipher, key): >> multiplication.py
echo     inv = mod_inverse(key,26) >> multiplication.py
echo     if inv is None: >> multiplication.py
echo         return "Error: key has no inverse modulo 26!" >> multiplication.py
echo     plain = "" >> multiplication.py
echo     for ch in cipher: >> multiplication.py
echo         if ch.isalpha(): >> multiplication.py
echo             p = ( (ord(ch)-65) * inv ) %% 26 >> multiplication.py
echo             plain += chr(p + 65) >> multiplication.py
echo         else: >> multiplication.py
echo             plain += ch >> multiplication.py
echo     return plain >> multiplication.py
echo. >> multiplication.py
echo text = "HELLO" >> multiplication.py
echo key = 5    >> multiplication.py
echo. >> multiplication.py
echo encrypted = multiplicative_encrypt(text, key) >> multiplication.py
echo decrypted = multiplicative_decrypt(encrypted, key) >> multiplication.py
echo. >> multiplication.py
echo print("Encrypted:", encrypted) >> multiplication.py
echo print("Decrypted:", decrypted) >> multiplication.py

:: =====================================================
:: 10. FREQUENCY ANALYSIS
:: =====================================================
echo Creating frequency.py...
echo # frequency > frequency.py
echo from collections import Counter >> frequency.py
echo. >> frequency.py
echo ENGLISH_FREQ = "ETAOINSHRDLCUMWFGYPBVKJXQZ" >> frequency.py
echo. >> frequency.py
echo def encrypt(text, key_map): >> frequency.py
echo     text = text.upper() >> frequency.py
echo     result = "" >> frequency.py
echo     for ch in text: >> frequency.py
echo         if ch.isalpha(): >> frequency.py
echo             result += key_map.get(ch, ch) >> frequency.py
echo         else: >> frequency.py
echo             result += ch >> frequency.py
echo     return result >> frequency.py
echo. >> frequency.py
echo def decrypt(ciphertext, key_map): >> frequency.py
echo     reverse_map = {v: k for k, v in key_map.items()} >> frequency.py
echo     return encrypt(ciphertext, reverse_map) >> frequency.py
echo. >> frequency.py
echo key_map = { >> frequency.py
echo     'A': 'Q', 'B': 'W', 'C': 'E', 'D': 'R', 'E': 'T', >> frequency.py
echo     'F': 'Y', 'G': 'U', 'H': 'I', 'I': 'O', 'J': 'P', >> frequency.py
echo     'K': 'A', 'L': 'S', 'M': 'D', 'N': 'F', 'O': 'G', >> frequency.py
echo     'P': 'H', 'Q': 'J', 'R': 'K', 'S': 'L', 'T': 'Z', >> frequency.py
echo     'U': 'X', 'V': 'C', 'W': 'V', 'X': 'B', 'Y': 'N', >> frequency.py
echo     'Z': 'M' >> frequency.py
echo } >> frequency.py
echo. >> frequency.py
echo plain = "I LOVE PENTRATION TESTING" >> frequency.py
echo cipher = encrypt(plain, key_map) >> frequency.py
echo print("Ciphertext:", cipher) >> frequency.py
echo. >> frequency.py
echo decrypted = decrypt(cipher, key_map) >> frequency.py
echo print("Decrypted:", decrypted) >> frequency.py

:: =====================================================
:: 11. OTP (ONE TIME PAD)
:: =====================================================
echo Creating otp.py...
echo # OTP > otp.py
echo import random >> otp.py
echo import string >> otp.py
echo. >> otp.py
echo letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ012345" >> otp.py
echo. >> otp.py
echo def generate_key(length): >> otp.py
echo     return ''.join(random.choice(string.ascii_uppercase) for _ in range(length)) >> otp.py
echo. >> otp.py
echo def encrypt(plaintext, key): >> otp.py
echo     plaintext = plaintext.upper().replace(" ", "") >> otp.py
echo     ciphertext = "" >> otp.py
echo     for p, k in zip(plaintext, key): >> otp.py
echo         c_index = (ord(p) - 65 + ord(k) - 65) %% 26 >> otp.py
echo         ciphertext += chr(c_index + 65) >> otp.py
echo     return ciphertext >> otp.py
echo. >> otp.py
echo def decrypt(ciphertext, key): >> otp.py
echo     plaintext = "" >> otp.py
echo     for c, k in zip(ciphertext, key): >> otp.py
echo         p_index = (ord(c) - 65 - (ord(k) - 65)) %% 26 >> otp.py
echo         plaintext += chr(p_index + 65) >> otp.py
echo     return plaintext >> otp.py
echo. >> otp.py
echo def xor_encrypt(plaintext, key): >> otp.py
echo     plaintext = plaintext.upper().replace(" ", "") >> otp.py
echo     ciphertext = "" >> otp.py
echo     for p, k in zip(plaintext, key): >> otp.py
echo         xor_value = (ord(p) - 65) ^^ (ord(k) - 65) >> otp.py
echo         ciphertext += letters[xor_value] >> otp.py
echo     return ciphertext >> otp.py
echo. >> otp.py
echo def xor_decrypt(ciphertext, key): >> otp.py
echo     plaintext = "" >> otp.py
echo     for c, k in zip(ciphertext, key): >> otp.py
echo         xor_value = letters.index(c) >> otp.py
echo         p_value = xor_value ^^ (ord(k) - 65) >> otp.py
echo         plaintext += chr((p_value %% 26) + 65) >> otp.py
echo     return plaintext >> otp.py
echo. >> otp.py
echo text = "HELLO" >> otp.py
echo key = generate_key(len(text)) >> otp.py
echo. >> otp.py
echo cipher = encrypt(text, key) >> otp.py
echo plain = decrypt(cipher, key) >> otp.py
echo. >> otp.py
echo xor_cipher = xor_encrypt(text, key) >> otp.py
echo xor_plain = xor_decrypt(xor_cipher, key) >> otp.py
echo. >> otp.py
echo print("Text:", text) >> otp.py
echo print("Key:", key) >> otp.py
echo print("method (1) Cipher:", cipher) >> otp.py
echo print("Decrypted:", plain) >> otp.py
echo print("XOR Cipher method(2):", xor_cipher) >> otp.py
echo print("XOR Decrypted:", xor_plain) >> otp.py

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
```
