%% overall parameters
drop = (1.5*10^6 *0.25); % pressure drop over injector in pascals
angle = 60; % angle of impingement 

%% oxidizer calcs
disp('------------------ oxidizer ------------------');
n = 16; % number of ox orifices 
mtoto = 0.5552; % total ox mass flow rate in kg/s
cdo = 0.9; % coeff of discharge for ox
rhoo = 772.25; % density of oxidizer in kg/m^3
disp('diameter of oxidizer orifice in m:');
format long g % make decimal longer
disp(2*(sqrt(mtoto/(n*cdo*pi*(sqrt(2*rhoo*drop)))))); %display the diameter in m
diamo = (2*(sqrt(mtoto/(n*cdo*pi*(sqrt(2*rhoo*drop)))))); % diam of ox orifice in m
jet5o = 5*diamo; %jet length for oxidizer using l/d ratio of 5
jet6o = 6*diamo;%jet length for oxidizer using l/d ratio of 6
jet7o = 7*diamo; %jet length for oxidizer using l/d ratio of 7
jetlengo = jet7o; % round number chosen from jet options above in m           **  check above 3 variables if change numbers, choose round num or smallest (whichever is more convenient)**
disp('oxidizer jet length in m');
disp (jetlengo);
btwno = (jetlengo * 2 * sind(angle)); %distance between oxidizer orifices on combustion side
disp('distance between the ox orifices in m on combustion side');
disp (btwno);
disp('point of impingement ox');
ptimpo = (btwno/2)*tand(angle); % point of impingement for oxidizer in m
disp(ptimpo);
disp('length of ox orifice');
lengtho = 10 * diamo; % length of ox orifice is 10 times orifice diam
disp(lengtho);
disp('ox mdot per orifice');
mdoto = cdo*(pi*(diamo/2)^2)*sqrt(2*rhoo*drop);
disp(mdoto);
%% fuel calcs
disp('---------------- fuel --------------------');
nf = 8; % number of fuel orifices 
mtotf = 0.1388; % total mass flow rate in kg/s
cdf = 0.88; % coeff of discharge 
rhof = 789; % density of oxidizer in kg/m^3
disp('diameter of fuel orifice in m:');
format long g
disp(2*(sqrt(mtotf/(nf*cdf*pi*(sqrt(2*rhof*drop)))))); %display the diameter
diamf = (2*(sqrt(mtotf/(nf*cdf*pi*(sqrt(2*rhof*drop))))));
jet5f = 5*diamf; %jet length for oxidizer using l/d ratio of 5
jet6f = 6*diamf; %jet length for oxidizer using l/d ratio of 6
jet7f = 7*diamf; %jet length for oxidizer using l/d ratio of 7
jetlengf = jet5f; % since no round number, chose smallest one           **  check above 3 variables if change numbers, choose round num or smallest (whichever is more convenient)**
disp('fuel jet length in m');
disp (jetlengf);
btwnf = (jetlengf * 2 * sind(angle)); %distance between oxidizer orifices on combustion side
disp('distance between the fuel orifices in m on combustion side');
disp (btwnf);
disp('point of impingement fuel');
ptimpf = (btwnf/2)*tand(angle); % point of impingement for fuel in m
disp(ptimpf);
disp('length of fuel orifice');
lengthf = 10 * diamf;
disp(lengthf);
disp('fuel mdot per orifice');
mdotf = cdf*(pi*(diamf/2)^2)*sqrt(2*rhof*drop);
disp(mdotf);
%% injector plate
disp('---------------- plate --------------------');
diams = [diamo diamf]; %so you can do the max thing below
plate = (max(diams) * 4); % 4 times the largest orifice 
disp ('plate thickness in m');
disp (plate);
%% manifold side distances
disp('---------------- manifold --------------------');
disp('distance between ox orifices in m on manifold side');
manio = (2*(plate/tand(angle))) + btwno; % 2 times because extends on both sides plus starting distance between
disp(manio);
disp('distance between fuel orifices in m on manifold side');
manif = (2*(plate/tand(angle))) + btwnf;
disp(manif);