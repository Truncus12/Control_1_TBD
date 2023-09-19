SELECT tipo_depto.id_tipo_depto, edificio.id_edificio, COUNT(depto) AS cantidad_departamentos
FROM depto
LEFT JOIN tipo_depto ON depto.id_tipo_depto = tipo_depto.id_tipo_depto
LEFT JOIN edificio ON depto.id_edificio = edificio.id_edificio
GROUP BY edificio.id_edificio, tipo_depto.id_tipo_depto
ORDER BY edificio.id_edificio