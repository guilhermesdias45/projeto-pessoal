function dashboardsAcertosErros(param) {

    fetch(`/medidas/buscarResultados/${param}`, {
      method: "GET",
    })
      .then(function (resposta) {
        resposta.json().then((conta) => {
          conta.forEach((acertosErros) => {
            acertos += acertosErros.certo;
            erros += acertosErros.errado;

            tentativas += acertosErros.certo;
            tentativas += acertosErros.errado;
          });
          gerarDashboard();
        });
      })
      .catch(function (resposta) {
        console.log(`#ERRO: ${resposta}`);
      });
  }

  function gerarDashboard() {
    if(tentativas > 0){
      historico_partidas.innerHTML = ``;
      
      const ctxDonut = document.getElementById('donut').getContext('2d');

    let myChart = new Chart(ctxDonut, {
      type: 'doughnut',
      data: {
        labels: ['Acertos', 'Erros'],
        datasets: [{
          data: [(acertos/tentativas *100), (erros/tentativas *100)],
          backgroundColor: ['green', 'red'],
          borderWidth: 1
        }]
      },
      options: {
        responsive: true,
        plugins: {
          legend: {
            position: 'bottom'
          },
          title: {
            display: true,
            text: 'Quizz Resultados: (%)',
          }
        }
      }
    });
  }
}