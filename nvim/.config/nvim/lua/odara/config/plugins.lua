return {

  -- Packages Managers {{{

  -- NOTE:   Gerenciador de plugins moderno e eficiente para Neovim.
  --   Carregamento sob demanda para otimizar o desempenho do editor.
  --   Suporte a dependências, configuração automática e hooks de inicialização.
  --   Interface intuitiva para instalação, atualização e gerenciamento de plugins.
  --   Repositório: https://github.com/folke/lazy.nvim
  lazy_nvim = true,

  -- NOTE:  Gerencia a instalação de LSPs, DAPs, linters e formatters no Neovim.
  --  Fornece uma interface simples para instalar e atualizar ferramentas externas.
  --  Integra-se com lspconfig e null-ls para configuração automática.
  --  Repositório: https://github.com/williamboman/mason.nvim
  mason_nvim = true,

  -- }}}

  -- AI {{{

  -- NOTE:   Integração oficial do GitHub Copilot para Neovim.
  --   Sugestões de código em tempo real baseadas em IA.
  --   Suporte a múltiplas linguagens e contexto inteligente.
  --   Configuração simples via `.vimrc` ou `init.lua`.
  --   Repositório: https://github.com/github/copilot.vim
  copilot_vim = false,

  -- }}}

  -- Tests {{{

  -- NOTE:   Framework para executar testes diretamente do Neovim.
  --   Suporte a diversas linguagens e frameworks de teste.
  --   Integra-se com terminais, Tmux, Neovim jobs e mais.
  --   Comandos fáceis para rodar testes de arquivo, linha ou suíte completa.
  --   Repositório: https://github.com/vim-test/vim-test
  vim_test = false,

  -- NOTE:   Framework de testes modular para Neovim.
  --   Suporte a múltiplas linguagens e frameworks de teste.
  --   Integra-se com Treesitter, LSP e interfaces personalizadas.
  --   Permite execução assíncrona e exibição detalhada de resultados.
  --   Repositório: https://github.com/nvim-neotest/neotest
  neotest = true,

  -- NOTE:   Adaptador do Neotest para testes em Go.
  --   Permite executar, depurar e visualizar testes de Go diretamente no Neovim.
  --   Integra-se com `go test` e suporta execução assíncrona.
  --   Compatível com `neotest`, oferecendo feedback detalhado sobre testes.
  --   Repositório: https://github.com/nvim-neotest/neotest-go
  neotest_go = true,

  -- }}}

  -- UI {{{

  -- NOTE:  Tela inicial altamente customizável para o Neovim.
  --  Suporte a atalhos, cabeçalhos personalizados e integração com plugins.
  --  Exibe sessões recentes, atalhos rápidos e informações úteis no startup.
  --  Leve, rápido e fácil de configurar com temas prontos.
  --  Repositório: https://github.com/goolord/alpha-nvim
  alpha_nvim = true,

  -- NOTE:  Gerencia buffers como abas no Neovim com uma interface moderna.
  --  Suporte a ícones, separadores e indicadores de buffer ativo.
  --  Integra-se com nvim-web-devicons e temas personalizados.
  --  Configurável com atalhos para navegação e manipulação de buffers.
  --  Repositório: https://github.com/akinsho/bufferline.nvim
  bufferline_nvim = false,

  -- NOTE:  Ícones para arquivos e diretórios no Neovim.
  --  Integra-se com plugins como nvim-tree, telescope e lualine.
  --  Suporte a múltiplos temas e personalização de ícones.
  --  Requer uma fonte Nerd Font para exibição correta.
  --  Repositório: https://github.com/nvim-tree/nvim-web-devicons
  nvim_web_devicons = true,

  -- NOTE:  Melhora a interface de seleção e entrada de comandos no Neovim.
  --  Substitui `vim.ui.select` e `vim.ui.input` por janelas customizáveis.
  --  Integra-se com Telescope e fzf para uma experiência aprimorada.
  --  Leve, configurável e compatível com diversos plugins.
  --  Repositório: https://github.com/stevearc/dressing.nvim
  dressing_nvim = true,

  -- NOTE:  Adiciona guias visuais para indentação no Neovim.
  --  Suporte a Treesitter e detecção de escopo para indentação inteligente.
  --  Configuração flexível para exibir níveis de indentação e linhas virtuais.
  --  Compatível com modos escuros e integração com temas.
  --  Repositório: https://github.com/lukas-reineke/indent-blankline.nvim
  indent_blankline_nvim = true,

  -- NOTE: 墳 Barra de status altamente customizável para Neovim.
  --  Suporte a separadores, temas e integração com LSP, buffers e git.
  --  Leve e otimizada para desempenho sem comprometer a estética.
  --  Fácil de configurar e compatível com nvim-web-devicons.
  --  Repositório: https://github.com/nvim-lualine/lualine.nvim
  lualine_nvim = true,

  -- NOTE:  Melhora a experiência com mensagens, comandos e LSP no Neovim.
  --  Substitui `:messages`, entrada de comandos e UI de notificações.
  --  Integra-se com Telescope, cmp e LSP para uma exibição fluida.
  --  Altamente personalizável com suporte a animações e janelas flutuantes.
  --  Repositório: https://github.com/folke/noice.nvim
  noice_nvim = true,

  -- NOTE:  Biblioteca para criar interfaces gráficas no Neovim com Lua.
  --  Fornece APIs para janelas, popups, menus e componentes customizados.
  --  Utilizado por diversos plugins como noice.nvim e dressing.nvim.
  --  Flexível, eficiente e fácil de integrar com outras ferramentas.
  --  Repositório: https://github.com/MunifTanjim/nui.nvim
  nui_nvim = true,

  -- NOTE:  Sistema de notificações elegante e configurável para Neovim.
  --  Substitui `:echo` e `:messages` com uma UI flutuante moderna.
  --  Suporte a histórico de notificações e níveis de prioridade.
  --  Integrável com LSP, plugins e atalhos personalizados.
  --  Repositório: https://github.com/rcarriga/nvim-notify
  nvim_notify = true,

  -- NOTE:  Mostra dicas de atalhos no Neovim em tempo real.
  --  Exibe combinações de teclas disponíveis ao pressionar um prefixo.
  --  Ajuda a memorizar atalhos e melhorar a produtividade.
  --  Totalmente configurável, com suporte a grupos e descrições personalizadas.
  --  Repositório: https://github.com/folke/which-key.nvim
  which_key_nvim = true,

  -- NOTE:  Maximiza e restaura janelas no Neovim com um único comando.
  --  Mantém o layout original ao restaurar a visualização.
  --  Funciona em splits horizontais e verticais sem alterar buffers.
  --  Simples, leve e sem dependências externas.
  --  Repositório: https://github.com/szw/vim-maximizer
  vim_maximizer = true,

  -- }}}

  -- Bookmarks {{{

  -- NOTE:   Gerenciador de bookmarks simples e eficiente para Neovim.
  --   Permite salvar, visualizar e navegar rapidamente entre bookmarks.
  --   Suporte a atalhos personalizáveis e integração com Telescope.
  --   Armazena bookmarks em um arquivo, permitindo persistência entre sessões.
  --   Repositório: https://github.com/crusj/bookmarks.nvim
  bookmarks_nvim = false,

  -- }}}

  -- File Explorers {{{

  -- NOTE:  Gerenciador de arquivos em árvore para Neovim.
  --  Suporte a ícones, atalhos e integração com git.
  --  Permite navegação rápida e manipulação de arquivos diretamente no editor.
  --  Leve, altamente configurável e substitui o netrw.
  --  Repositório: https://github.com/nvim-tree/nvim-tree.lua
  nvim_tree_lua = true,

  -- }}}

  -- Themes {{{

  -- NOTE:  Tema moderno e vibrante para Neovim com suporte a LSP e Treesitter.
  --  Oferece variações como Night, Storm, Day e Moon.
  --  Integra-se com diversos plugins para uma experiência visual coesa.
  --  Personalizável via configurações para cores e transparência.
  --  Repositório: https://github.com/folke/tokyonight.nvim
  tokyonight_nvim = false,

  -- NOTE:   Tema elegante e altamente personalizável para Neovim.
  --   Fornece paleta suave e consistente para diferentes ambientes.
  --   Suporte nativo para LSP, Treesitter, Telescope e mais.
  --   Variantes de cores configuráveis para diferentes estilos visuais.
  --   Repositório: https://github.com/catppuccin/nvim
  catppuccin_nvim = true,

  -- }}}

  -- Security {{{

  -- NOTE:  Permite salvar arquivos como root no Neovim sem precisar reiniciá-lo com sudo.
  --  Usa `:SudaWrite` e `:SudaRead` para escrita e leitura de arquivos protegidos.
  --  Funciona de forma transparente e sem necessidade de modificar permissões.
  --  Simples, leve e sem dependências externas.
  --  Repositório: https://github.com/lambdalisue/vim-suda
  vim_suda = true,

  -- }}}

  -- REST Clients {{{

  -- NOTE:  Cliente HTTP para Neovim com suporte a requisições assíncronas.
  --  Permite enviar requisições diretamente do editor e visualizar respostas.
  --  Integra-se com curl e exibe respostas formatadas no buffer.
  --  Suporte a autenticação, headers e corpo de requisição configuráveis.
  --  Repositório: https://github.com/rest-nvim/rest.nvim
  rest_nvim = true,

  -- }}}

  -- Clipboard {{{

  -- NOTE:  Gerencia o histórico de yanks e pastes no Neovim.
  --  Integra-se com Telescope e fzf-lua para busca rápida.
  --  Suporte a histórico persistente utilizando sqlite.lua.
  --  Configuração flexível com filtros e ações personalizadas.
  --  Repositório: https://github.com/AckslD/nvim-neoclip.lua
  nvim_neoclip_lua = true,

  -- }}}

  -- SQL {{{

  -- NOTE:  Fornece uma interface leve para SQLite no Neovim via Lua.
  --  Usa FFI para alto desempenho sem dependências externas.
  --  Suporte a operações SQL assíncronas e sincronas.
  --  Utilizado por plugins como nvim-neoclip.lua para histórico persistente.
  --  Repositório: https://github.com/kkharji/sqlite.lua
  sqlite_lua = true,

  -- }}}

  -- Completition {{{

  -- NOTE:  Autocompletar poderoso e extensível para Neovim.
  --  Suporte a múltiplas fontes, incluindo LSP, buffers e snippets.
  --  Integra-se com luasnip, nvim-autopairs e outros plugins.
  --  Altamente configurável, com mapeamentos e comportamento personalizável.
  --  Repositório: https://github.com/hrsh7th/nvim-cmp
  nvim_cmp = true,

  -- NOTE:  Fonte de autocompletar para palavras do buffer no nvim-cmp.
  --  Sugere trechos de texto já escritos no arquivo atual.
  --  Personalizável, permitindo filtros e preferências de correspondência.
  --  Leve e otimizado para eficiência no Neovim.
  --  Repositório: https://github.com/hrsh7th/cmp-buffer
  cmp_buffer = true,

  -- NOTE:  Fonte de autocompletar para LSP no nvim-cmp.
  --  Fornece sugestões inteligentes baseadas em servidores LSP ativos.
  --  Suporte para snippets, assinaturas de funções e documentação inline.
  --  Essencial para integração entre nvim-cmp e Neovim LSP.
  --  Repositório: https://github.com/hrsh7th/cmp-nvim-lsp
  cmp_nvim_lsp = true,

  -- NOTE: ﱮ Fonte de autocompletar para caminhos de arquivos no nvim-cmp.
  --  Sugere diretórios e arquivos com base no caminho digitado.
  --  Suporte a caminhos absolutos e relativos no Neovim.
  --  Leve, rápido e fácil de configurar.
  --  Repositório: https://github.com/hrsh7th/cmp-path
  cmp_path = true,

  -- NOTE:  Fonte de autocompletar para LuaSnip no nvim-cmp.
  --  Permite expandir e navegar por snippets diretamente no completor.
  --  Suporte a placeholders dinâmicos e múltiplas expansões.
  --  Integração fluida com LuaSnip para uma experiência otimizada.
  --  Repositório: https://github.com/saadparwaiz1/cmp_luasnip
  cmp_luasnip = true,

  -- NOTE:  Adiciona ícones aos menus de autocompletar do nvim-cmp.
  --  Melhora a experiência visual com ícones para LSP, snippets e buffers.
  --  Suporte a personalização de ícones e formatação do menu.
  --  Leve, eficiente e fácil de integrar com nvim-cmp.
  --  Repositório: https://github.com/onsails/lspkind.nvim
  lspkind_nvim = true,

  -- }}}

  -- Data Bases {{{

  -- NOTE:  Plugin para gerenciamento de bancos de dados no Neovim.
  --  Permite executar queries SQL diretamente no editor.
  --  Suporte para MySQL, PostgreSQL, SQLite, entre outros.
  --  Integração com plugins como vim-dadbod-ui e vim-dadbod-completion.
  --  Repositório: https://github.com/tpope/vim-dadbod
  vim_dadbod = false,

  -- }}}

  -- Debug (DAP) {{{

  -- NOTE:  Depurador assíncrono para Neovim.
  --  Suporte para depuração de várias linguagens via adaptadores DAP.
  --  Permite adicionar breakpoints, inspecionar variáveis e controlar a execução do código.
  --  Altamente configurável e extensível com integrações como nvim-dap-ui.
  --  Repositório: https://github.com/mfussenegger/nvim-dap
  nvim_dap = true,

  -- NOTE:  Suporte para depuração de Go no Neovim com nvim-dap.
  --  Configura automaticamente o adaptador DAP para Go (delve).
  --  Permite adicionar breakpoints, inspecionar variáveis e controlar a execução.
  --  Requer nvim-dap e Delve (dlv) instalado no sistema.
  --  Repositório: https://github.com/leoluz/nvim-dap-go
  nvim_dap_go = true,

  -- }}}

  -- Development {{{

  -- NOTE:  Configura automaticamente o Lua Language Server (LuaLS) para editar configurações do Neovim.
  --  Atualiza dinamicamente as bibliotecas do workspace com base nos módulos requeridos.
  --  Oferece integração com nvim-cmp e outras fontes de conclusão para declarações `require`.
  --  Repositório: https://github.com/folke/lazydev.nvim
  lazydev_nvim = true,

  -- NOTE:  Exibe diagnósticos, quickfix, LSP references e todo-comments em uma lista organizada.
  --  Interface intuitiva para navegação rápida entre erros e avisos.
  --  Integra-se com LSP, Telescope, todo-comments e outros plugins.
  --  Suporte a atalhos para abrir, fechar e filtrar resultados facilmente.
  --  Repositório: https://github.com/folke/trouble.nvim
  trouble_nvim = true,

  -- }}}

  -- Text Editing {{{

  -- NOTE:  Plugin para alternar valores booleanos no Neovim.
  --  Troca rapidamente entre `true` ⇄ `false`, `yes` ⇄ `no`, entre outros.
  --  Permite adicionar pares personalizados para alternância.
  --  Útil para edição rápida de configurações e código.
  --  Repositório: https://github.com/nguyenvukhang/nvim-toggler
  nvim_toggler = true,

  -- NOTE:  Plugin para comentar e descomentar linhas ou blocos no Neovim de forma fácil.
  --  Suporte a múltiplas linguagens com detecção automática de sintaxe.
  --  Integra-se com motions e operadores do Neovim para maior flexibilidade.
  --  Configuração simples e suporte a atalhos personalizados.
  --  Repositório: https://github.com/numToStr/Comment.nvim
  comment_nvim = true,

  -- NOTE:  Define automaticamente o tipo de comentário correto com base no contexto do Tree-sitter.
  --  Funciona em arquivos com múltiplas linguagens, como HTML, Vue e JavaScript.
  --  Integra-se com plugins como Comment.nvim para uma experiência aprimorada.
  --  Configuração simples e compatível com nvim-treesitter.
  --  Repositório: https://github.com/JoosepAlviste/nvim-ts-context-commentstring
  nvim_ts_context_commentstring = true,

  -- NOTE:  Realça e gerencia comentários como TODO, FIX, HACK e outros no código.
  --  Integra-se com Telescope para busca e navegação rápida.
  --  Suporte a destaque visual e personalização de palavras-chave.
  --  Repositório: https://github.com/folke/todo-comments.nvim
  todo_comments_nvim = true,

  -- NOTE:   Gerador de texto Lorem Ipsum para Neovim.
  --   Insere parágrafos, frases ou palavras fictícias rapidamente.
  --   Suporte a comandos e atalhos para geração dinâmica de texto.
  --   Configurável para diferentes comprimentos e estilos de saída.
  --   Repositório: https://github.com/derektata/lorem.nvim
  lorem = false,

  -- }}}

  -- Custom Text Motions {{{

  -- NOTE:  Insere automaticamente pares de caracteres como parênteses e aspas no Neovim.
  --  Suporte a múltiplas linguagens com integração ao Treesitter.
  --  Funciona com completion plugins como nvim-cmp para fechamento inteligente.
  --  Personalizável, permitindo regras específicas para diferentes contextos.
  --  Repositório: https://github.com/windwp/nvim-autopairs
  nvim_autopairs = true,

  -- NOTE:  Fornece novos operadores e movimentos para substituição e troca rápida de texto no Neovim.
  --  Inclui operadores de substituição, substituição em intervalo e troca de texto.
  --  Inspirado nos plugins vim-subversive e vim-exchange, reescrito em Lua para melhor desempenho.
  --  Repositório: https://github.com/gbprod/substitute.nvim
  substitute_nvim = false,

  -- NOTE:  Manipula pares de caracteres como parênteses, aspas e colchetes no Neovim.
  --  Adiciona, remove e substitui delimitadores de forma intuitiva.
  --  Inspirado no vim-surround, reescrito em Lua para melhor desempenho.
  --  Suporte a mapeamentos personalizados e integração com motions.
  --  Repositório: https://github.com/kylechui/nvim-surround
  nvim_surround = true,

  -- NOTE:  Fornece text-objects avançados baseados em Tree-sitter no Neovim.
  --  Permite seleção, movimentação e manipulação precisa de blocos de código.
  --  Suporte a linguagens múltiplas e integração com motions personalizados.
  --  Extensível e compatível com nvim-treesitter para melhor precisão.
  --  Repositório: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  nvim_treesitter_textobjects = false,

  -- }}}

  -- Folding {{{

  -- NOTE:  Plugin avançado de folding para Neovim.
  --  Suporte a LSP, Treesitter e indentação para um folding mais preciso.
  --  Permite abrir e fechar folds de forma eficiente com atalhos personalizados.
  --  Integração com Lualine e pré-visualização de código dobrado.
  --  Repositório: https://github.com/kevinhwang91/nvim-ufo
  nvim_ufo = true,

  -- NOTE:  Plugin para aprimorar a exibição de folds no Neovim.
  --  Personaliza a aparência dos folds com indentação e ícones.
  --  Suporte a destaque de sintaxe dentro dos folds recolhidos.
  --  Compatível com o sistema de folds nativo e plugins como nvim-ufo.
  --  Repositório: https://github.com/anuvyklack/pretty-fold.nvim
  pretty_fold_nvim = false,

  -- NOTE:  Plugin para pré-visualização de folds no Neovim.
  --  Mostra o conteúdo dobrado ao passar o cursor sobre um fold.
  --  Suporte para nvim-ufo e sistema de folds nativo.
  --  Altamente configurável, com opções de exibição personalizadas.
  --  Repositório: https://github.com/anuvyklack/fold-preview.nvim
  fold_preview_nvim = false,

  -- }}}

  -- Formatters {{{

  -- NOTE:  Formatação assíncrona e configurável para múltiplas linguagens no Neovim.
  --  Suporte a diversos formatters com fallback automático.
  --  Integração com autocmds para formatação ao salvar arquivos.
  --  Leve, sem dependências externas e fácil de configurar.
  --  Repositório: https://github.com/stevearc/conform.nvim
  conform_nvim = true,

  -- }}}

  -- Fuzzy Finders (Telescope) {{{

  -- NOTE:  Fuzzy finder altamente extensível para Neovim.
  --  Busca rápida em arquivos, buffers, LSP, comandos e muito mais.
  --  Integra-se com ripgrep, fd, fzf e plugins externos.
  --  Altamente configurável e personalizável com atalhos e extensões.
  --  Repositório: https://github.com/nvim-telescope/telescope.nvim
  telescope_nvim = true,

  -- NOTE:  Extensão do Telescope para busca ultrarrápida com FZF nativo.
  --  Usa C para melhor desempenho na correspondência fuzzy.
  --  Suporte a ordenação inteligente e prévia rápida de resultados.
  --  Requer compilação, mas melhora significativamente a velocidade de busca.
  --  Repositório: https://github.com/nvim-telescope/telescope-fzf-native.nvim
  telescope_fzf_native_nvim = true,

  -- NOTE:  Substitui `vim.ui.select` pela interface do Telescope no Neovim.
  --  Permite usar a experiência do Telescope para menus de seleção.
  --  Melhora a navegação e a busca em diálogos interativos.
  --  Leve, fácil de configurar e compatível com outros plugins.
  --  Repositório: https://github.com/nvim-telescope/telescope-ui-select.nvim
  telescope_ui_select_nvim = true,

  -- NOTE: Extensão do Telescope para integração com o LuaSnip no Neovim.
  -- Permite pesquisar e inserir snippets do LuaSnip através da interface do Telescope.
  -- Facilita a visualização e inserção de trechos de código de forma interativa.
  -- Repositório: https://github.com/benfowler/telescope-luasnip.nvim
  telescope_luasnip_nvim = true,

  -- }}}

  -- GIT {{{

  -- NOTE:  Integração do Lazygit com Neovim para gerenciamento eficiente de Git.
  --  Permite abrir o Lazygit diretamente no Neovim via comandos.
  --  Suporte a atalhos personalizados para navegação rápida.
  --  Leve e fácil de configurar, requer o Lazygit instalado.
  --  Repositório: https://github.com/kdheepak/lazygit.nvim
  lazygit_nvim = true,

  -- NOTE:  Exibe informações de alterações no Git diretamente no gutter do Neovim.
  --  Mostra adições, remoções e modificações em tempo real.
  --  Suporte a blame inline, hunk previews e restauração de mudanças.
  --  Leve, rápido e integrado ao Neovim sem dependências externas.
  --  Repositório: https://github.com/lewis6991/gitsigns.nvim
  gitsigns_nvim = true,

  -- }}}

  -- Highlighting {{{

  -- NOTE:  Fornece parsing avançado de código-fonte usando árvores sintáticas (Tree-sitter).
  --  Melhora realce de sintaxe, folds, indentação e análise estrutural do código.
  --  Suporte a múltiplas linguagens com instalação e atualização automática de parsers.
  --  Extensível, permitindo desenvolvimento de funcionalidades baseadas em árvore sintática.
  --  Repositório: https://github.com/nvim-treesitter/nvim-treesitter
  nvim_treesitter = true,

  -- }}}

  -- Libraries {{{

  -- NOTE:  Biblioteca auxiliar com funções utilitárias para desenvolvimento em Lua no Neovim.
  --  Fornece manipulação de arquivos, async, paths, jobs e mais.
  --  Dependência essencial para diversos plugins, como Telescope e nvim-lint.
  --  Facilita desenvolvimento de plugins com API unificada e eficiente.
  --  Repositório: https://github.com/nvim-lua/plenary.nvim
  plenary_nvim = true,

  -- NOTE:  Plugin para carregar configurações locais no Neovim.
  --  Permite executar arquivos `.nvim.lua`, `.nvimrc.lua` e similares em diretórios específicos.
  --  Suporte a listas de permissões e confirmações para segurança.
  --  Útil para projetos que exigem configurações específicas sem poluir a config global.
  --  Repositório: https://github.com/klen/nvim-config-local
  nvim_config_local = true,

  -- NOTE:  Biblioteca de Promises assíncronas para Neovim em Lua.
  --  Utilizada para facilitar operações assíncronas sem callbacks aninhados.
  --  Oferece uma API semelhante às Promises do JavaScript.
  --  Dependência essencial para plugins como nvim-ufo.
  --  Repositório: https://github.com/kevinhwang91/promise-async
  promise_async = true,

  -- }}}

  -- Linters {{{

  -- NOTE:  Executa linters assíncronos no Neovim sem necessidade de LSP.
  --  Suporte a múltiplos linters e configuração por arquivo ou global.
  --  Integra-se com autocmds para linting automático ao salvar arquivos.
  --  Extensível e compatível com diversas linguagens.
  --  Repositório: https://github.com/mfussenegger/nvim-lint
  nvim_lint = true,

  -- }}}

  -- LSP {{{

  -- NOTE:  Coleção de configurações prontas para servidores LSP no Neovim.
  --  Facilita a configuração e gerenciamento de LSPs com opções personalizáveis.
  --  Integra-se com mason.nvim para instalação automática de servidores.
  --  Repositório: https://github.com/neovim/nvim-lspconfig
  nvim_lspconfig = true,

  -- NOTE:  Integra mason.nvim com lspconfig para configuração automática de LSPs.
  --  Facilita a instalação e ativação de servidores LSP compatíveis.
  --  Garante compatibilidade entre mason.nvim e nvim-lspconfig.
  --  Repositório: https://github.com/williamboman/mason-lspconfig.nvim
  mason_lspconfig_nvim = true,

  -- NOTE:  Plugin para exibição de status assíncrono no Neovim.
  --  Mostra indicadores de carregamento para LSP e tarefas assíncronas.
  --  Fornece notificações visuais e discretas na interface do editor.
  --  Altamente configurável, com suporte a diferentes estilos de animação.
  --  Repositório: https://github.com/j-hui/fidget.nvim
  fidget_nvim = true,

  -- }}}

  -- Performance {{{

  -- NOTE:  Plugin para corrigir o tempo de espera do CursorHold no Neovim.
  --  Reduz atrasos ao usar eventos baseados em CursorHold.
  --  Melhora a responsividade de plugins como LSP, hover e pré-visualização.
  --  Essencial para evitar travamentos em timeouts longos.
  --  Repositório: https://github.com/antoinemadec/FixCursorHold.nvim
  fixcursorhold_nvim = true,

  -- }}}

  -- Sessions {{{

  -- NOTE:  Gerencia sessões automaticamente no Neovim.
  --  Salva e restaura sessões ao abrir e fechar o editor.
  --  Suporte a múltiplos diretórios e detecção automática de projetos.
  --  Configuração flexível com integração ao Telescope.
  --  Repositório: https://github.com/rmagatti/auto-session
  auto_session = false,

  -- NOTE:  Extensão do auto-session para buscar sessões com Telescope.
  --  Permite listar, pesquisar e carregar sessões salvas rapidamente.
  --  Integração fluida com auto-session e atalhos personalizáveis.
  --  Leve, eficiente e fácil de configurar.
  --  Repositório: https://github.com/rmagatti/session-lens
  session_lens = true,

  -- }}}

  -- Snippets {{{

  -- NOTE:  Sistema de snippets poderoso e extensível para Neovim.
  --  Suporte a múltiplos gatilhos, placeholders dinâmicos e expansões aninhadas.
  --  Integra-se com nvim-cmp para autocompletar snippets.
  --  Totalmente configurável, permitindo criação e personalização de snippets.
  --  Repositório: https://github.com/L3MON4D3/LuaSnip
  luasnip = true,

  -- NOTE:  Coleção de snippets pré-definidos para diversas linguagens no Neovim.
  --  Compatível com LuaSnip, snippy e outros sistemas de snippets.
  --  Inclui atalhos para frameworks e bibliotecas populares.
  --  Fácil de expandir e personalizar conforme necessário.
  --  Repositório: https://github.com/rafamadriz/friendly-snippets
  friendly_snippets = true,

  -- NOTE:   Plugin para desenvolvimento em Go no Neovim.
  --   Suporte a formatação, linting, execução e depuração de código Go.
  --   Integra-se com LSP, Treesitter, DAP e ferramentas como `gopls` e `dlv`.
  --   Comandos para testar, compilar e navegar pelo código de forma eficiente.
  --   Repositório: https://github.com/ray-x/go.nvim
  snippets_go_nvim = true,

  -- }}}

  -- Tasks {{{

  -- NOTE:   Gerenciador de tarefas assíncronas para Neovim.
  --   Executa, monitora e gerencia comandos e processos dentro do editor.
  --   Integra-se com plugins como nvim-dap e telescope.nvim.
  --   Suporte a logs, histórico e múltiplas estratégias de execução.
  --   Repositório: https://github.com/stevearc/overseer.nvim
  overseer_nvim = true,

  -- }}}

  -- Terminal {{{

  -- NOTE:  Gerencia terminais flutuantes, verticais e horizontais no Neovim.
  --  Suporte a múltiplas instâncias e persistência de sessões.
  --  Fácil alternância entre terminal e edição sem sair do Neovim.
  --  Configuração flexível com atalhos personalizáveis.
  --  Repositório: https://github.com/akinsho/toggleterm.nvim
  toggleterm_nvim = true,

  -- }}}

  -- TMUX {{{

  -- NOTE:  Navegação fluida entre janelas do Neovim e painéis do tmux.
  --  Usa atalhos intuitivos para alternar entre splits e tmux panes.
  --  Funciona sem necessidade de configuração extra no tmux.
  --  Leve e sem impacto no desempenho do Neovim.
  --  Repositório: https://github.com/christoomey/vim-tmux-navigator
  vim_tmux_navigator = false,

  -- NOTE:   Plugin para interação entre Neovim/Vim e tmux.
  --   Permite enviar comandos do editor para um painel do tmux.
  --   Suporte a execução assíncrona de scripts e testes.
  --   Atalhos configuráveis para envio rápido de comandos ao tmux.
  --   Repositório: https://github.com/preservim/vimux
  vimux = false,

  -- }}}

  -- Translations {{{

  -- NOTE: Plugin para tradução direta no Neovim.
  -- Permite traduzir textos utilizando comandos ou APIs externas, como Google Translate, translate-shell e DeepL.
  -- Oferece múltiplas formas de exibir os resultados: janela flutuante, divisão de janela, inserção no buffer atual ou substituição do texto original.
  -- Altamente configurável, permitindo adicionar funções personalizadas para tradução.
  -- Repositório: https://github.com/uga-rosa/translate.nvim
  translate_nvim = false,

  -- }}}
}
