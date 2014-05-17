PROCEDURE
1. Record voice signal for 1 sec at 20 kHz.
2. Take 512 samples from this recording which should approximately correspond to 25 ms.
3. Apply the windowing function to these N=512 samples.
Call the result s(k)
4. Find the Fourier transform of s(k). Take the absolute value square of this Fourier transformation
Call the result V(n)
5. Take the natural logarithm of V(n) and find its IFT (Inverse Fourier Transform)
Call the result ^s(d)
6. Filter out the high frequency components of ^s(d). Just take 32 low frequencies of ^s(d), equate all the high frequencies to zero. 
Call the result ^v(n).
7. Find reverse IFT of v(n).

EXPERIMENTS
1. Do the above steps for vowels ‘a’ and ‘o’.