@echo off
setlocal enabledelayedexpansion

REM Set the directory to the current folder
cd /d "%~dp0"

echo Creating Lab Files...

REM ============================================================
REM LAB 1
REM ============================================================
echo # LAB 1 > lab1.py
echo # Remove special character and spaces >> lab1.py
echo. >> lab1.py
echo plain = "third stage morning and evening study at Cyber security engineering techniques" >> lab1.py
echo clean_text = "" >> lab1.py
echo for c in plain: >> lab1.py
echo     if c.isalnum(): >> lab1.py
echo         clean_text += c >> lab1.py
echo print(clean_text) >> lab1.py

REM ============================================================
REM LAB 2
REM ============================================================
echo # LAB 2 > lab2.py
echo # Caesar Cipher E/D >> lab2.py
echo. >> lab2.py
echo m = "Hello, World! This is Hussein. ABC xyz" >> lab2.py
echo k = 3 >> lab2.py
echo e = "" >> lab2.py
echo for c in m: >> lab2.py
echo     if c.isalpha(): >> lab2.py
echo         n = ord(c.lower()) - 97 >> lab2.py
echo         e += chr((n + k) %% 26 + 97) >> lab2.py
echo print(e.upper()) >> lab2.py
echo d = "" >> lab2.py
echo for c in e: >> lab2.py
echo     d += chr((ord(c) - 97 - k) %% 26 + 97) >> lab2.py
echo print(d) >> lab2.py

