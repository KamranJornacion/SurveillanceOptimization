function A = lloyds_adjacency_matrix(xy, rc)
%{
Let "n" be the number of agents.

--- Inputs ---
xy: n by 2 array holding position data for agents
    e.g., xy(j,2) is the y coordinate for agent-j

rc: radius of communication (scalar) used by all agents

--- Outputs ---
A:  n by n adjacency matrix
    e.g., if A(i,j) = 1, then agent-i receives a signal from agent-j
          if A(i,j) = 0, then agent-i receives NO signal from agent-j
%}

    % Number of agents
    n = size(xy, 1);

    % Initialize adjacency matrix with zeros
    A = zeros(n, n);

    % Iterate through each agent pair
    for i = 1:n
        for j = 1:n
            if i ~= j
                % Calculate distance between agent-i and agent-j
                dist = sqrt((xy(i, 1) - xy(j, 1))^2 + (xy(i, 2) - xy(j, 2))^2);

                % Verify if the distance is within the communication radius
                if dist <= rc
                    A(i, j) = 1; % Indicate agents i and j can communicate
                end
            end
        end
    end
end
