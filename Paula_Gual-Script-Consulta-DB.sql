-- PAULA GUAL EJERCICIO PRACTICA SQL KEEPCODING
-- SCRIPT CONSULTA MODELO ENTIDAD RELACION FLOTA COCHES KC

------------------------------------------------------------------------------------
-- Crear una consulta SQL para sacar el siguiente listado de coches activos que hay en KeepCoding:
  -- Nombre modelo, marca y grupo de coches (los nombre de todos)
  -- Fecha de compra
  -- Matricula
  -- Nombre del color del coche
  -- Total kilómetros
  -- Nombre empresa que esta asegurado el coche
  -- Numero de póliza

-- QUERY

select  a.id_car as "Id Coche",
		b.name || ' - ' || c.name || ' - ' || d.name as "Modelo - Marca - Grupo", 
		a.dt_adquisition as "Fecha de Compra", 
		a.plate as "Matrícula", 
		e.name as "Color", 
		a.total_km as "Total Kilómetros", 
		h.name as "Empresa Aseguradora", 
		f.num_ins_policy as "Número de Póliza"
from pgmaster.cars a
left join pgmaster.car_models b on a.id_model = b.id_model 
left join pgmaster.car_brands c on b.id_brand = c.id_brand 
left join pgmaster.car_groups d on c.id_group = d.id_group
left join pgmaster.colors e on a.id_color = e.id_color
left join pgmaster.hist_insurance_pol f on a.id_car = f.id_car 
left join pgmaster.insurance_pols g on f.num_ins_policy = g.num_ins_policy
left join pgmaster.insurance_comps h on g.id_ins_company = h.id_ins_company 
where f.dt_end > CURRENT_DATE;

------------------------------------------------------------------------------------
