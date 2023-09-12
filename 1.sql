SELECT ID_depto
FROM Depto
WHERE ID_Pago_Gasto_Depto NOT IN (SELECT ID_Pago_Gasto_Depto 
                                FROM PAGO_GASTO_DEPTO 
                                WHERE Fecha_Limite >  CURRENT_DATE - INTERVAL '3 months')