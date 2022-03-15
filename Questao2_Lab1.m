% Questão 2: performance do produto interno

% Parte 1
%
N =1000;
dim = 10^7;

tMatriz = zeros(N,1);
tDot = zeros(N,1);
tFor = zeros(N,1);

for jj = 1:N
    x = rand(dim,1);
    y = rand(dim,1);
    
    % Produto interno com multiplicação de matrizes
    tic; 
    x' * y;
    tMatriz(jj, 1) = toc;
    
    % Produto interno com função dot
    tic;
    dot(x,y);
    tDot(jj, 1) = toc;
    
    % Produto interno com laço for
    tic;
    pInterno(x,y,dim);
    tFor(jj, 1) = toc;
end

% Produção dos gráficos
figure 
plot(tMatriz)
hold on
plot(tDot)
hold on
plot(tFor)
xlabel('operação');
ylabel('tempo');
legend('multiplicação','dot','for');
title('tempo dos produtos internos');
grid
print -dpng -r400 grafico1q2.png


% Parte 2
% 
% Reduzir ruídos
TMatriz = zeros(N,1);
TDot = zeros(N,1);
TFor = zeros(N,1);

for jj = 1:N
    TMatriz(jj) = mean(tMatriz(1:jj, 1));
    TDot(jj) = mean(tDot(1:jj, 1));
    TFor(jj) = mean(tFor(1:jj, 1));
end

% Produção dos gráficos
figure
plot(TMatriz)
hold on
plot(TDot)
hold on
plot(TFor)
xlabel('operação');
ylabel('tempo médio');
legend('multiplicação','dot','for');
title('tempo médio dos produtos internos');
grid
print -dpng -r400 grafico2q2.png

function [pInt] = pInterno(x, y, dim)
    pInt = 0;
    for ii = 1:dim
       pInt = pInt + (x(ii,1) * y(ii,1)); 
    end 
end
