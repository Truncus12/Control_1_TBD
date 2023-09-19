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