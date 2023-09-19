SELECT e.ID_Edificio, EXTRACT(MONTH FROM p.Fecha_Pago) AS Mes, SUM(p.Monto) AS Recaudo
FROM Edificio e
JOIN Depto d ON e.ID_Edificio = d.ID_Edificio
JOIN PAGO_GASTO_DEPTO p ON d.ID_depto = p.ID_depto AND p.Fecha_Pago IS NOT NULL
GROUP BY e.ID_Edificio, EXTRACT(MONTH FROM p.Fecha_Pago)
ORDER BY e.ID_Edificio, EXTRACT(MONTH FROM p.Fecha_Pago)