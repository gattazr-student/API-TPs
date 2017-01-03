with Ada.Text_Io;
with Texte1;

procedure Compter_les_LE_3 is				
    Compteur: Natural; 
begin 
    Compteur := 0;    
    Texte1.Démarrer;
    
    while not Texte1.FdS loop
        if Texte1.ElémentCourant = 'L' then
            Texte1.Avancer;
            if Texte1.ElémentCourant = 'E' then
            	Compteur := Compteur + 1;
                Texte1.Avancer;
            end if;
        else
            Texte1.Avancer;
        end if;  
    end loop;
    
    Ada.Text_Io.Put_line(Integer'image(Compteur));  
    
end Compter_les_LE_3;

     
    
    
