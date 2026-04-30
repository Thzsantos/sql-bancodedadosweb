from flask import Flask, render_template, request
import mysql.connector

app = Flask(__name__)

def conectar():
    return mysql.connector.connect(
        host="localhost",
        user="root",       # padrão do XAMPP
        password="",       # senha vazia
        database="cadastro_db"
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

    return render_template("success.html")

if __name__ == "__main__":
    app.run(debug=True)
