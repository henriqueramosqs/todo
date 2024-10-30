# todo
Lista de tarefas feita para o processo seletivo da V360. A aplicação foi desenvolvida com inspiração no [pastebin](https://pastebin.com) e permite que um usuário crie e a acesse listas de tarefas, adicione tarefas em cada uma dessas listas, e mude uma tarefa de categoria (feito | não feito).

# Instalação e execução
Para utilizar, tenha o Ruby on Rails e suas dependências instaladas na sua máquina e digite no terminal:

```
git clone https://github.com/henriqueramosqs/todo
cd todo/todo
rails s
```
Em seguida, use um navegador para acessar a rota http://localhost:3000.

Se algo do tipo "migration pending" aprecer ao invés da tela inicial, volte ao terminal, interrompa o processo e faça:

```
rails db:migrate
rails s
```
Volte para localhost:3000 e tudo deve ocorrer conforme o esperado.




