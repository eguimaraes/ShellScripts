
# Método 1: Apagando Posts em Massa Pelo Painel do WordPress
# (Este método é manual, siga as etapas diretamente no painel do WordPress)

# Método 2: Usando Plugin (Exemplo: Bulk Delete)
# (Este método requer que você siga as instruções do plugin no painel do WordPress)

# Método 3: Apagar Todos os Posts Diretamente pelo Banco de Dados (phpMyAdmin)

# Apagar todos os posts:
DELETE FROM wp_posts WHERE post_type = 'post';

# Apagar os metadados dos posts excluídos:
DELETE pm FROM wp_postmeta pm 
LEFT JOIN wp_posts wp ON wp.ID = pm.post_id 
WHERE wp.ID IS NULL;

# Método 4: Usando WP-CLI

# Acesse o diretório do WordPress via SSH:
cd /caminho/do/seu/site/wordpress

# Excluir todos os posts:
wp post delete $(wp post list --post_type='post' --format=ids)
