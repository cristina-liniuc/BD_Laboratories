--ex1
declare @N1 int, @N2 int, @N3 int;
declare @maiMare int;
set @N1 = 60*RAND();
set @N2 = 60*RAND();
set @N3 = 60*RAND();

if @N1>@N2 and  @N1>@N3 set @maiMare = @N1;
else if @N2>@N3 set @maiMare = @N2;
     else set @maiMare = @N3;
print @N1;
print @N2;
print @N3;
print 'Mai mare= '+ cast(@maiMare as varchar(2));
if(@N1 = @N2 or @N1 = @N3 or @N2 = @N3)
begin
	raiserror('unele din valori sunt egale', 16, --Severitatea 
	                                          1 --starea
											  )
end


--ex3
declare @N1 int, @N2 int, @N3 int;
declare @maiMare int;
set @N1 = 60*RAND();
set @N2 = 60*RAND();
set @N3 = 60*RAND();
set @maiMare=
case 
when @N1>@N2 and @N1>@N3 then  @N1 
when @N2>@N3 and @N2>@N1 then  @N2
when @N3>@N1 and @N3>@N2 then  @N3
end
print @N1;
print @N2;
print @N3;
print 'Mai mare= '+ cast(@maiMare as varchar(2));


--ex 4 raiserror
select top 10 Nume_Student, Prenume_Student
from studenti inner join (select Id_Student, Nota
                            from studenti_reusita inner join (select Id_Disciplina 
							                                  from discipline
															  where Disciplina like 'Baze de date') as d
							on studenti_reusita.Id_Disciplina = d.Id_Disciplina
							where Tip_Evaluare = 'Testl 1' and studenti_reusita.Nota<>6 and 
							                                    studenti_reusita.Nota<>8 ) as media
on studenti.Id_Student=media.Id_Student 

if(@@ROWCOUNT = 0)
begin
	raiserror('sunt greseli in select', 16, --Severitatea 
	                                          1 --stare
											  )
end

