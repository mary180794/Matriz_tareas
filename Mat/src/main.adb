with Ada.Text_IO,Ada.Integer_Text_IO; use Ada.Text_IO,Ada.Integer_Text_IO;

procedure Main is

   matrizA : array(1..10,1..10) of Integer;
   matrizB : array(1..10,1..10) of Integer;
   matrizC : array(1..10,1..10) of Integer;

   i ,j,k ,multi,suma : Integer := 1 ;

    task type Multiplicacion is
    entry valor (valor :Integer);
    end Multiplicacion;

   task llenarMatrizAB;
   task llenarMatrizC;

   task type  MaResultante is
   entry valor(valor,i,j,suma :Integer);
   end MaResultante;


   task body llenarMatrizAB is
   begin
   for i in 1..10 loop
    for j in 1..10 loop
   matrizA(i,j) := 1;
   matrizB(i,j) := 1;
    end loop;
   end loop;
   end llenarMatrizAB;

   task body llenarMatrizC is
   begin
   for i in 1..10  loop
    for j in 1..10 loop
    matrizC(i,j) := 0;
    end loop;
   end loop;
   end llenarMatrizC;

   task body Multiplicacion  is
   begin
      accept valor (valor : in Integer) do
   for i in 1..10 loop
     for j in 1..10 loop
         for k in 1..10  loop
                  matrizC(i,j) := matrizC(i,j) +  matrizA(i,k) * matrizB(k,j);
                  matrizC(i,j) := suma;
               end loop;
               MaResultante.valor(i,j,suma);
       end loop;
         end loop;
         end valor;
      end Multiplicacion;

   task body MaResultante is
   begin
      accept valor ;
         matrizC(i,j):=valor;
   Put_Line("Matriz  C");
   for i in 1..10 loop
      for j in 1..10 loop
        Put(matrizC(i,j));
      end loop;
      Put_Line("");
         end loop;
      end valor;
   end MaResultante;

begin
   null;
end Main;
