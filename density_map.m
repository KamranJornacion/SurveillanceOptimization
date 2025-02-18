function d = density_map(x, y, t)
%{
Generate a density map with hotspots around given centers. Density decays exponentially with distance from the centers.
 
--- Inputs ---
x, y: n by n meshgrid of x and y coordinates (used for agent positioning or grid points).
t: time (used for global time decay).

--- Outputs ---
d: n by n density map with hotspots around centers, decaying exponentially with distance.
%}

% Define parameters
% Exponential decay rate
lambda = 0.1; 

%location of hot spots
centers =[-10,-20;-11,-20;-27,-14;-27,-13;14,-3;32,-10;32,-11;32,-12;32,-13;40,-15;14,1;14,7;27,2;8,12;26,10;13,20;14,20;15,20;16,20;-32,13;-32,12;-22,20;-8,20;-7,20;-6,20];

% Calculates number of centers
num_centers = size(centers, 1);  

% Initialize density map with zeros
d = zeros(size(x));

% iterate through hot spots and calculate density
for i = 1:num_centers
    %distance to hot spot calculation
    dist = sqrt((x - centers(i, 1)).^2 + (y - centers(i, 2)).^2);
    
    % Apply exponential decay for each center and add to the density map
    d = d + exp(-lambda * dist);
end

%Normalize density output between a range from [0,1]
d = d / max(d(:));

end
