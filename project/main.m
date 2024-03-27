clc;
clear all;

%Setting the given f
f = @(u,v) sin(u + v) * sin(v^2);

mutation_rate = 30;
max_gen = 10000;
gaussians = 15;
genes_size = gaussians*5;
[best_individual,best_error] = genetic_algorithm(gaussians,max_gen,mutation_rate);

%load best33mut.mat
plots(best_individual,genes_size,best_error)


gaussianNames = {'1st Gaussian';'2nd Gaussian';'3rd Gaussian';'4th Gaussian';...
    '5th Gaussian';'6th Gaussian';'7th Gaussian';'8th Gaussian';'9th Gaussian';...
    '10th Gaussian';'11th Gaussian';'12th Gaussian';'13th Gaussian';...
    '14th Gaussian';'15th Gaussian'};

A = best_individual(1:5:end)';
center1 = best_individual(2:5:end)'; 
center2 = best_individual(3:5:end)';
sigma1 = best_individual(4:5:end)'; 
sigma2 = best_individual(5:5:end)'; 
gaussians_table = table(gaussianNames,A,center1,center2,sigma1,sigma2);
disp(gaussians_table)

