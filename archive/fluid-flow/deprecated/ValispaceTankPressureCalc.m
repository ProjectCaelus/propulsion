%% Tank Pressure Loss Calculation with Valispace Integration
% Valispace integration of tankPressureSimple.m
% Ron Nachum, 05 October, 2019

%% Preprocessing 
clc; close all;
ValispaceInit("https://caelus.valispace.com","RonNachum","Valispace2019")
ValispacePull()

%% Simple Tank Pressure Calculation
% Using two isentropic expansion formulas
% https://www.grc.nasa.gov/www/k-12/airplane/compexp.html
finalPressure = ValispaceGetValue("Propellant_Tanks.FinalPressure"); % Final pressure inside tank
% waterVolume = 4.567; % Liters
waterVolume = (ValispaceGetValue("Fluid.Time") * (1/ValispaceGetValue("Fluid.Density")) * ValispaceGetValue("Fluid.MassFlowRate")) * 1000;
disp(waterVolume)
initVolume = linspace(waterVolume, 100-waterVolume, numPoints);
totalVolume = initVolume+waterVolume;
initTemp = 298; % Kevlin, room temperature
gamma = 1.40; % Ratio of specific heats of nitrogen gas
v1 = initVolume;
v2 = totalVolume;
p2 = finalPressure;
p1 = getInitPressure(p2, v1, v2, gamma);
t1 = initTemp;
t2 = getFinalTemp(t1, p1, p2, gamma);
initPressures = p1/1e06;
finalTemps = t2;

disp(finalTemps)
%% Functions
function finalTemp = getFinalTemp(temp_1, pressure_1, pressure_2, gamma)
    finalTemp = temp_1*(pressure_2/pressure_1)^((gamma-1)/gamma);
end
function initPressure = getInitPressure(pressure_2, volume_1, volume_2, k)
    initPressure = (pressure_2)/(volume_1/volume_2)^k;
end