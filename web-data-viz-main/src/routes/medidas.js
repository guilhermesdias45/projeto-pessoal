var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/dashboards", function (req, res) {
    medidaController.buscarCategorias(req, res);
});

router.get("/tempo-real/:idAquario", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})

router.get("/perguntas/", function (req, res){
    medidaController.buscarQuestao(req, res);
})
    
module.exports = router;