REM ============================================================
REM LAB 3
REM ============================================================
REM Note: I fixed the smart quote (’) to a normal quote (') to prevent Python errors
echo # LAB 3 > lab3.py
echo # Substitution Cipher E/D >> lab3.py
echo. >> lab3.py
echo p = 'dulceetdecormestpro' >> lab3.py
echo a = 'abcdefghijklmnopqrstuvwxyz' >> lab3.py
echo k = 'HWUGCTVAEKDYQPBRJLFIXMSOZN' >> lab3.py
echo e = '' >> lab3.py
echo for c in p: >> lab3.py
echo     if c in a: >> lab3.py
echo         e += k[a.index(c)] >> lab3.py
echo print(e) >> lab3.py
echo d = '' >> lab3.py
echo for c in e: >> lab3.py
echo     if c in k: >> lab3.py
echo         d += a[k.index(c)] >> lab3.py
echo print(d) >> lab3.py

REM ============================================================
REM LAB 4
REM ============================================================
echo # LAB 4 > lab4.py
echo # Vigenere Cipher E/D >> lab4.py
echo. >> lab4.py
echo p = input().lower() >> lab4.py
echo k = input().lower() >> lab4.py
echo e = '' >> lab4.py
echo for i in range(len(p)): >> lab4.py
echo     if p[i].isalpha(): >> lab4.py
echo         e += chr((ord(p[i]) - 97 + ord(k[i %% len(k)]) - 97) %% 26 + 97) >> lab4.py
echo print(e) >> lab4.py
echo d = '' >> lab4.py
echo for i in range(len(e)): >> lab4.py
echo     d += chr((ord(e[i]) - 97 - (ord(k[i %% len(k)]) - 97)) %% 26 + 97) >> lab4.py
echo print(d) >> lab4.py

REM ============================================================
REM LAB 5
REM ============================================================
echo # LAB 5 > lab5.py
echo # Hill Cipher E/D >> lab5.py
echo. >> lab5.py
echo import numpy as np >> lab5.py
echo. >> lab5.py
echo k = np.array([[6,24,1], >> lab5.py
echo               [13,16,10], >> lab5.py
echo               [20,17,15]]) >> lab5.py
echo. >> lab5.py
echo m = "helloworld" >> lab5.py
echo while len(m) %% 3 != 0: >> lab5.py
echo     m += "x" >> lab5.py
echo. >> lab5.py
echo # Encrypt >> lab5.py
echo e = "" >> lab5.py
echo for i in range(0, len(m), 3): >> lab5.py
echo     p = np.array([ord(m[i])-97, ord(m[i+1])-97, ord(m[i+2])-97]) >> lab5.py
echo     c = k.dot(p) %% 26 >> lab5.py
echo     e += "".join(chr(x+97) for x in c) >> lab5.py
echo print(e) >> lab5.py
echo. >> lab5.py
echo # Key inverse (mod 26) >> lab5.py
echo det = int(round(np.linalg.det(k))) %% 26 >> lab5.py
echo for i in range(26): >> lab5.py
echo     if (det * i) %% 26 == 1: >> lab5.py
echo         di = i >> lab5.py
echo         break >> lab5.py
echo. >> lab5.py
echo adj = np.round(det * np.linalg.inv(k)).astype(int) %% 26 >> lab5.py
echo ki = (di * adj) %% 26 >> lab5.py
echo. >> lab5.py
echo # Decrypt >> lab5.py
echo x = "" >> lab5.py
echo for i in range(0, len(e), 3): >> lab5.py
echo     p = np.array([ord(e[i])-97, ord(e[i+1])-97, ord(e[i+2])-97]) >> lab5.py
echo     c = ki.dot(p) %% 26 >> lab5.py
echo     x += "".join(chr(v+97) for v in c) >> lab5.py
echo. >> lab5.py
echo print(x) >> lab5.py

REM ============================================================
REM LAB 6
REM ============================================================
echo # LAB 6 > lab6.py
echo # Affine cipher E/D >> lab6.py
echo. >> lab6.py
echo m = "helloworld" >> lab6.py
echo a = 5 >> lab6.py
echo b = 8 >> lab6.py
echo e = "" >> lab6.py
echo for c in m: >> lab6.py
echo     e += chr((a * (ord(c) - 97) + b) %% 26 + 97) >> lab6.py
echo print(e) >> lab6.py
echo for i in range(26): >> lab6.py
echo     if (a * i) %% 26 == 1: >> lab6.py
echo         ai = i >> lab6.py
echo         break >> lab6.py
echo d = "" >> lab6.py
echo for c in e: >> lab6.py
echo     d += chr((ai * ((ord(c) - 97) - b)) %% 26 + 97) >> lab6.py
echo print(d) >> lab6.py

REM ============================================================
REM LAB 7
REM ============================================================
echo # LAB 7 > lab7.py
echo # Transposition cipher E/D >> lab7.py
echo. >> lab7.py
echo m = "helloworld" >> lab7.py
echo k = "hack" >> lab7.py
echo # pad message >> lab7.py
echo while len(m) %% len(k) != 0: >> lab7.py
echo     m += "x" >> lab7.py
echo # key order >> lab7.py
echo order = sorted((ch, i) for i, ch in enumerate(k)) >> lab7.py
echo # encryption >> lab7.py
echo e = "" >> lab7.py
echo for _, c in order: >> lab7.py
echo     e += "".join(m[i + c] for i in range(0, len(m), len(k))) >> lab7.py
echo print(e) >> lab7.py
echo # decryption >> lab7.py
echo d = [""] * len(e) >> lab7.py
echo x = 0 >> lab7.py
echo for _, c in order: >> lab7.py
echo     for i in range(0, len(e), len(k)): >> lab7.py
echo         d[i + c] = e[x] >> lab7.py
echo         x += 1 >> lab7.py
echo print("".join(d)) >> lab7.py

REM ============================================================
REM LAB 8
REM ============================================================
REM The ^< symbol is needed to escape the 'less than' sign in Batch
echo # LAB 8 > lab8.py
echo # Playfair cipher E/D >> lab8.py
echo m="helloworld" >> lab8.py
echo k="monarchy" >> lab8.py
echo a="abcdefghiklmnopqrstuvwxyz" >> lab8.py
echo kp="" >> lab8.py
echo for c in k.lower(): >> lab8.py
echo     if c=="j":c="i" >> lab8.py
echo     if c not in kp:kp+=c >> lab8.py
echo for c in a: >> lab8.py
echo     if c not in kp:kp+=c >> lab8.py
echo s=[[kp[i*5+j]for j in range(5)]for i in range(5)] >> lab8.py
echo p="" >> lab8.py
echo for c in m.lower(): >> lab8.py
echo     if c=="j":c="i" >> lab8.py
echo     if c.isalpha():p+=c >> lab8.py
echo t="" >> lab8.py
echo i=0 >> lab8.py
echo while i^<len(p): >> lab8.py
echo     c1=p[i] >> lab8.py
echo     if i==len(p)-1:t+=c1+"x";break >> lab8.py
echo     c2=p[i+1] >> lab8.py
echo     if c1==c2:t+=c1+"x";i+=1 >> lab8.py
echo     else:t+=c1+c2;i+=2 >> lab8.py
echo e="" >> lab8.py
echo i=0 >> lab8.py
echo while i^<len(t): >> lab8.py
echo     c1,c2=t[i],t[i+1] >> lab8.py
echo     for r in range(5): >> lab8.py
echo         for c in range(5): >> lab8.py
echo             if s[r][c]==c1:r1,c1p=r,c >> lab8.py
echo             if s[r][c]==c2:r2,c2p=r,c >> lab8.py
echo     if r1==r2:e+=s[r1][(c1p+1)%%5]+s[r2][(c2p+1)%%5] >> lab8.py
echo     elif c1p==c2p:e+=s[(r1+1)%%5][c1p]+s[(r2+1)%%5][c2p] >> lab8.py
echo     else:e+=s[r1][c2p]+s[r2][c1p] >> lab8.py
echo     i+=2 >> lab8.py
echo print(e) >> lab8.py
echo d="" >> lab8.py
echo i=0 >> lab8.py
echo while i^<len(e): >> lab8.py
echo     c1,c2=e[i],e[i+1] >> lab8.py
echo     for r in range(5): >> lab8.py
echo         for c in range(5): >> lab8.py
echo             if s[r][c]==c1:r1,c1p=r,c >> lab8.py
echo             if s[r][c]==c2:r2,c2p=r,c >> lab8.py
echo     if r1==r2:d+=s[r1][(c1p-1)%%5]+s[r2][(c2p-1)%%5] >> lab8.py
echo     elif c1p==c2p:d+=s[(r1-1)%%5][c1p]+s[(r2-1)%%5][c2p] >> lab8.py
echo     else:d+=s[r1][c2p]+s[r2][c1p] >> lab8.py
echo     i+=2 >> lab8.py
echo print(d) >> lab8.py

REM ============================================================
REM OPEN VS CODE
REM ============================================================
set "VSCODE="
if exist "%LOCALAPPDATA%\Programs\Microsoft VS Code\Code.exe" set "VSCODE=%LOCALAPPDATA%\Programs\Microsoft VS Code\Code.exe"
if not defined VSCODE if exist "%PROGRAMFILES%\Microsoft VS Code\Code.exe" set "VSCODE=%PROGRAMFILES%\Microsoft VS Code\Code.exe"
if not defined VSCODE if exist "%PROGRAMFILES(X86)%\Microsoft VS Code\Code.exe" set "VSCODE=%PROGRAMFILES(X86)%\Microsoft VS Code\Code.exe"

if defined VSCODE (
    echo Opening VS Code...
    start "" "%VSCODE%" . "lab1.py" "lab2.py" "lab3.py" "lab4.py" "lab5.py" "lab6.py" "lab7.py" "lab8.py"
) else (
    echo VS Code not found, but files were created.
    pause
)

endlocal
exit /b
