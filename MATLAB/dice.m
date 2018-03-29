function [dice] = dice(dimension_x, dimension_y, truth_x, truth_y, model_x, model_y)
truth = zeros(dimension_x, dimension_y);
model = zeros(dimension_x, dimension_y);

truth = poly2mask(truth_x+dimension_x/2, truth_y+dimension_y/2, dimension_x, dimension_y);
model = poly2mask(model_x+dimension_x/2, model_y+dimension_y/2, dimension_x, dimension_y);

dice = 2*nnz(model&truth)/(nnz(model)+nnz(truth));
end

