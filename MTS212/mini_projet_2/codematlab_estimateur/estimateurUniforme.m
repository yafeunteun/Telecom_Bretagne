% appel [a b]= estimateurUniforme(data)
% estimateur d'une loi uniforme sur l'intervalle [a,b]
% d�termine les estimateurs des valeurs de a et b 
%les deux bornes de l'intervalle
function [minEst, maxEst] = estimateurUniforme(data)
    minEst = min( data );
    maxEst = max( data );
end