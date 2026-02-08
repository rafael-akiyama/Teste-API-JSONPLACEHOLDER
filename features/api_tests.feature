# language: pt
Funcionalidade: Testes de API JSONPlaceholder
    Como um testador automatizado
    Desejo validar os endpoints GET e POST da API
    Para garantir que funcionam conforme o especificado

    Contexto:
        Dado que a API JSONPlaceholder está disponível
        E o endpoint base é "https://jsonplaceholder.typicode.com"

    Cenário: Buscar todos os comentários com sucesso (GET)
        Quando envio uma requisição GET para "/comments"
        Então o status code deve ser 200
        E a resposta deve ser um array
        E o array deve conter elementos
        E cada comentário deve ter os campos obrigatórios:
            | postId |
            | id     |
            | name   |
            | email  |
            | body   |
        E os campos devem ter tipos de dados corretos
        E os emails devem ter formato válido

    Cenário: Criar um novo álbum com sucesso (POST)
        Dado que tenho os seguintes dados do álbum:
            | campo  | valor     |
            | userId | 1         |
            | title  | Nova ID   |
        Quando envio uma requisição POST para "/albums" com os dados
        Então o status code deve ser 201
        E a resposta deve ser um objeto JSON
        E o tempo de resposta deve estar abaixo de 2000ms
        E a resposta deve conter o userId enviado: 1
        E a resposta deve conter o title enviado: "Nova ID"
        E o servidor deve ter gerado um ID para o álbum
        E o ID gerado deve ser um número maior que 0
