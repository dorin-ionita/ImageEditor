			@@@@ Dorin Ionita, 315CC @@@@@
			@@@@ Tema3 @@@@
	Am implementat toate cerintele.
	Timp de executie: pe laptopul meu (i3)- <2 min.
	(Linux complet, nu in masina virtuala.)


lerp:
	Am scos ecuatia dreptei pentru a determina valoarea
punctului primit ca argument.

bilerp:
	Am facut ce spunea in cerinta (am facut lerp pe cele doua
directii), iar apoi am facut interpolare intre cele doua valori
obtinute.

forward_mapping:
	Am tratat separat (printr-un if) cele doua cazuri: rotatie
sau scalare.
	In primul rand, determin, in ambele cazuri, cat de mare va 
fi imaginea.
	In cazul de scalare inmultesc dimensiunile cu factorul de
scalare, iar in celelalt caz, determin unde se vor muta
colturile, si iau diferenta maxima pe latime si pe inaltime.
	Important in cazul rotatie este ca imaginea se roteste 
in planul xOy, dar nu pe loc, astfel incat a trebuit sa deter-
min doua constante (de shiftare) pentru a aduce piexelii 
incepand cu pozitia 0 0 din matrice.
	
inverse_mapping:
	In cazul inverse_mapping procedez aproape identic, dar,
pentru a scapa de pixelii morti fac interpolare pe matricea
initiala, in locul respectiv "potrivind" o valoarea prin
interpolarea biliniara.
	Prin analogie: am procedat ca in cazul definirii integralei
de suprafata la matematica1. E mai usor sa folosesc matricea
initiala decat pe cea finala.

image_stack:
	Se obtin imagini succesive, pe baza celei anterioare si se
adauga in stiva.

transform_image:
	Primeste stiva si kul. Creeaza o imagine ca un "sandwich"
intre imaginile de pe pozitile intregi alaturate lui k interpoland
pixelii cu aceiasi i si j (folosind lerp).

demo:
	Functia demo creeaza multe fisiere, cate unul pentru fiecare
poza, transformare si functie de obtinere a pozei.
	Functia ar trebui apelata din Octave prin comanda "demo()",
dupa ce, in prealabil, ne aflam in directorul in care ea este
continuta. De asemenea, imaginile ar trebui sa fie incluse in 
director.
	Ca transformari am:
scalare la 0.4: T=[0.4 0 ; 0 0.4];
scalare la 1.5: T=[1.5 0 ; 0 1.5];
rotire la pi/4: T=[cos(pi/4) -sin(pi/4);sin (pi/4) cos(pi/4)];
rotire la pi: T=[-1 0 ; 0 -1];
ultima cerinta: k=9.8;

