SELECT e.id_edificio, c.nombre, count(d.id_depto)
FROM comuna c, edificio e, depto d
WHERE c.id_comuna = e.id_comuna and e.id_edificio = d.id_edificio
GROUP BY( e.id_edificio, c.nombre)