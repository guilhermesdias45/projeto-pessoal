if (sessionStorage.NOME_USUARIO != undefined) {
  b_usuario.innerHTML = sessionStorage.NOME_USUARIO;
}

  if (sessionStorage.ID_USUARIO == undefined) {
    div_login.style.display = 'block';
    div_perfil.style.display = 'none';
    div_cadastro.style.display = 'block';
  } else {
    div_login.style.display = 'none';
    div_perfil.style.display = 'block';
    div_cadastro.style.display = 'none';
  }

function Exibir() {
  if (div_escondida.style.display == "none") {
    div_escondida.style.display = "block";
    pagina.style.width = "80%";
  } else {
    div_escondida.style.display = "none";
    pagina.style.width = "100%";
  }
}

function testeLogin() {
  window.location = "cadastro.html";
}
