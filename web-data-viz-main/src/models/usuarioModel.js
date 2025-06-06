var database = require("../database/config")

function autenticar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucaoSql = `
    SELECT u.idUsuario, u.nome, u.email, u.username, c.nome as categoria_favorita FROM Usuario u
    INNER JOIN Categoria c on u.categoria_favorita = c.idCategoria
    WHERE u.email = '${email}' AND u.senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function cadastrar(nome, email, senha, username, categoria) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha, username, categoria);
    
    var instrucaoSql = `
        INSERT INTO Usuario (nome, email, senha, username, categoria_favorita) VALUES ('${nome}', '${email}', '${senha}', '${username}', '${categoria}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function listar() {
    var instrucaoSql = `
    SELECT u.idUsuario, u.nome, u.email, u.username, c.nome as categoria_favorita FROM Usuario u
    INNER JOIN Categoria c on u.categoria_favorita = c.idCategoria;
    `;

    return database.executar(instrucaoSql);
}

module.exports = {
    autenticar,
    cadastrar,
    listar
};