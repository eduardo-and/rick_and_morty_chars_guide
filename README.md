# Rick and Morty Chars Guide
## Apk
<a href="https://github.com/eduardo-and/rick_and_morty_chars_guide/raw/master/apk/rick-and-morty-chars-guide.apk">
<img src="https://upload.wikimedia.org/wikipedia/commons/1/11/Download_apk.png?20180424184350" alt="drawing" width="250"/></a>

### Descrição

O objetivo do projeto é aprimorar as habilidades em prototipagem e desenvolvimento mobile, utilizando Flutter e as linguagens nativas. Nesse contexto, a implementação do projeto também será realizada em Kotlin quanto em Swift. Quanto aos dados, foram obtidos através da API **[https://randomuser.me/api](https://rickandmortyapi.com/)**.

## Implementação
### Design System
A fim de acelerar o processo de desenvolvimento e garantir uma boa qualidade final ao produto,
realizei a implementação do protótipo(UI) da solulção, juntamente com um design system bem básico para o projeto

[Design system](https://www.figma.com/file/eMMnfCyK8EG5yP8TbTWrOf/Rick-and-morty-app?type=design&node-id=1-5&mode=design)

<br>

[UI](https://www.figma.com/file/eMMnfCyK8EG5yP8TbTWrOf/Rick-and-morty-app?type=design&node-id=0%3A1&mode=design&t=ev7UnyCV1HP9Mvxx-1)

<br>
Para complementar, criei também um tema dark.
<br><br>

![light theme](https://github.com/eduardo-and/rick_and_morty_chars_guide/assets/20565180/675c48b8-92a8-4a52-9787-d99b26ee1f6b)

![dark theme](https://github.com/eduardo-and/rick_and_morty_chars_guide/assets/20565180/536c4f32-4f1e-41e4-b369-021ee6c6795c)

## Stack
Alguns packages e decisões arquiteturais do projeto:

  - Arquitetura: **Clean architecture**
  - State management: **MobX**
  - Http Client : **DIO**
  - Dependency injection: **get_it**
  - Routes: **Flutter Navigator**
  - Local data store: **Shared Preferences**
  
  Outros
   - DartZ
   - google_fonts
   - flutter_svg

</br>

## Rodando o projeto

Possuindo o ambiente flutter/dart instalado e configurado, realize os passos a seguir:
- Execute os comandos a seguir:

```
flutter pub get
flutter pub run build_runner build 
```
- Execute a aplicação

