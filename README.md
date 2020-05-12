Doggies App

<b>Itens Técnicos</b> 

  - Arquitetura MVVM - Projeto desenvolvido em MVVM utilizando alguns protocolos para injeção de dependência. O intuito da abordagem é desacoplar as partes do app e poder utilizar a arquitetura para testes.
  - Cache de Imagens utilizando uma abordagem da classe NSCache.
  - Validação de e-mail do usuário utilizando regex
  
<b>Run App</b>
- O projeto possui apenas um target e pode ser rodado em qualquer dispositivo iOS desde que seja >= iOS 9
- O processo de Login ocorre apenas uma vez. O usuário permanece loga nas outras vezes em que for utilizar o app.

Frameworks utilizados: 
- SnapKit - Utiizado com o intuito de facilitar o setup de constraints com ViewCode
- SwiftKeychainWrapper - Utilizado para lidar com o armazenamento do token de acesso do usuário, salvando-o através do Keychain API. Uma alternativa mais segura frente ao uso do UserDefaults
