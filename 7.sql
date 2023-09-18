SELECT id_depto, id_edificio, piso, cant_habitantes
FROM depto
INNER JOIN (SELECT id_edificio, piso, MAX(cant_habitantes) as cant_habitantes
	FROM depto
	GROUP BY piso, id_edificio
	ORDER BY(id_edificio, piso) desc) as tablita USING(id_edificio, piso, cant_habitantes)