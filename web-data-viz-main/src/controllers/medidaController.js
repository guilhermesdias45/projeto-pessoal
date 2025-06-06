var medidaModel = require("../models/medidaModel");

function buscarCategorias(req, res) {

    medidaModel.buscarCategorias(req, res).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as categorias");
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarQuestao(req, res){
    medidaModel.buscarQuestao(req, res).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as questões");
        res.status(500).json(erro.sqlMessage);
    });
}

function salvarResultado(req, res) {

    var per1 = req.body.pergunta1;
    var res1 = req.body.resposta1;
    var idUsuario = req.body.idUsuario;

        medidaModel.salvarResultado(per1, res1, idUsuario)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
}

function buscarResultados(req, res){
    idUsuario = req.params.idPerfil;
    
    medidaModel.buscarResultados(idUsuario).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as questões");
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarTodosResultados(req, res){
    medidaModel.buscarTodosResultados().then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as questões");
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    buscarCategorias,
    buscarQuestao,
    salvarResultado,
    buscarResultados,
    buscarTodosResultados
}