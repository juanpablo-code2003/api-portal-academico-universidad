const express = require('express');
const morgan = require('morgan');
const app = express();
const port = 3000;

const programasAcademicosRouter = require('./routes/programas_academicos.routes');
const facultadesRouter = require('./routes/facultades.routes');

app.get('/', (request, response) => {
  response.send({
    message: 'Hola bienvenido a la app portal académico'
  });
});

app.use(morgan('dev'));
app.use(express.json());

app.use(programasAcademicosRouter);
app.use(facultadesRouter);

app.listen(port, () => {
  console.log(`Server active on port ${port}`);
});