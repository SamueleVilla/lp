%%% -*- Mode: Prolog -*-
%
%
% domanda1/3
%

domanda1([], 0, []).                           % se la L1 e' vuota L2 pure

domanda1([[A, B] | Ys], N, [[A , B] | Zs]) :-  % se L1 testa ha due elementi faccio la somma
    (A + B) is N,
    domanda1(Ys, N, Zs).

domanda1([_, Ys], N, L2) :-                    % se L1 non ha due elementi in testa procedo sulle code
    domanda1(Ys, N, L2).

% domanda1.pl ends here.
