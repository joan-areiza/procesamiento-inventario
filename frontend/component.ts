import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-upload',
  templateUrl: './component.html',
  styleUrls: ['./component.css']
})
export class UploadComponent {
  selectedFile: File | null = null;
  responseMessage: any = null;

  constructor(private http: HttpClient) {}

  // Captura el archivo seleccionado por el usuario
  onFileSelected(event: any) {
    const file: File = event.target.files[0];
    if (file) {
      this.selectedFile = file;
    }
  }

  // Realiza la llamada HTTP POST al endpoint del backend
  subirArchivo() {
    if (!this.selectedFile) return;

    const formData = new FormData();
    formData.append('file', this.selectedFile); // 'file' debe coincidir con el interceptor del backend

    this.http.post('http://localhost:3000/api/inventario/upload', formData).subscribe({
      next: (response) => {
        this.responseMessage = response;
        alert('Carga completada con éxito');
      },
      error: (error) => {
        console.error('Error al subir el archivo', error);
        alert('Ocurrió un error al procesar el archivo');
      }
    });
  }
}
