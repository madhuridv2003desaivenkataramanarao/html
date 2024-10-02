% to find accracy
function[accu,TPrate,FPrate]=Accurate(testing,ground_truth)
 TP=(ground_truth==1&testing==1);
 FP=(ground_truth==0&testing==1);
 TN=(ground_truth==0&testing==0);
 FN=(ground_truth==1&testing==0);
 accu=(TP+TN)/(TP+TN+FP+FN);
 TPrate=TP/(TP+FN);
 FPrate=FP/(FP+TN);
 endfunction
