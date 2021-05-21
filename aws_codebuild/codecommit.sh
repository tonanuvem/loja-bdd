echo "Criar o Repositório do Projeto de Testes BDD:"
aws codecommit create-repository --repository-name bddtestes --repository-description "Testes BDD dos Microserviços" --region us-east-1
echo "Configurar as credenciais"
git config --global credential.helper '!aws codecommit credential-helper $@'
git config --global credential.UseHttpPath true
echo "Salvar o código fonte do Projeto de Testes BDD:"
cd ~/environment/pagamento-bdd-gof
rm -rf .git
echo -e '*/target/**' >> .gitignore
git init
git add *
git add .mvn/*
git commit -m "criando repo"
git remote add origin "https://git-codecommit.us-east-1.amazonaws.com/v1/repos/bddtestes"
git push -f origin master
