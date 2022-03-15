% Questão 1: representação numérica e erros

% Parte 1
%
erroNumerico1 = 0.1 + 0.1 + 0.1 - 0.3;
erroNumerico2 = 0.125 + 0.125 + 0.125 + 0.125 - 0.5;

erroNumerico1, erroNumerico2

% Parte 2
%
D1 = calcularErro(100000, 0.1)
D2 = calcularErro(80000, 0.125)

D1 == D2;
abs(D1-D2) < 0.0001;

% Definição da função calcularErro
function [D] = calcularErro(n,x)
    D = 10000;
    soma = 0;
    for jj = 1:n
        soma = soma + x;
    end
    D = D - soma;
end
