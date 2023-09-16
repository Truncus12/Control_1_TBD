SELECT ID_depto
FROM Depto
WHERE ID_depto NOT IN (SELECT ID_depto 
                                FROM PAGO_GASTO_DEPTO 
                                WHERE Fecha_Limite >  CURRENT_DATE - INTERVAL '3 months')