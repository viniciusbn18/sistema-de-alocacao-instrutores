# Sistema de Alocação de Instrutores e Cursos

Este repositório contém o sistema de alocação de instrutores e cursos, organizado em um **monorepo** com frontend e backend.  
O objetivo deste README é servir como **guia completo** para desenvolvedores da equipe contribuírem de forma organizada.

--------------------------------------------------------------------------------

## **📁 Estrutura do repositório**

/projeto-alocacao-instrutores
├── backend/ # Código backend Spring Boot
│ ├── src/
│ └── Dockerfile
├── frontend/ # Código frontend (HTML, CSS, JS)
└── docker-compose.yml # Orquestração Docker para desenvolvimento

## **⚙️ Perfis de execução (Spring Boot)**

O backend possui três perfis:

| Perfil | Banco | Objetivo | Quando usar |
|--------|-------|----------|------------|
| dev    | PostgreSQL (Docker) | Desenvolvimento diário | Codar funcionalidades, testes manuais |
| test   | H2 em memória | Testes automatizados | Rodar JUnit e testes de integração rapidamente |
| prod   | PostgreSQL real | Deploy seguro | Produção / homologação |

---

## **💻 Backend**

### Dependências Maven principais

- `spring-boot-starter-web` → APIs REST e servidor embutido
- `spring-boot-starter-data-jpa` → JPA/Hibernate
- `postgresql` → driver PostgreSQL
- `h2` → banco de teste em memória
- `spring-boot-starter-test` → JUnit e testes de integração
- `lombok` → reduzir boilerplate
- `flyway-core` → controle de migrations 
- `spring-boot-devtools` → reload automático em dev
- `spring-boot-starter-security` → autenticação/autorização

---

### **🚀 Rodando o backend**

Com Docker Compose:

- **Desenvolvimento (dev)**
```bash
docker compose up --build
```

- Testes Automatizados (test)
```
mvn test
```
- Produção (prod)
```
SPRING_PROFILES_ACTIVE=prod DB_USER=usuario DB_PASSWORD=senhaSegura docker compose up --build -d
```
## 🌐 **Frontend**

- Servido via Nginx no container do Docker.

- Código está em frontend/.

- Porta padrão: http://localhost

## 🐳 **Docker**
O docker-compose.yml orquestra os seguintes serviços:

|Serviço | Imagem | Função |
|--------|--------|--------|
|db      | postegres: 15| Banco de dados dev/prod |
|backend | build: ./backend |API Spring Boot |
|frontend| nginx:alpine | Servir frontend estático

- O Postgres cria o banco meu_banco_dev automaticamente no dev.

- Backend depende do db (depends_on) para iniciar.

## 🧪 **Testes**

- Todos os testes automatizados usam o perfil test com banco H2.

- Cada execução de teste começa com banco limpo em memória.

- Rodar:
```
mvn test
```
## 📝 **Boas práticas de contribuição**

1. **Branching**
    - Crie  branches com nome claros
        - ``` feature/nome-da-funcionalidade ```
        - ```bugfix/nome-do-bug```
2. **Commits**
    - Mensagens claras e objetivas, exemplo:
    ```
    feat: adicionar endpoint para listar instrutores
    fix: corrigir cálculo de horas do instrutor
    ```
3. **Pull Requests**

    - Abrir PR para branch principal (``main`` ou ``develop``)

    - Revisão obrigatória por outro membro da equipe

    - Rodar todos os testes antes de merge

4. **Docker**
    - Sempre subir containers com Docker Compose no dev
    - Evite rodar backend sem Docker em dev, para manter consistência do PostgreSQL

5. **Perfis**
    - **dev** →  desenvolvimento diário
    - **test** → apenas testes automatizados
    - **prod** → produção/homologação
6. **Banco de Dados**
    - Não altere o schema manualmente em produção
    - Use migrations via Flyway

## 🔗 **Resumo rápido dos comandos**


Comando | Descrição |
------- | --------- |
  ``docker compose up --build`` | Sobe backend, frontend e PostgreSQL para dev 
|``mvn test``| Executa testes automatizados com H2|
  
