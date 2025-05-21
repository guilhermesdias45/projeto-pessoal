function Exibir() {
  if (div_escondida.style.display == "none") {
    div_escondida.style.display = "block";
  } else {
    div_escondida.style.display = "none";
  }
}

function testeLogin() {
  window.location = "cadastro.html";
  //   if(sessionStorage.ID_USUARIO == null){
  //     window.location = "login.html";
  //   } else{
  //     window.location = "perfil.html";
  //   }
}
