% Questão 3: Performance do produto de matrizes

% Parte 1:
%
[tOp10, tAlg10] = tempoMatriz(10)
[tOp100, tAlg100] = tempoMatriz(100)
[tOp1000, tAlg1000] = tempoMatriz(1000)

% Parte 2:
%
casoUno = zeros(200,1);
casoDos = zeros(200,1);
for jj = 1:200
    [tOp, tAlg] = tempoMatriz(jj);
    casoUno(jj,1) = tOp;
    casoDos(jj,1) = tAlg;
end

% Produção dos gráficos
figure
plot(casoUno)
hold on
plot(casoDos)
xlabel('operação');
ylabel('tempo');
legend('multiplicação','for');
title('tempo dos produtos de matrizes');
grid
print -dpng -r400 grafico3q3.png


function [tOperador, tAlgoritmo] = tempoMatriz(dim)
    cont = 20;
    tOperador = 0;
    tAlgoritmo = 0;
    for jj = 1:cont
        X = rand(dim);
        Y = rand(dim);
        % Multiplicação de matrizes do software
        tic;
        X * Y;
        tOperador = tOperador + toc;  
        
        % Multiplicação de matrizes do algoritmo
        tic;
        produtoMatriz(X,Y,dim);
        tAlgoritmo = tAlgoritmo + toc;
    end    
    tOperador = tOperador / cont;
    tAlgoritmo = tAlgoritmo / cont;
end 


function [pMatriz] = produtoMatriz(X, Y, dim)
    pMatriz = zeros(dim);
    for ii = 1:dim
      for jj = 1:dim
        for k = 1:dim
            pMatriz(ii, jj) = X(ii,k)*Y(k,jj);
        end
      end
    end
end