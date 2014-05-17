function piano
clear all
close all
clc

    t =0.5;
    
    % Define exponential coefficient
    pow=-0.1*t;
    ex=2.71^pow;
   
    % The tone to pe produced
    x=linspace(0,t*30*pi,t*15000);

    % Notes between C2-B3
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
                
    
    % Get ascii codes of pressed buttons and play the notes
    while(1)
        ch = getkey(1);
            if (ch==27)
                break;
            
            elseif (ch==113)
                sound(C2)
    
            elseif (ch==119)
                sound(D2)
                
            elseif (ch==101)
                sound(E2)
                
            elseif (ch==114)   
                sound(F2)
                
            elseif (ch==116)
                sound(G2)
                
             elseif (ch==121)
                sound(A2)
                
             elseif (ch==117)
                sound(B2)
                
             elseif (ch==97)
                sound(C3)
                
             elseif (ch==115)
                sound(D3)
                
             elseif (ch==100)
                sound(E3)
                
             elseif (ch==102)
                sound(F3)
                
             elseif (ch==103)
                sound(G3)
                
             elseif (ch==104)
                sound(A3)
                
             elseif (ch==106)
                sound(B3)
            end
    end
            
    end
     