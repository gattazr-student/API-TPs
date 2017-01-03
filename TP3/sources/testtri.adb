with Ada.Numerics.Discrete_Random; -- Pour generer aleatoirement des nombres a trier
with Ada.Real_Time; use Ada.Real_Time; -- Pour calculer le temps d'execution du tri
with Ada.Text_IO; -- Pour afficher les resultats
with Ada.Integer_Text_IO;

procedure testtri is

	-- Taille maximale du tableau
	NMAX: constant integer := 10000;

	-- Valeur contenue dans le tableau
	subtype Intervalle is integer range 1..NMAX;

	-- Pour utiliser le package aleatoire generique
	package NombreAleatoire is new Ada.Numerics.Discrete_Random (Intervalle);

	-- Graine commune pour l'aleatoire
	Semence : NombreAleatoire.Generator;


	-- Le tableau a trier
	A: array (1..NMAX) of Intervalle;



	-- Pour debugguer : affichage du tableau
	AFFICHAGE: constant boolean := false;


	-- Tri du tableau par insertion
	procedure triParInsertion( N: in integer; compteurTests: in out integer) is

		i, Clef: integer;
	begin
		for j in 2..N loop

			Clef := A(j);

			i := j-1;

			while (i>0) and then A(i) > Clef loop
				A(i+1) := A(i);
				i := i-1;
				compteurTests := compteurTests + 2;
			end loop;
			compteurTests := compteurTests + 1;

			A(i+1) := Clef;

		end loop;

	end triParInsertion;

	-- Initialisation du tableau A par des valeurs aleatoires entre 1 et NMAX
	procedure initialise_tableau(N : in integer) is
	begin
		for i in 1..NMAX loop
			A(i) := NombreAleatoire.Random(Semence);
		end loop;

	end initialise_tableau;

	-- Tri du tableau par methode trirapide
	procedure partition (premier,dernier : in integer; compteurTests: in out integer; index :out integer) is
		pivot : integer := A(premier);
		compteur : integer := premier;
		temp : integer :=0;
		save : integer := 0;
		begin -- Procedure
			for i in premier+1..dernier loop
				compteurTests := compteurTests + 2;
				if (A(i)<pivot) then
					compteur := compteur +1;

					save := A(i);
					A(i) := A(compteur);
					A(compteur) := save;
				end if;				
			end loop;
			compteurTests := compteurTests + 1;
			save := A(premier);
			A(premier) := A(compteur);
			A(compteur) := save;
			index := compteur;
	end partition;

	-- Tri du tableau par methode trirapide
	procedure triRapide (premier, dernier : in integer; compteurTests: in out integer) is
		pivot : integer :=0;
		begin
			if (premier<dernier) then
				partition(premier,dernier, compteurTests, pivot);
				triRapide(premier, pivot-1, compteurTests);
				triRapide(pivot+1, dernier, compteurTests);
			end if;
			compteurTests := compteurTests + 1;
	end triRapide;

	-- Teste le tri pour un tableau de taille N .
	procedure testUnTri(N : in integer) is

		Temps1, Temps2: Ada.Real_Time.Time;
		Duree: Ada.Real_Time.Time_Span;
		compteurTests: integer;

	begin
		for i in 1..10 loop
			-- Initialisation du tableau
			initialise_tableau(N);

			-- Affichage eventuel du tableau avant tri

			if AFFICHAGE then
				for k in 1..N loop
					Ada.Integer_Text_Io.Put( A(k));
					Ada.Text_Io.New_Line;
				end loop;
				Ada.Text_Io.New_Line;
			end if;

			Temps1 := Ada.Real_Time.Clock;

			compteurTests := 0;

			-- Tri du tableau par insertion

			-- triParInsertion(N, compteurTests);

			-- Tri du tableau par tri rapide
			
			triRapide(1, N, compteurTests);

			-- Affichage eventuel du tableau apres tri

			Temps2 := Ada.Real_Time.Clock;
			Duree := Temps2 - Temps1;

			if AFFICHAGE then
				for k in 1..N loop
					Ada.Integer_Text_Io.Put(A(k));
					Ada.Text_Io.New_Line;
				end loop;
				Ada.Text_Io.New_Line;
			end if;

			-- Affichage du temps de tri

			Ada.Text_Io.Put("Duree du tri en millisecondes: ");
			Ada.Integer_Text_Io.Put(Duree / Milliseconds(1));
			Ada.Text_Io.Put( " Pour" & Integer'Image(N) & " Elements");
			Ada.Integer_Text_Io.Put(compteurTests);
			Ada.Text_Io.Put( " tests effectués");

			Ada.Text_Io.New_Line;
		end loop;

	end testUnTri;

	i: integer;
begin
	NombreAleatoire.Reset(Semence);

	-- i := 1000;
	-- while i <= 10000 loop
	-- 	TestUnTri(i);
	-- 	i := i + 1000;
	-- 	Ada.Text_Io.New_Line;
	-- end loop;

	TestUnTri(NMAX);
	
end testtri;
