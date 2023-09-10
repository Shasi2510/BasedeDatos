import sqlite3

# Conectarse a la base de datos SQLite
conn = sqlite3.connect('database.db')
cursor = conn.cursor()

# Crear la tabla 'items' si no existe
cursor.execute('''CREATE TABLE IF NOT EXISTS items (
                  id INTEGER PRIMARY KEY,
                  nombre TEXT,
                  descripcion TEXT
                )''')
conn.commit()

def crear_item():
    nombre = input("Ingrese el nombre del item: ")
    descripcion = input("Ingrese la descripción del item: ")
    
    cursor.execute("INSERT INTO items (nombre, descripcion) VALUES (?, ?)", (nombre, descripcion))
    conn.commit()
    print("Item creado con éxito.")

def listar_items():
    cursor.execute("SELECT * FROM items")
    items = cursor.fetchall()
    
    if not items:
        print("No hay items en la base de datos.")
    else:
        for item in items:
            print(f"ID: {item[0]}, Nombre: {item[1]}, Descripción: {item[2]}")

def obtener_item():
    item_id = input("Ingrese el ID del item que desea obtener: ")
    cursor.execute("SELECT * FROM items WHERE id=?", (item_id,))
    item = cursor.fetchone()
    
    if item:
        print(f"ID: {item[0]}, Nombre: {item[1]}, Descripción: {item[2]}")
    else:
        print("No se encontró ningún item con ese ID.")

def eliminar_item():
    item_id = input("Ingrese el ID del item que desea eliminar: ")
    cursor.execute("DELETE FROM items WHERE id=?", (item_id,))
    conn.commit()
    print("Item eliminado con éxito.")

while True:
    print("\nOperaciones disponibles:")
    print("1. Crear Item")
    print("2. Listar Items")
    print("3. Obtener Item por ID")
    print("4. Eliminar Item por ID")
    print("5. Salir")
    
    opcion = input("Seleccione una operación (1/2/3/4/5): ")
    
    if opcion == '1':
        crear_item()
    elif opcion == '2':
        listar_items()
    elif opcion == '3':
        obtener_item()
    elif opcion == '4':
        eliminar_item()
    elif opcion == '5':
        break
    else:
        print("Opción no válida. Por favor, seleccione una opción válida.")

# Cerrar la conexión a la base de datos al salir del programa
conn.close()

