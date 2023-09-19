SELECT
    Administrador.Nombre AS Nombre,
    COUNT(Edificio.ID_Edificio) AS Cantidad_Edificios
FROM Administrador
LEFT JOIN Edificio
    ON Edificio.ID_Administrador = Administrador.ID_Administrador
GROUP BY Administrador.ID_Administrador
ORDER BY Cantidad_Edificios DESC