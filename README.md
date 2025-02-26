# ✨ Sistema de Denúncias Urbanas ✨

## Introdução
O **Sistema de Denúncias Urbanas** permite que cidadãos relatem problemas urbanos, como buracos nas ruas, postes quebrados e outros incidentes, de forma rápida e eficiente. A plataforma será utilizada tanto por cidadãos quanto por autoridades responsáveis pela solução desses problemas.

A plataforma também inclui recursos de **acessibilidade** para garantir que **Pessoas com Deficiência (PCD)** possam utilizá-la de forma eficaz, promovendo inclusão e garantindo que todos tenham voz ativa na melhoria da cidade.

---

## ⚙️ Funcionalidades Principais

### 📂 Cadastro de Usuários
Os cidadãos devem se cadastrar informando:
- Nome
- E-mail
- Senha
- Localização (opcional)
- Opção de indicar se é PCD (Sim/Não)

Se **"Sim"**, o usuário poderá selecionar uma ou mais necessidades específicas:
- 🧡 **Deficiência Auditiva** (ex.: notificações em LIBRAS ou legendas)
- 👨‍🦯 **Deficiência Visual** (ex.: suporte para leitor de tela ou notificações por áudio)
- 🦽 **Deficiência Física** (ex.: opção para reportar problemas de acessibilidade urbana)
- 🧠 **Deficiência Cognitiva** (ex.: interface simplificada e textos acessíveis)

### 📝 Registro de Denúncias
Os usuários podem cadastrar uma denúncia informando:
- **Título**
- **Descrição**
- **Foto** (opcional)
- **Localização** (mapa interativo)
- **Categoria do problema**
- **Opção de relatar problemas de acessibilidade** (ex.: falta de rampas, calçadas irregulares)

Cada denúncia terá um status:
- ✅ **Aberta** (cadastrada pelo usuário)
- 📝 **Em Análise** (quando uma autoridade estiver verificando)
- 🏢 **Resolvida** (quando a denúncia for solucionada)

Somente **autoridades** podem alterar o status da denúncia.

### 💬 Interação e Comentários
- Usuários podem **comentar** em denúncias para fornecer mais informações.
- Autoridades podem **responder** diretamente na plataforma.
- Suporte para **comentários em áudio** para usuários com deficiência visual ou motora.

### 🌏 Mapa de Problemas
- Denúncias disponíveis em um **mapa interativo** para visualização pública.
- Estatísticas sobre os problemas mais frequentes e **áreas mais afetadas**.
- Filtros específicos para **problemas de acessibilidade**.

### 🛡️ Moderação e Segurança
- Permite **denúncias anônimas**, evitando spam e informações falsas.
- Possibilidade de **denunciar conteúdo inapropriado**.
- Suporte para **leitores de tela**, **alto contraste** e **ajustes de fonte**.

### 📢 Notificações e Alertas
- Notificações automáticas sobre o **status das denúncias**.
- Atualizações sobre **problemas próximos** à localização do usuário.
- Usuários **PCD** podem optar por notificações em **áudio** ou **LIBRAS**.

### 🗳️ Votação e Engajamento
- Usuários podem **votar** em denúncias para aumentar sua prioridade.
- Denúncias mais votadas aparecem no topo para autoridades verificarem primeiro.
- Denúncias sobre **acessibilidade** recebem **destaque** na plataforma.

---

## 📊 Modelo de Relacionamentos

- **Usuário (1) → (N) Denúncias** (um usuário pode criar várias denúncias)
- **Denúncia (1) → (N) Comentários** (uma denúncia pode ter vários comentários)
- **Denúncia (1) → (N) Histórico de Status** (registros de mudança de status)
- **Denúncia (1) → (N) Votos** (usuários podem votar em denúncias)
- **Denúncia (N) → (1) Categoria** (cada denúncia pertence a uma categoria)
- **Denúncia (N) → (1) Autoridade** (cada denúncia pode ser resolvida por uma autoridade)
- **Usuário (1) → (N) Comentários** (usuário pode comentar em várias denúncias)
- **Usuário (1) → (N) Notificações** (usuário pode receber várias notificações)
- **Usuário (1) → (1) Preferências de Acessibilidade** (cada usuário pode definir suas preferências)

---

## 📚 Considerações Finais
### O que o sistema faz:
✅ **Organiza eficientemente as denúncias**
✅ **Rastreia detalhadamente o status dos problemas**
✅ **Promove engajamento e transparência**
✅ **Facilita a comunicação entre cidadãos e autoridades**
✅ **Garante acessibilidade para todos os usuários**

