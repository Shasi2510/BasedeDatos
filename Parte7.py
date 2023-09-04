import sqlite3

# Conectar a la base de datos o crearla si no existe
conn = sqlite3.connect('mi_base_de_datos.db')
cursor = conn.cursor()

# Crear una tabla si no existe
cursor.execute('''
    CREATE TABLE IF NOT EXISTS registros (
        id INTEGER PRIMARY KEY,
        nombre TEXT,
        edad INTEGER
    )
''')
conn.commit()

def crear_registro():
    nombre = input("Ingrese el nombre: ")
    edad = int(input("Ingrese la edad: "))
    cursor.execute('INSERT INTO registros (nombre, edad) VALUES (?, ?)', (nombre, edad))
    conn.commit()
    print("Registro creado con éxito!")

def leer_registros():
    cursor.execute('SELECT * FROM registros')
    registros = cursor.fetchall()
    for registro in registros:
        print(f"ID: {registro[0]}, Nombre: {registro[1]}, Edad: {registro[2]}")

def actualizar_registro():
    id_actualizar = int(input("Ingrese el ID del registro que desea actualizar: "))
    nuevo_nombre = input("Ingrese el nuevo nombre: ")
    nueva_edad = int(input("Ingrese la nueva edad: "))
    cursor.execute('UPDATE registros SET nombre=?, edad=? WHERE id=?', (nuevo_nombre, nueva_edad, id_actualizar))
    conn.commit()
    print("Registro actualizado con éxito!")

def eliminar_registro():
    id_eliminar = int(input("Ingrese el ID del registro que desea eliminar: "))
    cursor.execute('DELETE FROM registros WHERE id=?', (id_eliminar,))
    conn.commit()
    print("Registro eliminado con éxito!")

while True:
    print("\nMenú:")
    print("1. Crear Registro")
    print("2. Leer Registros")
    print("3. Actualizar Registro")
    print("4. Eliminar Registro")
    print("5. Salir")
    
    opcion = input("Seleccione una opción: ")
    
    if opcion == '1':
        crear_registro()
    elif opcion == '2':
        leer_registros()
    elif opcion == '3':
        actualizar_registro()
    elif opcion == '4':
        eliminar_registro()
    elif opcion == '5':
        break

# Cerrar la conexión a la base de datos al salir
conn.close()

