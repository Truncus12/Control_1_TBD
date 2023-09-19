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
GROUP BY Edificio.ID_Edificio, Tipo_Depto.ID_Tipo_Depto