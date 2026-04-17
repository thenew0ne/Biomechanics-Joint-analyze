clear; clc;
RAW_data = table2array(readtable('LKNE데이터.xlsx',Range="B5:D1736",ReadVariableNames=false));
syms x y z r
total_error = 0;
for i = 1: length(RAW_data)
    int_r(i) = sqrt((500-RAW_data(i,1)).^2+(1000-RAW_data(i,2)).^2+(100-RAW_data(i,3)).^2);
    E(i) = (sqrt((x-RAW_data(i,1))^2+(y-RAW_data(i,2))^2+(z-RAW_data(i,3))^2)-r)^2;
    total_error = total_error + E(i);
end
df_total_error =transpose(jacobian(total_error,[x;y;z;r]));
d2f_jac = jacobian(df_total_error,[x;y;z;r]);
X = [500; 1000; 100; int_r(i)]; 
for i = 1 : 10
    Xold = X;
    f_x = double(subs(df_total_error,[x;y;z;r],X));
    f_p = double(subs(d2f_jac,[x;y;z;r],X));
    X = double(X - (f_p)\f_x);
    if abs(X - Xold) < 10^(-3)
        break
    end
    fprintf('횟수 : %d \nx : %0.4f \ny : %0.4f \nz : %0.4f \nr : %0.4f \n', i, X(1), X(2) ,X(3) ,X(4))
end