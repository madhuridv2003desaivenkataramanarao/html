clc
close all
clearvars

pkg load image
pkg load statistics
mat = dir ('database/*.mat');
for i = 1:51
 filename = fullfile('database',mat(i).name );
 load(filename);
 a=rgb2hsv(img);
 mask = (a(:,:,1)> 0.21 | a(:,:,2) > 0.48) ;
 se = strel('disk',5,0);
 %img_1 = imopen(imclose(mask,se),se);
 img_1 = imopen(mask,se);
 img_open = bwareaopen(img_1,50,4);
 cc = bwconncomp(img_open,4);
 t(i) = cc.NumObjects;
 imshowpair(img,img_open, 'montage');
 title(['Number of Balloons = ',num2str(cc.NumObjects)],'FontSize',20)
 pause(1);
end
true_class = [0 1 1 1 1 1 1 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 2 1 2 2 2 2 2 1 1 1 2 2 2 1 1 2 2 2 3 3 3 2 2];
c_m=confusionmat(true_class,t)
label=['0 balloon','1 balloon', '2 balloon','3 balloon']
s=confusionchart(c_m,label)
s.Title='number of balloons';
