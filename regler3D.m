%% 2.6
s = tf('s');
Ga = 1 / (s^2 + 2*s + 1);
Gb = 1 / (s^2 + 0.4*s + 1);
Gc = 1 / (s^2 + 5*s + 1);
Gd = 1 / (s^2 + s + 1);
Ge = 4 / (s^2 + 2*s +4);
step(Gb); grid

% a)
Tr_Ga = 2.21;
Ts_Ga = 5.83;
M_Ga = 0;

Tr_Gb = 1.21;
Ts_Gb = 19.6;
M_Gb = 0.5;

Tr_Gc = 10.5;
Ts_Gc = 19;
M_Gc = 0;

Tr_Gd = 1.64;
Ts_Gd = 8.08;
M_Gd = 0.16;

Tr_Ge = 0.82;
Ts_Ge = 4.04;
M_Ge = 0.16;

% b)
% format rat; % om br?k k?nns h?rligt
format short; % decimaltal
P_Ga = pole(Ga);
P_Gb = pole(Gb);
P_Gc = pole(Gc);
P_Gd = pole(Gd);
P_Ge = pole(Ge);

% c)
% Ga och Gc har inga ?versl?ngar samt att polerna inte har imagin?ra delar.
% St?rre imagin?rdel ger snabbare restid

%% 3.5a
s = tf('s');
Gs = 0.2 / ((s^2 + s + 1)*(s + 0.2));
% Us = Kp*(Rs - Ys);
% Ys = Gs*Us;
Kp = 1;
F = Kp;
G = feedback(F*Gs, 1);
step(G); grid

% a)
% L?gre Kp ger segare restid men inga ?versl?ngar
% H?gre Kp ger d? snabbare restid, men ?versl?ngar samt l?ngsammare
% insv?ngningstid till en viss del.

%% 3.5b
s = tf('s');
Gs = 0.2 / ((s^2 + s + 1)*(s + 0.2));
% Us = (Kp+Ki*(1/s))(Rs - Ys);
% Ys = Gs*Us;
Kp = 1;
Ki = 0.5;
F = (Kp + (Ki/s));
G = feedback(F*Gs, 1);
step(G, 50); grid

% stora Ki (2) gav instabilt stegsvar, mindre Ki g?r att I-delen p?verkar
% f?r lite, dvs l?ngsamm insv?ngningstid samt.

%% 3.5c
s = tf('s');
Gs = 0.2 / ((s^2 + s + 1)*(s + 0.2));
% Us = (Kp+Ki*(1/s))(Rs - Ys);
% Ys = Gs*Us;
Kp = 1;
Ki = 1;
T = 0.1;
Kd = 3;
F = (Kp + (Ki/s) + (Kd*s)/(s*T + 1));
G = feedback(F*Gs, 1);
step(G, 50); grid

% mindre Kd ger snabbare stegsvar men st?rre ?versl?ng, st?rre Kd ger d?
% segare stegsvar men d?mpar ?versl?ngen samt l?ngsammare insv?ngning.

%% 2.7
s = tf('s');
a = -5;
G = (a*s + 1)/(s^2 + 2*s + 1);
step(G); grid

% st?rre a ger snabbare stegsvar men med st?rre ?versl?ng
% mindre a ger negativ amplitud till att b?rja med men r?tar upp sig efter
% ett tag. Stegsvaret blir d? segare av detta. (icke-minimumfassystem)


