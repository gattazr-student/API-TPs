with Ada.Text_IO, Ada.Integer_Text_IO; 
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure atester is				   
    i, NbLE, N : Natural;
   -- Les strings se manipulent comme un tableau de caractère ...	
    T : STRING(1..10);
begin 
    NbLE := 0;
    i := 1;        
    get_line(T,N);   
    if N = 10 then 
       Ada.Text_Io.Put_line("WARNING ! The string must be at most 10 char long ! Others chars will be ignored.");
    end if;		
    while i <= N loop
       if T(i) = 'L' then
          i := i + 1;
          if T(i) = 'E' then
             NbLE := NbLE + 1;
          end if;
       end if;  
       i := i + 1; 
    end loop;
    
    Put(NbLE);
    New_Line;
    
end atester;

     
    
    
