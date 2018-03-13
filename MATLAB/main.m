%% MAIN PROGRAM

%%
% Initialisation
clear all;
close all;
clc;
%%
test;
path_in = 'C:\Users\talmezh\Desktop\Annee3\H18\Projet3\Code\Projet3\Poisson_module';
name_in = '\depth5solver5.ply';
name_out = '\depth5solver5_sortie.ply';
write_ply([path_in,name_in],xyz);
run_poisson([path_in,name_in],[path_in, name_out], 'ascii');