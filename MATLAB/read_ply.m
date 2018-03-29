function [xyz] = read_ply(filename)
fichier = fopen(filename, 'r');
vertex = 'element vertex';
header_end = 'end_header';
read_line = '';
while ~contains(read_line,vertex)
    read_line = fgetl(fichier);
end
nb_vertex = str2double(read_line(length(vertex)+1:end));
while ~contains(read_line,header_end)
    read_line = fgetl(fichier);
end
for i = 1:nb_vertex
      line = fgetl(fichier);
      coords = sscanf(line, '%f');
      xyz(i,:) = coords';
end
end

