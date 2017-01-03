with tri;
with Ada.Numerics.Discrete_Random; -- Pour generer aleatoirement des nombres a trier
with Ada.Real_Time; use Ada.Real_Time; -- Pour calculer le temps d'execution du tri
with Ada.Text_IO; -- Pour afficher les resultats
with Ada.Integer_Text_IO;
with Ada.Command_Line;

procedure Test is

	function IntegerIsGreaterThan (aA,aB : Integer) return Boolean is
	begin
		return aA > aB;
	end IntegerIsGreaterThan;


	package triInteger is new tri(Integer, IntegerIsGreaterThan);


	-- Taille maximale du tableau
	NMAX: constant integer := 10000;
	-- Valeur contenue dans le tableau
	subtype Intervalle is integer range 1..NMAX;
	-- Pour utiliser le package aleatoire generique
	package NombreAleatoire is new Ada.Numerics.Discrete_Random (Intervalle);
	-- Graine commune pour l'aleatoire
	Semence : NombreAleatoire.Generator;
	-- Le tableau a trier
	A: array (1..NMAX) of Tab;

	-- Initialisation du tableau A par des valeurs aleatoires entre 1 et NMAX
	procedure initialise_tableau(N : in integer) is
	begin
		for i in 1..NMAX loop
			A(i) := NombreAleatoire.Random(Semence);
		end loop;

	end initialise_tableau;

	compteur: Integer;

	begin

	NombreAleatoire.Reset(Semence);
	initialise_tableau(10);

	for k in 1..N loop
		Ada.Integer_Text_Io.Put(A(k));
		Ada.Text_Io.New_Line;
	end loop;
	Ada.Text_Io.New_Line;
	
	triInteger.triParInsertion(A, compteur);

	for k in 1..N loop
		Ada.Integer_Text_Io.Put(A(k));
		Ada.Text_Io.New_Line;
	end loop;
	Ada.Text_Io.New_Line;


		
end Test;