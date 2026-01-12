# Clone Empiricus Research

Clone Empiricus Research é um projeto demonstrativo criado para meu processo seletivo, com o objetivo de mostrar habilidades práticas em Flutter: arquitetura de tela, gerenciamento de estado, consumo de dados locais, responsividade e boas práticas de UI.

## O que este projeto demonstra

- Uso de Slivers e layouts responsivos (SliverAppBar, SliverPersistentHeader, CustomScrollView).
- Estrutura de camadas (models, data, controllers) e mapeamento de dados para modelos Dart.
- Gerenciamento de estado com Cubit/Bloc (`HomeController` / `HomeState`).
- Widgets reutilizáveis e tratamento responsivo de texto e imagens.
- Integração de pacotes úteis: `google_fonts`, `intl`, `flutter_bloc`.

## Como executar

1. Instale as dependências:

```powershell
flutter pub get
```

2. Rode no emulador ou dispositivo:

```powershell
flutter run
```

3. Para gerar um APK (Android):

```powershell
flutter build apk
```

> Observação: se utilizar `google_fonts` com cache, pode ser necessário adicionar o plugin `path_provider` (já incluído) e reiniciar a aplicação totalmente.

## Estrutura principal

- `lib/app/data` — fontes de dados e fixtures (notícias, lives).
- `lib/app/models` — modelos tipados para domínio (NewsModel, LivesModel).
- `lib/pages/` — telas, componentes e controller (UI + lógica de apresentação).
