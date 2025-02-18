# Yorkdale Security Robot Simulation
## 📌 Project Overview
This MATLAB-based simulation models the deployment of security robots in Yorkdale using Lloyd’s Algorithm for optimal area coverage. The project applies exponential decay density mapping and adjacency matrix-based communication modeling to distribute agents (robots) effectively based on high-traffic zones.

## 🏗 Project Structure
### 1️⃣ Density Map Algorithm (density_map.m)
Uses an exponential decay function to determine density values.
Inputs: x, y (coordinate matrices), t (time variable, not used in this case).
Outputs: Normalized density map (0 to 1 range).
Key Parameters:
Decay Rate: Arbitrarily set to 0.1 for this simulation but can be modified for different use cases.
Hotspots: Hardcoded based on store locations and entrances (fixed high-traffic areas).
### 2️⃣ Adjacency Matrix Algorithm (adjacency_matrix.m)
Constructs a communication network between agents based on proximity.
Inputs:
Number of agents
Communication radius (defines connectivity threshold).
Outputs: Adjacency matrix (1 if two agents can communicate, 0 otherwise).
Uses Euclidean distance to determine connectivity.
### 3️⃣ Pre-Coded Files (Provided by Instruction Team)
These files were supplied by the course instructors and were not modified:

observation_set.m – Defines observation points.
animate_network.m – Handles visualization and animation of agent movement.
move_agents.m – Governs agent movement logic.
update_agents.m – Updates agent states dynamically.
### 4️⃣ Run File (run_simulation.m)
Controls execution of the simulation.
Key Parameters (selected by the team):
Communication & Observation Radii – Set based on agent specifications and infrastructure.
Number of Agents – Arbitrarily chosen within reasonable project constraints.
Arena Size – Adjusted to match the rectangular layout of Yorkdale Mall.
Energy Calculations – Disabled for this project scope.

## 🔄 Future Improvements
Dynamic time-dependent density mapping (e.g., varying foot traffic patterns).
Energy-aware movement optimization for extended operational efficiency.
Integration with real-world robot sensor data for enhanced accuracy.
## 📜 Acknowledgments
This project was developed as part of a course assignment and was completed to focus on practical applications of multi-agent systems in security robotics.

