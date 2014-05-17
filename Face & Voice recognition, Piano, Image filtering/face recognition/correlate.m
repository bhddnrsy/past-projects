function corr = correlate(T,Ipart)

T1= T-mean(mean(T));
I1= Ipart-mean(mean(Ipart));

nT = sqrt(sum(sum(T1.^2)));
nI = sqrt(sum(sum(I1.^2)));

x = T1.*I1;
y = nT*nI;

corr = x/y;

z=1;