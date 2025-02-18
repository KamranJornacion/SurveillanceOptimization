function [y1, E1] = update_agents(y0, ydot, x1, E0, dt)
%{
Let "n" be the number of agents.

--- Inputs ---
y0: n by 2 array holding all system outputs at timestep i
    e.g., y0(j,2) is the second output for agent-j

ydot: n by 2 array holding all system output time derivatives at timestep i
    e.g., ydot(j,2) is the second output time derivative for agent-j

x1: n by 2 array holding all consensus states for all agents at timestep i+1
    e.g., x1(j,2) is the second consensus state for agent-j

E0:  1 by n array holding energy data for all agents at timestep i
    e.g., E0(j) is the energy of agent-j at timestep i  

dt: timestep

--- Outputs ---
y1:  n by 2 array holding all system outputs at timestep i+1
     Same structure as y0.

E1: 1 by n array holding energy data for all agents at timestep i+1.
    Same structure as E0.
%}

IS_FLOCK = 1; % 0 = formation system; 1 = flocking system

if IS_FLOCK
    y1 = y0 + x1 * dt;
else
    y1 = x1;
end

E1 = E0;  % let energy pass through if you don't want to use it

% velocity restriction example --------------------------------------------
dvec = ydot * dt;
MAXD = 0.5;
if MAXD > 0
    n = length(y0);     % number of agents
    dmag = sqrt(sum(dvec.^2,2));
    for i=1:n
        r = dmag(i) / MAXD;
        if r > 1
            y1(i,:) = y0(i,:) + dvec(i,:) / r;
        end
    end
end

% energy consumption ------------------------------------------------------
ECPUD = 10;            % energy consumed per unit distance
dvec_sat = y1 - y0;     % relative displacement

dmag_sat = sqrt(sum(dvec_sat.^2,2));  
% distance travelled after velocity constrained

E1 = E0 - ECPUD * dmag_sat';
for i = 1:n
    if E1(i) <= 0
        E1(i) = 0;
        y1(i,:) = y0(i,:);
    end
end



endfunction [y1, E1] = update_agents(y0, ydot, x1, E0, dt)
%{
Let "n" be the number of agents.

--- Inputs ---
y0: n by 2 array holding all system outputs at timestep i
    e.g., y0(j,2) is the second output for agent-j

ydot: n by 2 array holding all system output time derivatives at timestep i
    e.g., ydot(j,2) is the second output time derivative for agent-j

x1: n by 2 array holding all consensus states for all agents at timestep i+1
    e.g., x1(j,2) is the second consensus state for agent-j

E0:  1 by n array holding energy data for all agents at timestep i
    e.g., E0(j) is the energy of agent-j at timestep i  

dt: timestep

--- Outputs ---
y1:  n by 2 array holding all system outputs at timestep i+1
     Same structure as y0.

E1: 1 by n array holding energy data for all agents at timestep i+1.
    Same structure as E0.
%}

IS_FLOCK = 1; % 0 = formation system; 1 = flocking system

if IS_FLOCK
    y1 = y0 + x1 * dt;
else
    y1 = x1;
end

E1 = E0;  % let energy pass through if you don't want to use it

% velocity restriction example --------------------------------------------
dvec = ydot * dt;
MAXD = 0.5;
if MAXD > 0
    n = length(y0);     % number of agents
    dmag = sqrt(sum(dvec.^2,2));
    for i=1:n
        r = dmag(i) / MAXD;
        if r > 1
            y1(i,:) = y0(i,:) + dvec(i,:) / r;
        end
    end
end

% energy consumption ------------------------------------------------------
ECPUD = 10;            % energy consumed per unit distance
dvec_sat = y1 - y0;     % relative displacement

dmag_sat = sqrt(sum(dvec_sat.^2,2));  
% distance travelled after velocity constrained

E1 = E0 - ECPUD * dmag_sat';
for i = 1:n
    if E1(i) <= 0
        E1(i) = 0;
        y1(i,:) = y0(i,:);
    end
end



end