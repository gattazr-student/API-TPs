with Ada.Text_Io;
with Texte1;

procedure Compter_les_LE_8 is				
    Compteur: Natural; PrecEstUnL: Boolean;
begin 
    Compteur := 0;    
    PrecEstUnL := false; Texte1.D�marrer;
    
    while not Texte1.FdS loop
        if PrecEstUnL and Texte1.El�mentCourant = 'E' then
            Compteur := Compteur + 1;
        end if;  
        PrecEstUnL := (Texte1.El�mentCourant = 'L'); Texte1.Avancer;
    end loop;
    
    Ada.Text_Io.Put_line(Integer'image(Compteur));  
    
end Compter_les_LE_8;

     
    
    
