var database = require("../database/config");

function buscarPorId(id) {
  var instrucaoSql = `SELECT * FROM Guilda WHERE idGuilda = '${idGuilda}'`;

  return database.executar(instrucaoSql);
}

function buscarPorCnpj(nome) {
  var instrucaoSql = `SELECT * FROM Guilda WHERE nome = '${nome}'`;

  return database.executar(instrucaoSql);
}

function cadastrar(nome, descricao) {
  var instrucaoSql = `INSERT INTO Guilda (nome, descricao) VALUES ('${nome}', '${descricao}')`;

  return database.executar(instrucaoSql);
}

module.exports = { buscarPorCnpj, buscarPorId, cadastrar };
