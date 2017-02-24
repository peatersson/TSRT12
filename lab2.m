%% Lab2

s = tf('s');
n = 0.05;
Kt = 38;
Lm = 2.0;
Rm = 21;
J = 2.0;
b = 1.0;
G1 = (s*Lm + Rm);
G2 = (J*s + b);
Km = 0.5;
Gs = n * (1/s) * ((Kt)/(Kt*Km + G1*G2));

%step(transf); % stepresponse for the transferfunction
%step(Gs/s); % ramp response
%step(S); % sensitivity

% 2.2 P-reglering

Kp = 10;
F = Kp;
transf = F*Gs / (1 + F*Gs);
S = 1 / (1 + Gs*F);

%step(transf);
%open = F * Gs;
%margin(open);
%bodeplot(transf);


% use Flead to create a system that satisfies our needs
wcd = 4 * 0.435;
beta = 0.125; % test values from 0.2 - 0.7
Gsabs = abs(freqresp(Gs, wcd));
K = sqrt(beta)/Gsabs;
Td = 1/(wcd*sqrt(beta));
Flead = K*((Td*s +1)/(beta*Td*s +1));

transf2 = Flead*Gs / (1 + Flead*Gs);
open2 = (Flead*Gs);
%step(transf2);

% temp = 1/(limit(Flead*Gs*s,s,0));

e1 = 1/(K*1.9/40); % 1.9/40 = n*Kt/(Kt*Km+Rm*b)
gamma = 1 / (e1/0.05); % 0.05 is our error demand
Ti = 10 / wcd;
Fleadlag = K*((Td*s +1)/(beta*Td*s +1))*((Ti*s + 1)/(Ti*s + gamma));
transf3 = (Fleadlag*Gs)/(1+Fleadlag*Gs);
step(transf2, transf3); % comparison of the two regulators
S2 = 1 / (1 + Flead*Gs);
S3 = 1 / (1 + Fleadlag*Gs);
e2 = e1 * gamma;


% check for stability
xi1 = 0.2;
xi2 = 0.4;
w0 = 5;
Ga1 = w0^2 / (s^2 + 2*xi1*w0*s + w0^2);
Ga2 = w0^2 / (s^2 + 2*xi2*w0*s + w0^2);
deltaG1 = Ga1 - 1;
deltaG2 = Ga2 - 1;
T3 = 1 - S3;
bode(1/T3, deltaG1, deltaG2);
