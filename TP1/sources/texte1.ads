package Texte1 is	-- mod�le 1  
    
    procedure D�marrer;
    	-- �tat initial :	indiff�rent
    	-- �tat final : 	pg = []
    
    procedure Avancer;     
    	-- �tat initial : 	pg = g ; pd = d ; pd /= []
    	-- �tat final : 	pg = g.premier(d) ; pd = fin(d)
    
    function El�mentCourant return Character; 
    	-- Courant = premier(pd)
    
    function FdS return Boolean;   
    	-- Fin = (pd = [])  
    
end Texte1;  
