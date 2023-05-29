# Pageone Theme

Uma tema para o software [OJS](https://pkp.sfu.ca/software/ojs/download/).

OJS é uma aplicação web para publicar artigos e revistas, gerenciar o fluxo de trabalho de pesquisadores, autores e avaliadores em suas práticas acadêmicas.

Desenvolvido pelo grupo [PKP](https://pkp.sfu.ca/about/), possui vasta [documentação](https://docs.pkp.sfu.ca/dev/) e uma [comunidade de desenvolvedores e usuários](https://forum.pkp.sfu.ca/) bastante ativa. No Brasil, também podemos contar com o [forum do Ibict](https://forum.ibict.br/)

## Descrição
Pageone é um plugin OJS da categorial visual. Um tema que muda a exibição da interface do OJS, tornando-a mais atrativa e provendo mais opções de usabilidade e interatividade para o usuário final.

## Instalação

Este é um projeto pessoal, mas você é livre para usar e modificar. Se existir algum problema, [reporte](https://github.com/webfelipemaia/PageoneThemePlugin/issues). Você [pode ajudar](https://github.com/webfelipemaia/PageoneThemePlugin/pulls), se quiser. Não seja tímido. Agora, se você chegou aqui e não sabe como fazer para instalar, veja abaixo o guia de instalação para de acordo com o seu nível de conhecimento.


### Para quem não sabe nada

```
Este conteúdo ainda não está disponível :cry:
```

### Para administradores e desenvolvedores

#### Administradores

1. Baixe o arquivo `pageone.tar.gz` e descompate na pasta `../plugins/themes/`.
2. Instale as dependências. Para isso, é preciso ter instalado na máquina tanto o [npm](https://www.npmjs.com/get-npm) quanto o [Gulp](https://gulpjs.com/). Você tem a opção de trabalhar com uma folha de estilos sem a necessidade de compilar os arquivos `.less`. Nesse caso, basta apontar a nova folha de estilos no arquivo de configuração do tema.
3. Executar o comando `gulp compileAll` para compilar e minificar os arquivos. Após isso, todos os arquivos necessários para exibir a bela aparência do tema serão enviados para a pasta `assets/`.
4. Descrição da pasta `assets/`.

    4.1 `css/`: folhas de estilos do tema e das fontes utilizadas no tema, se houver.

    4.2 `fonts/`: arquivos das fontes utilizadas no tema.

    4.3 `js/`: arquivos JavaScript.

    4.4 `less/`: folhas de estilos dinâmica [Less Language](https://lesscss.org/usage/). Depois da compilação, os arquivos `.css` são gerados.

5. As demais pastas são: `locale/` que trata da tradução; `templates/` que são os arquivos `.tpl` responsáveis pela personalização do OJS; demais arquivos de configuração, dentre os quais está o principal, que é o `PageoneThemePlugin.inc.php`.
6. No painel do administrador, ative o plugin. e habilite o tema.

#### Desenvolvedores

## Licenç
Este tema é lançado sob a licença GPL.

A fonte Roboto é distribuída sob os termos da [Apache License, 2.0](http://www.apache.org/licenses/LICENSE-2.0). A fonte Spectral é distribuída sob os termos da [Open Font License](https://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL).
