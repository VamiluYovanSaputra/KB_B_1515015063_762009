predicates  
	nondeterm
	agenda1(long,symbol,symbol)
	nondeterm
	agenda2(long,symbol,symbol)
	nondeterm
	semuaagenda(long,symbol,symbol)
	nondeterm
	tingkahlaku(symbol,symbol)
clauses
	agenda1(1600,candycat,gorsegiri).
	agenda1(1615,pencil,gorsegiri).
	agenda1(1640,jiva,gorsegiri).
	agenda1(1705,mysteryofblood,gorsegiri).
	agenda1(1730,kawananrastaman,gorsegiri).
	agenda1(1755,ruffus,gorsegiri).
	agenda2(2000,gangstarasta,gorsegiri).
	agenda2(2105,killingmeinside,gorsegiri).
	agenda2(2210,djyasmine,gorsegiri).
	
	
	semuaagenda(Waktu,Acara,Tempat):-
	agenda1(Waktu,Acara,Tempat);
	agenda2(Waktu,Acara,Tempat).
	tingkahlaku(bernyanyi,teman).
	tingkahlaku(menari,pacar).
	tingkahlaku(berfoto,teman).
		
goal
	agenda2(Waktu,Acara,Tempat),
	Waktu=2210,
	tingkahlaku(Sedang,Bersama),
	Sedang=menari.
	
%skenario agenda jakcloth 2017
	
	
	