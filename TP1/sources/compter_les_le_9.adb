with Ada.Text_Io;
with Texte1;

procedure Compter_les_LE_9 is				
    Compteur: Natural; 
begin 
    Compteur := 0;    
    Texte1.Démarrer;
    
    while not Texte1.FdS loop
        if Texte1.ElémentCourant = 'L' then
        	Texte1.Avancer;	    
            if not Texte1.FdS then
                if Texte1.ElémentCourant = 'E' then
                	Compteur := Compteur + 1;
                end if;
                Texte1.Avancer;
            end if; 
      	else
        	Texte1.Avancer;
        end if; 
    end loop;
    
    Ada.Text_Io.Put_line(Integer'image(Compteur));  
    
end Compter_les_LE_9;

     
    
    
