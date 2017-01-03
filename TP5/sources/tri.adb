package body tri is

	-- Tri du tableau par insertion
	procedure triParInsertion(A: in out Tab; compteurTests: in out integer) is
		i: integer;
		Clef: T;
	begin
		for j in 2..A'Last loop

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

end tri;
