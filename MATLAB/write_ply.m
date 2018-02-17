function [] = write_ply(name, pts_norm)
    fichier = fopen(name,'w');
    PLY_HEADER = sprintf(['ply \nformat ascii 1.0 \nelement vertex %d'...
                            '\nproperty double x \nproperty double y'...
                            '\nproperty double z \nproperty double nx'...
                            '\nproperty double ny\nproperty double nz'...
                            '\nend_header\n'],size(pts_norm,1));
    fprintf(fichier,PLY_HEADER);
    for n=1:size(pts_norm,1)
        line = sprintf(['%17.15f %17.15f %17.15f %17.15f %17.15f '...
            '%17.15f\n'],pts_norm(n,:));
        fprintf(fichier, line);
    end
    fclose(fichier);
end

