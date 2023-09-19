-- 1
SELECT e.ID_Edificio AS Edificio, d.ID_depto AS Depto, p.Fecha_Limite, p.Fecha_Pago
FROM Edificio e
JOIN Depto d ON e.ID_Edificio = d.ID_Edificio
JOIN PAGO_GASTO_DEPTO p on d.ID_depto = p.ID_depto
WHERE p.Fecha_Emision >= (CURRENT_DATE - INTERVAL '3 months') AND (p.Fecha_Pago > p.Fecha_Limite OR p.Fecha_Pago IS NULL)
GROUP BY e.ID_Edificio, d.ID_depto,  p.Fecha_Limite, p.Fecha_Pago
ORDER BY e.ID_Edificio, p.Fecha_Limite

-- 2
SELECT e.ID_Edificio, EXTRACT(MONTH FROM p.Fecha_Pago) AS Mes, SUM(g.mantencion + g.servicios) AS Recaudo
FROM Edificio e
JOIN Depto d ON e.ID_Edificio = d.ID_Edificio
JOIN PAGO_GASTO_DEPTO p ON d.ID_depto = p.ID_depto AND p.Fecha_Pago IS NOT NULL
JOIN GASTO_COMUN g ON g.ID_Gasto_Comun = p.ID_Gasto_Comun
GROUP BY e.ID_Edificio, EXTRACT(MONTH FROM p.Fecha_Pago)
ORDER BY e.ID_Edificio, EXTRACT(MONTH FROM p.Fecha_Pago);

-- 3
SELECT pge.id_edificio, EXTRACT(MONTH FROM pge.fecha_emision), ge.monto
FROM pago_gasto_edificio pge
JOIN gasto_edificio ge ON (ge.id_gasto_edificio = pge.id_gasto_edificio)
WHERE pge.estado = true;

-- 4
SELECT td.id_tipo_depto, td.nombre, (gc.mantencion + gc.servicios) AS gasto_comun_depto
FROM tipo_depto td 
JOIN gasto_comun gc ON (gc.id_gasto_comun = td.id_gasto_comun)
WHERE (gc.mantencion + gc.servicios) = (
    SELECT MAX(gasto_comun_depto)
    FROM (
        SELECT (gc.mantencion + gc.servicios) AS gasto_comun_depto
        FROM tipo_depto td 
        JOIN gasto_comun gc ON (gc.id_gasto_comun = td.id_gasto_comun)
    ) AS subconsulta
);

-- 5
SELECT e.id_edificio, c.nombre, count(d.id_depto)
FROM comuna c, edificio e, depto d
WHERE c.id_comuna = e.id_comuna and e.id_edificio = d.id_edificio
GROUP BY( e.id_edificio, c.nombre)

-- 7
SELECT id_depto, id_edificio, piso, cant_habitantes
FROM depto
INNER JOIN (SELECT id_edificio, piso, MAX(cant_habitantes) as cant_habitantes
	FROM depto
	GROUP BY piso, id_edificio
	ORDER BY(id_edificio, piso) desc) as tablita USING(id_edificio, piso, cant_habitantes)

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

-- 10
SELECT
	Edificio.ID_Edificio,
	Tipo_Depto.ID_Tipo_Depto
FROM Edificio
JOIN Depto
	ON Depto.ID_Edificio = Edificio.ID_Edificio
JOIN Tipo_Depto
	ON Tipo_Depto.ID_Tipo_Depto = Depto.ID_Tipo_Depto
JOIN (
  SELECT 
		ID_Edificio,
		MIN(Tipo_Depto.Tamano) AS Tamano
  FROM Depto
	JOIN Tipo_Depto
		ON Tipo_Depto.ID_Tipo_Depto = Depto.ID_Tipo_Depto
  GROUP BY Depto.ID_Edificio
) AS minimo_depto
	ON minimo_depto.ID_Edificio = Edificio.ID_Edificio
	AND minimo_depto.Tamano = Tipo_Depto.Tamano
GROUP BY Edificio.ID_Edificio