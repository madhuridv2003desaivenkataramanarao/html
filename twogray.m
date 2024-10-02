%converting the ballons
clc;
clearvars;
close all;
pkg load image;
A=imread('C:\Users\SW\Desktop\ea733b17-6b66-4cc9-8128-d2b1e0ca3af9.jpg');
B=imread('C:\Users\SW\Desktop\b16f7dbb-20cc-4223-9920-0247062ce75c - Copy.jpg');
a=rgb2gray(A);
b=rgb2gray(B);
output=imadd(a,b);

