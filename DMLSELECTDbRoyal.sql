SET search_path TO dbRoyal;
--DML 
select
	ma.nombre as marca ,
	m.nombre as modelo,
	ge.nombre as grupo,
	c.fecha_compra,
	c.matricula ,
	c.km,
	co.nombre as color,
	p.numero_poliza,
	a.nombre as aseguradora
from
	dbRoyal.Coche c
join dbRoyal.Modelo m on
	c.modelo_id = m.id
join dbRoyal.Marca ma on
	m.marca_id = ma.id
join dbRoyal.Grupo_Empresarial ge on
	ma.grupo_empresarial_id = ge.id
join dbRoyal.Color co on
	c.color_id = co.id
join dbRoyal.Poliza p on
	c.id = p.coche_id
join dbRoyal.Aseguradora a on
	p.aseguradora_id = a.id
where
	c.status = 1;