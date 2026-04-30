from flask import Flask, render_template, request, redirect, url_for
import pymysql

app = Flask(__name__)

def conectar():
    return pymysql.connect(
        host="localhost",
        user="root",
        password="",
        database="Formulario_db"
    )

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/cadastro", methods=["POST"])
def cadastro():
    nome = request.form["nome"]
    email = request.form["email"]
    telefone = request.form["telefone"]
    senha = request.form["senha"]

    conn = conectar()
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO usuarios (nome, email, telefone, senha) VALUES (%s, %s, %s, %s)",
        (nome, email, telefone, senha)
    )
    conn.commit()
    cursor.close()
    conn.close()

    return redirect(url_for("sucesso"))

@app.route("/sucesso")
def sucesso():
    return render_template("success.html")

# Painel Admin
@app.route("/admin")
def admin():
    conn = conectar()
    cursor = conn.cursor()
    cursor.execute("SELECT id, nome, email, telefone FROM usuarios")
    usuarios = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template("admin.html", usuarios=usuarios)

# Deletar usuário específico
@app.route("/deletar/<int:id>")
def deletar(id):
    conn = conectar()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM usuarios WHERE id = %s", (id,))
    conn.commit()
    cursor.close()
    conn.close()
    return redirect(url_for("admin"))

# Deletar todos os usuários
@app.route("/deletar_todos")
def deletar_todos():
    conn = conectar()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM usuarios")
    conn.commit()
    cursor.close()
    conn.close()
    return redirect(url_for("admin"))

# Editar usuário (formulário)
@app.route("/editar/<int:id>")
def editar(id):
    conn = conectar()
    cursor = conn.cursor()
    cursor.execute("SELECT id, nome, email, telefone FROM usuarios WHERE id = %s", (id,))
    usuario = cursor.fetchone()
    cursor.close()
    conn.close()
    return render_template("editar.html", usuario=usuario)

# Atualizar usuário (POST)
@app.route("/atualizar/<int:id>", methods=["POST"])
def atualizar(id):
    nome = request.form["nome"]
    email = request.form["email"]
    telefone = request.form["telefone"]

    conn = conectar()
    cursor = conn.cursor()
    cursor.execute(
        "UPDATE usuarios SET nome=%s, email=%s, telefone=%s WHERE id=%s",
        (nome, email, telefone, id)
    )
    conn.commit()
    cursor.close()
    conn.close()
    return redirect(url_for("admin"))

if __name__ == "__main__":
    app.run(debug=True)
