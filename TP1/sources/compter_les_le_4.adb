with Ada.Text_Io;
with Texte1;

procedure Compter_les_LE_4 is				
    Compteur: Natural; Prec: Character;
begin 
    Compteur := 0;    
    Texte1.D�marrer;
    if not Texte1.FdS then
        
        loop
        	Prec := Texte1.El�mentCourant; Texte1.Avancer;
    	exit when Texte1.FdS;
        	if Prec = 'L' and Texte1.El�mentCourant = 'E' then
            	Compteur := Compteur + 1;
        	end if;  
        end loop;
        
  	end if;
    
    Ada.Text_Io.Put_line(Integer'image(Compteur));  
    
end Compter_les_LE_4;

     
    
    
