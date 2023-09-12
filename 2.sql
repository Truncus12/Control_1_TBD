SELECT ID_Edificio, MONTH(p.Fecha_Emision) AS Mes, SUM(p.Monto) AS Recaudo
FROM Edificio e
JOIN Depto d ON e.ID_Edificio = d.ID_Edificio
JOIN PAGO_GASTO_DEPTO p ON d.ID_depto = p.ID_depto
GROUP BY e.ID_Edificio, MONTH(p.Fecha_Emision)
ORDER BY e.ID_Edificio, MONTH(p.Fecha_Emision) 