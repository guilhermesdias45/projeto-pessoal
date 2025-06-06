var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/dashboards", function (req, res) {
    medidaController.buscarCategorias(req, res);
});

router.get("/tempo-real/:idAquario", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
});

router.get("/perguntas", function (req, res){
    medidaController.buscarQuestao(req, res);
});

router.post("/salvar", function (req, res){
    medidaController.salvarResultado(req, res);
});

router.get("/buscarResultados/:idPerfil", function (req, res){
    medidaController.buscarResultados(req, res);
});

router.get("/buscarTodosResultados", function (req, res){
    medidaController.buscarTodosResultados(req, res);
});
    
module.exports = router;