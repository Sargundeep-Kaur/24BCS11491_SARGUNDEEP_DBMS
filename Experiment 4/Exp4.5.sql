and output the joined table. */
 Select * 
 From student
 inner JOIN course
 on student.Course_id=course.Course_id;
 
 
 Select * From
 student right JOIN
 course on
 student.Course_id= course.Course_id;