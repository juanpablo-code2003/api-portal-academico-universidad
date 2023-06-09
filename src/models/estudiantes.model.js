const db = require('../database/conexion');
const { getColumnsValuesSQL } = require('./base.model');

const table = 'estudiantes';
const columns = ['codigo_dni', 'estado'];
const primaryKey = 'codigo_dni';

const selectEstudiantes = (limit = 100) => {
  const columns_select = [
    `${table}.codigo_dni`, 
    `usuarios.correo_inst`,
    `personas.nombre1`, 
    `personas.nombre2`, 
    `personas.apellido1`,
    `personas.apellido2`,
    `personas.telefono`,
    `personas.celular`,
    `personas.correo_pers`,
    `CONCAT(
      personas.nombre1, 
      ' ', 
      CASE 
        WHEN personas.nombre2 IS NOT NULL THEN CONCAT(personas.nombre2, ' ')
        ELSE ''
      END, 
      personas.apellido1,
      CASE 
        WHEN personas.apellido2 IS NOT NULL THEN CONCAT(' ', personas.apellido2)
        ELSE ''
      END
    ) AS nombre_completo`
  ];
  const result = db.query(`
    SELECT ${columns_select.join(', ')} FROM ${table}
    INNER JOIN usuarios ON ${table}.codigo_dni = usuarios.codigo_dni
    INNER JOIN personas ON usuarios.codigo_dni = personas.codigo_dni
    WHERE ${table}.estado = true 
    ORDER BY ${primaryKey}
    LIMIT ${limit}
  `);
  return result;
};

const selectEstudiantesNotInGrupo = (id_asig, id_semestre) => {
  const columns_select = [
    `${table}.codigo_dni`, 
    `usuarios.correo_inst`,
    `personas.nombre1`, 
    `personas.nombre2`, 
    `personas.apellido1`,
    `personas.apellido2`,
    `personas.telefono`,
    `personas.celular`,
    `personas.correo_pers`,
    `CONCAT(
      personas.nombre1, 
      ' ', 
      CASE 
        WHEN personas.nombre2 IS NOT NULL THEN CONCAT(personas.nombre2, ' ')
        ELSE ''
      END, 
      personas.apellido1,
      CASE 
        WHEN personas.apellido2 IS NOT NULL THEN CONCAT(' ', personas.apellido2)
        ELSE ''
      END
    ) AS nombre_completo`
  ];
  const result = db.query(`
    SELECT ${columns_select.join(', ')} FROM ${table}
    INNER JOIN usuarios ON ${table}.codigo_dni = usuarios.codigo_dni
    INNER JOIN personas ON usuarios.codigo_dni = personas.codigo_dni
    WHERE ${table}.estado = true AND NOT EXISTS (SELECT codigo_estudiante FROM estudiantes_grupos WHERE codigo_estudiante = ${table}.codigo_dni AND id_asig = ${id_asig} AND id_semestre = ${id_semestre})
    ORDER BY ${primaryKey}
  `);
  return result;
};

const selectOneEstudiante = (codigo_dni) => {
  const columns_select = [
    `${table}.codigo_dni`, 
    `usuarios.correo_inst`,
    `personas.nombre1`, 
    `personas.nombre2`, 
    `personas.apellido1`,
    `personas.apellido2`,
    `personas.telefono`,
    `personas.celular`,
    `personas.correo_pers`,
    `CONCAT(
      personas.nombre1, 
      ' ', 
      CASE 
        WHEN personas.nombre2 IS NOT NULL THEN CONCAT(personas.nombre2, ' ')
        ELSE ''
      END, 
      personas.apellido1,
      CASE 
        WHEN personas.apellido2 IS NOT NULL THEN CONCAT(' ', personas.apellido2)
        ELSE ''
      END
    ) AS nombre_completo`
  ];
  const result = db.query(`
    SELECT ${columns_select.join(', ')} FROM ${table}   
    INNER JOIN usuarios ON ${table}.codigo_dni = usuarios.codigo_dni
    INNER JOIN personas ON usuarios.codigo_dni = personas.codigo_dni
    WHERE ${table}.${primaryKey} = '${codigo_dni}' AND ${table}.estado = true ${wherePassword} 
    ORDER BY ${primaryKey}
  `);
  return result;
};

const insertEstudiante = (data) => {
  const [columns_insert, values_insert] = getColumnsValuesSQL(data);
  const result = db.query(`INSERT INTO ${table}(${columns_insert.join(', ')}) VALUES (${values_insert.join(', ')}) RETURNING *`);
  return result;
};

const deleteEstudiante = (codigo_dni) => {
  const result = db.query(`UPDATE ${table} SET estado=false WHERE ${primaryKey} = '${codigo_dni}' RETURNING *`);
  return result;
};

module.exports = {
  selectEstudiantes,
  selectOneEstudiante,
  insertEstudiante,
  deleteEstudiante,
  selectEstudiantesNotInGrupo
};