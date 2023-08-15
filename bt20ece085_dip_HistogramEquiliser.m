
% Ritik Rangari ( BT20ECE085 )
clc;
clear all;
close all;
x=imread('bob.png');
subplot(3,2,1);
imshow(x);
title('Original Image');
subplot(3,2,2);
imhist(x);
title('Histogram using built in function(Original Image)');
axis tight;
h=zeros(1,256);
[r c]=size(x);
pixels=r*c;
n=0:255; 

j=histeq(x);
subplot(3,2,3);
imshow(j);
title('Histogram Equalization using built in function');
subplot(3,2,4);
imhist(j);
axis tight;
title('H. Equalization using built in function');

%Calculating Histogram without built-in function
for i=1:r
    for j=1:c
        h(x(i,j)+1)=h(x(i,j)+1)+1;
    end
end

%Calculating Probability
for i=1:256
    h(i)=h(i)/pixels;
end

%Calculating Cumulative Probability
rar=h(1);
for i=2:256
    rar=rar+h(i);
    h(i)=rar;
end

%Mapping
for i=1:r
    for j=1:c
        x(i,j)=round(h(x(i,j)+1)*255);
    end
end
subplot(3,2,5);
imshow(x);
title('Histogram Equalized image using own code');
subplot(3,2,6);
imhist(x);
axis tight;
title('H. Equalization using own code');