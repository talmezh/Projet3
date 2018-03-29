% extract a slice from finished model
xyz_model = read_ply([path_in, name_out]);

for i = 1:size(center,1)
    transform = make_transform3d(center(i,1), center(i,2), center(i,3), theta(i,1), theta(i,2), theta(i,3));
    [X, Y, Z] = transformPointsInverse(transform, xyz_model(:,1), xyz_model(:,2), xyz_model(:,3));
    id = find(round(Z) == 0 );
    slice = unique([round(X(id)) round(Y(id))], 'rows'); 
    truth = zeros(nb_pts(i), 2);
    [slice(:,1), slice(:,2)] = sort_vertices(slice(:,1), slice(:,2));
    [truth(:,1), truth(:,2)] = sort_vertices( pts(1:nb_pts(i),1,i)-dim(1)/2, pts(1:nb_pts(i),2,i)-dim(2)/2);
    dicey(i) = dice(dim(1), dim(2), truth(:,1), truth(:,2), slice(:,1), slice(:,2));
end
mean(dicey)
