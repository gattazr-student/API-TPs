with Ada.Text_Io; 

package body Texte1 is 
    
    Ligne: String(1..255);
    Longueur: Integer range 0..255;
    Rang: Integer range 1..256; 	
           
    procedure Démarrer is
    begin               
        Ada.Text_Io.Get_Line(Ligne, Longueur); 
        Rang := 1;
    end Démarrer;
        
    procedure Avancer is
    begin
	if (FdS) then 
		Ada.Text_IO.Put_Line("Erreur dans Avancer: on est deja en fin de sequence");
		raise CONSTRAINT_ERROR; 
	end if;
        Rang := Rang + 1;        
    end Avancer; 
    
    function ElémentCourant return Character is
    begin
	if (FdS) then 
		Ada.Text_IO.Put_Line("Erreur dans ElementCourant: on est deja en fin de sequence");
		raise CONSTRAINT_ERROR; 
	end if;
        return Ligne(Rang);
    end ElémentCourant;
     
    function FdS return Boolean is
    begin
        return (Rang = Longueur+1);
    end FdS;  
    
end Texte1;
