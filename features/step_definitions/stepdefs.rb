# Steps CRUD Produtos

Given("Eu estou na pagina de criar um novo produto") do
  visit 'http://localhost:3000/produtos/new'
  expect(page).to have_content('Novo Produto')
end

When("Eu crio o produto de descricao {string} e preco {int}") do |string, int|
  fill_in 'produto[descricao]', :with => string
  fill_in 'produto[preco]', :with => int
end

When("Clico em criar produto") do
  click_button 'Create Produto'
end

Then("Eu vejo que o produto de descricao {string} foi salvo") do |string|
  expect(page).to have_content(string)
end

Then("Eu vejo a mensagem de erro {string}") do |string|
  expect(page).to have_content(string)
end

When("Eu crio o produto de descricao {string} e preco {string}") do |string, string2|
  fill_in 'produto[descricao]', :with => string
  fill_in 'produto[preco]', :with => string2
end

# Steps CRUD Vendas

Given("Eu estou na tela de nova venda") do
  visit 'http://localhost:3000/vendas/new'
  expect(page).to have_content('Nova Venda')
end

When("Eu crio uma nova venda com o cliente {string}, o produto {string} e quantidade {int}") do |cliente,produto, quantidade|
  select cliente, :from => "venda[cliente_id]"
  select produto, :from => "venda[produto_id]"
  select quantidade, :from => "venda[quantidade]"
end

When("Eu clico em criar venda") do
  click_button 'Create Venda'
end

Then("Eu vejo que o produto {string} foi salvo") do |string|
  expect(page).to have_content(string)
end

Then("Eu vejo as mensagens de erro {string} e {string}") do |string, string2|
  expect(page).to have_content(string)
  expect(page).to have_content(string2)
end