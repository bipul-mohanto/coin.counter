function []=coin_counter() 
clear all; 
close all;
clc;
total_coin=0;
rgb_img = imread('euros.bmp'); % img size 388,512
figure (1), imshow(rgb_img);
gray_img = rgb2gray(rgb_img);
figure(2),imshow(gray_img);
binary_img = im2bw(gray_img,0.27);
figure(3),imshow(binary_img);

%% phase coding method
% [centers, radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark','Sensitivity',0.97)
% imshow(rgb);
% h = viscircles(centers,radii);
% length(centers)
% delete(h);
% h=viscircles(centers,radii);
% length(centers)

% %%two stage method
% [centers, radii] = imfindcircles(rgb,[20 25], 'ObjectPolarity','dark','Sensitivity',0.95,'Method','twostage');
% h = viscircles(centers,radii);
% imshow(gray_image);
% [centersBright, radiiBright] = imfindcircles(rgb,[20 25],'ObjectPolarity','bright','Sensitivity',0.95);
% imshow(rgb);
% 
% hBright = viscircles(centersBright, radiiBright,'EdgeColor','b');
% [centersBright, radiiBright, metricBright] = imfindcircles(rgb,[20 25], ...
%     'ObjectPolarity','bright','Sensitivity',0.95,'EdgeThreshold',0.45);
% 
% delete(hBright);
% 
% hBright = viscircles(centersBright, radiiBright,'EdgeColor','b');
% h = viscircles(centers,radii);
% length(centers)

img_fill=imfill(binary_img,'holes');
figure(4);imshow(img_fill);
strl=strel('disk',1);
img_fill_opn=imopen(img_fill,strl);
figure(5);imshow(img_fill_opn);
[centers, radii] = imfindcircles(img_fill_opn,[11 42],'ObjectPolarity','bright', ...
   'Sensitivity',0.86,'edge',0.03);
close all;
imshow(rgb_img);
h=viscircles(centers,radii,'EdgeColor','b');
circle_num=size(radii);
length(circle_num);
for i = 1:circle_num
    if(radii(i) > 15.0 && radii(i) < 21.875)
        total_coin=total_coin+0.01;
    elseif(radii(i) >= 21.875 && radii(i) < 24.0789)
        total_coin=total_coin+0.02;
    elseif(radii(i) >= 24.0789 && radii(i) < 25.55525)
        total_coin=total_coin+0.10;
    elseif(radii(i) >= 25.55525 && radii(i) < 27.11755)
        total_coin=total_coin+0.05;
    elseif(radii(i) >= 27.11755 && radii(i) < 28.4806)
        total_coin=total_coin+0.20;
    elseif(radii(i) >= 28.4806 && radii(i) < 29.6918)
        total_coin=total_coin+1;
    elseif(radii(i) >= 29.6918 && radii(i) < 31.283)
        total_coin=total_coin+0.50;
    elseif (radii(i) >=31.283 && radii(i) <40)
            total_coin= total_coin+2;
        else
            total_coin=total_coin+0;
    end
end
total_coin

