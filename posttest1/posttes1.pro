PREDICATES
putri(STRING,STRING)
adik_perempuan(STRING,STRING)
adik_laki(STRING,STRING)
menikah(STRING,STRING)
ibu(STRING ibu,STRING putri)
nenek(STRING nenek,STRING cucu)
nondeterm keponakan_perempuan(STRING,STRING)

CLAUSES
putri("Indah","Lia").
adik_perempuan("Desy","Dwi").
adik_laki("Aan","Ahmad").
menikah("Indah","Desy").
menikah("Ahmad","Sulis").
ibu(X,Y):-putri(Y,X).
nenek(X,Y):-ibu(X,Z), ibu(Z,Y).
keponakan_perempuan(X,Y):-menikah(X,Z), adik_perempuan(Z,Y).
keponakan_perempuan(X,Y):-adik_laki(X,Z), menikah(Z,Y).

GOAL
keponakan_perempuan("Indah",Adalah).

%program memanggil predikat mendahului predikat
%keponakan_perempuan berfungsi untuk memberitahu ke compiler Visual Prolog
%bahwa predikat tersebut mempunyai lebih dari satu kemungkinan jawaban (non-
%deterministik). Secara default Visual Prolog akan menganggap predikat yang ada
%di section predicates sebagai deterministik (kecuali pada section facts,
%merupakan kebalikannya).selanjutnya program akan mencari"adalah"keponakan_perempuan
%karena jawaban hanya 1 solusi yaitu dwi sebagai keponakan perempuan 
%selesai