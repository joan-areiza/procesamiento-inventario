import { Injectable, BadRequestException } from '@nestjs/common';
import * as XLSX from 'xlsx';
import * as mysql from 'mysql2/promise';

@Injectable()
export class InventarioService {
  private pool = mysql.createPool({
    host: 'localhost',
    user: 'tu_usuario',
    password: 'tu_password',
    database: 'procesamiento-inventario',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
  });

  async procesarArchivoExcel(file: Express.Multer.File) {
    if (!file) {
      throw new BadRequestException('No se ha proporcionado ningún archivo.');
    }

    const workbook = XLSX.read(file.buffer, { type: 'buffer' });
    const sheetName = workbook.SheetNames[0];
    const worksheet = workbook.Sheets[sheetName];
    const rows: any[] = XLSX.utils.sheet_to_json(worksheet);

    let totalRegistrosLeidos = rows.length;
    let totalRegistrosInsertados = 0;
    let totalRegistrosActualizados = 0;
    let erroresEncontrados = 0;

    const insertadosPorColor: Record<string, number> = {};
    const insertadosPorModelo: Record<string, number> = {};

    for (const [index, row] of rows.entries()) {
      const connection = await this.pool.getConnection();

      try {
        const sku = row['SKU'];
        const nombreProducto = row['Producto'] || row['Nombre Producto'];
        const categoriaNombre = row['Categoría'];
        const stock = row['Cantidad'];
        const color = row['Color'];
        const talla = row['Talla'] || null;
        const modelo = row['Modelo'];
        const estado = row['Activo'] !== undefined ? (row['Activo'] === 'ACTIVO' ? 1 : 0) : 1;

        if (!sku || !nombreProducto || !categoriaNombre || stock === undefined || !color || !modelo) {
          throw new Error(`Faltan campos obligatorios en la fila ${index + 2}`);
        }

        if (stock < 0) {
          throw new Error(`El stock debe ser un número positivo en la fila ${index + 2}`);
        }

        await connection.beginTransaction();

        const [categorias]: any = await connection.execute(
          'SELECT id_categoria FROM categorias WHERE nombre_categoria = ?',
          [categoriaNombre]
        );

        if (categorias.length === 0) {
          throw new Error(`La categoría '${categoriaNombre}' no existe (Fila ${index + 2})`);
        }

        const idCategoria = categorias[0].id_categoria;

        const [productosExistentes]: any = await connection.execute(
          'SELECT sku FROM productos WHERE sku = ?',
          [sku]
        );

        if (productosExistentes.length > 0) {
          await connection.execute(
            `UPDATE productos 
             SET nombre = ?, id_categoria = ?, stock = ?, color = ?, talla = ?, modelo = ?, estado = ? 
             WHERE sku = ?`,
            [nombreProducto, idCategoria, stock, color, talla, modelo, estado, sku]
          );
          totalRegistrosActualizados++;
        } else {
          await connection.execute(
            `INSERT INTO productos (nombre, sku, id_categoria, stock, color, talla, modelo, estado) 
             VALUES (?, ?, ?, ?, ?, ?, ?, ?)`,
            [nombreProducto, sku, idCategoria, stock, color, talla, modelo, estado]
          );
          totalRegistrosInsertados++;

          insertadosPorColor[color] = (insertadosPorColor[color] || 0) + 1;
          insertadosPorModelo[modelo] = (insertadosPorModelo[modelo] || 0) + 1;
        }

        await connection.commit();

      } catch (error) {
        await connection.rollback();
        erroresEncontrados++;
      } finally {
        connection.release();
      }
    }

    return {
      mensaje: "Carga de inventario completada.",
      totalRegistrosLeidos,
      totalRegistrosInsertados,
      totalRegistrosActualizados,
      erroresEncontrados,
      detalle: {
        insertadosPorColor,
        insertadosPorModelo
      }
    };
  }
}