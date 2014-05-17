function jingle_bells
clear all
close all
clc

    t =0.2;
    pow=-0.1*t;
    ex=2.71^pow;
   
    x=linspace(0,t*30*pi,t*15000);

    C2=ex*(sin(65.41*x)+0.4*sin(2*65.41*x)+0.6*sin(3*65.41*x)+0.2*sin(4*65.41*x));
    D2=ex*(sin(73.42*x)+0.4*sin(2*73.42*x)+0.6*sin(3*73.42*x)+0.2*sin(4*73.42*x));
    E2=ex*(sin(82.41*x)+0.4*sin(2*82.41*x)+0.6*sin(3*82.41*x)+0.2*sin(4*82.41*x));
    F2=ex*(sin(87.31*x)+0.4*sin(2*87.31*x)+0.6*sin(3*87.31*x)+0.2*sin(4*87.31*x));
    G2=ex*(sin(98.00*x)+0.4*sin(2*98.00*x)+0.6*sin(3*98.00*x)+0.2*sin(4*98.00*x));
    A2=ex*(sin(110.00*x)+0.4*sin(2*110.00*x)+0.6*sin(3*110.00*x)+0.2*sin(4*110.00*x));
    B2=ex*(sin(123.47*x)+0.4*sin(2*123.47*x)+0.6*sin(3*123.47*x)+0.2*sin(4*123.47*x));
    C3=ex*(sin(130.81*x)+0.4*sin(2*130.81*x)+0.6*sin(3*130.81*x)+0.2*sin(4*130.81*x));
    D3=ex*(sin(146.83*x)+0.4*sin(2*146.83*x)+0.6*sin(3*146.83*x)+0.2*sin(4*146.83*x));
    E3=ex*(sin(164.81*x)+0.4*sin(2*164.81*x)+0.6*sin(3*164.81*x)+0.2*sin(4*164.81*x));
    F3=ex*(sin(174.61*x)+0.4*sin(2*174.61*x)+0.6*sin(3*174.61*x)+0.2*sin(4*174.61*x));
    G3=ex*(sin(196.00*x)+0.4*sin(2*196.00*x)+0.6*sin(3*196.00*x)+0.2*sin(4*196.00*x));
    A3=ex*(sin(220.00*x)+0.4*sin(2*220.00*x)+0.6*sin(3*220.00*x)+0.2*sin(4*220.00*x));
    B3=ex*(sin(246.94*x)+0.4*sin(2*246.94*x)+0.6*sin(3*246.94*x)+0.2*sin(4*246.94*x));
                
    N = 0.2*20000;
    er = zeros(1, .125*N); % eigth rest
    qr = zeros(1, .25*N); % quarter rest
    hr = zeros(1, .5*N); % half rest
    tr = zeros(1, .75*N); % three-quarter rest
    wr = zeros(1, N); % whole rest
    
    % tone parts
    jbseq1 = [A2 qr A2 qr A2 A2 qr]; 
    jbseq2 = [A2 qr C3 qr F2 qr G2 qr A2 A2 A2 hr]; 
    jbseq3 = [B2 qr B2 qr B2 qr B2 qr B2 qr A2 qr A2 qr A2 er A2 qr A2 qr G2 qr G2 qr A2 qr G2 G2 qr C3 C3 qr];
    jbseq4 = [B2 qr B2 qr B2 qr B2 qr B2 qr A2 qr A2 qr A2 er A2 qr C3 qr C3 qr B2 qr G2 qr F2 F2 F2]; 
    jbseq5 = [C2 qr A2 qr G2 qr F2 qr C2 C2 qr C2 er C2 qr C2 qr A2 qr G2 qr F2 qr D2 D2 D2 qr];
    jbseq6 = [D2 qr B2 qr A2 qr G2 qr E2 E2 E2 qr C3 qr C3 qr B2 qr G2 qr A2 A2 A2 qr];
    jbseq7 = [C2 qr A2 qr G2 qr F2 qr C2 C2 C2 qr C2 qr A2 qr G2 qr F2 qr D2 D2 D2 qr];
    jbseq8 = [D2 qr B2 qr A2 qr G2 qr C3 qr C3 qr C3 qr C3 er C3 qr D3 qr C3 qr B2 qr G2 qr F2 wr C3 C3 qr];
    jbseq9 = [B2 qr B2 qr B2 qr B2 qr B2 qr A2 qr A2 qr A2 er A2 qr C3 qr C3 qr B2 qr G2 qr F2 F2 F2 qr ];

%Song constructed from several, sometimes repeating, jbsequences
jbells2 = [jbseq1 jbseq1 jbseq2 jbseq3 jbseq1 jbseq1 jbseq2 jbseq4 jbseq5 jbseq6 jbseq7 jbseq8 jbseq1 jbseq1 jbseq2 jbseq3 jbseq1 jbseq1 jbseq2 jbseq3 jbseq9];
sound(jbells2,16000);

            
    end
     