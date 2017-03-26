
/*****************************************************************************

		Copyright (c) 1984 - 2000 Prolog Development Center A/S

 Project:  
 FileName: CH04E12.PRO
 Purpose: 
 Written by: PDC
 Modifyed by: Eugene Akimov
 Comments: 
******************************************************************************/

trace
domains
  name,sex,occupation,object,vice,substance = symbol
  age=integer

predicates
  person(name,age,sex,occupation) - nondeterm (o,o,o,o), nondeterm (i,o,o,i), nondeterm (i,o,i,o)
  had_affair(name,name) - nondeterm (i,i), nondeterm (i,o)
  killed_with(name,object) - determ (i,o)
  killed(name) - procedure (o)
  killer(name) - nondeterm (o)
  motive(vice) - nondeterm (i)
  smeared_in(name,substance) - nondeterm (i,o), nondeterm (i,i)
  owns(name,object) - nondeterm (i,i)
  operates_identically(object,object) - nondeterm (o,i)
  owns_probably(name,object) - nondeterm (i,i)
  suspect(name) - nondeterm (i)

/* * * Facts about the murder * * */
clauses
  person(bert,55,m,carpenter).
  person(allan,25,m,football_player).
  person(allan,25,m,butcher).
  person(john,25,m,pickpocket).

  had_affair(barbara,john).
  had_affair(barbara,bert).
  had_affair(susan,john).

  killed_with(susan,club).
  killed(susan).

  motive(money).
  motive(jealousy).
  motive(righteousness).

  smeared_in(bert,blood).
  smeared_in(susan,blood).
  smeared_in(allan,mud).
  smeared_in(john,chocolate).
  smeared_in(barbara,chocolate).

  owns(bert,wooden_leg).
  owns(john,pistol).

/* * * Background knowledge * * */

  operates_identically(wooden_leg, club).
  operates_identically(bar, club).
  operates_identically(pair_of_scissors, knife).
  operates_identically(football_boot, club).

  owns_probably(X,football_boot):-
	person(X,_,_,football_player).
  owns_probably(X,pair_of_scissors):-
	person(X,_,_,hairdresser).
  owns_probably(X,Object):-
	owns(X,Object).

/* * * * * * * * * * * * * * * * * * * * * * *
 * Suspect all those who own a weapon with   *
 * which Susan could have been killed.       *
 * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-
	killed_with(susan,Weapon) ,
	operates_identically(Object,Weapon) ,
	owns_probably(X,Object).

/* * * * * * * * * * * * * * * * * * * * * * * * * *
 * Suspect men who have had an affair with Susan.  *
 * * * * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-
	motive(jealousy),
	person(X,_,m,_),
	had_affair(susan,X).

/* * * * * * * * * * * * * * * * * * * * *
 * Suspect females who have had an       *
 * affair with someone that Susan knew.  *
 * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-
	motive(jealousy),
	person(X,_,f,_),
	had_affair(X,Man),
	had_affair(susan,Man).

/* * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Suspect pickpockets whose motive could be money.  *
 * * * * * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-
	motive(money),
	person(X,_,_,pickpocket).

  killer(Killer):-   %program akan melacak data yang cocok dengan goal yang nanti akan disimpan di variable killer
	person(Killer,_,_,_), % fungsinya untuk memanggil subgoal pertama untuk mengecek orang(pembunuh,_,_,_)
	killed(Killed), % untuk mengecek siapa yang terbunuh
	Killed <> Killer, /* It is not a suicide */ 
	suspect(Killer), %ungsisnya ini untuk mengecek alibi pada orang-orang yang ada di clause
	smeared_in(Killer,Goo),%untuk mengecek apakah orang yang di curigai ternodai darah
	smeared_in(Killed,Goo).

goal
  killer(X).


%Analisis
%pertama mengecek siapa yang terbunuh, yang terbunuh ada susan
%kemudian mengecek orang pertama sebagai tersangka yaitu bert
%cek kembali kecurigaan bert
%kecurigaan pertama mencari orang yang memiliki pentungan sebagai alat pembunuhan
%bert terindikasi memiliki alat yang menyerupai pentungan yaitu kaki kayu
%lalu dicek lagi apakah di tubuhnya terdapat darah
%ternyata noda darah ada di tubuh susan dan bert
%namun karena susan yang terbunuh dan ternodai darah , maka bert lah yang menjadi pembunuh
%Pembunuh dari kejadian ini adalah bert yang menjadi korban nya adalah susan dikarenakan bert tidak memiliki uang dan juga kecemburuang