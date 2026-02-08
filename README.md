# API Tests - Postman + Newman (BDD Style)

Projeto de testes automatizados para a API [JSONPlaceholder](https://jsonplaceholder.typicode.com/) usando Postman Collection e Newman CLI com **estrutura BDD (Behavior-Driven Development)**.

## 🎯 Metodologia BDD

Os testes seguem a estrutura **Dado/Quando/Então** para melhor legibilidade e organização:

- **Dado** : Contexto inicial / Pré-condições
- **Quando** : Ação executada  
- **Então** : Resultado esperado
- **E** : Condições adicionais

📋 **[Cenários em Gherkin](features/api_tests.feature)** | 

## 📋 Testes Implementados

### 1. Teste GET - /comments
- **Endpoint:** `GET https://jsonplaceholder.typicode.com/comments`
- **Feature**: Consultar comentários da API
- **Scenario**: Buscar todos os comentários com sucesso
- **Validações:**
  - **Dado**: A API está disponível
  - **Quando**: Faço uma requisição GET para /comments
  - **Então**: 
    - Status code deve ser 200
    - Resposta deve ser um array
    - Array deve conter elementos
  - **E**: Os comentários devem ter estrutura válida
    - Campos obrigatórios (postId, id, name, email, body)
    - Tipos de dados corretos
    - Email com formato válido

### 2. Teste POST - /albums
- **Endpoint:** `POST https://jsonplaceholder.typicode.com/albums`
- **Feature**: Criar novo álbum na API
- **Scenario**: Criar álbum com dados válidos
- **Body:**
  ```json
  {
    "userId": 1,
    "title": "Nova ID"
  }
  ```
- **Validações:**
  - **Dado**: Tenho dados válidos de um álbum
  - **Quando**: Envio uma requisição POST para /albums
  - **Então**:
    - Status code deve ser 201 (Created)
    - Resposta deve ser um objeto JSON
    - Tempo de resposta abaixo de 2000ms
  - **E**: A resposta deve conter os dados enviados
    - userId enviado
    - title enviado
    - ID gerado pelo servidor

## 🚀 Como Usar

### Pré-requisitos
- Node.js (versão 18 ou superior)
- npm

### Instalação
```bash
npm install
```

### Executar Testes

#### Execução padrão (com relatórios HTML e JSON)
```bash
npm test
```

#### Execução verbosa (mais detalhes no console)
```bash
npm run test:verbose
```

#### Execução para CI (apenas JSON e CLI)
```bash
npm run test:ci
```

### Visualizar Relatórios
Após executar os testes, os relatórios estarão disponíveis em:
- **HTML:** `newman/reports/report.html` (abra no navegador)
- **JSON:** `newman/reports/report.json`

## 🔄 GitHub Actions (CI/CD)

O projeto está configurado para executar os testes automaticamente:

- **Push/Pull Request:** Executa em branches `main` e `develop`
- **Agendamento:** Diariamente às 9h UTC
- **Manual:** Via workflow_dispatch

### Artifacts
Os relatórios são salvos automaticamente como artifacts do GitHub Actions e ficam disponíveis por 30 dias.

### Visualizar Resultados
1. Acesse a aba **Actions** do repositório
2. Clique no workflow executado
3. Veja o resumo dos testes no **Summary**
4. Baixe os relatórios em **Artifacts**

## 📊 Status dos Testes

Os testes validam:
- ✅ Status codes corretos
- ✅ Estrutura das respostas JSON
- ✅ Tipos de dados
- ✅ Presença de campos obrigatórios
- ✅ Performance (tempo de resposta)

## 🛠️ Tecnologias Utilizadas

- **[Newman](https://www.npmjs.com/package/newman)** - CLI do Postman para executar collections
- **[newman-reporter-html](https://www.npmjs.com/package/newman-reporter-html)** - Geração de relatórios HTML
- **[GitHub Actions](https://github.com/features/actions)** - CI/CD automation
- **[JSONPlaceholder](https://jsonplaceholder.typicode.com/)** - API de teste

## 📄 Autor

Rafael Akiyama