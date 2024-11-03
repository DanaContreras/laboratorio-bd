--Ejercicio 1
CREATE OR REPLACE FUNCTION moverse_pacientes()
RETURNS TEXT AS $$
DECLARE
   paciente_cursor CURSOR FOR SELECT dni, tipoDni, nombre, apellido FROM paciente;
   dni_var VARCHAR;
   tipoDni_var VARCHAR;
   nombre_var VARCHAR;
   apellido_var VARCHAR;
   output TEXT := '';  -- Variable para acumular el texto de salida
BEGIN
   -- Abre el cursor
   OPEN paciente_cursor;
  
   -- Mueve el cursor a la tercera fila
   MOVE FORWARD 3 IN paciente_cursor;
   FETCH FROM paciente_cursor INTO dni_var, tipoDni_var, nombre_var, apellido_var;
   output := output || FORMAT('Datos después de MOVE FORWARD 3: DNI = %s, Tipo DNI = %s, Nombre = %s, Apellido = %s%s',
                               dni_var, tipoDni_var, nombre_var, apellido_var, E'\n');

   -- Mueve el cursor 1 fila hacia atrás y obtiene los datos
   MOVE BACKWARD 2 IN paciente_cursor;
   FETCH FROM paciente_cursor INTO dni_var, tipoDni_var, nombre_var, apellido_var;
   output := output || FORMAT('Datos después de MOVE BACKWARD 2: DNI = %s, Tipo DNI = %s, Nombre = %s, Apellido = %s%s',
                               dni_var, tipoDni_var, nombre_var, apellido_var, E'\n');

   -- Mueve el cursor a la última fila y obtiene los datos
   MOVE LAST IN paciente_cursor;
   FETCH FROM paciente_cursor INTO dni_var, tipoDni_var, nombre_var, apellido_var;
   output := output || FORMAT('Datos en la última fila: DNI = %s, Tipo DNI = %s, Nombre = %s, Apellido = %s%s',
                               dni_var, tipoDni_var, nombre_var, apellido_var, E'\n');

   -- Cierra el cursor
   CLOSE paciente_cursor;

   -- Retorna el texto acumulado
   RETURN output;
END;
$$ LANGUAGE plpgsql;
