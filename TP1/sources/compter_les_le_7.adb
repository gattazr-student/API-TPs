with Ada.Text_Io;
with Texte1;

procedure Compter_les_LE_7 is				
    Compteur: Natural;
begin 
    Compteur := 0;    
    Texte1.D�marrer;
    
    while not Texte1.FdS loop
        if Texte1.El�mentCourant = 'L' then
            Compteur := Compteur + 1;
        end if;  
        Texte1.Avancer;
    end loop;
    
    Ada.Text_Io.Put_line(Integer'image(Compteur));  
    
end Compter_les_LE_7;

     
    
    
