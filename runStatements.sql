-- 1
SELECT ID_depto
FROM Depto
WHERE ID_depto NOT IN (SELECT ID_depto 
                                FROM PAGO_GASTO_DEPTO 
                                WHERE Fecha_Limite >  CURRENT_DATE - INTERVAL '3 months')

-- 2
SELECT e.ID_Edificio, EXTRACT(MONTH FROM p.Fecha_Emision) AS Mes, SUM(p.Monto) AS Recaudo
FROM Edificio e
JOIN Depto d ON e.ID_Edificio = d.ID_Edificio
JOIN PAGO_GASTO_DEPTO p ON d.ID_depto = p.ID_depto
GROUP BY e.ID_Edificio, p.Fecha_Emision
ORDER BY e.ID_Edificio, p.Fecha_Emision

-- 8
SELECT tipo_depto.id_tipo_depto, edificio.id_edificio, COUNT(depto) AS cantidad_departamentos
FROM depto
LEFT JOIN tipo_depto ON depto.id_tipo_depto = tipo_depto.id_tipo_depto
LEFT JOIN edificio ON depto.id_edificio = edificio.id_edificio
GROUP BY edificio.id_edificio, tipo_depto.id_tipo_depto
ORDER BY edificio.id_edificio

-- 9
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
	)