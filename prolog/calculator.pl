interface(Atom, Sonuc) :-
    catch(hesapla_ifade(Atom, Sonuc),
          sifira_bolme_hatasi,
          (write('Hata: divided by 0'), nl, fail)),
    !.

interface(_, _) :-
    write('Hata: not able to calculate'), nl,
    fail.

hesapla_ifade(Atom, Sonuc) :-
    atom_codes(Atom, Codes),
    phrase(ifade(AST), Codes),
    hesapla(AST, Sonuc).

ifade(AST) --> terim(T), ifade_devam(T, AST).
ifade_devam(Acc, AST) --> "+", terim(T), ifade_devam(topla(Acc,T), AST).
ifade_devam(Acc, AST) --> "-", terim(T), ifade_devam(cikar(Acc,T), AST).
ifade_devam(Acc, Acc) --> [].

terim(AST) --> faktor(F), terim_devam(F, AST).
terim_devam(Acc, AST) --> "*", faktor(F), terim_devam(carp(Acc,F), AST).
terim_devam(Acc, AST) --> "/", faktor(F), terim_devam(bol(Acc,F), AST).
terim_devam(Acc, Acc) --> [].

faktor(AST) --> "(", ifade(AST), ")".
faktor(sayi(Sayi)) --> sayi(Sayi).

sayi(N) --> bosluklar, rakamlar(Cs), bosluklar, {number_codes(N, Cs)}.

rakamlar([D|Ds]) --> [D], {benim_code_type(D, digit)}, rakamlar(Ds).
rakamlar([D])    --> [D], {benim_code_type(D, digit)}.

bosluklar --> [C], {benim_code_type(C, space)}, bosluklar.
bosluklar --> [].

benim_code_type(C, space) :- member(C, [9,10,11,12,13,32]).
benim_code_type(C, digit) :- C >= 48, C =< 57.

hesapla(sayi(X), X).

hesapla(topla(X,Y), Sonuc) :-
    hesapla(X, S1), hesapla(Y, S2), Sonuc is S1 + S2.

hesapla(cikar(X,Y), Sonuc) :-
    hesapla(X, S1), hesapla(Y, S2), Sonuc is S1 - S2.

hesapla(carp(X,Y), Sonuc) :-
    hesapla(X, S1), hesapla(Y, S2), Sonuc is S1 * S2.

hesapla(bol(X,Y), Sonuc) :-
    hesapla(X, S1), hesapla(Y, S2),
    (   S2 =:= 0
    ->  throw(sifira_bolme_hatasi)
    ;   Sonuc is S1 / S2
    ).


run :-
    write('>'), nl,
    read(Input),
    (
        Input = q
    ->
        write('end.'), nl
    ;
        atom(Input)
    ->
        interface(Input, Sonuc),
        format('Result = ~w~n', [Sonuc]),
        run
    ;
        write('Invalid Input'), nl,
        run
    ).
