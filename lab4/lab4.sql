
--13. Aflati cursurile urmate de catre studentul Florea Ioan 
select  distinct Disciplina
from studenti_reusita SR inner join studenti S on S.Id_Student = SR.Id_Student
	                     inner join discipline D on D.Id_Disciplina = SR.Id_Disciplina
where S.Nume_Student = 'Florea' and S.Prenume_Student = 'Ioan'


--29. Determinati numele si prenumele studentilor, care au sustinut toate disciplinile 
--    cu o nota mai mica decit oricare dintre notele studentilor cu identificatorul 100

select  distinct studenti.Nume_Student, studenti.Prenume_Student
from studenti inner join studenti_reusita on studenti.Id_Student = studenti_reusita.Id_Student
where Nota< (select min(Nota) from studenti_reusita where Id_Student = 100 and Tip_Evaluare = 'Examen') 
      and Tip_Evaluare = 'Examen'


--37. Gasiti disciplina sustinuta de studenti cu nota medie (la examen) cea mai inalta.
select Disciplina
from discipline inner join (select top(1) with ties Id_Disciplina 
                            from studenti_reusita
							group by Id_Disciplina
							order by AVG(Nota) desc) as media
on discipline.Id_Disciplina=media.Id_Disciplina
