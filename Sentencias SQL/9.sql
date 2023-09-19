SELECT id_edificio
FROM edificio
WHERE id_edificio IN (
	-- id_edificio asociados a esos gastos
	SELECT id_edificio
	FROM pago_gasto_edificio
	WHERE id_gasto_edificio IN (
		-- id_gasto_edificio donde el monto es el minimo
		SELECT id_gasto_edificio
		FROM gasto_edificio
		WHERE monto = (
			SELECT MIN(monto) 
			FROM gasto_edificio
			)
		)
	);