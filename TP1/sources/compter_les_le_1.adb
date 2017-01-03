with Ada.Text_Io;
with Texte1;

procedure Compter_les_LE_1 is				
    Compteur: Natural; Prec: Character;
begin 
    Compteur := 0;    
    Prec := ' '; Texte1.Démarrer;
    
    while not Texte1.FdS loop
        if Prec = 'L' and Texte1.ElémentCourant = 'E' then
            Compteur := Compteur + 1;
        end if;  
        Prec := Texte1.ElémentCourant; Texte1.Avancer;
    end loop;
    
    Ada.Text_Io.Put_line(Integer'image(Compteur));  
    
end Compter_les_LE_1;

     
    
    
