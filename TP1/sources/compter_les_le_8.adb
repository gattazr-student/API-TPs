with Ada.Text_Io;
with Texte1;

procedure Compter_les_LE_8 is				
    Compteur: Natural; PrecEstUnL: Boolean;
begin 
    Compteur := 0;    
    PrecEstUnL := false; Texte1.Démarrer;
    
    while not Texte1.FdS loop
        if PrecEstUnL and Texte1.ElémentCourant = 'E' then
            Compteur := Compteur + 1;
        end if;  
        PrecEstUnL := (Texte1.ElémentCourant = 'L'); Texte1.Avancer;
    end loop;
    
    Ada.Text_Io.Put_line(Integer'image(Compteur));  
    
end Compter_les_LE_8;

     
    
    
