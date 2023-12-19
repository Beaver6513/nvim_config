Il package manager che utilizzo è Lazy.
Tra tutti i plugin che utilizzo i più importanti sono:
    whichkey : ti dice quali keybinds puoi utilizzare quando premi un tasto come <leader> o altri
    telescope : penso tu lo conosca, in caso contrario: è il tuo project explorer. 
                puoi trovare tutte le keybinds nel corrispettivo file .lua in plugins/
    onedarkplus: è il tema. Se vuoi cambiarlo, dovrai cambiare il nome del plugin installato nel file onedarkplus.lua.
                 come potrai notare il setup del colorscheme è fatto direttamente nel .lua del tema (vim.cmd("colorscheme onedark"))
    treesitter: semplice syntax highligthing, installa i pacchetti da solo, puoi anche scordarti che è li, funziona uguale.
    noice: invece di scrivere i messaggi di stato in fondo sotto la barra comandi, li stampa in una finestra in alto a destra, puoi toglierlo se vuoi
    lualine: semplicemente una barra in basso più figa
    lspsaga: ti permette di fare cose come "goto implementation" o "goto definition"
             Lo uso con c e c++ e solo il "goto implementation" per qualche motivo non mi funziona
    hardtime: è un simpatico plugin che quando utilizzi dei comandi poco efficienti te lo dice, e ti da dei consigli su come migliorare
              Eliminalo se vuoi
    comment: puoi commentare codice selezionandolo e premendo "gc", funziona con tutti i linguaggi che ho potuto usare finora
    autopairs: semplice autopairing di parentesi
    cmp: autocomplete, trovi i suoi keybinds nel file stesso (per farla breve Tab scorre (alt+Tab al contrario) e poi accetti con Enter)

    --------IMPORTANTE -----------
    se vorrai aggiungere dei plugin in futuro, sappi che ho impostato lo stato dei plugin come "lazy" di default.
    Questo mi permette di selezionare manualmente i plugin che voglio che si avviino in automatico quando avvio nvim.
    Se noti in molti dei file plugin imposto "lazy = false", vuol dire che mi servono subito all'avvio. Se hai problemi con alcuni
    plugin può essere quello

    ------CARTELLA CONFIG-------
    nella cartella config ci sono alcuni file relativi a nvim stesso. Ci trovi le opzioni, i keybinds (anche se buona parte
    sono settati nei file .lua dei plugin direttamente) ed eventuali autocommands. Per ora ho un solo autocommand che lancia la formattazione 
    automatica del file quando salvi con "w". Se vuoi puoi eliminare il file.

    -------COME AGGIUNGERE LINTERS E/O FORMATTERS E/O LSPs--------------
    Dopo averli installati com Mason, potrai impostarli nel file "nvim-lspconfig.lua". Io utilizzo efmls per i config degli lsp.
    Per aggiungere un linguaggio, devi prima controllare se efmls lo supporta, controllando in questa pagina web: 
    "https://github.com/creativenull/efmls-configs-nvim/blob/main/doc/SUPPORTED_LIST.md"
    Se è presente il linters o formatter, vuol dire che lo puoi usare. Per abilitarlo puoi seguire il codice che ho scritto per abilitare quelli che gia uso.

   	lspconfig.clangd.setup({
		capabilities = capabilities, -- richiesto
		on_attach = on_attach, -- richiesto
		settings = {},  -- eventuali settings
		cmd = { -- non necessario, qui puoi però impostare cose come comandi custom
			"clangd",
			"--query-driver='/home/beaver/BibaOS/toolchain/i686-elf/bin/i686_elf_gcc'",
			"--offset-encoding=utf-16",
		},
	})
    --------------IMPORTANTE-------------
    come puoi notare ho impostato un comando custom per clangd (c e c++), mi serve per il cross-compiling per il mio OS, lo devi togliere 
    quello che fa è, come penso tu possa notare, darmi suggerimenti per architettura i686, per il mio crosscompiler. Togli "cmd = {}"
    --------------------------------------
    Dopo aver fatto il setup dell'lsp, devi importare linter e formatter:
    	local cpplint = require("efmls-configs.linters.cpplint")
    	local clang_format = require("efmls-configs.formatters.clang_format")
    dopo aver farro ciò devi creare una entry all'interno del setup di efm (filetype e settings/languages)
    In pratica inserisci il tipo di file all'interno della variabile filetypes{} e poi dici a efm per quel tipo di file quale linter e formatter (in questo ordine) utilizzare
    


