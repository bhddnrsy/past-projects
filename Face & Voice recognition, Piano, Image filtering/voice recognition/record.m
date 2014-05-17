function [recObj] = record(Fs,nBits,nChannels) 
recObj = audiorecorder(Fs,nBits,nChannels);
disp('Start speaking.')
recordblocking(recObj, 1);
disp('End of Recording.');

% Play back the recording.
play(recObj);

% Store data in double-precision array.
myRecording = getaudiodata(recObj);
nx=length(myRecording);

% Plot the waveform.
%plot(myRecording);
%set(gcf,'Color','w');
%title('My Recording');

% Apply the Hamming Window function.
w=hamming(512,'periodic');
nw=length(w);
pos=1;
if (pos+nw <= nx)
    y = myRecording(pos:pos+nw-1).*w;
end
sk=y.*w;
%plot(sk);
%set(gcf,'Color','w');
%title('s(k)');

% Find the Fourier transform of s(k).
DFT_of_sk = fft(sk);
% Find V(n).
Vn = (abs(DFT_of_sk)).^2;
%plot(Vn);
%set(gcf,'Color','w');
%title('V(n)');

% Find the Inverse Fourier transform of log(Vn).
sd = ifft(log(Vn));
plot(sd);
set(gcf,'Color','w');
title('s(d)');

% Filter out the high frequency components of s(d).
vn=sd(1:32);
plot(vn);
set(gcf,'Color','w');
title('v(n)');

% Again find the Inverse Fourier transform of it.
IFT_of_vn = ifft(vn);
plot(IFT_of_vn);
set(gcf,'Color','w');
title('IFT(v(n))');

end






