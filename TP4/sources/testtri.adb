with Ada.Numerics.Discrete_Random; -- Pour generer aleatoirement des nombres a trier
with Ada.Real_Time; use Ada.Real_Time; -- Pour calculer le temps d'execution du tri
with Ada.Text_IO; -- Pour afficher les resultats
with Ada.Integer_Text_IO;
with Ada.Command_Line;

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
	AFFICHAGE: constant boolean := true;


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

	function lireTableau(aFileName: in String) return Integer is
		wFile : Ada.Text_IO.File_Type;
		wNbLigne : integer;

	begin -- lireTableau(aFileName: String)
		Ada.Text_Io.Open(wFile, Ada.Text_IO.In_File, aFileName);
		wNbLigne := 0;

		while wNbLigne < NMAX and not Ada.Text_IO.End_Of_File(wFile) loop
			declare
				wLine : String := Ada.Text_IO.Get_Line(wFile);
				begin
					wNbLigne:= wNbLigne+1;
					A(wNbLigne) := Integer'Value(wLine);
				end;
		end loop;
		Ada.Text_Io.Close(wFile);
		return wNbLigne;

	end lireTableau;

	-- Teste le tri pour un tableau de taille N .
	procedure testUnTri(N : in integer; aFileName : in String) is

		Temps1, Temps2: Ada.Real_Time.Time;
		Duree: Ada.Real_Time.Time_Span;
		compteurTests: integer;
		wFile : Ada.Text_IO.File_Type;

	begin

		-- Affichage eventuel du tableau avant tri
		if AFFICHAGE then
			for k in 1..N loop
				Ada.Integer_Text_Io.Put(A(k));
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

		Ada.Text_Io.Create(wFile, Ada.Text_IO.Out_File, aFileName & ".txt");
		for k in 1..N loop
			Ada.Text_Io.Put_Line(wFile, Integer'Image(A(k)));
		end loop;
		Ada.Text_Io.Close(wFile);

		
		Ada.Text_Io.Create(wFile, Ada.Text_IO.Out_File, aFileName & ".time.txt");
		Ada.Text_Io.Put_Line(wFile, "Duree du tri en millisecondes: " & Integer'Image(Duree / Milliseconds(1)));
		Ada.Text_Io.Close(wFile);

		Ada.Text_Io.Create(wFile, Ada.Text_IO.Out_File, aFileName & ".aff.txt");
		Ada.Text_Io.Put_Line(wFile, "Pour" & Integer'Image(N) & " Elements " & Integer'Image(compteurTests) & " tests effectués");
		Ada.Text_Io.Close(wFile);

	end testUnTri;

	wSize: integer;

begin
	if (Ada.Command_Line.Argument_Count = 2) then
		wSize := lireTableau(Ada.Command_Line.Argument(1));
		TestUnTri(wSize, Ada.Command_Line.Argument(2));
	end if;

end testtri;
