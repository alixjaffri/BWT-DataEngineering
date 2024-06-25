/*
SYED M. ALI AMMAR
BYTEWISE FELLOWSHIP
TASK 02
*/


-- 1)
select* from rnacen.rna
where len > 12 AND timestamp > '2008-12-31 00:00:00'
limit 100;


-- 2)
select count(p.upi) as sjudbjfk
from rnacen.rnc_rna_precomputed as p
where p.is_active = true AND p.last_release < 2022
limit 100;


select count(p.upi) as TOTAL
from rnacen.rnc_rna_precomputed as p INNER JOIN rnacen.rna as a ON p.upi = a.upi
where (p.rna_type = 'tRNA' OR p.rna_type = 'snoRNA') 
	  AND (
	  (a.timestamp >= '2011-01-01 00:00:00' AND a.timestamp <= '2011-12-31 23:59:59') OR
	  (a.timestamp >= '2016-01-01 00:00:00' AND a.timestamp <= '2016-12-31 23:59:59') OR
	  (a.timestamp >= '2014-01-01 00:00:00' AND a.timestamp <= '2014-12-31 23:59:59') OR
	  (a.timestamp >= '2020-01-01 00:00:00' AND a.timestamp <= '2020-12-31 23:59:59')
	  );
 -- As timestamp resides in the RNA table while rna_type resides in RNC_RNA_PRECOMPUTED table


-- 4)
select p.databases
from rnacen.rnc_rna_precomputed as p INNER JOIN rnacen.rna as a ON p.upi = a.upi
where a.len NOT IN (100, 200, 300, 400, 15);


-- 5)
select*, s.region_name as myregions
from rnc_sequence_regions;
