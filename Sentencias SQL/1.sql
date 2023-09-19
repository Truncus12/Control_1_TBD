SELECT e.ID_Edificio AS Edificio, d.ID_depto AS Depto, p.Fecha_Limite, p.Fecha_Pago
FROM Edificio e
JOIN Depto d ON e.ID_Edificio = d.ID_Edificio
JOIN PAGO_GASTO_DEPTO p on d.ID_depto = p.ID_depto
WHERE p.Fecha_Emision >= (CURRENT_DATE - INTERVAL '3 months') AND (p.Fecha_Pago > p.Fecha_Limite OR p.Fecha_Pago IS NULL)
GROUP BY e.ID_Edificio, d.ID_depto,  p.Fecha_Limite, p.Fecha_Pago
ORDER BY e.ID_Edificio, p.Fecha_Limite