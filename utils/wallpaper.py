#!/usr/bin/env python3

import tkinter as tk
from tkinter import filedialog
from tkinter import messagebox
from PIL import Image, ImageTk
import os

def select_image():
    file_path = filedialog.askopenfilename(filetypes=[("Image files", "*.jpg *.jpeg *.png *.bmp")])
    if file_path and not os.path.basename(file_path).startswith('.'):
        try:
            load_preview(file_path)
        except Exception as e:
            messagebox.showerror("Error", f"Cannot open image: {e}")
    elif file_path:
        messagebox.showerror("Error", "Hidden files and directories are not allowed. Please select a visible file.")

def load_preview(file_path):
    image = Image.open(file_path)
    # Redimensiona la imagen para la vista previa (ajusta el tamaño aquí)
    image.thumbnail((500, 500))  # Cambia (500, 500) al tamaño que prefieras
    photo = ImageTk.PhotoImage(image)

    preview_label.config(image=photo)
    preview_label.image = photo
    preview_label.file_path = file_path

def set_wallpaper():
    if hasattr(preview_label, 'file_path'):
        file_path = preview_label.file_path
        # Ejecuta el comando para cambiar el fondo de pantalla con feh
        os.system(f'feh --bg-fill "{file_path}"')
        comando = f"sed -i 's|feh --bg-fill [^ ]*|feh --bg-fill {file_path}|' /home/iortxi/.config/spectrwm/autostart.sh"
        os.system(comando)
    else:
        messagebox.showerror("Error", "No image selected")

app = tk.Tk()
app.title("Wallpaper Changer")
app.geometry("600x600")

frame = tk.Frame(app)
frame.pack(pady=20)

btn_select = tk.Button(frame, text="Select Image", command=select_image)
btn_select.grid(row=0, column=0, padx=10)

btn_set = tk.Button(frame, text="Set as Wallpaper", command=set_wallpaper)
btn_set.grid(row=0, column=1, padx=10)

preview_label = tk.Label(app)
preview_label.pack(pady=20)

app.mainloop()

