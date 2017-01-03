package Texte1 is	-- modèle 1  
    
    procedure Démarrer;
    	-- état initial :	indifférent
    	-- état final : 	pg = []
    
    procedure Avancer;     
    	-- état initial : 	pg = g ; pd = d ; pd /= []
    	-- état final : 	pg = g.premier(d) ; pd = fin(d)
    
    function ElémentCourant return Character; 
    	-- Courant = premier(pd)
    
    function FdS return Boolean;   
    	-- Fin = (pd = [])  
    
end Texte1;  
