import sqlite3
import tkinter as tk
from tkinter import messagebox, ttk


# --- FUNÇÕES DE BANCO DE DADOS ---
def conectar_bd():
    """Cria a conexão e a tabela de clientes se não existirem."""
    conexao = sqlite3.connect("cadastro_clientes.db")
    cursor = conexao.cursor()
    cursor.execute(
        """
        CREATE TABLE IF NOT EXISTS clientes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            email TEXT NOT NULL
        )
    """
    )
    conexao.commit()
    conexao.close()


def salvar_cliente():
    """Salva o cliente digitado nos campos de entrada."""
    nome = entry_nome.get()
    email = entry_email.get()

    if nome == "" or email == "":
        messagebox.showwarning("Aviso", "Por favor, preencha todos os campos!")
        return

    conexao = sqlite3.connect("cadastro_clientes.db")
    cursor = conexao.cursor()
    cursor.execute(
        "INSERT INTO clientes (nome, email) VALUES (?, ?)", (nome, email)
    )
    conexao.commit()
    conexao.close()

    messagebox.showinfo("Sucesso", "Cliente cadastrado com sucesso!")
    entry_nome.delete(0, tk.END)
    entry_email.delete(0, tk.END)


# --- REQUISITO: FUNÇÃO PARA VISUALIZAR CLIENTES (NOVA JANELA) ---
def abrir_janela_visualizacao():
    """Abre uma nova janela e exibe todos os clientes cadastrados em uma tabela."""
    # Cria a nova janela (TopLevel)
    janela_dados = tk.Toplevel(janela_principal)
    janela_dados.title("Clientes Cadastrados")
    janela_dados.geometry("500x330")

    # Título interno
    lbl_titulo = tk.Label(
        janela_dados, text="Lista de Clientes", font=("Arial", 14, "bold")
    )
    lbl_titulo.pack(pady=10)

    # Criação da tabela (Treeview)
    colunas = ("ID", "Nome", "E-mail")
    tabela = ttk.Treeview(janela_dados, columns=colunas, show="headings")

    # Configuração dos cabeçalhos das colunas
    tabela.heading("ID", text="ID")
    tabela.heading("Nome", text="Nome")
    tabela.heading("E-mail", text="E-mail")

    # Ajuste de largura das colunas
    tabela.column("ID", width=50, anchor="center")
    tabela.column("Nome", width=200)
    tabela.column("E-mail", width=220)

    tabela.pack(padx=15, pady=10, fill=tk.BOTH, expand=True)

    # Busca os dados no banco de dados e insere na tabela
    conexao = sqlite3.connect("cadastro_clientes.db")
    cursor = conexao.cursor()
    cursor.execute("SELECT * FROM clientes")
    clientes = cursor.fetchall()

    for cliente in clientes:
        tabela.insert("", tk.END, values=cliente)

    conexao.close()


# --- INTERFACE GRÁFICA PRINCIPAL ---
conectar_bd()  # Garante que o BD está pronto

janela_principal = tk.Tk()
janela_principal.title("Formulário de Cadastro")
janela_principal.geometry("350x300")

# Elementos da tela principal
lbl_nome = tk.Label(janela_principal, text="Nome:", font=("Arial", 10))
lbl_nome.pack(pady=(15, 2))
entry_nome = tk.Entry(janela_principal, width=35)
entry_nome.pack()

lbl_email = tk.Label(janela_principal, text="E-mail:", font=("Arial", 10))
lbl_email.pack(pady=(10, 2))
entry_email = tk.Entry(janela_principal, width=35)
entry_email.pack()

# Botão para Cadastrar/Salvar
btn_salvar = tk.Button(
    janela_principal,
    text="Cadastrar Cliente",
    command=salvar_cliente,
    bg="#4CAF50",
    fg="white",
    width=20,
)
btn_salvar.pack(pady=20)

# --- BOTÃO DO REQUISITO ADICIONADO ---
btn_visualizar = tk.Button(
    janela_principal,
    text="Visualizar Clientes",
    command=abrir_janela_visualizacao,
    bg="#2196F3",
    fg="white",
    width=20,
)
btn_visualizar.pack(pady=5)

janela_principal.mainloop()
