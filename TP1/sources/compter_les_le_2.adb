with Ada.Text_Io;
with Texte1;

procedure Compter_les_LE_2 is    		
    Compteur: Natural; Prec: Character;
begin  
    Compteur := 0;
    Texte1.Démarrer;
    
    Prec := Texte1.ElémentCourant; Texte1.Avancer;	 	
    
    while not Texte1.FdS loop
        if Prec = 'L' and Texte1.ElémentCourant = 'E' then
            Compteur := Compteur + 1;
        end if;  
        Prec := Texte1.ElémentCourant; Texte1.Avancer;
    end loop;
    
    Ada.Text_Io.Put_line(Integer'image(Compteur));  
    
end Compter_les_LE_2;

     
    
    
