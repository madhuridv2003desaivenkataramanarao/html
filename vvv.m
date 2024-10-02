%for single thrshold n accuracy
clc
clearvars
close all

pkg load image
load p44.mat
load ground_truth_p44.mat
gimg=rgb2gray(img);
thresh=1:1:254;
for k=1:length(thresh)
  disp(k)
  bin{k}=gimg<thresh(k);

endfor
for k=1:length(thresh)
  TP(k)=nnz(A==1 & bin{k}==1);
  FP(k)=nnz(A==0 & bin{k}==1);
  TN(k)=nnz(A==0 & bin{k}==0);
  FN(k)=nnz(A==1 & bin{k}==0);
  Accuracy(k)=(TP(k)+TN(k))/(TP(k)+TN(k)+FN(k)+FP(k));
  Tprate{k}=TP(k)/(TP(k)+FN(k));
  Fprate{k}=FP(k)/(FP(k)+TN(k));
endfor
bestvalue=max(Accuracy);
bestimg=find(Accuracy==max(Accuracy));
figure
imshowpair(bin{bestimg},A,'montage')
figure
plot(Fprate,Tprate)
xlabel("Frate");
ylabel("Trate");
title("ROC of 1st threshold value",'FontSize',20);
