SELECT pge.id_edificio, EXTRACT(MONTH FROM pge.fecha_emision), ge.monto
FROM pago_gasto_edificio pge
JOIN gasto_edificio ge ON (ge.id_gasto_edificio = pge.id_gasto_edificio)
WHERE pge.estado = true;