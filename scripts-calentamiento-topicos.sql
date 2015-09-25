/*
comentario de varias
lineas
*/
-- hello world como statement
select 'hello world' as title from dual;


-- hello world como script
begin
   DBMS_OUTPUT.PUT_LINE('hello world');
end;


-- hello world con variable
declare
  v_mensaje VARCHAR2 (100);
begin
  v_mensaje:= 'hello world';
   DBMS_OUTPUT.PUT_LINE('El mensaje es: [' || v_mensaje || ']');
end;


-- cálculo de raiz cuadrada
declare
  v_numero1 NUMBER (10,4);
  v_numero2 NUMBER (15,8);
begin
  v_numero1:= 78234.783;
  v_numero2:= power(v_numero1, 0.5);
   DBMS_OUTPUT.PUT_LINE('La raiz cuadrada de ' ||
      v_numero1 || ' es ' || v_numero2);
end;


-- creación de funciones almacenadas en base de datos
create or replace function f_prime (p_number in number) return number IS
  v_contador number:= 3;
  -- partimos del hecho de que el numero es primo
  v_resultado number:= 1;
begin
  -- determine si es par o múltiplo de cinco
  if p_number > 3 AND p_number <> 5 AND 
    ( MOD (p_number, 2) = 0 OR MOD (p_number, 5) = 0 ) THEN
     v_resultado:= 0;
  end if;
  -- en caso de que no sea par
  if v_resultado = 1 THEN
    -- busque los divisores, si es que tiene
    while (v_contador < p_number and v_resultado = 1) loop
      -- verifique si el número es primo
      if (MOD (p_number, v_contador) = 0) THEN
        v_resultado:= 0;
      else
        -- no es primo
        v_contador:= v_contador + 2;
      END IF;
    end loop;
  end if;
  return v_resultado;
end f_prime;
/


-- creación de funciones almacenadas en base de datos
create or replace function f_prime_v2 (p_number in number) return number IS
  v_contador number:= 3;
  -- partimos del hecho de que el numero es primo
  v_resultado number:= p_number;
begin
  -- determine si es par o múltiplo de cinco
  if p_number > 3 AND p_number <> 5 THEN
    IF ( MOD (p_number, 2) = 0) THEN
      v_resultado:= 2;
    END IF;
    IF ( MOD (p_number, 5) = 0 ) THEN
     v_resultado:= 5;
    END IF;
  end if;
  -- en caso de que no sea par
  if v_resultado = p_number THEN
    -- busque los divisores, si es que tiene
    while (v_contador < p_number and v_resultado = p_number) loop
      -- verifique si el número es primo
      if (MOD (p_number, v_contador) = 0) THEN
        v_resultado:= v_contador;
      else
        -- no es primo
        v_contador:= v_contador + 2;
      END IF;
    end loop;
  end if;
  return v_resultado;
end f_prime_v2;
/
