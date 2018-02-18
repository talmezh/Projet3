function [] = write_ply(name, pts_norm)
% Writes 3D point data into PLY format using ascii encoding
% Only works for point clouds, does not support facettes

% name: Full name of the file. give full directory to save in another
% location than current dir

% pts_norm: Nx6 matrix containing vertice attributes (x, y, z, nx, ny, nz)

% Open file for writing
fichier = fopen(name,'w');
%Write PLY header
PLY_HEADER = sprintf(['ply \nformat ascii 1.0 \nelement vertex %d'...
                        '\nproperty double x \nproperty double y'...
                        '\nproperty double z \nproperty double nx'...
                        '\nproperty double ny\nproperty double nz'...
                        '\nend_header\n'],size(pts_norm,1));
fprintf(fichier,PLY_HEADER);
% Write vertices information
for n=1:size(pts_norm,1)
    line = sprintf('%17.15f %17.15f %17.15f %17.15f %17.15f %17.15f\n',...
        pts_norm(n,:));
    fprintf(fichier, line);
end
% Close file
fclose(fichier);
end

