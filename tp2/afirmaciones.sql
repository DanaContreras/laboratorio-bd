-- Ejercicio 2
CREATE ASSERTION limiteDeSotAlMes
CHECK (
	NOT EXISTS (
		SELECT legajoAcompaniante
		FROM sot
		WHERE MONTH(fechaHora) = MONTH(current_date) AND YEAR(fechaHora) = YEAR(current_data)
		GROUP BY legajoAcompaniante
		HAVING COUNT(*) > 30
	)
);
