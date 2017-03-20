DOMAINS 
cowok = symbol
mapan = symbol
umur = long
kendaraan = symbol
nama = symbol
job = symbol

PREDICATES
nondeterm cowok(nama,umur).
nondeterm kriteria_calon(nama,kendaraan,job,umur,mapan).
nondeterm pekerjaan(nama,job).
nondeterm material(nama,kendaraan,mapan).

CLAUSES
cowok("Fajar Khairuman",25).
cowok("Vamilu Yovan Saputra",27).
cowok("Katon Nur Riyanto",27).
cowok("Monkey D Luffy",26).
cowok("Gold D Ace",28).

pekerjaan("Fajar Khairuman","Polisi").
pekerjaan("Vamilu Yovan Saputra","Dosen").
pekerjaan("Katon Nur Riyanto","Polisi").
pekerjaan("Monkey D Luffy","Pengusaha").
pekerjaan("Gold D Ace","Polisi").

material("Fajar Khairuman","Motor","tidak").
material("Vamilu Yovan Saputra","Motor","ya").
material("Katon Nur Riyanto","Mobil","ya").
material("Monkey D Luffy","Helicopter","ya").
material("Gold D Ace","Motor","tidak").

kriteria_calon(Nama,Kendaraan,Job,Umur,Mapan):-
	cowok(Nama,Umur),
	Umur>27,
	Umur<30,
	pekerjaan(Nama,Job),
	Job="Polisi",
	material(Nama,Kendaraan,Mapan),
	Kendaraan="Motor",Mapan="tidak".


GOAL
 kriteria_calon(Nama,Kendaraan,Job,Umur,Mapan).
