% JARINGAN BERBASIS KOMPETISI
% Jaringan Kompetitif Dengan Bobot Adaptif
% Jaringan Kohonen SOM untuk mengguguskan empat vektor

% Contoh Soal
% Misalkan vektor yang akan diguguskan adalah sebagai berikut [1 1 0 0], [1
% 0 0 0], [0 0 0 1], [0 0 1 1]

% Cacah gugus maksimum yang harus dibentuk adalah dua. dimisalkan laju
% training (learning rate) alpha(0)=0,9 dan alpha(t+1)=0,5 alpha(t), dengan
% R = 0 (karena hanya dua gugus). Carilah matriks bobot setelah 100 iterasi
% (epoch).

% Solusi
clc;
x = [1 1 0 0;
    1 0 0 0;
    0 0 0 1;
    0 0 1 1] % Matriks pola masukan

% Bobot awal gugus 1
w1 = [0.2 0.6 0.5 0.9]

% Bobot awal gugus 2
w2 = [0.8 0.4 0.7 0.3]

% Laju training awal (learning rate)
a = 0.9

% Lakukan 100 iterasi (epoch)
for j = 1:100
    m = 2^(j-i); % Faktor pembagi laju (learning rate)
    
   for k = 1:4 %Pelatihan (training) dengan 4 vektor
       d1=0; d2=0;
      for i=1:4
            d1=d1+(w1(i)-x(k,i))^2; %Jarak ke vektor bobot 1
            d2=d2+(w2(i)-x(k,i))^2; %Jarak ke vektor bobot 2
       end;
       
       if d1<d2 
           bbt1 = w1+(a/m)*(x(k,:)-w1); % Bila vektor bobot 1 (bbt1) lebih dekat
           w1 = bbt1; % Perbarui vektor bobot 1
           
       else
           bbt2 = w2+(a/m)*(x(k,:)-w2); % Bila vektor bobot 2 (bbt2) lebih dekat
           w2 = bbt2; % Perbarui vektor bobot 2
       end;
       
        w1 = w1; % Vektor bobot 1 setelah satu pola di training
        w2 = w2; % Vektor bobot 2 setelah satu pola di training
   end;
   
   w1 = w1; % Vektor bobot 1 setelah 4 pola training
   w2 = w2; % Vektor bobot 2 setelah 4 pola training
end;

w1 = w1; % Vektor bobot 1 setelah 100 iterasi
w2 = w2; % Vektor bobot 2 setelah 100 iterasi