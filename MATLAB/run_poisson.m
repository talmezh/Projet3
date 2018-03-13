function [model] = run_poisson(in,out,encoding)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
path = ['C:\Users\talmezh\Desktop\Annee3\H18\Projet3\Code\Projet3'...
    '\Poisson_module\PoissonRecon.exe'];
if ~exist('encoding','var')
    encoding = '';
else
    encoding = ' --ascii ';
end
cmd_in = [' --in ',in];
cmd_out = [' --out ',out];


system([path, cmd_in, cmd_out, ' --depth 5']);
model=0;
end

