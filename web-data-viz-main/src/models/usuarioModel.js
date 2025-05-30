var database = require("../database/config")

function autenticar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucaoSql = `
        SELECT idUsuario, nome, email, username FROM Usuario WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function cadastrar(nome, email, senha, username, categoria) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha, username, categoria);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
        INSERT INTO Usuario (nome, email, senha, username, categoria_favorita) VALUES ('${nome}', '${email}', '${senha}', '${username}', '${categoria}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function listar() {
    var instrucaoSql = `SELECT idUsuario, nome, username, email FROM Usuario`;

    return database.executar(instrucaoSql);
}

function verificarAmizade(idUsuario1, idUsuario2){
    console.log("Estou testando a função de verificar amizade!")

    var instrucaoSql = `SELECT * FROM Amizade WHERE idUsuario1 = ${idUsuario1} AND idUsuario2 = ${idUsuario2}`;

    return database.executar(instrucaoSql);
}

module.exports = {
    autenticar,
    cadastrar,
    verificarAmizade,
    listar
};