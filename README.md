<div align="center">
<h2><img src="./.github/logo.png" alt="Proffy" width="200"></h2>
<h3>Sua plataforma de estudos online</h3>
</div>

<hr>

Aplicativo desenvolvido como projeto final para disciplina de Programação para Dispositivos Móveis.

## Executando localmente

Pré-requisitos:

- Flutter SDK instalado em seu sistema
- Git instalado em seu sistema

Abra o terminal ou prompt de comando no seu sistema e Navegue até o diretório onde deseja clonar o repositório. Depois, execute o seguinte comando para clonar o repositório:

```sh
  git clone https://github.com/GilbertSilvaa/dev.CV.git
```

Aguarde até que o Git termine de clonar o repositório. Após a conclusão do clone, navegue até o diretório do projeto:

```sh
  cd dev.CV/app
```

Execute os seguintes comandos para atualizar o SDK e verificar se há dependências não instaladas:

```sh
  flutter upgrade
  flutter pub get
```

Agora você está pronto para executar o aplicativo Flutter. Utilize o seguinte comando:

```sh
  flutter run
```

Aguarde até que o processo de compilação seja concluído e o aplicativo seja iniciado no emulador ou dispositivo.

## API do projeto

A API foi desenvolvida pelo próprio grupo e pode ser acessada através `https://dev-cv-api.onrender.com`. No diretório `api/` há instruções de como usar melhor as rotas.

Caso haja instabilidade no uso da API hospedada, é necessário rodá-la localmente, baixando as dependências necessárias de API e modificando o arquivo `app/lib/services/api_service.dart` para a URL local.
