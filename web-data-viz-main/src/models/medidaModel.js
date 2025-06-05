var database = require("../database/config");

function buscarCategorias(req, res) {

    var instrucaoSql = `select c.nome, count(*) as contagem from Usuario u inner join Categoria c
on c.idCategoria = u.categoria_favorita group by categoria_favorita;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarQuestao(req, res) {

    var instrucaoSql = `SELECT * FROM Quizz_Questao;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function salvarResultado(per1, res1, idUsuario) {

    var instrucaoSql = `INSERT INTO Quizz (idPergunta, fkUsuario, acerto) VALUES (${per1}, ${idUsuario}, ${res1});`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarResultados(idUsuario) {

    var instrucaoSql = `select fkUsuario, (select count(*) from Quizz
                            where acerto = 1 and fkUsuario = ${idUsuario}) certo,
                            (select count(*) from Quizz
                            where acerto = 0 and fkUsuario = ${idUsuario}) errado
                        from Quizz group by fkUsuario;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


// function buscarMedidasEmTempoReal(idAquario) {

//     var instrucaoSql = `SELECT 
//         dht11_temperatura as temperatura, 
//         dht11_umidade as umidade,
//                         DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico, 
//                         fk_aquario 
//                         FROM medida WHERE fk_aquario = ${idAquario} 
//                     ORDER BY id DESC LIMIT 1`;

//     console.log("Executando a instrução SQL: \n" + instrucaoSql);
//     return database.executar(instrucaoSql);
// }

module.exports = {
    buscarCategorias,
    // buscarMedidasEmTempoReal
    buscarQuestao,
    salvarResultado,
    buscarResultados
}
