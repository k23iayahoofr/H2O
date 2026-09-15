% Sustainable Water Production Simulation with Sensor-Based Graphics
clc; clear; close all;

%% Parameters for Simulation
timeSteps = 100; % Total simulation time steps
time = 1:timeSteps;

% Simulated sensor measures
fogSensor = rand(1, timeSteps); % Fog harvesting efficiency
rainSensor = rand(1, timeSteps); % Rain harvesting efficiency
humiditySensor = rand(1, timeSteps); % Dew harvesting efficiency
gravelSensor = rand(1, timeSteps); % Gravel filtration performance
sandSensor = rand(1, timeSteps); % Sand filtration performance
claySensor = rand(1, timeSteps); % Clay filtration performance
infiltrationSensor = rand(1, timeSteps); % Infiltration basin efficiency
vegetationSensor = rand(1, timeSteps); % Vegetation regeneration efficiency

%% Scenarios
% Scenario 1: Passive Collection
fogWaterCollected = fogSensor * 0.5; % Fog net efficiency
rainWaterCollected = rainSensor * 0.8; % Rainwater collection efficiency
dewWaterCollected = humiditySensor * 0.4; % Dew harvesting efficiency

totalPassiveCollection = fogWaterCollected + rainWaterCollected + dewWaterCollected;

% Scenario 2: Natural Filtration
gravelFiltered = totalPassiveCollection .* gravelSensor * 0.9;
sandFiltered = gravelFiltered .* sandSensor * 0.95;
clayFiltered = sandFiltered .* claySensor * 0.98;

totalFilteredWater = clayFiltered;

% Scenario 3: Regeneration
infiltrationWater = totalFilteredWater .* infiltrationSensor * 0.85;
vegetationWater = infiltrationWater .* vegetationSensor * 0.9;

totalRegeneratedWater = vegetationWater;

%% Visualization
% Scenario 1: Passive Collection
figure('Name', 'Scenario 1: Passive Collection');
subplot(2, 1, 1);
hold on;
plot(time, fogSensor, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Fog Sensor');
plot(time, rainSensor, 'c-', 'LineWidth', 1.5, 'DisplayName', 'Rain Sensor');
plot(time, humiditySensor, 'g-', 'LineWidth', 1.5, 'DisplayName', 'Humidity Sensor');
title('Sensor Readings (Scenario 1: Passive Collection)');
xlabel('Time Steps');
ylabel('Efficiency');
legend('show');
grid on;

subplot(2, 1, 2);
plot(time, totalPassiveCollection, 'm-', 'LineWidth', 1.5);
title('Water Produced (Scenario 1: Passive Collection)');
xlabel('Time Steps');
ylabel('Water Collected');
grid on;

% Scenario 2: Natural Filtration
figure('Name', 'Scenario 2: Natural Filtration');
subplot(2, 1, 1);
hold on;
plot(time, gravelSensor, 'r-', 'LineWidth', 1.5, 'DisplayName', 'Gravel Sensor');
plot(time, sandSensor, 'm-', 'LineWidth', 1.5, 'DisplayName', 'Sand Sensor');
plot(time, claySensor, 'k-', 'LineWidth', 1.5, 'DisplayName', 'Clay Sensor');
title('Sensor Readings (Scenario 2: Natural Filtration)');
xlabel('Time Steps');
ylabel('Efficiency');
legend('show');
grid on;

subplot(2, 1, 2);
plot(time, totalFilteredWater, 'b-', 'LineWidth', 1.5);
title('Water Produced (Scenario 2: Natural Filtration)');
xlabel('Time Steps');
ylabel('Filtered Water');
grid on;

% Scenario 3: Regeneration
figure('Name', 'Scenario 3: Regeneration');
subplot(2, 1, 1);
hold on;
plot(time, infiltrationSensor, 'y-', 'LineWidth', 1.5, 'DisplayName', 'Infiltration Sensor');
plot(time, vegetationSensor, 'g-', 'LineWidth', 1.5, 'DisplayName', 'Vegetation Sensor');
title('Sensor Readings (Scenario 3: Regeneration)');
xlabel('Time Steps');
ylabel('Efficiency');
legend('show');
grid on;

subplot(2, 1, 2);
plot(time, totalRegeneratedWater, 'r-', 'LineWidth', 1.5);
title('Water Produced (Scenario 3: Regeneration)');
xlabel('Time Steps');
ylabel('Regenerated Water');
grid on;

%% Summary Comparison
figure('Name', 'Water Production Comparison');
hold on;
plot(time, totalPassiveCollection, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Scenario 1: Passive Collection');
plot(time, totalFilteredWater, 'r-', 'LineWidth', 1.5, 'DisplayName', 'Scenario 2: Natural Filtration');
plot(time, totalRegeneratedWater, 'g-', 'LineWidth', 1.5, 'DisplayName', 'Scenario 3: Regeneration');
title('Water Production Over Time (All Scenarios)');
xlabel('Time Steps');
ylabel('Water Produced');
legend('show');
grid on;

%% Statistical Evaluation
% Total water produced in each scenario
totalWaterProduced = [
    sum(totalPassiveCollection);
    sum(totalFilteredWater);
    sum(totalRegeneratedWater)
];

% Display total water production
fprintf('Total Water Produced in Each Scenario:\n');
fprintf('Scenario 1 (Passive Collection): %.2f\n', totalWaterProduced(1));
fprintf('Scenario 2 (Natural Filtration): %.2f\n', totalWaterProduced(2));
fprintf('Scenario 3 (Regeneration): %.2f\n', totalWaterProduced(3));
